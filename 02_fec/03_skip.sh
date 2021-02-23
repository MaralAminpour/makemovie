#!/bin/bash

#step1
#extract force output in every 400 step (it can be from work.asmd.1.dat or the smooth.dat file 
#awk 'NR == 1 || NR % 400 == 0' smooth.dat > force.dat

rm -r forces
mkdir forces
#step2
#going over the lines (points) in force.dat file and replace the item from 06_figure.gnu with that point
i=0
j=0
# frame number*400(steps we skip)*timestep(0.002 ps)=$i*1.6 
echo $i
while read line || [[ $line ]]; do
    point=`echo $line`
    echo $point
  sed   "s/item/${point}/"  <03_figure.gnu> script.gnu
  sed   "s/zaman/${j}/"  <script.gnu> script3.gnu 
##replace the ^M (ctrl+V and ctrlM)  
  cat script3.gnu | sed  "s///g" > script2.gnu
  gnuplot script2.gnu
##mv force.png   forces/force_$i"_"$j.png
  mv force.png   forces/force_$i.png
  i=`echo "scale=5;$i+1" | bc`
  j=`echo "scale=5;$j+0.8" | bc`
  echo $i
  echo $j
  done < force.dat
    rm script*

cd forces    
num=0
#for i in force_"%1d"*.png
nlines=`wc -l ../smooth.dat | awk '{ print $1 }'`
nframes=`echo "$nlines/400" | bc`
echo $nframes
for (( i = 0; i =< $nframes; ++i )); do
echo $i
  f=force_$i.png
  a=`printf "%05d" $num`
#  echo $a
  mv "$f" "force_$a.png"
  let "num = $(($num + 1))"
done
cd ..
