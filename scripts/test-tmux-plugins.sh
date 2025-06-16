#!/usr/bin/env zsh
# Test script to verify zsh plugins work in tmux

echo "=== TMUX ZSH PLUGIN TEST ==="
echo "Shell: $0"
echo "Process: $(ps -p $$ -o comm=)"
echo "PWD: $PWD"
echo ""

# Test if autosuggestions plugin is loaded
if typeset -f _zsh_autosuggest_bind_widgets >/dev/null 2>&1; then
    echo "✅ zsh-autosuggestions: LOADED"
else
    echo "❌ zsh-autosuggestions: NOT LOADED"
fi

# Test if syntax highlighting plugin is loaded
if [[ -n "${ZSH_HIGHLIGHT_REVISION}" ]] || typeset -f _zsh_highlight >/dev/null 2>&1; then
    echo "✅ zsh-syntax-highlighting: LOADED"
else
    echo "❌ zsh-syntax-highlighting: NOT LOADED"
fi

# Check if plugins are sourced
echo ""
echo "Plugin locations:"
echo "Autosuggestions: $(ls /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null && echo "Found" || echo "Not found")"
echo "Syntax highlighting: $(ls /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null && echo "Found" || echo "Not found")"

echo ""
echo "=== END TEST ===" 