//=================================================================================
// estop.scad
// Model for pushbutton power cutoff switches
//
// Dr Tom Flint, 12 Dec 2020
//=================================================================================

use <../Parts/switch2.scad>
use <../Parts/tslot.scad>

//-----------------------------------------
module estop(){
  
  difference(){
    hull(){
      // base
      translate([0,0,-1])
      linear_extrude(height=2)
      offset(r=5,$fn=200)
      square([50,50], center=true);

 
      // top plate
      translate([0,0,40])
      cylinder(r=20,h=3,$fn=200);
    
    }

    // top rail
    color("cyan")
    translate([-30,0,-15])
    rotate([0,90,0])
    tslot1(type=2,len=60);

    // cut for switch barrel
    translate([0,0,-10])
    cylinder(r=6,h=60,$fn=88);
    
    // cut for switch body
    translate([0,0,-10])
    cylinder(r1=25,r2=16,h=47,$fn=200);
    
    // cut for bolts
    translate([-25,15,-10])
    cylinder(r=2,h=80,$fn=44);
    translate([25,-15,-10])
    cylinder(r=2,h=80,$fn=44);

    // Cut for the bolt head, use also for support
    translate([-25,15,6])
    cylinder(r=4,h=39,$fn=44);
    translate([25,-15,6])
    cylinder(r=4,h=39,$fn=44);
    
    // cut for the wires
    hull(){
      translate([0,0,17])
      rotate([90,0,0])
      cylinder(r=6,h=40,$fn=200);
      rotate([90,0,0])
      cylinder(r=12,h=40,$fn=200);
    }
    
    // cross section cut
    if(0){
      translate([0,0,-40])
      cube([200,200,200]);
    }
      
  }
  

}

//-----------------------------------------------------------
// support for printing the estop 
module estop_sup(){
    // Cut for the bolt head, use also for support
    translate([-25,15,6])
    cylinder(r=4,h=39,$fn=44);
    translate([25,-15,6])
    cylinder(r=4,h=39,$fn=44);
}

//----------------------------------------------------------------
module estop_topa(){

    difference(){
      // top plate
      cylinder(r1=20,r2=18,h=2,$fn=200);
      // cut for switch barrel
      translate([0,0,-10])
      cylinder(r=6,h=60,$fn=88);
    }
    
  }
//----------------------------------------------------------------
module estop_topb(){
      color("red")
      translate([0,-14,2])
      linear_extrude(height=0.6,scale=1)
      text("S", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

      color("red")
      rotate([0,0,35])
      translate([0,-14,2])
      linear_extrude(height=0.6,scale=1)
      text("T", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

      color("red")
      rotate([0,0,70])
      translate([0,-14,2])
      linear_extrude(height=0.6,scale=1)
      text("O", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

      color("red")
      rotate([0,0,105])
      translate([0,-14,2])
      linear_extrude(height=0.6,scale=1)
      text("P", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

}

//===============================

estop();

translate([0,0,43])
estop_topa();

translate([0,0,43])
estop_topb();

//color("green")
//estop_sup();

if(1){
color("red")
translate([0,0,36])
switch2();
}

//===============================
