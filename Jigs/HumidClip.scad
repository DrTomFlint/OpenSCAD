//======================================================================
// HumidClip.scad
//
// clip to add humidity sensor to the big drybox.
//
// DrTomFlint, 19 Jan 2025
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>

F1=200;
F2=77;

//----------------------------------------------------------------------
module sensor(){

  cube([44.8,25.9,13.5],center=true);
  translate([0,0,13.5/2+1.9/2])
  cube([47.8,28.8,1.9],center=true);
  
  // side clips
  translate([44.6/2+1.8/2,0,-0.7])
  cube([1.8,5.9,12.0],center=true);
  translate([-44.6/2-1.8/2,0,-0.7])
  cube([1.8,5.9,12.0],center=true);
  
}
//----------------------------------------------------------------------
module clip(){

  // around the sensor
  difference(){
    translate([0,0,-1])
    cube([48,29,16],center=true);
    
    sensor();
  }
  // on the divider wall
  difference(){
    translate([0,0,-8-5])
    cube([48,13,10],center=true);
    
    translate([0,0,-8-5])
    cube([48,8.4,10],center=true);
  }


}


//======================================================================

//~ sensor();

clip();

//======================================================================
