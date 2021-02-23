#!/bin/bash

#series1
#for dir in frame00{1..9}; do  #run1
#for dir in frame0{10..14}; do #run1
#for dir in frame0{15..28}; do #run2
#for dir in frame0{29..41}; do #run3

#series3
for dir in frame00{1..9}; do #run4
#for dir in frame0{10..41}; do #run4

#series2    
#for dir in frame00{1..5}; do #run8
#for dir in frame00{6..9}; do #run9
#for dir in frame010; do #run9
#for dir in frame0{11..25}; do #run4
#for dir in frame0{26..29}; do #run5
#for dir in frame030; do #run5
#for dir in frame0{31..36}; do #run4
#for dir in frame0{37..41}; do #run7

a=`echo $dir | sed 's/frame0//g'`  

echo $a

#cat $dir/protein/*10/run5/asmd.work.dat.1   $dir/protein/*10/run5_ext/asmd.work.dat.1     | awk '{print $2/10.0,"     "$3*69.4786}' > 201/asmd.work.dat_$a.1 

#cat $dir/protein/*10/run4/asmd.work.dat.1   $dir/protein/*10/run4_ext/asmd.work.dat.1     | awk '{print $2,"     "$3}' > all/asmd.work.dat_$a.1

cat $dir/protein/*10/run4/asmd.work.dat.1    | awk '{print $2,"     "$3}' > 201/asmd.work.dat_$a.1


done



