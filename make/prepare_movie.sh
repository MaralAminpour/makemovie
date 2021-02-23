#!/bin/bash
mkdir trash
mv  0*  trash prepare_movie.sh trash

mkdir 01_trajectory 02_fec 03_conan-contact 04_merge 01_trajectory/01_whole-trajectory 01_trajectory/02_movie-vmd 01_trajectory/03_trajectory-time

#cp ../scripts/trajectory/cpptraj.in 01_trajectory/01_whole-trajectory
cp  protein/asmd_v_10/traj.pdb  01_trajectory/01_whole-trajectory

#cd 01_trajectory/01_whole-trajectory
#cpptraj -i cpptraj.in 
#cd ../..

echo out of 01_whole-trajectory

cp ../scripts/trajectory/01_prepare_movie.tcl 01_trajectory/02_movie-vmd
cp ../scripts/trajectory/02_movie.tcl  01_trajectory/02_movie-vmd
cp ../scripts/trajectory/03_convert_ppm_jpg.sh 01_trajectory/02_movie-vmd
cp ../scripts/trajectory/04_make_movie_vmd.sh 01_trajectory/02_movie-vmd
cp ../scripts/trajectory/05_movie_all_steps.tcl 01_trajectory/02_movie-vmd
cp ../scripts/trajectory/sscashe.tcl 01_trajectory/02_movie-vmd
cp ../scripts/trajectory/stride.tcl 01_trajectory/02_movie-vmd

cd 01_trajectory/02_movie-vmd
#vmd -dispdev text -eofexit < prepare_movie.tcl > output.log 
cd ../..

echo out of 02_movie-vmd

cp ../scripts/trajectory/06_make_time_dat.sh 01_trajectory/03_trajectory-time
cd 01_trajectory/03_trajectory-time
bash 06_make_time_dat.sh
cd ../..

echo out of 03_trajectory-time

cp ../scripts/fec_scripts/0* 02_fec
cp ../scripts/fec_scripts/README 02_fec
#cp ./protein/asmd.work.dat_*.1 02_fec
cp   smooth_*.dat  02_fec
cd 02_fec

#extract col1=distance col2=force from  asmd.work.dat_23.1 file --> data 
#bash 01_extract_fec_cut_direct.j 

# then i give data file to mosti and get mosti_smooth.dat
#cp data  smooth.dat
cat smooth_*.dat | awk ' ($1)<=205.56 {print  $1,"     "$2}' > smooth.dat

#step1
#extract force output in every 400 step (it can be from work.asmd.1.dat or the smooth.dat file 
awk 'NR == 1 || NR % 400 == 0' smooth.dat > force.dat


#step2
#going over the lines (points) in force.dat file and replace the item from 06_figure.gnu with that point

#we need to get the number of lines from smooth.dat
nlines=`wc -l smooth.dat | awk '{ print $1 }'`
nframes=`echo "$nlines/400" | bc`
sed   "s/item/${nlines}/"  <02_make_time_fec_dat.py> script_fec_time.py
python  script_fec_time.py > time_fec.dat 
bash 03_skip.sh
cd ..

echo out of 02_fec

cp ../scripts/conan_scripts/README 03_conan-contact
cp ../scripts/conan_scripts/domains.txt   03_conan-contact
cp ../scripts/conan_scripts/fine.inp  03_conan-contact
cp 01_trajectory/01_whole-trajectory/traj.pdb  03_conan-contact 
cp protein/common/protein.pdb 03_conan-contact
cp protein/common/start.pdb 03_conan-contact

cd 03_conan-contact
echo 2 | python  ../../scripts/conan_scripts/conan-1.0/conan.py fine.inp
cd ../

echo out of 03_conan-contact

cp ../scripts/merge/01_add_step1.sh  04_merge
cp ../scripts/merge/02_add_step2.sh  04_merge
cp ../scripts/merge/03_make-movie-merged.sh  04_merge 

cd 04_merge
bash 01_add_step1.sh
bash 02_add_step2.sh 
bash 03_make-movie-merged.sh
cd ..
 
echo out of 04_merge

