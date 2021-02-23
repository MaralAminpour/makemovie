# make sure, that the main menu is active
menu main on
#### Changes turning-on of menus
menu graphics on ;# shows representations dialog 
after idle { menu tkcon on }
#### Changes display defaults
display resize 600 600
#scale by 1.8
axes location off
display projection orthographic 
color Display Background white
#### Changes defaults for molecule representations
mol default style VDW ;# sets default style for representations (VDW not Lines) 
mol default selection protein
mol material Edgy

mol new ../../protein/common/start.prmtop type parm7
#mol addfile ../../protein/common/start.pdb type pdb
mol addfile ../01_whole-trajectory/traj.pdb type pdb

#mol addfile ../01_whole-trajectory_201/traj.pdb type pdb waitfor all


# modify display settings
display projection orthographic
axes location off
color Display Background white

light 0 on
light 1 on
light 2 off
light 3 off
 
mol modselect 0 top "protein"
mol modcolor 0 top Structure
mol modstyle 0 top NewCartoon 


mol material Edgy
color change rgb 32 0 0.501 1
mol addrep top
mol modselect 1 top "protein and resid  431 to  571"
mol modcolor 1 top ColorID 32
mol modstyle 1 top NewCartoon

color change rgb 31  0.152 0.701 0.462
mol addrep top
mol modselect 2 top "protein and resid 288 to  428"
mol modcolor 2 top ColorID 31
mol modstyle 2 top NewCartoon

mol addrep top
mol modselect 3 top "protein and resid 145 to  285"
mol modcolor 3 top ColorID 2
mol modstyle 3 top NewCartoon

mol addrep top
mol modselect 4 top "protein and resid 2 to 142"
mol modcolor 4 top ColorID 1
mol modstyle 4 top NewCartoon

mol addrep top
mol modselect 5 top "protein and resid  429  to  430"
mol modcolor 5 top ColorID 27
mol modstyle 5 top NewCartoon

mol addrep top
mol modselect 6 top "protein and resid  286  to  287"
mol modcolor 6 top ColorID 27
mol modstyle 6 top NewCartoon

mol addrep top
mol modselect 7 top "protein and resid 143 to  144"
mol modcolor 7 top ColorID 27
mol modstyle 7 top NewCartoon

##display update

##animate secondary structure
source sscashe.tcl
source stride.tcl
start_sscache "top"
sscache
stop_sscache "top"



