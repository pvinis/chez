#!/usr/bin/env bash


# Function to toggle the color filter
toggle_color_filter() {
  shortcuts run "_color-filter-toggle"
}

# Main script
if [ "$1" = "toggle" ]; then
  toggle_color_filter
fi

# Display the current state in the menu bar
echo "Color"
echo "---"
echo "Toggle | bash='$0' param1=toggle terminal=false"
