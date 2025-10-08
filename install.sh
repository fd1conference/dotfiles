#!/bin/bash

# Dotfiles installation script
# Run this on any new machine to set up your Claude Code configuration

set -e

echo "================================================"
echo "Installing dotfiles..."
echo "================================================"

# Create .claude directory if it doesn't exist
mkdir -p ~/.claude

# Symlink Claude instructions
if [ -f ~/.claude/instructions.md ] || [ -L ~/.claude/instructions.md ]; then
    echo "WARNING: ~/.claude/instructions.md already exists"
    read -p "Overwrite? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Skipping Claude instructions..."
    else
        rm -f ~/.claude/instructions.md
        ln -sf ~/dotfiles/.claude/instructions.md ~/.claude/instructions.md
        echo "✓ Linked .claude/instructions.md"
    fi
else
    ln -sf ~/dotfiles/.claude/instructions.md ~/.claude/instructions.md
    echo "✓ Linked .claude/instructions.md"
fi

# Make sync script executable
chmod +x ~/dotfiles/sync.sh
echo "✓ sync.sh ready"

echo ""
echo "================================================"
echo "Installation complete!"
echo "================================================"
echo ""
echo "Next steps:"
echo "1. Install 1Password CLI: brew install --cask 1password-cli"
echo "2. Enable 1Password Settings → Developer → 'Integrate with 1Password CLI'"
echo "3. Create vault 'INTEGRATIONS_API_MCP' in 1Password"
echo "4. Add API keys to the vault (title becomes env var name)"
echo "5. Run: source ~/dotfiles/sync.sh"
echo ""
