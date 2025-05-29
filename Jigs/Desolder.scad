//======================================================================
// Desolder.scad
//
// Fix desoldering tool
//
// DrTomFlint, 3 March 2025
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/hexcut.scad>


F1=299;
F2=77;

//----------------------------------------------------------------------
module plug(tol=0){

  difference(){
    union(){
      // insert
      translate([0,0,0])
      cylinder(r1=17.5/2,r2=18/2,h=7,$fn=F2);
      // lip
      translate([0,0,7])
      cylinder(r1=18/2,r2=20/2,h=2,$fn=F2);
      translate([0,0,9])
      cylinder(r=20/2,h=1,$fn=F2);
      translate([0,0,10])
      cylinder(r1=20/2,r2=11/2,h=7,$fn=F2);
    }
    
    translate([0,0,0])
    cylinder(r=6.7/2,h=3.5,$fn=F2);
    translate([0,0,2])
    cylinder(r=6.9/2,h=3.5,$fn=F2);
    translate([0,0,2+3.5])
    cylinder(r=6.1/2,h=6,$fn=F2);
    translate([0,0,2+3.5+6])
    cylinder(r=6.2/2,h=10,$fn=F2);
    
    
    // for cutaway view only
    //~ cube([40,40,20]);
  }

}


//======================================================================

plug();

//======================================================================

