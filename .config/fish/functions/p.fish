# Defined in - @ line 1
function p --wraps='sudo pacman' --description 'alias p=sudo pacman'
  sudo pacman $argv;
end
