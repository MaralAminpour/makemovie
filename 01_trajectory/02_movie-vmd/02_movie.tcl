set freq 1
	# get the number of frames in the movie
	set num [molinfo top get numframes]
	# loop through the frames
	for {set i 0} {$i < $num} {incr i $freq} {
		# go to the given frame
		animate goto $i
                # for the display to update
                display update
		# take the picture
		set filename movie-vmd.[format "%05d" [expr $i/$freq]].ppm
#		render snapshot $filename
                render TachyonInternal $filename
	}
#exec convert movie-vmd.*.ppm movie.gif
#exec convert -delay 10 -loop 2 shapshot.*.rgb movie.gif

#exec convert -delay 20 movie-vmd.*.ppm movie.gif
