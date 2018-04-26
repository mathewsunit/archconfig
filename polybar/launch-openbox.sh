#!/bin/bash

#MONITOR_LIST=$(polybar -m | awk -F ':' '{print $1}')

MONITOR_LIST=$(polybar -m | grep DP | awk -F ':' '{print $1}')

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

for mon in $MONITOR_LIST; do
    echo "Launching on monitor $mon"
    env MONITOR=$mon polybar -c /home/sunit/.config/polybar/config-openbox top &
    env MONITOR=$mon polybar -c /home/sunit/.config/polybar/config-openbox bottom &
done

echo "Bars launched..."
