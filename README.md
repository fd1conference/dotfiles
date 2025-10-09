# Dotfiles

Personal configuration files synced across machines.

## What's Included

- `CLAUDE.md` - Global Claude Code instructions (automatically loaded in every conversation)
- `configs.json` - MCP servers and API keys (secrets stored in 1Password)
- `sync.sh` - Syncs configs and loads credentials from 1Password

## Installation

On a new machine:

```bash
cd ~
git clone https://github.com/fd1conference/dotfiles.git
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

### Edit Claude instructions

```bash
cd ~/dotfiles
# Edit CLAUDE.md
git add CLAUDE.md
git commit -m "Update Claude instructions"
git push
```

On other machines, pull the changes:

```bash
cd ~/dotfiles
git pull
```
