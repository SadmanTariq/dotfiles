# Defined in - @ line 1
function sdn --wraps='sudo shutdown now' --description 'alias sdn=sudo shutdown now'
  sudo shutdown now $argv;
end
