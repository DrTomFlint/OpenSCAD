//=================================================================================
// Wibby.scad
//
//
// Dr Tom Flint, 16 Feb 2023
//=================================================================================

use <./WibbyLowShadow.scad>
use <./WibbyUpperShadow.scad>
use <./WibbyMtn.scad>
use <./WibbyWhite.scad>
use <./WibbyW.scad>
use <./WibbyMask.scad>

use <../Parts/rounder.scad>

sx = 40;       // size of square
sy = 60;
mag = 60;		// magnification of traces
thick = 1.2;    // thickness
rx=1.5;           // rounding of corners

wide=5;   // frame width
tol=0.3;  // space between frame and part
ry=2;     // founder on frame

//-----------------------------------------------------------------------------------
module wibMtn(){
  
  intersection(){
    cube([sx,sy,4*thick],center=true);
    scale([mag,mag,thick])
    WibbyMtn();
  }
}

//-----------------------------------------------------------------------------------
module wibW(){
  
  intersection(){
    cube([sx,sy,4*thick],center=true);
    scale([mag,mag,thick])
    WibbyW();
  }
}

//-----------------------------------------------------------------------------------
module wibWhite(){
  
  intersection(){
    cube([sx,sy,4*thick],center=true);
    scale([mag,mag,thick])
    WibbyWhite();
  }
}

//-----------------------------------------------------------------------------------
module wibUp(){
  
  intersection(){
    cube([sx,sy,4*thick],center=true);
    scale([mag,mag,thick])
    WibbyUpperShadow();
  }
}

//-----------------------------------------------------------------------------------
module wibLow(){
  
  intersection(){
    cube([sx,sy,4*thick],center=true);
    scale([mag,mag,thick])
    WibbyLowShadow();
  }
}

//-----------------------------------------------------------------------------------
module wibBack(){

  difference(){
    translate([-0.5,0,thick/2])
    cylinder(r=22,h=thick,center=true,$fn=99);
  
    translate([0,0,-1])
    scale([mag,mag,2*thick])
    WibbyMask();
  }
}

//-----------------------------------------------------------------------------------
module wibRim(){

  translate([-0.5,0,thick/2])
  difference(){
    cylinder(r=23,h=thick,center=true,$fn=99);
    cylinder(r=22,h=thick,center=true,$fn=99);
  }
}

//===================================================================================

//wibMtn();
//wibW();
//wibWhite();
//wibUp();
//wibLow();

//wibBack();
wibRim();

//WibbyMask();
//===================================================================================


