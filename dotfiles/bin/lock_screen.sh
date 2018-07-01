#!/usr/bin/env bash

#
# Lock the screen using i3lock-color, a fork of i3lock
#
# Makes some assumptions on the image, e.g date and time are shown in black at the top and the
# input layout in white at the bottom. You might need to change this if your image has conflicting colors.
#

# image to display
img=$HOME/Pictures/screenlock/lockbg_wicon.png

# colors
blank="#00000000"
blue="#00549fff"
red="#a11035ff"
black="#000000ff"
grayed="#00000033"
text_dark="#000000ff"
text_light="#ddddddff"

# parameters specific to i3lock-color
COL_PARAM=(
    --insidevercolor=$grayed \
    --ringvercolor=$blue \
    --veriftext="" \
    \
    --insidewrongcolor=$grayed \
    --ringwrongcolor=$red \
    --wrongtext="" \
    \
    --noinputtext="" \
    \
    --insidecolor=$blank \
    --ringcolor=$black \
    --line-uses-inside \
    --separatorcolor=$black \
    \
    --verifcolor=$text_dark \
    --wrongcolor=$text_dark \
    --timecolor=$text_dark \
    --datecolor=$text_dark \
    --layoutcolor=$text_light \
    --keyhlcolor=$blue \
    --bshlcolor=$red \
    \
    --screen 1 \
    --clock \
    --timepos="w/2:h/8" \
    --time-align=0 \
    --timesize=60 \
    --datepos="w/2:h/8+60" \
    --date-align=0 \
    --datesize=30 \
    --layoutpos="w/2:h*11/12" \
    --layout-align=0 \
    --layoutsize=30 \
    --radius=120 \
    --timestr="%H:%M:%S" \
    --datestr="%Y-%m-%d" \
    --keylayout 2 \
    )

# run the lock command
i3lock-color "${COL_PARAM[@]}" -i $HOME/Pictures/screenlock/lockbg_wicon.png 2>/dev/null
