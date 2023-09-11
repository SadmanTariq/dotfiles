#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Launch bar
echo "---" | tee -a /tmp/polybar.log
polybar -r main 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bar launched..."
