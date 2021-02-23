#!/bin/bash

#cat asmd.work.dat_*.1   | awk ' {print  $1/10.0,"     "$2*69.4786}' > data1
#cat data1 | awk ' ($1)<=205.56 {print  $1,"     "$2}' > data

cat smooth_*.dat | awk ' ($1)<=205.56 {print  $1,"     "$2}' > data


#python /Users/Maral/Dropbox/woodside/movie/conan-1.0/applications/frame023/03_fec/01_plot_FEC.py data

#rm data1
#mv  smooth.dat smooth_1.dat

#cat smooth_1.dat | awk ' ($2)<=205.56 {print  $1,"     "$2}' > smooth.dat


