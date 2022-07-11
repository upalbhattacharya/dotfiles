#!/usr/bin/env zsh
apps=("Google Calendar" "ClickUp" "Todoist" "Habitify" "Telegram Web" "WhatsApp" "Toggl Track")

# Kill all webapps spawned for the Work Suite
for app in "${apps[@]}"
do
    wid=$(xdotool search --name $app | tail -n1)
    pid=$(xprop -id $wid | grep _NET_WM_PID | head -n1 | awk '{print $(NF)}')
    echo $pid
    kill $pid
done
