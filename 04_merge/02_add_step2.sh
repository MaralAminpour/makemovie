#!/bin/bash

#nframes=`grep "MODEL" ../01_trajectory/01_whole-trajectory/traj.pdb 
# | tail -1 | awk '{ print $2 }'`

nlines=`wc -l ../02_fec/smooth.dat | awk '{ print $1 }'`
nframes=`echo "scale=5;$nlines/400" | bc`

#I replaces movie-vmd with movie-vmd

while read line || [[ $line ]]; do

echo $line
echo ../02_fec/forces/force_$line.png  ../03_conan-contact/frames/$line.domains.png  ../01_trajectorty/02_movie-vmd/movie-vmd.$line.jpg
convert  ../02_fec/forces/force_$line.png ../03_conan-contact/frames/$line.domains.png  +append ../04_merge/out.png

magick convert ../01_trajectory/02_movie-vmd/movie-vmd.$line.jpg  -resize 200% ../01_trajectory/02_movie-vmd/movie-vmd2.$line.jpg

convert  ../04_merge/out.png   ../01_trajectory/02_movie-vmd/movie-vmd2.$line.jpg -append ../04_merge/out_$line.png
done < list



