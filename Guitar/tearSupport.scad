//=================================================================================
// tearSupport.scad
//
// Support for Tear Drop style guitar picks
//
// Dr Tom Flint, 20 Feb 2025
//=================================================================================

include <./tearConstants.scad>
use <./tearHalf.scad>

//-----------------------------------------------------------------------------------
// support for the first layer and the lip
module support(){

base = 0.2;

    difference(){
      translate([0,0,-Z-base])
      scale([1.1,1.1,1])
      scale([1.05,1.05,1])
        hull(){
          translate([1.45*X,0,0])
          scale([0.95,1.4,1])
          cylinder(r1=R,r2=1.02*R+dz,h=T/2+Z+base,$fn=F);
          
          rotate([0,0,113])
          translate([X,0,0])
          scale([0.7,1.95,1])
          cylinder(r1=0.85*R,r2=0.87*R+dz,h=T/2+Z+base,$fn=F);
          
          rotate([0,0,-113])
          translate([X,0,0])
          scale([0.7,1.95,1])
          cylinder(r1=0.85*R,r2=0.87*R+dz,h=T/2+Z+base,$fn=F);
        }
      
      tearhalf(side=1);
    }
  
}

//===================================================================================

support();

//===================================================================================
