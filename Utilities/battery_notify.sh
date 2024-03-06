#!/usr/bin/env sh

while true; do
  bat_lvl=$(cat /sys/class/power_supply/BAT0/capacity)
  bat_state=$(cat /sys/class/power_supply/BAT0/status)
  if [ $bat_lvl -le 15 ] && [ $bat_state != "Charging" ]; then
    notify-send --urgency=CRITICAL "Battery Low" "Level: ${bat_lvl}%"
    sleep 120
  else
    sleep 600
  fi
done
