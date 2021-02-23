#!/bin/bash

nframes=`grep "MODEL" 01_trajectory_201/01_whole-trajectory_201/traj.pdb | tail -1 | awk '{ print $2 }'`
echo $nframes


nlines=`wc -l 02_fec_201/data | awk '{ print $1 }'`
nframes=`echo "$nlines/400" | bc`
echo $nframes
