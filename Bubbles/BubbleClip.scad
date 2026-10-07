//======================================================================
// BubbleClip.scad
//
//
// DrTomFlint 17 June 2026
//======================================================================

use <../Parts/threads.scad>
use <../Fractals/Lsystem.scad>



rA = 54.2/2;   // blower outer radius
rB = 7.1/2;     // peg outer radius
zA = 62;        // delta between blower pegs and bottle top

rC = 31.5/2;    // bottle top outer radius
rD = 30/2;      // post radius

thick = 3.0;  // thickness of holder walls

dy = (60.25+49)/2;  // distance between clips
dz = 40;            // height of upper post band

Version="A";
F1=300;

//----------------------------------------------------------------------
module BubbleClipA(tol=0.15){

  // +Y leg
  difference(){
    union(){
      translate([0,rA+thick/2,zA/2])
      cube([4*thick,thick,zA],center=true);
      translate([0,rA+thick/2,zA])
      rotate([90,0,0])
      cylinder(r=rB+2*thick,h=thick,center=true,$fn=F1);
    }
    translate([0,rA+thick,zA])
    rotate([90,0,0])
    cylinder(r=rB+tol,h=2*thick,center=true,$fn=F1);
  }
  // Y leg
  mirror([0,1,0])
  difference(){
    union(){
      translate([0,rA+thick/2,zA/2])
      cube([4*thick,thick,zA],center=true);
      translate([0,rA+thick/2,zA])
      rotate([90,0,0])
      cylinder(r=rB+2*thick,h=thick,center=true,$fn=F1);
    }
    translate([0,rA+thick,zA])
    rotate([90,0,0])
    cylinder(r=rB+tol,h=2*thick,center=true,$fn=F1);
  }
  // Loop for the bottle 
  difference(){
    union(){
      translate([0,(rC+rA)/2,thick/2])
      cube([4*thick,rA-rC+2*thick,2*thick],center=true);
      translate([0,-(rC+rA)/2,thick/2])
      cube([4*thick,rA-rC+2*thick,2*thick],center=true);
      translate([0,0,thick])
      cylinder(r=rC+thick,h=2*thick,center=true,$fn=F1);
    }
    translate([0,0,0])
    cylinder(r1=rC+tol,r2=rC-tol,h=6*thick,center=true,$fn=F1);
    // notch on bottle holder
    translate([0,rC,-1.5/2])
    cube([14,10,1.5],center=true);
    translate([0,-rC,-1.5/2])
    cube([14,10,1.5],center=true);
  }
  
}
//----------------------------------------------------------------------
module BubbleClip(tol=0.15){

  translate([0,dy,0])
  BubbleClipA();
  translate([0,-dy,0])
  BubbleClipA();
  
  // lower loop for post
  difference(){
    union(){
      translate([0,(rC+rA)/2,thick/2])
      cube([4*thick,rA-rC+0*thick,2*thick],center=true);
      translate([0,-(rC+rA)/2,thick/2])
      cube([4*thick,rA-rC+0*thick,2*thick],center=true);
      translate([0,0,thick])
      cylinder(r=rD+thick,h=3*thick,center=true,$fn=F1);
    }
    translate([0,0,0])
    cylinder(r=rD,h=6*thick,center=true,$fn=F1);
  }

  // upper loop for post
  translate([0,0,dz])
  difference(){
    union(){
      translate([0,(rC+rA)/2,thick/2])
      cube([4*thick,rA-rC+0*thick,2*thick],center=true);
      translate([0,-(rC+rA)/2,thick/2])
      cube([4*thick,rA-rC+0*thick,2*thick],center=true);
      translate([0,0,thick])
      cylinder(r=rD+thick,h=3*thick,center=true,$fn=F1);
    }
    translate([0,0,0])
    cylinder(r=rD,h=6*thick,center=true,$fn=F1);
  }
}

//----------------------------------------------------------------------
module JugClip1(tol=0.15){

rJug = 54/2;
rPole = 27.3/2;
dY = 55;
wide2 = 10;
thick2 = 2.0;

  difference(){
    union(){
      translate([0,dY,0])
      cylinder(r=rJug+thick2,h=wide2,center=true,$fn=F1);
      translate([0,-dY,0])
      cylinder(r=rJug+thick2,h=wide2,center=true,$fn=F1);
      cylinder(r=rPole+thick2,h=wide2,center=true,$fn=F1);
      cube([16,rJug+rPole+20,wide2],center=true);
    }
    translate([0,dY,thick2])
    cylinder(r=rJug,h=wide2+1,center=true,$fn=F1);
    translate([0,dY,0])
    cylinder(r=rJug-2*thick2,h=wide2+1,center=true,$fn=F1);
    
    translate([0,-dY,thick2])
    cylinder(r=rJug,h=wide2+1,center=true,$fn=F1);
    translate([0,-dY,0])
    cylinder(r=rJug-2*thick2,h=wide2+1,center=true,$fn=F1);
    cylinder(r=rPole,h=wide2+1,center=true,$fn=F1);
    cube([2*thick2,(rJug+rPole+20)*2,wide2+1],center=true);
  }

}

//----------------------------------------------------------------------
module JugClip2(tol=0.15){

rJug = 54/2;
rPole = 30/2;
dY = 55;
wide2 = 10;
thick2 = 2.0;

  difference(){
    union(){
      translate([0,dY,0])
      cylinder(r=rJug+thick2,h=wide2,center=true,$fn=F1);
      translate([0,-dY,0])
      cylinder(r=rJug+thick2,h=wide2,center=true,$fn=F1);
      cylinder(r=rPole+thick2,h=wide2,center=true,$fn=F1);
      cube([20,rJug+rPole+20,wide2],center=true);
    }
    translate([0,dY,0])
    cylinder(r=rJug,h=wide2+1,center=true,$fn=F1);
    
    translate([0,-dY,0])
    cylinder(r=rJug,h=wide2+1,center=true,$fn=F1);
    cylinder(r=rPole,h=wide2+1,center=true,$fn=F1);
    
    cube([2*thick2,(rJug+rPole+10)*2,wide2+1],center=true);
  }

}


//======================================================================

//~ // cross section
//~ difference(){
  //~ BubbleClip();
  //~ translate([50,0,0])
  //~ cube([100,200,200],center=true);
//~ }

//~ // print
//~ BubbleClip();


//~ translate([0,0,-50])
JugClip1();

//~ JugClip2();

//======================================================================
