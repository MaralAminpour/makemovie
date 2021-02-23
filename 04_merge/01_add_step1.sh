#!/bin/bash

nlines=`wc -l ../02_fec/smooth.dat | awk '{ print $1 }'`
nframes=`echo "scale=5;$nlines/400" | bc`

#nframes=`grep "MODEL" ../01_trajectory_201/01_whole-trajectory/traj.pdb | tail -1 | awk '{ print $2 }'`

#how to get the list
awk -v start=0 -v end=$nframes 'BEGIN{for (i=start; i<=end; i++) printf("%05d\n", i)}' > list

#while read line || [[ $line ]]; do

#echo $line
##echo ./forces/force_$line.png ./frames/$line.png  ./movie-vmd/movie-vmd.$line.jpg
#echo ../03_fec/forces/force_$line.png  ../04_conan-contact/frames/$line.domains.png  ../02_trajectorty/02_movie-vmd/movie-vmd.$line.jpg
#convert  ../03_fec/forces/force_$line.png ../04_conan-contact/frames/$line.domains.png  +append ../05_merge/out.png
#convert  ../05_merge/out.png   ../02_trajectorty/02_movie-vmd/movie-vmd.$line.jpg  -append ../05_merge/out_$line.png
#done < list



