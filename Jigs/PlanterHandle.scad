//=================================================================================
// PlanterHandle.scad
//
// Handles for the 10x20" planter trays
//
// Dr Tom Flint, 9 Dec 2025
//=================================================================================

use <../Parts/rounder.scad>


layer = 0.24;
thick = 10*layer;

F1=77;

//-----------------------------------------------------------------------------------
module PlanterHandle(){

  translate([0,-thick,thick/2])
  rotate([0,90,0])
  cylinder(r=thick,h=240,center=true,$fn=F1);

  difference(){
    union(){
      cube([240,40,thick],center=true);
      hull(){
        translate([-40,20,0])
        cylinder(r=30,h=thick,center=true,$fn=F1);
        translate([40,20,0])
        cylinder(r=30,h=thick,center=true,$fn=F1);
      }
    }
    // left side      
    hull(){
      translate([-120,20,0])
      cylinder(r=20,h=3*thick,center=true,$fn=F1);
      translate([-90,20,0])
      cylinder(r=20,h=3*thick,center=true,$fn=F1);
    }
    // left side      
    hull(){
      translate([120,20,0])
      cylinder(r=20,h=3*thick,center=true,$fn=F1);
      translate([90,20,0])
      cylinder(r=20,h=3*thick,center=true,$fn=F1);
    }  
    // finger hole
    hull(){
      translate([-30,20,0])
      cylinder(r=18,h=3*thick,center=true,$fn=F1);
      translate([30,20,0])
      cylinder(r=18,h=3*thick,center=true,$fn=F1);
    }
    Label(Num,AB);
  }
    
}

//-----------------------------------------------------------------------------------
module Label(txt1,txt2){

  translate([-58,20,thick/2-2*layer])
  linear_extrude(height=4*layer)
  text(txt1, font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.2);
  translate([58,20,thick/2-2*layer])
  linear_extrude(height=4*layer)
  text(txt2, font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.2);

}

//=================================================================================

Num = "6";
AB = "B";

PlanterHandle();
//~ Label(Num,AB);

//=================================================================================



