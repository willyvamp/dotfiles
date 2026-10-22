#!/usr/bin/env bash

choice=$(printf "󰤄  Suspend\n󰜉  Reboot\n󰐥  Shutdown" |
  rofi -dmenu \
    -i \
    -p "Power Menu" \
    -location 1 \
    -xoffset 0 \
    -yoffset 0 \
    -theme-str '
      window {
        anchor: south west;
        location: south west;
        width: 200px;
      }
      listview {
        lines: 3;
      }
    ')

case "$choice" in
  *Suspend)
    systemctl suspend
    ;;
  *Reboot)
    systemctl reboot
    ;;
  *Shutdown)
    systemctl poweroff
    ;;
esac
