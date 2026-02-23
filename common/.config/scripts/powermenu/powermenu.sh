#!/usr/bin/env bash

options="  Éteindre\n  Redémarrer\n  Mettre en veille\n  Déconnexion"

# On lance rofi en mode dmenu
chosen="$(echo -e "$options" | rofi -dmenu -i -p "Session" -theme ~/.config/rofi/powermenu/powermenu.rasi)"

case $chosen in
    *Éteindre)
        systemctl poweroff ;;
    *Redémarrer)
        systemctl reboot ;;
    *Veille)
        systemctl suspend ;;
    *Déconnexion)
        hyprctl dispatch exit ;;
esac
