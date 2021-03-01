# if status --is-login; return; end

# suppress greeting
set fish_greeting

source ("/usr/bin/starship" init fish --print-full-init | psub)  # Starship prompt

# pywal
cat ~/.cache/wal/sequences
