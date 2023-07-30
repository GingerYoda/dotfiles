#!/bin/bash
FILENAME="screenshot_`date +%F-%T`"
grim -g "$(slurp)" ~/Pictures/Screenshots/$FILENAME.png
