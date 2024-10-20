//=================================================================================
// birdcam.scad
//
// Bird camera redux
// This is just the armored ethernet cable and mating part
//
// Dr Tom Flint, 24 Sept 2021
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>



//-----------------------------------------------------------------------------------
module cable1(){
 
difference(){
  translate([0,0,10])
  cube([15,15,20],center=true);
  metric_thread (diameter=12.3, pitch=6.3, length=20, thread_size=3, groove=true);
}

}

//======================================================================================

difference(){
  cable1();
  translate([20,0,-1])
  cube([40,40,60], center=true);
  
  cylinder(r=5.2,h=60,center=true,$fn=89);
}
  

//======================================================================================

