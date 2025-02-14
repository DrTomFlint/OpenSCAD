//=================================================================================
// CatJerky.scad
//
//
// Dr Tom Flint, 24 Feb 2023
//=================================================================================

use <./CatFace.scad>
use <./CatMask.scad>
use <./CatRing.scad>

use <../Parts/rounder.scad>

rcut = 30;       // cut radius to remove registration marks

//rout = 24.5;      // outer size of disk
rout = 22;      // outer size of disk

mag = 60;		// magnification of traces
thick = 1.2;    // thickness
rx=1.5;           // rounding of corners

wide=5;   // frame width
tol=0.3;  // space between frame and part
ry=2;     // founder on frame

f1=222;

//-----------------------------------------------------------------------------------
module cFace(){
  
  intersection(){
    cylinder(r=rcut,h=4*thick,center=true);
    scale([mag,mag,thick])
    CatFace();
  }
}

//-----------------------------------------------------------------------------------
module cMask(){
  difference(){
    intersection(){
      cylinder(r=rcut,h=4*thick,center=true);
      scale([mag,mag,thick])
      CatMask();
    }
    scale([mag,mag,thick])
    CatFace();
    }
}

//-----------------------------------------------------------------------------------
module cRing(){
  
  intersection(){
    cylinder(r=rout,h=4*thick,center=true,$fn=f1);
    scale([mag,mag,thick])
    CatRing();
  }
}

//-----------------------------------------------------------------------------------
module cWhite(){
  
  difference(){
    cylinder(r=rout-0.1,h=thick);
    
    translate([0,0,-thick]){
      scale([mag,mag,4*thick])
      CatRing();
      scale([mag,mag,4*thick])
      CatFace();
      scale([mag,mag,4*thick])
      CatMask();
    }
  }
}

//-----------------------------------------------------------------------------------
module cTeeth(){
  
  difference(){
    translate([-20/2,-10,0])
    cube([20,10,thick]);
    
    translate([0,0,-thick]){
      scale([mag,mag,4*thick])
      CatFace();
      scale([mag,mag,4*thick])
      CatMask();
    }
  }
}

//-----------------------------------------------------------------------------------
module cTeethA(){

  intersection(){
    translate([-3.1,-9,0])
    rotate([0,0,-10])
    cube([3.8,5,thick]);
    
    cTeeth();
  }
}  
//-----------------------------------------------------------------------------------
module cTeethB(){

  difference(){
    cTeeth();

    translate([-3.1,-9,0])
    rotate([0,0,-10])
    cube([3.8,5,thick]);
    
  }
}  


//-----------------------------------------------------------------------------------
module cRim(){
  
  difference(){
    cylinder(r=rout+1,h=thick,$fn=f1);
    cylinder(r=rout,h=thick,$fn=f1);
  }
}

//-----------------------------------------------------------------------------------
module cLoop(){
  
  translate([0,9.3,0])
  difference(){
    cylinder(r=2,h=thick,$fn=f1);
    cylinder(r=1,h=thick,$fn=f1);
  }
}

//===================================================================================

//~ cRing();
//~ cFace();
//~ cLoop();
//~ cMask();
//~ cWhite();
//~ cRim();
//~ cTeeth();

//~ cTeethA();
cTeethB();

//===================================================================================


