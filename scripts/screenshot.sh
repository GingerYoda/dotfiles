#!/bin/bash
FILENAME="screenshot_`date +%F-%H-%M-%S`"
grim -g "$(slurp)" ~/pictures/screenshots/$FILENAME.png
