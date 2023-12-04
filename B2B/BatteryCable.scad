//======================================================================
// BatteryCable.scad
//
//
// DrTomFlint 3 Dec 2023
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/hexcut.scad>

rx=2.5;

// ---------------------------------------------------------------------
module elbow(len=5){

  rotate_extrude(angle=90,$fn=77){
    translate([len,0])
    circle(r=rx);
  }
}

// ---------------------------------------------------------------------
module BatteryCable(lid=0){

thick=5;

  difference(){
    if(lid==0){
      translate([8, 20, -2])
      cube([36,40,6],center=true);
    }
    if(lid==1){
      translate([8, 20, 2.5])
      cube([36,40,3],center=true);
    }

    elbow(len=5);
    translate([0,5,-5])
    rotate([90,0,0])
    rotate([0,0,90])
    elbow(len=5);

    translate([0,10,0]){
      elbow(len=12);
      translate([0,12,-5])
      rotate([90,0,0])
      rotate([0,0,90])
      elbow(len=5);
    }
    translate([12,10,0])
    rotate([90,0,0])
    cylinder(r=rx,h=10,$fn=55);
    
    translate([0,15,0]){
      elbow(len=20);
      translate([0,20,-5])
      rotate([90,0,0])
      rotate([0,0,90])
      elbow(len=5);
    }
    translate([20,15,0])
    rotate([90,0,0])
    cylinder(r=rx,h=20,$fn=55);

    translate([21,35,0])
    cylinder(r=rx,h=20,center=true,$fn=55);
    translate([3,12,0])
    cylinder(r=rx,h=20,center=true,$fn=55);

    translate([-10,0,-10])
    rounder(r=6,h=20,f=44);
    translate([-10,40,-10])
    rotate([0,0,-90])
    rounder(r=6,h=20,f=44);
  }
}

//======================================================================

//~ color("cyan")
//~ BatteryCable();
//~ translate([0,0,0.1])
BatteryCable(lid=1);

//======================================================================


