#!/bin/bash

# Config sync with 1Password integration
set -e

DOTFILES="$HOME/dotfiles"
CONFIG_FILE="$DOTFILES/configs.json"
VAULT="INTEGRATIONS_API_MCP"

# Detect OS and set Claude config path
if [[ "$OSTYPE" == "darwin"* ]]; then
    CLAUDE_CONFIG_DIR="$HOME/Library/Application Support/Claude"
elif grep -qi microsoft /proc/version 2>/dev/null; then
    # WSL - access Windows AppData
    CLAUDE_CONFIG_DIR="$(wslpath "$(cmd.exe /c 'echo %APPDATA%' 2>/dev/null | tr -d '\r')")/Claude"
else
    # Linux
    CLAUDE_CONFIG_DIR="$HOME/.config/claude"
fi

CLAUDE_CONFIG_FILE="$CLAUDE_CONFIG_DIR/claude_desktop_config.json"

# Check 1Password CLI
if ! command -v op &> /dev/null; then
    echo "Error: 1Password CLI not installed"
    echo "Install: brew install --cask 1password-cli (macOS) or see 1password.com"
    exit 1
fi

# Verify 1Password is unlocked
if ! op account list &> /dev/null; then
    echo "Unlocking 1Password..."
    eval $(op signin)
fi

# Pull latest configs
cd "$DOTFILES"
git pull --quiet 2>/dev/null || true

# Get list of all items in vault
items=$(op item list --vault "$VAULT" --format json 2>/dev/null || echo "[]")

# Export each item as environment variable
# Format: Item title becomes env var name (spaces replaced with _)
if [ "$items" != "[]" ]; then
    while IFS= read -r item; do
        title=$(echo "$item" | jq -r '.title')
        var_name=$(echo "$title" | tr '[:lower:]' '[:upper:]' | tr ' -' '_')
        value=$(op read "op://$VAULT/$title/password" 2>/dev/null || op read "op://$VAULT/$title/credential" 2>/dev/null || echo "")

        if [ -n "$value" ]; then
            export "$var_name=$value"
        fi
    done < <(echo "$items" | jq -c '.[]')
fi

# Create Claude config directory
mkdir -p "$CLAUDE_CONFIG_DIR"

# Backup existing config
if [ -f "$CLAUDE_CONFIG_FILE" ]; then
    cp "$CLAUDE_CONFIG_FILE" "${CLAUDE_CONFIG_FILE}.backup"
fi

# Process config file - substitute environment variables
cp "$CONFIG_FILE" "$CLAUDE_CONFIG_FILE"

# Expand environment variables in the config
if command -v envsubst &> /dev/null; then
    envsubst < "$CLAUDE_CONFIG_FILE" > "${CLAUDE_CONFIG_FILE}.tmp"
    mv "${CLAUDE_CONFIG_FILE}.tmp" "$CLAUDE_CONFIG_FILE"
else
    # Fallback: manually expand common variables
    for var in $(env | cut -d= -f1); do
        sed -i.bak "s/\${$var}/${!var}/g" "$CLAUDE_CONFIG_FILE" 2>/dev/null || true
    done
    rm -f "${CLAUDE_CONFIG_FILE}.bak"
fi

echo "✓ Config synced and credentials loaded"
