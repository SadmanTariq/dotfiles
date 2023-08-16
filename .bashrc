#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export PATH=$HOME/Scripts:$HOME/.local/bin:$PATH

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

#_set_my_PS1() {
#    #PS1='[\u@\h \W]\$ '
#    #PS1="\t [\[$(tput sgr0)\]\[\033[38;5;6m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;1m\]\w\[$(tput sgr0)\]]\\$ \[$(tput sgr0)\]"
#    PS1="\t [\[$(tput sgr0)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;6m\]\w\[$(tput sgr0)\]]\\$ \[$(tput sgr0)\]"
#    if [ "$(whoami)" = "liveuser" ] ; then
#        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
#        if [ -n "$iso_version" ] ; then
#            local prefix="eos-"
#            local iso_info="$prefix$iso_version"
#            PS1="[\u@$iso_info \W]\$ "
#        fi
#    fi
#}
# _set_my_PS1
# unset -f _set_my_PS1


[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'


#eval $(thefuck --alias --enable-experimental-instant-mode)

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Pywal
# (cat ~/.cache/wal/sequences &)

# Env variables
export EDITOR="/usr/bin/nvim"


# bash parameter completion for the dotnet CLI
_dotnet_bash_complete()
{
  local word=${COMP_WORDS[COMP_CWORD]}

  local completions
  completions="$(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)"
  if [ $? -ne 0 ]; then
    completions=""
  fi

  COMPREPLY=( $(compgen -W "$completions" -- "$word") )
}
complete -f -F _dotnet_bash_complete dotnet


if [ "${BASH_VERSINFO[0]}" -gt 4 ] || ([ "${BASH_VERSINFO[0]}" -eq 4 ] && [ "${BASH_VERSINFO[1]}" -ge 1 ])
then
source <("/usr/bin/starship" init bash --print-full-init)
else
source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
fi
