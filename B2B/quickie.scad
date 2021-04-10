//====================================================
// quickie.scad
// parts for the quick connects on coolant loop
//
// Dr Tom Flint, 2 March 2021
//====================================================

use <../Parts/threads.scad>

//--------------------------------------------------------
module flangeIn(){
  
  difference(){
    cylinder(r=13,h=3,$fn=8);
 
    translate([0,0,-0.1])
    #english_thread (diameter=11/16, threads_per_inch=24, length=1/4,
                    internal=true, n_starts=1, thread_size=-1, groove=false,
                    square=false, rectangle=0, angle=30, taper=0, leadin=0,
                    leadfac=1.0, test=false);
}

}

//--------------------------------------------------------

module flangeOut(){
  
  difference(){
    union(){
        cylinder(r=15,h=2,$fn=89);
        translate([0,0,2])
        cylinder(r=15,h=2.5,$fn=8);
     }
    translate([0,0,-0.1])
    english_thread (diameter=11/16, threads_per_inch=24, length=0.2,
                    internal=true, n_starts=1, thread_size=-1, groove=false,
                    square=false, rectangle=0, angle=30, taper=0, leadin=0,
                    leadfac=1.0, test=false);
}

}



//====================================================

//flangeIn();
flangeOut();

//====================================================


