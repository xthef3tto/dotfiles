# autocomplete options
autoload -U compinit; compinit
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# ctrl + w only deleting last word in path
autoload -U select-word-style
select-word-style bash

# dont need to use cd
setopt auto_cd

# file history settings
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

# override ls function
function ls() 
{
  if [[ "$1" == -* ]]; then
    exa --colour-scale -bghla -snew $2
  else
    exa --colour-scale -bghla -snew $1
  fi
}

# alias commands
alias l="exa -bghl -snew"
alias ll="exa -bghl -snew"
alias top="htop"
alias eZ="vim ~/.zshrc"
alias eI="vim ~/.config/i3/config"

# start starship
eval "$(starship init zsh)"

# enable find-the-command
source /usr/share/doc/find-the-command/ftc.zsh

