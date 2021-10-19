//=================================================================================
// rainbows.scad
//
// 
//
// Dr Tom Flint, 15 Oct 2021
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>


r0=40;      // radius of donut
wide1=2;    // thickness of donut

r1=2;       // holes for ribbons
Nholes=6;

//-----------------------------------------------------------------------------------
module rain1(){


difference(){

  rotate_extrude(angle=360,$fn=200)
  translate([r0,0,0])
  scale([1.5,1])
  circle(r=wide1,$fn=89);
  
  for(i=[0:Nholes-1]){
    rotate([0,0,360/Nholes*i])
    translate([r0,0,0])
    scale([0.3,1,1])
    cylinder(r=r1,h=2*wide1,$fn=89,center=true);
  }
  
  translate([0,0,-11])
  cube([3*r0,3*r0,20],center=true);
}

}

//=================================================================================

rain1();

//=================================================================================

