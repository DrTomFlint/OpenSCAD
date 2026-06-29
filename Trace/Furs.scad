//======================================================================
// Furs.scad
//
// Desert Furs Coyote logo
//
// DrTomFlint 29 JUne 2026
//
//======================================================================

use <../Parts/rounder.scad>

layer = 0.24;
thick = 4*layer;
mag = 0.075;

F1 = 99;
F2 = 24;  



//----------------------------------------------------------------------
module FursBlack(){

  render()
  intersection(){
    translate([0,0,1])
    scale([mag,mag,1])
    surface(file="./FursBlack.png", center = true, invert=true);
  
    translate([0,0,thick/2])
    cube([1000,1000,thick],center=true);
  }

}

//======================================================================


FursBlack();

//======================================================================
