# source iff file exists
include() {
  [[ -f "$1" ]] && source "$1"
}

source $HOME/antigen.zsh

antigen use oh-my-zsh

plugins=(
  git pip lein z gradle rust kubectl 
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  command-not-found
)

for plugin in ${plugins[@]}; do
  antigen bundle ${plugin}
done

antigen apply

# fzf for mac
include ~/.fzf.zsh

# fzf for archlinux
include /usr/share/fzf/key-bindings.zsh
include /usr/share/fzf/completion.zsh

eval "$(starship init zsh)"

alias ls="exa"
alias vim="nvim"
alias k="kubectl"
alias py="python"
alias sudo="sudo -E"

fuck_gfw() {
  export HTTP_PROXY=http://127.0.0.1:7890
  export HTTPS_PROXY=${HTTP_PROXY}
}

gfw() {
  unset HTTP_PROXY
  unset HTTPS_PROXY
}
