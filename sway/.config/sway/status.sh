#!/usr/bin/env sh

# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)
date_formatted=$(date "+%a %F %I:%M %p")
linux_version=$(uname -r | cut -d '-' -f1)
# battery_status=$(cat /sys/class/power_supply/BAT0/status)
load_average=$(uptime | awk -F'[a-z]: ' '{ print $2 }' | sed 's/,//g')

# weather, with caching
# error handling if curl request fails
weather_file="/tmp/wttr.in-$(date "+%F-%H").txt"
if [ ! -f "$weather_file" ]; then
    curl --silent --max-time 5 https://wttr.in/?format="+%t+%c" > "$weather_file"
    if [ $? -ne 0 ]; then
        echo "" > "$weather_file"
    fi
fi

weather=$(cat "$weather_file")

echo "$weather $uptime_formatted ⏳   $linux_version 🐧   $load_average 💻   $date_formatted"
