#!/bin/bash

# Variables
THEME_NAME=$1
themeFolder="$HOME/.themes/i3/$THEME_NAME"
outputPath="$themeFolder/.i3"
outputFileName="config"
themeSourceFolder="$outputPath"
themeModuleFolder="$outputPath/modules"
configFile="$outputPath/$outputFileName"

# Functions
function buildConfig {
    rm $configFile
    touch $configFile
    # Import srcFiles (Module index)
    source "$themeSourceFolder/theme.i3"

    cat <<EOT >>$configFile
#
#
#  Name: ${THEME_NAME^^}
#
#

EOT

    # Write every module in config
    for filename in "${modules[@]}"; do
        cat <<EOT >>$configFile
#
#  ${filename^^}
#
EOT
        cat "$themeModuleFolder/$filename.i3" | awk '{$1=$1};1' >>$configFile
    done
}

function checkThemeExists {
    if [ ! -d "$THEME_NAME" ]; then
        echo "Theme »${THEME_NAME}« does not exist."
        exit
    fi
}

function debug {
    echo "THEME_NAME: $THEME_NAME"
    echo "themeFolder: $themeFolder"
    echo "outputPath: $outputPath"
    echo "outputFileName: $outputFileName"
    echo "themeSourceFolder: $themeSourceFolder"
    echo "themeModuleFolder: $themeModuleFolder"
    echo "configFile: $configFile"
}

# Main
debug
# checkThemeExists
buildConfig
