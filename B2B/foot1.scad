//=================================================================================
// foot1.scad
//
// Foot for 30x60 base T-slot on the B2B rig.
//
// Dr Tom Flint, 25 Dec 2020
//=================================================================================

use <../Parts/switch2.scad>
use <../Parts/tslot.scad>
use <../Parts/rounder.scad>

//--------------------------------------------------------------------------------

module foot(){

y1 = 29;
z1 = -1;
y2 = 40;
z2  = -50;

difference(){
  union(){
    minkowski(){
    hull(){
      color("cyan")
      translate([-3+2,y1,z1])
      rotate([0,90,0])
      cylinder(r=4,h=10-4,$fn=88);
      color("green")
      translate([-3+2,-y1,z1])
      rotate([0,90,0])
      cylinder(r=4,h=10-4,$fn=88);

      color("pink")
      translate([-3+2,y2,z2])
      rotate([0,90,0])
      cylinder(r=4,h=10-4,$fn=88);
      color("red")
      translate([-3+2,-y2,z2])
      rotate([0,90,0])
      cylinder(r=4,h=10-4,$fn=88);
    }
    sphere(r=2,$fn=44);
  }
    // tab
    translate([15,0,-30-3])
    cube([20,54,7],center=true);
  }
  
  // cut for tslot
  translate([0,0,-15])
  rotate([0,90,0])
  tslot1(type=2, len=60, tol=0.20);

  // recut tslot hole
  translate([10,0,-15])
  cube([20,60-1,30-1],center=true);
  
  // M5 bolt holes for Tnuts
  translate([17,15,-45])
  cylinder(r=3,h=20,$fn=44);
  translate([17,-15,-45])
  cylinder(r=3,h=20,$fn=44);

  // reduce the size of the tab
  translate([25,-54/2,-45])
  rotate([0,0,90])
  rounder(r=15,h=20,f=88);
  translate([25,54/2,-45])
  rotate([0,0,180])
  rounder(r=15,h=20,f=88);
  
  // bottom side arch  
  translate([2,0,-60])
  rotate([0,90,0])
  scale([1,2,1])
  cylinder(r1=15,r2=15,h=15,$fn=133,center=true);

  // cut for text
  color("red")
  translate([-3+0.3,0,-30])
  rotate([0,-90,0])
  rotate([0,0,-90])
  linear_extrude(height=0.6,scale=1)
  text("Aero Amp", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);

}

// fillet
color("pink")
translate([7,54/2,-36.5])
rotate([90,0,0])
rotate([0,0,-90])
rounder(r=6,h=54,f=55);



}
//-----------------------------------------------------------------------------
module footT(){

      color("red")
      translate([-3+0.6,0,-30])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.6,scale=1)
      text("Aero Amp", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);

}
  
//===============================================================================



foot();

//footT();

if(0){
  color("silver")
  translate([0,0,-15])
  rotate([0,90,0])
  tslot1(type=2, len=60, tol=0);
}

//===============================================================================
  
