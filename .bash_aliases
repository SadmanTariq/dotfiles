#!/bin/bash

function mkscript(){
    touch $1
    chmod +x $1
    echo '#!/bin/bash' >> $1
    nvim $1
}

function mkcd(){
	mkdir $1
	cd $1
}

function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}
function stopwatch(){
  date1=`date +%s`; 
   while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
   done
}

alias ls='ls --color=auto'
alias ll='ls -lAvh'   # show long listing of all except ".."
alias la='ls -Avh'   # show long listing of all except ".."

alias p='sudo pacman'
alias r='ranger'
alias ~='cd ~'
alias sbrc='source ~/.bashrc'

alias sdn='shutdown now'
alias hib='systemctl hibernate && exit'

# alias sudo='sudo '  # to make aliases work with sudo

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias count='tot=0; echo -n "0 "; while true; do read -rsn1 in; if [ "$in" == "" ]; then tot=$(($tot+1)); else tot=$(($tot-1)); fi; echo -en "\r$tot "; done'

alias upload='curl -F "file=@$(ls | fzf)" https://0x0.st'

function automount(){
  local device="$1"
  if [ "$1" == "--cd" ]; then
    device="$2"
  fi

  out=$(udisksctl mount -b "$device")
  echo $out
  if [ "$1" == "--cd" ]; then
    cd "/run/media/$(whoami)/$(echo $out | rg -o '[^/]+$')"
  fi
}

alias automcd='automount --cd'

function n() {
  if [ "$TERMINAL" == "kitty" ]; then
    kitten @ set-background-opacity 1.0
  fi

  if [ $# == 0 ]; then
    nvim .
  else
    nvim "$@"
  fi

  if [ "$TERMINAL" == "kitty" ]; then
    kitten @ set-background-opacity 0.8
  fi

}

# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'

if [ "$TERMINAL" == "kitty" ]; then
  alias ssh='kitty +kitten ssh'
  alias icat='kitty +kitten icat'
fi

alias clip='xclip -selection clipboard'
