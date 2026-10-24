source $HOME/.env

# Antigen plugin manager
source $HOME/.antigen.zsh
source $HOME/.aliases

# Oh-My-Zsh & Bundles
antigen use oh-my-zsh
antigen bundle git
antigen bundle node
antigen bundle npm
antigen bundle aliases

# Community Bundles
antigen bundle supercrabtree/k
antigen bundle ninrod/pass-zsh-completion
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle djui/alias-tips
antigen bundle jeffreytse/zsh-vi-mode

antigen apply

# Interactive Tools
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# Load navi cheatsheet widget
source <(navi widget zsh)

# Keybindings & Completion Settings
bindkey -v
autoload -U +X bashcompinit && bashcompinit
fpath+=~/.zfunc; autoload -Uz compinit; compinit
zstyle ':completion:*' menu select

# Load machine-specific configurations if they exist (ignored by git)
if [ -f "$HOME/.zshrc.local" ]; then
    source "$HOME/.zshrc.local"
fi
