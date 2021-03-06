source $HOME/.env

# Antigen configuration
source $HOME/.antigen.zsh

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
antigen bundle djui/alias-tips

# Load the theme from .dotfiles folder
antigen bundle $HOME/.oh-my-zsh/custom/themes bureau.zsh-theme --no-local-clone

antigen apply

source $HOME/.aliases

# load navi https://github.com/denisidoro/navi
source "$(navi widget zsh)"

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

if [ $commands[fasd] ]; then # check if fasd is installed
  eval "$(fasd --init auto)"
fi

# load grunt
eval "$(grunt --completion=zsh)"

# load bashcompinit
autoload -U +X bashcompinit && bashcompinit

# load fuzzy finder https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load minio client
complete -o nospace -C /usr/local/bin/mc mc

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# autoload nvm version in folders w/ .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc