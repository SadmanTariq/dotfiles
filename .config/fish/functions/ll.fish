# Defined in - @ line 1
function ll --wraps='ls -lAvh' --description 'alias ll=ls -lAvh'
  ls -lAvh $argv;
end
