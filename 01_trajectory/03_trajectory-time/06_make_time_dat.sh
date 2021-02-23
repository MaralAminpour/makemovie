#!/bin/bash
ntwx=400000
dt=0.002
rm time.dat

nframes=`grep "MODEL" ../01_whole-trajectory/traj.pdb | tail -1 | awk '{ print $2 }'`

for (( k = 0; k < $nframes; ++k )); do
   realtime=$(( k * $ntwx ))
   echo "$realtime" > file1
   cat file1 | awk '{print $1*0.002}' >> time.dat
   rm file1 
done
