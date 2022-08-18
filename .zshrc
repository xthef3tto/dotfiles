autoload -U compinit; compinit
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

setopt auto_cd

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

eval "$(starship init zsh)"

function ls() 
{
  if [[ "$1" == -* ]]; then
    exa --colour-scale -bghla -snew $2
  else
    exa --colour-scale -bghla -snew $1
  fi
}

alias l="exa -bghl -snew"
alias ll="exa -bghl -snew"
alias top="htop"
alias eZ="vim ~/.zshrc"
alias eI="vim ~/.config/i3/config"
