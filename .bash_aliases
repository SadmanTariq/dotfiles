function newscript(){
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
alias n='nvim'
alias sbrc='source ~/.bashrc'

alias sdn='shutdown now'

# alias sudo='sudo '  # to make aliases work with sudo

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias count='tot=0; echo -n "0 "; while true; do read -rsn1 in; if [ "$in" == "" ]; then tot=$(($tot+1)); else tot=$(($tot-1)); fi; echo -en "\r$tot "; done'

alias upload='curl -F "file=@$(ls | fzf)" https://0x0.st'

function automount(){
  out=$(udisksctl mount -b $1)
  echo $out
  if [ "$2" == "--cd" ]; then
    cd "$(echo $out | rg -o '\/[^\s]+$')"
  fi
}
