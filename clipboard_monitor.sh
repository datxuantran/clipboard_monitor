#!/bin/bash

if [ -n "$1" ]; then
    filename="data/$1"
else
    read -p "Enter filename: " filename
    filename="data/$filename"
fi

prev_data=""

# continuously monitor the clipboard
while true; do
    # get the current clipboard contents
    clipboard_data="$(xsel -o)"

    # check if the clipboard data has changed
    if [ "$clipboard_data" != "$prev_data" ]; then
        # append the new data to the file on a new line
        echo "$clipboard_data" >> "$filename"
        echo "New data added to $filename: $clipboard_data"
        prev_data="$clipboard_data"
    fi

    # wait for 1 second before checking the clipboard again
    sleep 1
done
