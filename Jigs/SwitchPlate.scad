//=================================================================================
// switchplate.scad
//
// Cover for the LED dimmer switches
//
// Dr Tom Flint, 19 Sept 2021
//=================================================================================

use <../Parts/rounder.scad>


r1=3;
d1=96.2;

//--------------------------------------------------------
module plate1(){

difference(){
  // main boss
  minkowski(){
    cube([75-2*r1,116-2*r1,8-2*r1],center=true);
    sphere(r1,$fn=88);
  }
  
  // take off half below zero
  translate([0,0,-10])
  cube([100,200,20],center=true);

  // backside cut for clearance
  difference(){
    cube([75-2*r1,116-2*r1,8-2*r1+2],center=true);
    translate([0,d1/2,0])
    cylinder(r=8.5/2,h=10,$fn=44,center=true);
    translate([0,-d1/2,0])
    cylinder(r=8.5/2,h=10,$fn=44,center=true);
  }
  // cut for switch rocker
  cube([33,66,12],center=true);

  translate([0,d1/2,0])
  cylinder(r=4.5/2,h=10,$fn=44,center=true);
  translate([0,d1/2,4-2.7])
  cylinder(r1=4.5/2,r2=7.0/2,h=2.7,$fn=44);
  
  
  translate([0,-d1/2,0])
  cylinder(r=4.5/2,h=10,$fn=44,center=true);
  translate([0,-d1/2,4-2.7])
  cylinder(r1=4.5/2,r2=7.0/2,h=2.7,$fn=44);
}


}
//===================================================================

plate1();

//===================================================================


