#!/usr/bin/env bash

# Find PDFs in the Documents folder and pipe them to rofi.
# The selected PDF is then opened with zathura.
find ~/Documents -type f -name "*.pdf" | rofi -dmenu -i -p "Ouvrir PDF:" -theme ~/.config/rofi/appmenu/appmenu.rasi | xargs -I {} zathura "{}"
