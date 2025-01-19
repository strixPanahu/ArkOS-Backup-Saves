echo ---------------------------------------------------
echo                 ArkOS Saves Script                 
echo  https://github.com/strixPanahu/ArkOS-Backup-Saves
echo ---------------------------------------------------

#!/bin/bash

# Housekeeping
sourceDirectory="/media/strixp/EASYROMS/"
destinationDirectory="/media/strixp/EASYROMS/saves"

echo "Source: $sourceDestination"
echo "Destination: $destinationDirectory"

# Create destination directory if it doesn't exist
if [ ! -d "$sourceDirectory" ]; then
    mkdir -p "$targetDirectory"
fi

# Copy each .srm (save) and .state (state) file to the destination directory
shopt -s globstar nullglob
echo "Loading save files, please wait . . ."
echo
for file in "$sourceDirectory"/**/*.{eep,fs,hi,mcd,mpk,nv,sav,srm,st0,state,auto}; do
    relativePath="${file#$sourceDestination/}"
    destinationPath="$destinationDirectory$relativePath"

    # Create the destination directory if it doesn't exist
    destinationDir="$(dirname "$destinationPath")"
    if [ ! -d "$destinationDir" ]; then
        mkdir -p "$destinationDir"
    fi

    # Copy the file
    sudo cp -u "$file" "$destinationPath"
    echo "Copied $file"
done

echo
echo "All game saves successfully copied to the Saves folder in the ROMS directory."
echo
(   trap "stty $(stty -g;stty -icanon)" EXIT
    LC_ALL=C dd bs=1 count=1 >/dev/null 2>&1
)   </dev/tty
