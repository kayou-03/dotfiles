#!/bin/bash

# This script switches the keyboard layout between French and Belgian
# by reordering the layouts in the hyprland configuration.

CURRENT_LAYOUTS=$(hyprctl getoption input:kb_layout | awk -F ' ' '/str:/{print $2}')

if [[ $CURRENT_LAYOUTS == "fr,be" ]]; then
    hyprctl keyword input:kb_layout be,fr
elif [[ $CURRENT_LAYOUTS == "be,fr" ]]; then
    hyprctl keyword input:kb_layout fr,be
else
    # Default to fr,be if the layout is not one of the expected ones
    hyprctl keyword input:kb_layout fr,be
fi
