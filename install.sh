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

echo "================================================"
echo "Installation complete!"
echo "================================================"
