#!/bin/bash

. ~/.rc/local.conf.d/config.ui
. ~/.rc/metascripts/common.include



set_value() {
    regex=$1
    value=$2
    file=$3

    echo "SETTING $regex $value to $file"

    sed -E -i.bak "s/($regex).+/\1$value/g" $file
}

set_cursor_size() {
    cursor_size=$1
    set_value "Xcursor\.size: " $cursor_size $custom_xresourcesconf
}

set_dpi() {
    dpi=$1
    set_value "Xft\.dpi: " $dpi $custom_xresourcesconf
}

set_icon_theme() {
    icon_theme=$1
    set_value "gtk-icon-theme-name = " $icon_theme $custom_gtk3conf
    set_value "gtk-icon-theme-name = " \"$icon_theme\" $custom_gtk2conf
}

set_theme() {
    theme=$1
    set_value "gtk-theme-name = " $theme $custom_gtk3conf
    set_value "gtk-theme-name = " \"$theme\" $custom_gtk2conf
}

set_wallpaper() {
    wp="$1"
    set_path="$HOME/.rc/local.conf.d/wallpaper.png"
    rm $set_path
    cp $wp $set_path
}

set_status_bar_font_size() {
    size=$1
    set_value "font pango: Font Awesome .+ Solid " $size $custom_i3conf
}

set_notifications_font_size() {
    size=$1
    set_value "font = Iosevka Term " $size $custom_dunstconf
}

set_launcher_font_size() {
    size=$1
    set_value "rofi\.font: Monospace " $size $custom_roficonf
}

set_gap_between_windows() {
    gap=$1
    set_value "gaps inner " $gap $custom_i3conf
}

get_red_from_RGB() {
    RGB=$1
    echo $(echo "scale=2; $(echo "ibase=16; $(echo "$RGB" | cut -c-2)" | bc)/255" | bc)
}

get_green_from_RGB() {
    RGB=$1
    echo $(echo "scale=2; $(echo "ibase=16; $(echo "$RGB" | cut -c3-4)" | bc)/255" | bc)
}

get_blue_from_RGB() {
    RGB=$1
    echo $(echo "scale=2; $(echo "ibase=16; $(echo "$RGB" | cut -c5-6)" | bc)/255" | bc)
}

set_window_shadow_color() {
    rgb=$(echo "$1" | tr -d "#" | tr [:lower:] [:upper:])

    red=$(get_red_from_RGB $rgb)
    green=$(get_green_from_RGB $rgb)
    blue=$(get_blue_from_RGB $rgb)

    set_value "shadow-red = " "$red;" $custom_comptonconf
    set_value "shadow-green = " "$green;" $custom_comptonconf
    set_value "shadow-blue = " "$blue;" $custom_comptonconf
}

set_focused_window_shadow_color() {
    rgb=$(echo "$1" | tr -d "#" | tr [:lower:] [:upper:])

    red=$(get_red_from_RGB $rgb)
    green=$(get_green_from_RGB $rgb)
    blue=$(get_blue_from_RGB $rgb)

    set_value "shadow-focused-red = " "$red;" $custom_comptonconf
    set_value "shadow-focused-green = " "$green;" $custom_comptonconf
    set_value "shadow-focused-blue = " "$blue;" $custom_comptonconf
}

set_focused_window_border_color() {
    rgb=$(echo "$1" | tr [:upper:] [:lower:])

    sed -E -i.bak "s/^ *client\.focused +(.+) +(.+) +(.+) +(.+) +(.+) */client\.focused $rgb $rgb \3 $rgb $rgb/g" "$red;" $custom_i3conf
}

declare -A UI_SETTER_OPTION=(

    ["DESKTOP_WALLPAPER"]="set_wallpaper"
    ["THEME"]="set_theme"
    ["ICON_THEME"]="set_icon_theme"

    ["DPI"]="set_dpi"

    ["CURSOR_SIZE"]="set_cursor_size"

    ["STATUS_BAR_FONT_SIZE"]="set_status_bar_font_size"
    ["NOTIFICATIONS_FONT_SIZE"]="set_notifications_font_size"
    ["PROGRAM_LAUNCHER_FONT_SIZE"]="set_launcher_font_size"

    ["MARGIN_GAP_BETWEEN_WINDOWS"]="set_gap_between_windows"
    
    ["WINDOW_SHADOW_COLOR"]="set_window_shadow_color"
    ["FOCUSED_WINDOW_BORDER_COLOR"]="set_focused_window_border_color"
    ["FOCUSED_WINDOW_SHADOW_COLOR"]="set_focused_window_shadow_color"

)


can_be_called() {
    pair=( $1 $2 )

    if [[ ${#pair[@]} -eq 2 ]]; then
        return 1
    fi

    return 0
}


for option in ${!UI_OPTION[@]}; do
    can_be_called ${UI_SETTER_OPTION["$option"]} ${UI_OPTION["$option"]}
    if [[ $? -eq 1 ]]; then
        ${UI_SETTER_OPTION["$option"]} ${UI_OPTION["$option"]}
    else
        echo "Unknown option '$option'"
    fi
    
done
