#!/bin/bash

# This script is a simple wrapper to correctly start a tmux session in Ghostty.
# It's designed to be called from the Ghostty 'command' configuration setting.

# Ensure we start from the user's home directory for a consistent state.
cd "$HOME" || exit 1

# First, check if tmux is installed and available.
if command -v tmux &>/dev/null; then
    # If tmux is available, execute the tmux-sessionizer script.
    # This script lets you choose a directory and creates/attaches to a tmux session for it.
    # We pass the dotfiles directory as the default selection.
    #
    # If the sessionizer script is cancelled (e.g., by pressing 'Esc' in fzf),
    # it will exit with a non-zero status. The '||' operator catches this.
    # The fallback logic then tries to attach to any existing session,
    # or creates a new default session if none exist. This prevents the
    # terminal from closing immediately if you cancel the sessionizer.
    "$HOME/github/dotfiles-latest/tmux/tools/prime/tmux-sessionizer.sh" "$HOME/github/dotfiles-latest" || (tmux attach || tmux)
else
    # If tmux is not installed, simply start a new zsh shell.
    zsh
fi 