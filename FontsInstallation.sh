#!/usr/bin/env bash

####################################
# Tunables
read -p "Font-Dir? [Default $PWD]: "
CURRENT_DIR="$PWD"
FONT_DIR="${REPLY:=$CURRENT_DIR}"
declare -a FONTS
FIND="find \"$FONT_DIR\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0" 

[[ `uname` == 'Darwin' ]] && INSTALL_DIR="$HOME/Library/Fonts" || [[ `uname` == 'Linux' ]] && INSTALL_DIR="$HOME/.local/share/fonts" && mkdir -p $INSTALL_DIR  || echo "Not support Window" && exit 1


#####################################

echo "Find those fonts: "
FONTS=`eval $FIND | xargs -0 -I str echo str | rev | cut -d '/' -f 1 | rev` 
# Some how i could not use cut in the same line with xargs
echo "${FONTS}"

(( ${#FONTS[@]} < 1 ))  && echo "Please Install Some Font to $FONT_DIR" && exit 1

echo -e "Install All Fonts to $INSTALL_DIR:" 

eval $FIND | xargs -0 -I % cp "%" "$INSTALL_DIR/"

## Reset font cache on Linux

if command -v fc-cache @>/dev/null ; then
    echo -e "\nResetting font cache, this may take a moment..."
    fc-cache -f $INSTALL_DIR
fi

echo -e "\nAll fonts have been installed to $INSTALL_DIR"

exit 0 
