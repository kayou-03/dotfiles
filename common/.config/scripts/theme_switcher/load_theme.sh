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

# --- 4. SWAYNC ---
link_file "$THEME_DIR/swaync-notif.css" "$HOME/.config/swaync/notifications.css"
link_file "$THEME_DIR/swaync-panel.css" "$HOME/.config/swaync/central_control.css"

# --- 5. KITTY ---
link_file "$THEME_DIR/kitty_colors.conf" "$HOME/.config/kitty/colors.conf"

# --- 6. Rofi ---
link_file "$THEME_DIR/rofi.rasi" "$HOME/.config/rofi/colors.rasi"

# --- 7. Starship ---
link_file "$THEME_DIR/colors_starship.toml" "$CONFIG_DIR/starship.toml"

hyprctl reload

pkill waybar
sleep 0.5
hyprctl dispatch exec waybar &>/dev/null &

send_notif "Thème <b>$THEME</b> appliqué avec succès ! 🎨" "normal" "emblem-default"
