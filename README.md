# Dotfiles

Personal configuration files synced across machines.

## What's Included

- `.claude/instructions.md` - Global Claude Code instructions

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

### Editing Instructions

Edit `~/.claude/instructions.md` on any machine. Since it's symlinked to `~/dotfiles/.claude/instructions.md`, changes appear in the repo automatically.

Commit and push:

```bash
cd ~/dotfiles
git add .claude/instructions.md
git commit -m "Update Claude instructions"
git push
```

Pull on other machines:

```bash
cd ~/dotfiles
git pull
```

## Manual Setup (if install.sh doesn't work)

```bash
mkdir -p ~/.claude
ln -sf ~/dotfiles/.claude/instructions.md ~/.claude/instructions.md
```
