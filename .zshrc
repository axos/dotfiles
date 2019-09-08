# Antigen configuration
source .antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle bower
antigen bundle colored-man-pages
antigen bundle debian
antigen bundle fasd
antigen bundle git
antigen bundle node
antigen bundle npm

# Other bundles
antigen bundle supercrabtree/k
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme from .dotfiles folder
antigen bundle $HOME/.dotfiles/.oh-my-zsh/custom/themes bureau.zsh-theme --no-local-clone

antigen apply

# Example aliases
alias c="clear"
alias x="exit"

# List only directories
alias lsd="ls -lhF ${colorflag} | grep --color=never '^d'"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Gzip-enabled `curl`
alias gurl='curl --compressed'

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# User configuration

export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

eval "$(grunt --completion=zsh)"
