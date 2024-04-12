#!/bin/bash

FOLDER_NAME="$1"
DIRECTORY_PATH="$2"

if [ -d "$DIRECTORY_PATH/$FOLDER_NAME" ]; then
    echo "Folder $FOLDER_NAME exists in $DIRECTORY_PATH"
else
    echo "Folder $FOLDER_NAME does not exist in $DIRECTORY_PATH"
fi