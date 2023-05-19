//=================================================================================
// LowBoy.scad
//
// Spacer for Longs Peak Pub refridgerator
//
// Dr Tom Flint, 13 March 2023
//=================================================================================


use <../Parts/tslot.scad>
use <../Parts/rounder.scad>

thick = 2.4;    // thickness of loop
thin = 0.9;     // thickness of the metal part
slot = 27;      // width of the slot
boss = 4.5;     // height of main boss
yoff= 1.6;      // offset for the tongue slot
tongue = 20;    // length of tongue

//---------------------------------------------------------------------------------
module Loop(){

  // around the metal
  difference(){
    union(){
      hull(){
        translate([slot/2,0,0])
        cylinder(r=thick+thin,h=boss,$fn=99);
        translate([-slot/2,0,0])
        cylinder(r=thick+thin,h=boss,$fn=99);
      }
      translate([0,yoff,0])
      hull(){
        translate([slot/2-thick,0,0])
        cylinder(r=thick+thin,h=boss,$fn=99);
        translate([-slot/2+thick,0,0])
        cylinder(r=thick+thin,h=boss,$fn=99);
      }
    }
    union(){
      hull(){
        translate([slot/2,0,0])
        cylinder(r=thin/2,h=3*boss,center=true,$fn=33);
        translate([-slot/2,0,0])
        cylinder(r=thin/2,h=3*boss,center=true,$fn=33);
      }
      translate([0,yoff,0])
      hull(){
        translate([slot/2-thick,0,0])
        cylinder(r=thick/2,h=3*boss,center=true,$fn=33);
        translate([-slot/2+thick,0,0])
        cylinder(r=thick/2,h=3*boss,center=true,$fn=33);
      }
    }
  }
  
  
}

//---------------------------------------------------------------------------------
module Tongue(tol=0.1){

      translate([0,yoff,tongue/2])
      hull(){
        translate([slot/2-thick,0,0])
        cylinder(r=thick/2-tol,h=tongue,center=true,$fn=33);
        translate([-slot/2+thick,0,0])
        cylinder(r=thick/2-tol,h=tongue,center=true,$fn=33);
      }

}
  
//=================================================================================
 

//Loop();
Tongue();
  
//=================================================================================

