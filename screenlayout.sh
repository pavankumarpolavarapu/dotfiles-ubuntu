#!/bin/sh
xrandr --output DP-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-0 --off --output DP-2 --off --output DP-3 --off --output DP-4 --mode 2560x1440 --pos 2560x0 --rotate normal --output DP-5 --off --output USB-C-0 --off --output HDMI-1-1 --off --output DP-1-1 --off --output HDMI-1-2 --off

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar screen1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar screen2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
