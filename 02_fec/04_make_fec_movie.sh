#!/bin/bash
mencoder -vf scale=1200:1080 -ovc x264 -x264encopts bitrate=2000 -mf fps=24:type=png -oac copy -noskip -o forces/forces.mp4 "mf://forces/force_%05d.png"

