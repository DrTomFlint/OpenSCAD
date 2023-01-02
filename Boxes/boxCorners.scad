//=================================================================================
// boxCorners.scad
//
// For Fairy Crystal storage box.
//
// Dr Tom Flint, 1 Jan 2023
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>

r1=4;   // radius of knob
$fn=8;

//-----------------------------------------------------------------------------------
module top1(){

extra=0.5;

difference(){
  union(){
    translate([125,100, 84-extra])
    rotate([0,0,180/8])
    cylinder(r=r1,h=26+extra);

    translate([125,100, 84+26])
    rotate([90,0,0])
    rotate([0,0,180/8])
    cylinder(r=r1,h=100+extra);

    translate([125,100, 84+26])
    rotate([0,-90,0])
    rotate([0,0,180/8])
    cylinder(r=r1,h=125+extra);

    translate([125.2,100.2, 84+26])
    rotate([0,0,180/8])
    sphere(r=r1);
  }
  boxTop(a=0);
  boxBase();
}
}

//-----------------------------------------------------------------------------------
module boxTop(a=0){

translate([-250/2,-200/2,84])
translate([0,-2,0])
rotate([a,0,0])
translate([0,2,0])
cube([250,200,26]);



}

//-----------------------------------------------------------------------------------
module boxBase(){

translate([0,0,84/2])
cube([250,200,84],center=true);




}

//================================================================================

//color("cyan")
//boxTop(a=0);

//boxBase();

//top1();

mirror([1,0,0])
top1();

if(0){
  rotate([0,0,180]){
    top1();
    mirror([1,0,0])
    top1();
  }
}

//================================================================================

