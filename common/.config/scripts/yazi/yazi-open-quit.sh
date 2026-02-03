#!/bin/bash

FILE="$1"

# 1. OUVERTURE DU FICHIER
# On détecte si c'est un fichier texte pour utiliser nvim, sinon on utilise l'app par défaut (xdg-open)
mime_type=$(file --mime-type -b "$FILE")

if [[ "$mime_type" == text/* || "$mime_type" == "application/json" || "$mime_type" == "application/javascript" ]]; then
    # C'est du texte : on ouvre un nouveau terminal avec nvim
    nohup kitty -e nvim "$FILE" >/dev/null 2>&1 &
else
    # C'est autre chose (Image, PDF, Vidéo) : on laisse le système décider (xdg-open)
    nohup xdg-open "$FILE" >/dev/null 2>&1 &
fi

# 2. FERMETURE CONDITIONNELLE
# On ne ferme Yazi que si la variable YAZI_FLOAT est détectée
if [ "$YAZI_FLOAT" == "1" ]; then
    ya emit quit
fi
