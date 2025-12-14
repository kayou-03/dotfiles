#!/usr/bin/env bash

# Rofi Main Menu Script

# Menu options with icons
options="󰚈 Apps\n󰈹 Browser\n Terminal\n󱗙  Theme\n󰐥 Power"

# Show rofi menu and get selection
chosen=$(echo -e "$options" | rofi -dmenu -theme ~/.config/rofi/mainmenu/mainmenu.rasi -p "~")

# Execute based on selection
case $chosen in
"󰚈 Apps")
  ~/.config/rofi/launcher/launcher.sh
  ;;
"󰈹 Browser")
  xdg-open "https://"
  ;;
" Terminal")
  kitty
  ;;

"󱗙  Theme")
  ~/.config/scripts/rofi/select_wallpaper.sh
  ;;

"󰐥 Power")
  ~/.config/rofi/powermenu/powermenu.sh
  ;;
esac
