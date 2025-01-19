//======================================================================
// Magnifier.scad
//
// magnifier stand, connect goose-neck to the glass
//
// DrTomFlint, 18 Jan 2025
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>

F1=200;
F2=77;

//----------------------------------------------------------------------
module glass(){

  difference(){
    union(){
      cylinder(r=128/2,h=2,$fn=F2);
      translate([0,0,2])
      cylinder(r1=128/2,r2=50,h=3,$fn=F2);
      mirror([0,0,1]){
        cylinder(r=128/2,h=2,$fn=F2);
        translate([0,0,2])
        cylinder(r1=128/2,r2=50,h=3,$fn=F2);
      }
    }
    translate([58,0,0])
    cylinder(r=2,h=20,center=true,$fn=F2);
  }

}

//----------------------------------------------------------------------
module magnifier(){

  // glass clamp
  difference(){
    hull(){
      translate([50,0,0])
      cube([10,80,18],center=true);
      
      translate([100,0,0])
      rotate([0,90,0])
      cylinder(r=9,h=2,center=true,$fn=F2);
    }
    // cut for glass bolt
    translate([58,0,0])
    cylinder(r=2,h=20,center=true,$fn=F2);
  
    // cut for the glass
    glass();
    
    // cut for the goose-neck
    translate([100-6,0,0])
    rotate([0,90,0])
    cylinder(r1=6.0,r2=6.4,h=15,center=true,$fn=F2);
    
    // material reduction
    translate([75,0,0])
    scale([1,1.5,1])
    cylinder(r=10,h=30,center=true,$fn=F2);
    
  }
}

//======================================================================

//~ glass();

magnifier();


//======================================================================
