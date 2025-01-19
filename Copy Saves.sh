#!/bin/bash

# Housekeeping
sourceDirectory="/roms/"
destinationDirectory="/roms/Saves/"

echo "Source: $sourceDirectory"
echo "Destination: $destinationDirectory"
echo

# Create destination directory if it doesn't exist
if [ ! -d "$sourceDirectory" ]; then
    mkdir -p "$targetDirectory"
fi

# Copy each .srm (save) and .state (state) file to the destination directory
shopt -s globstar nullglob
echo "Searching, please wait . . ."
echo
for file in "$sourceDirectory"/**/*.{eep,fs,hi,mcd,mpk,nv,sav,srm,st0,state,auto}; do
    relativePath="${file#$sourceDirectory}"
    destinationPath="$destinationDirectory$relativePath"

    # Create the destination directory if it doesn't exist
    destinationDir="$(dirname "$destinationPath")"
    if [ ! -d "$destinationDir" ]; then
        mkdir -p "$destinationDir"
    fi

    # Copy the file
    cp -u "$file" "$destinationPath"
    echo "Copied $file"
done

echo
echo "Backup successful, see Saves folder in EASYROMS."
echo
sleep 7 &
pid=$!
wait $pid
