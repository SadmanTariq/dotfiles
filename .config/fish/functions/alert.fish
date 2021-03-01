# Defined in - @ line 1
function alert --wraps='bash -c notify-send' --wraps='notify-send --urgency=low -i "terminal" "Done"' --description 'alias alert=notify-send --urgency=low -i "terminal" "Done"'
  notify-send --urgency=low -i "terminal" "Done" $argv;
end
