#!/bin/bash


#series2    
#for dir in frame00{1..5}; do #run8
#for dir in frame00{6..9}; do #run9
#for dir in frame010; do #run9
#for dir in frame0{11..25}; do #run4
#for dir in frame0{26..29}; do #run5
#for dir in frame030; do #run5
#for dir in frame0{31..36}; do #run4
for dir in frame0{37..41}; do #run7


a=`echo $dir | sed 's/frame0//g'`  

echo $a

cd $dir/protein/*10/

echo "
parm ../../protein/common/start.prmtop
trajin ../../protein/asmd_v_10/run7/asmd.1.mdcrd
trajin ../../protein/asmd_v_10/run7_ext/asmd.1.mdcrd

strip :WAT,Na+,Cl-
#trajout traj.pdb onlyframes 1-239
trajout traj.pdb" > cpptraj.in

cpptraj -i cpptraj.in

cd ../../../

done

#cat $dir/protein/*10/run4/asmd.work.dat.1   $dir/protein/*10/run4_ext/asmd.work.dat.1     | awk '{print $2/10.0,"     "$3*69.4786}' > 201/asmd.work.dat_$a.1 

#cat $dir/protein/*10/run7/asmd.work.dat.1   $dir/protein/*10/run7_ext/asmd.work.dat.1     | awk '{print $2,"     "$3}' > all/asmd.work.dat_$a.1             

#cat $dir/protein/*10/run7/asmd.work.dat.1  | awk '{print $2,"     "$3}' > 201/asmd.work.dat_$a.1





