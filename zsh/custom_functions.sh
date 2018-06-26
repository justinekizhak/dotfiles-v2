#!/usr/bin/env sh

add-to-path () {
        if ! echo "$PATH" | /usr/bin/grep -Eq "(^|:)$1($|:)" ; then
           if [ "$2" = "after" ] ; then
              PATH="$PATH:$1"
           else
              PATH="$1:$PATH"
           fi
        fi
}

add-to-path /Users/justine/Library/Python/3.6/bin
