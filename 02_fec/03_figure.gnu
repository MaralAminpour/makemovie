#set terminal png size 1000,800 
#marg=0.4
#set bmargin at screen 0.1 
set tmargin at screen 0.7 
set lmargin at screen 0.3 
#set rmargin at screen  3 
#set rmargin at screen 1-marg

#set terminal png size 1000,800 font "Arial, 18" 
set term pngcairo size 1000,800 font "Arial, 22"   
#set term pngcairo size 1200,1080  
set output 'force.png'
set style line 1 lc rgb 'red' pt 7
set style line 2 lc rgb 'black'
set pointsize 2
set ylabel  "Force (pN)"
set xlabel  "Distance (nm)"
set title "time=zaman ns"
plot 'smooth.dat' using 1:2 w l ls 2 notitle,\
     "<echo 'item'" with points ls 1 notitle
     exit

