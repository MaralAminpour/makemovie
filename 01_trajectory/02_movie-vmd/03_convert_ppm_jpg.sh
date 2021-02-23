#!/bin/bash
  
nframes1=`grep "MODEL" ../01_whole-trajectory/traj.pdb | tail -1 | awk '{ print $2 }'`
nframes=`echo "$nframes1-1" | bc`
echo $nframes

#how to get the list
awk -v start=0 -v end=$nframes 'BEGIN{for (i=start; i<=end; i++) printf("%05d\n", i)}' > list

while read line || [[ $line ]]; do

echo $line
#convertformat  movie-vmd-frame023.$line.ppm  movie-vmd-frame023.$line.jpg
convertformat movie-vmd.$line.ppm movie-vmd.$line.jpg

done < list

