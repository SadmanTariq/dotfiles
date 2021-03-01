# Defined in - @ line 1
function lanscan --wraps='nmap -sn _gateway/24' --wraps='sudo nmap -sn _gateway/24' --description 'alias lanscan=sudo nmap -sn _gateway/24'
  sudo nmap -sn _gateway/24 $argv;
end
