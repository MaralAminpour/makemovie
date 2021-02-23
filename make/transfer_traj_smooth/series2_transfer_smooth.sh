#!/bin/bash

#series1
#for dir in frame00{1..9}; do  #run1
for dir in frame0{10..41}; do

a=`echo $dir | sed 's/frame0//g'`
echo $a

#cp  series1_all/asmd.work.dat_$a.1  frame0$a

cp series_2_205_56_1500_10_matlab/smooth_$a.dat frame0$a

done



