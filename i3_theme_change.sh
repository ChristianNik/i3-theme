#!/bin/bash

theme=$1

I3_CONFIG_PATH="/home/christian/.config/i3/config"
NEW_I3_CONFIG_PATH="/home/christian/.themes/i3/$theme/.i3/config"

COMPTON_CONFIG_PATH="/home/christian/.config/compton.conf"
NEW_COMPTON_CONFIG_PATH="/home/christian/.themes/i3/$theme/.config/compton.conf"

# link i3 config
rm $I3_CONFIG_PATH
ln -s $NEW_I3_CONFIG_PATH $I3_CONFIG_PATH

# link compton config
rm $COMPTON_CONFIG_PATH
ln -s $NEW_COMPTON_CONFIG_PATH $COMPTON_CONFIG_PATH
# kill
killall polybar
killall compton
# restart
i3-msg restart
