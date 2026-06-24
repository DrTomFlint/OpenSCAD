//======================================================================
// TreeClip.scad
//
// 3 point support for a tree on a wire between two stakes.
//
// DrTomFlint 5 May 2026
//======================================================================

use <../Parts/threads.scad>
use <../Fractals/Lsystem.scad>

//~ thick=5;    // thickness of holder walls
//~ rA = 50;	// radius to the 3 holes, centerline of the C
//~ rB = 4.5;		// radius of the holes
//~ rC = 12;  // width of the disk
//~ rD  = 8;  // thickness of the lip

//~ Version="A";
//~ F1=300;

//~ thick=3;    // thickness of holder walls
//~ rA = 50;	// radius to the 3 holes, centerline of the C
//~ rB = 2;		// radius of the holes
//~ rC = 4;  // width of the disk
//~ rD  = 4;  // thickness of the lip

//~ Version="B";
//~ F1=300;

thick=3;    // thickness of holder walls
rA = 50;	// radius to the 3 holes, centerline of the C
rB = 2;		// radius of the holes
rC = 6;  // width of the disk
rD  = 5;  // thickness of the lip
rW = 1.5;   // radius of the wire

Version="D";
F1=300;


//----------------------------------------------------------------------
module treeClip1(tol=0){

  // plate
  difference(){
    union(){
      cylinder(r=rA+rC,h=thick,center=true,$fn=F1);
      for(i=[0:2])
      rotate([0,0,i*120])
      translate([rA+2,0,0])
      scale([1,3,1])
      cylinder(r=rB+2,h=thick,center=true,$fn=F1);

      translate([0,0,thick])
      cylinder(r=rA-rC+rD,h=1.5*thick,center=true,$fn=F1);
    }
    cylinder(r=rA-rC,h=5*thick,center=true,$fn=F1);
    translate([0,0,thick])
    rotate([0,0,-100])
    rotate_extrude($fn=F1,angle=200)
    translate([rA-rC+rD+0.5,0,0])
    circle(r=rW,$fn=F1);

    cylinder(r=rA-rC,h=5*thick,center=true,$fn=F1);
    
    // holes to retain the tape
    translate([0,0,2])
    for(i=[-1:1:1])
    rotate([0,0,i*110-10])
    difference(){
      rotate_extrude($fn=F1,angle=20)
      translate([rA-rC+rD-3.5,0,0])
      circle(r=2.2*thick,$fn=F1);
      
      rotate_extrude($fn=F1,angle=20)
      translate([rA-rC+rD-3.5,0,0])
      circle(r=1.15*thick,$fn=F1);
    }
  }
  
  // post
  for(i=[80,-80])
  rotate([0,0,i])
  translate([(rA+rC/2+3),0,0]){
    
    difference(){
      union(){
        translate([0,0,5/8*thick])
        cylinder(r=5,h=2.25*thick,center=true,$fn=F1);
        // retainer top
        hull(){
          translate([0,0,2*thick])
          cylinder(r=5,h=thick,center=true,$fn=F1);
          translate([-rC-1,0,2*thick])
          cylinder(r=5,h=thick,center=true,$fn=F1);
        }   
      }
      
      // wire cut
      translate([0,0,thick])
      rotate_extrude($fn=F1)
      translate([5,0,0])
      circle(r=1.5,$fn=F1);

      // small bore for extra perimeters
      translate([0,0,5/8*thick])
      cylinder(r=0.7,h=20,center=true,$fn=F1);
    }
  }


  
}

//----------------------------------------------------------------------
module treeClip(tol=0){

  difference(){
    treeClip1();
    difference(){
      translate([-130,0,0])
      rotate([0,0,45])
      cube([200,200,5*thick],center=true);

      rotate([0,0,54])
      translate([-rA,0,0])
      cylinder(r=rC,h=5*thick,center=true,$fn=F1);
      rotate([0,0,-54])
      translate([-rA,0,0])
      cylinder(r=rC,h=5*thick,center=true,$fn=F1);
    }
  }
}

//======================================================================

treeClip();

//======================================================================

