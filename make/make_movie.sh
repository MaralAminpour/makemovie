#!/bin/bash 

#for dir in   frame003  frame004 frame008  frame010 frame011 frame013 frame016 frame018 frame022 frame024 frame028 frame029 frame033 frame035 frame036


for dir in frame003  frame005 frame008  frame009 frame011 frame012 frame013 frame015 frame023 frame026 frame036 frame037 frame038

do

echo $dir
cp scripts/prepare_movie.sh $dir

cd $dir
bash prepare_movie.sh
cd ..

done
