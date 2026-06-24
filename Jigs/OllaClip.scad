//======================================================================
// OllaClip.scad
//
//
// DrTomFlint 31 May 2026
//======================================================================

use <../Parts/threads.scad>
use <../Fractals/Lsystem.scad>

thick = 1.5;  // thickness of holder walls
rA = 56.5/2;	// radius of rain head tip
rB=rA;
//~ rB = 55.0/2;	// radius rain head back
rC = 35/2;       // radius head attach
dA = 39;
dx = 5;


dz = 40;
rD = 17/2;

dtip=10;

Version="A";
F1=300;

//----------------------------------------------------------------------

module OllaClip(tol=0){

  // surround the rain head
  difference(){
    hull(){
      translate([dx,0,-thick])  
      cylinder(r1=rA+thick,r2=rB+thick,h=dA+2*thick,$fn=F1);
      translate([0,0,-thick])  
      cylinder(r1=rA+thick,r2=rB+thick,h=dA+2*thick,$fn=F1);
    }
    cylinder(r1=rA,r2=rB,h=dA,$fn=F1);
    hull(){
      translate([10*dx,0,2])  
      cylinder(r1=rA,r2=rB,h=dA-2,$fn=F1);
      translate([0,0,2])  
      cylinder(r1=rA,r2=rB,h=dA-2,$fn=F1);
    }
    hull(){
      translate([10*dx,0,dA-thick])  
      cylinder(r=rC-2*thick,h=3*thick,$fn=F1);
      translate([0,0,dA])  
      cylinder(r=rC,h=3*thick,$fn=F1);
    }
    translate([0,0,-thick])
    cylinder(r=rA-3*thick,h=3*thick,$fn=F1);

    translate([1.5*rA,0,dA/2+thick/2+2])
    cube([2*rA,3*rA,dA+thick-2],center=true);
  }

  // funnel
  difference(){
    hull(){
      translate([-(rA-rD+thick),0,-dz-thick-1])
      cylinder(r=rD,h=1,$fn=F1);
      translate([0,0,-1])
      cylinder(r=rA+thick,h=1,$fn=F1);
    }
    hull(){
      translate([-(rA-rD+thick),0,-dz-thick])
      cylinder(r=rD-thick,h=1,$fn=F1);
      translate([0,0,0])
      cylinder(r=rA,h=1,$fn=F1);
    }
    translate([-(rA-rD+thick),0,-dz-3*thick])
    cylinder(r=rD-thick,h=dtip,$fn=F1);
  }
  
  // tip
  translate([-(rA-rD+thick),0,-dz-thick-1-dtip])
  difference(){
    cylinder(r=rD,h=dtip,$fn=F1);
    cylinder(r=rD-thick,h=dtip,$fn=F1);
  }
}

//======================================================================

//~ // cross section
//~ difference(){
  //~ OllaClip();
  //~ translate([0,50,0])
  //~ cube([100,100,200],center=true);
//~ }

// print
OllaClip();


//======================================================================
