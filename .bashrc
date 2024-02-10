#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$HOME/Scripts:$HOME/.local/bin:$PATH

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Env variables
export EDITOR="/usr/bin/nvim"

# Increase history size
export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTTIMEFORMAT="[%F %T] "

# fzf bindings
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

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


# Starship prompt config
if [ "${BASH_VERSINFO[0]}" -gt 4 ]\
    || ([ "${BASH_VERSINFO[0]}" -eq 4 ]\
    && [ "${BASH_VERSINFO[1]}" -ge 1 ])
then
  source <("/usr/bin/starship" init bash --print-full-init)
else
  source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
fi
