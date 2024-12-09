#!/bin/sh

if [ "$(pgrep -x redshift)" ]; then
        echo "%{F#EBCB8B} "
    else
        echo "%{F#D08770} "
fi
