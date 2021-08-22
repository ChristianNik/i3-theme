#!/bin/bash

TYPE=$1
NAME=$2

case $TYPE in
"use")
    echo "Switching to $NAME"
    /home/christian/.scripts/i3-theme/i3_theme_change.sh $NAME
    ;;
"build")
    /home/christian/.scripts/i3-theme/i3_theme_build.sh $NAME
    ;;

esac
