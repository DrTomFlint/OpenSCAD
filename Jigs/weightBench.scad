//======================================================================
// weightBench.scad
//
// DrTomFlint 17 Oct 2024
//
//======================================================================

use <../Parts/rounder.scad>

//----------------------------------------------------------------------
module foot(){
  
out=55.75;
hi=34;
thick=3.0;

  difference(){
    cube([out,out,hi]);
    translate([thick,thick,1.5])
    cube([out-2*thick,out-2*thick,hi]);
  }
  
  for(i=[0:5]){
    translate([5.5+8*i,-5,0])
    cube([5,5,hi]);
  }
  translate([0,-5,0])
  cube([6,5,hi]);
  translate([out-6,-5,0])
  cube([6,5,hi]);
  
}

//======================================================================

foot();

//======================================================================