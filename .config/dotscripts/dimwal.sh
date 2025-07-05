#!/bin/bash

# Script to create a hyprland pywal colors file with lowered alpha values #

# Path to the source file from wal
source_file="$HOME/.cache/wal/colors-hyprland.conf"

# Path to the destination file for hyprlock
dest_file="$HOME/.cache/wal/colors-hyprlock-dim.conf"

# Check if the source file exists
if [ ! -f "$source_file" ]; then
    echo "Source file not found: $source_file"
    exit 1
fi

# Create new color variables with 0.5 alpha and write to dest_file
grep '^\$color' "$source_file" | sed -e 's/,1.0)/,0.8)/' -e 's/^\$color[0-9]\+/&_dim/' > "$dest_file"