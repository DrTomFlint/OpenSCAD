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

sx = 40;        // size of square
sy = 60;
mag = 60;		    // magnification of traces
thick = 1.2;    // thickness
thin = 0.9;     // thickness of the sanding frame
rx=1.5;         // rounding of corners

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
    translate([-1.5,0,thick/2])
    cylinder(r=22,h=thick,center=true,$fn=99);
  
    translate([0,0,-1])
    scale([mag,mag,2*thick])
    WibbyMask();
  }
}

//-----------------------------------------------------------------------------------
module wibRim(){

  translate([-1.5,0,thick/2])
  difference(){
    cylinder(r=23,h=thick,center=true,$fn=99);
    cylinder(r=22,h=2*thick,center=true,$fn=99);
  }
}

//-----------------------------------------------------------------------------------
module wibFrame(){

  translate([-0.5,0,thin/2])
  difference(){
    cylinder(r=25,h=thin,center=true,$fn=99);
    cylinder(r=23+0.15,h=2*thin,center=true,$fn=99);
  }
  
  difference(){
    hull(){
      translate([24,0,thin/2])
      cube([2,10,thin],center=true);
      translate([22+30,0,thin/2])
      cube([2,6,thin],center=true);
    }
    hull(){
      translate([22+4,0,thin/2])
      cube([2,5,2*thin],center=true);
      translate([22+26,0,thin/2])
      cube([2,2,2*thin],center=true);
    }
  }    
  translate([22+30,0,3])
  cube([2,6,6],center=true);


  difference(){
    hull(){
      translate([0,24,thin/2])
      cube([10,2,thin],center=true);
      translate([0,22+30,thin/2])
      cube([6,2,thin],center=true);
    }
    hull(){
      translate([0,22+4,thin/2])
      cube([5,2,2*thin],center=true);
      translate([0,22+26,thin/2])
      cube([2,2,2*thin],center=true);
    }
  }
  translate([0,22+30,3])
  cube([6,2,6],center=true);

}

//===================================================================================

//wibMtn();
//wibW();
//wibWhite();
//wibUp();
//wibLow();

//wibBack();
wibRim();

//wibFrame();

//WibbyMask();
//===================================================================================


