# Dotfiles

Personal configuration files synced across machines.

## What's Included

- `.claude/instructions.md` - Global Claude Code instructions
- `configs.json` - MCP servers and API keys (secrets stored in 1Password)
- `sync.sh` - Syncs configs and loads credentials from 1Password

## Installation

On a new machine:

```bash
cd ~
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles
./install.sh
```

The install script creates symlinks from your home directory to files in this repo.

## Usage

### Sync configs and start Claude

```bash
source ~/dotfiles/sync.sh
```

This pulls latest configs and loads API keys from 1Password.

### Add new API keys

1. Add item to 1Password vault `INTEGRATIONS_API_MCP`
2. Item title becomes env var (e.g., "Eventbrite API" → `EVENTBRITE_API`)
3. Reference in `configs.json` as `${EVENTBRITE_API}`

### Update configs

```bash
cd ~/dotfiles
# Edit configs.json
git add configs.json
git commit -m "Add new integration"
git push
```
