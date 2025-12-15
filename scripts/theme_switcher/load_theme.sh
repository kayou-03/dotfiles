#!/bin/bash

THEME="$1"
THEME_DIR="$HOME/.config/themes/$THEME"
CONFIG_DIR="$HOME/.config"

send_notif() {
    URGENCY="${2:-normal}"
    notify-send -u "$URGENCY" "Theme Switcher" "$1"
}

# 1. Vérification des arguments
if [ -z "$THEME" ]; then
    send_notif "Erreur : Aucun nom de thème fourni !" "critical" "dialog-error"
    exit 1
fi

# 2. Vérification du dossier
if [ ! -d "$THEME_DIR" ]; then
    send_notif "Erreur : Le thème '$THEME' n'existe pas !" "critical" "dialog-error"
    exit 1
fi

send_notif "Chargement du thème : <b>$THEME</b>..." "normal"

link_file() {
   if [ -f "$1" ]; then
      ln -sf "$1" "$2"
   else
      notify-send -u low "Theme Switcher " "⚠️ Fichier manquant : $(basename $1)"
   fi
}

# --- 1. HYPRLAND ---
link_file "$THEME_DIR/colors.conf" "$HOME/.config/hypr/config/colors.conf"

# --- 2. WAYBAR ---
link_file "$THEME_DIR/waybar.css" "$HOME/.config/waybar/colors.css"

# --- 3. Nvim ---
link_file "$THEME_DIR/nvim_theme.lua" "$HOME/.config/nvim/lua/current_theme.lua"

hyprctl reload

pkill waybar
sleep 0.5
hyprctl dispatch exec waybar &>/dev/null &

send_notif "Thème <b>$THEME</b> appliqué avec succès ! 🎨" "normal" "emblem-default"
