#!/usr/bin/env bash

# Script that doesn't really work

# Terminate already running bar instances
function launch()
{
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log  /tmp/polybar2.log
polybar primary >>/tmp/polybar1.log 2>&1 &
#polybar secondary >>/tmp/polybar2.log 2>&1 &

echo "Bars launched..."
}

if pgrep -x "polybar" > /dev/null
then
    killall -q polybar
    bspc config top_padding 0
else
    launch
fi
