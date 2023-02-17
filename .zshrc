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

# Backup and Restore Docker Volumes
function backupDockerVolume()
{
  docker run --rm -v $1:/volData -v $(pwd):/backup ubuntu tar cvf /backup/$2.tar /volData
}
function restoreDockerVolume()
{
  docker run --rm -v $1:/volData -v $(pwd):/restore ubuntu tar xvf /restore/$2.tar -C /volData --strip 1
}

# alias commands
alias l="exa -bghl -snew"
alias ll="exa -bghl -snew"
alias top="htop"
alias eZ="vim ~/.zshrc"
alias eI="vim ~/.config/i3/config"
alias yt-dl='docker run --rm -i -e PGID=$(id -g) -e PUID=$(id -u) -v "$(pwd)":/workdir:rw mikenye/youtube-dl'

# ssh key management gedöns
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# start starship
eval "$(starship init zsh)"

