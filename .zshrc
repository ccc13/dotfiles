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

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

antigen apply

# fzf for mac
include ~/.fzf.zsh

# fzf for archlinux
include /usr/share/fzf/key-bindings.zsh
include /usr/share/fzf/completion.zsh

eval "$(starship init zsh)"

alias ls="lsd"
alias tree="lsd --tree"
alias vim="nvim"
alias k="kubectl"
alias py="python"
