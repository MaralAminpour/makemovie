#!/bin/bash
#mencoder -vf scale=1200:1080 -of mpeg -ovc lavc  -lavcopts vcodec=mpeg1video  -mf fps=24:type=png  -oac copy  -o all.mpg "mf://out_%05d.png"

mencoder  -of mpeg -ovc lavc  -lavcopts vcodec=mpeg1video  -mf fps=24:type=png  -oac copy  -o merged_movies.mpg "mf://out_%05d.png"



