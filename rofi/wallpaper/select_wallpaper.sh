#!/bin/bash

# Dossier des images
DIR="$HOME/Images/backgrounds"

# 1. Générer la liste formatée pour Rofi
# La syntaxe magique est : Nom_Fichier \0icon\x1f Chemin_Complet
# Cela dit à Rofi : "Affiche ce nom, et utilise ce chemin comme icône"
list_wallpapers() {
    for file in "$DIR"/*.{jpg,jpeg,png,webp}; do
        # On vérifie si des fichiers existent pour éviter les erreurs
        [ -e "$file" ] || continue
        
        filename=$(basename "$file")
        echo -en "$filename\0icon\x1f$file\n"
    done
}

# 2. Lancer Rofi avec notre thème spécial
# On appelle la fonction list_wallpapers et on envoie le tout à rofi
CHOIX=$(list_wallpapers | rofi -dmenu -theme ~/.config/rofi/wallpaper/wallpaper.rasi -p "Choisir Wallpaper")

# 3. Appliquer le choix
if [ -n "$CHOIX" ]; then
    FULLPATH="$DIR/$CHOIX"
    
    # Notification
    notify-send "Wallpaper" "Changement vers $CHOIX..."
    
    # Commandes
    swww img "$FULLPATH" --transition-type grow --transition-pos 0.5,0.5 --transition-step 90
    matugen image "$FULLPATH"
fi
