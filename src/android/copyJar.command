#!/bin/bash

# Configuration
plugin="admob"
version="39"
moveToOld=false

# Step 1: Rename plugin-debug.aar to plugin-debug.zip
cp "plugin/build/outputs/aar/plugin-debug.aar" "plugin/build/outputs/aar/plugin-debug.zip"

# Step 2: Extract the content and overwrite existing files without prompting
unzip -o "plugin/build/outputs/aar/plugin-debug.zip" -d "plugin/build/outputs/aar/plugin-debug"

# Step 3: Copy classes.jar
cp "plugin/build/outputs/aar/plugin-debug/classes.jar" "/Users/aez/corona_uncrossed/UnCrosswords/android/app/libs/plugin.$plugin-$version.jar"
cp "plugin/build/outputs/aar/plugin-debug/classes.jar" "plugin/build/outputs/plugin.$plugin-$version.jar"

# Step 4: Check if moveToOld is true, then perform the operations
if [ "$moveToOld" = true ]; then
  # Step 5: Check if aar-old folder exists, and delete it if it does
  if [ -d "plugin/build/outputs/aar-old" ]; then
    rm -rf "plugin/build/outputs/aar-old"
  fi

  # Step 6: Rename aar to aar-old
  mv "plugin/build/outputs/aar" "plugin/build/outputs/aar-old"
fi
