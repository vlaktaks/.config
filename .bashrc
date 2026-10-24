# ================================================
# This bashRC can kill you! ~ J.P. Ramackers
# ================================================

[[ $- != *i* ]] && return

export GOBIN="$HOME/.local/bin"
export PATH="$GOBIN:$PATH"

export PATH="$(go env GOPATH)/bin:$PATH"

export VIRTUAL_ENV_DISABLE_PROMPT=1

# ================================================
# Extra aliases
# ================================================

alias ll='ls -lah --color=auto'
alias la='ls -A'
alias update='sudo pacman -Syu'
alias fix='source ~/.bashrc'
alias code='cd ~/Code/ && ls -a'
alias nanoxmr='/opt/nanominer/nanominer /home/jp/config.ini'
alias gh-update='cd ~/cli && git pull && make && cp bin/gh ~/.local/bin/gh'

# ================================================
# Extra functions for extract and cd
# ================================================

function extract() {
  if [ -f "$1" ]; then
    case "$1" in
    *.tar.bz2) tar xjvf "$1" ;;
    *.tar.gz) tar xzvf "$1" ;;
    *.tar.xz) tar xvf "$1" ;;
    *.bz2) bzip2 -d "$1" ;;
    *.rar) unrar2dir "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *.7z) 7z x "$1" ;;
    *.ace) unace x "$1" ;;
    *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function cd() {
  local new_directory="${*:-$HOME}"
  builtin cd "$new_directory" &&
    /bin/ls -lhF --time-style=long-iso --color=auto --ignore=lost+found
}

# ================================================
# Ryoku: shell integration, syntax highlighting,
# and Starship prompt
# ================================================

if [[ -r /usr/share/ryoku/config/bash/ryoku.bash ]]; then
  . /usr/share/ryoku/config/bash/ryoku.bash
fi
