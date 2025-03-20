#!/bin/bash
FILENAME="screenshot_`date +%F-%H-%M-%S`"
grim -g "$(slurp)" ~/Pictures/screenshots/$FILENAME.png
