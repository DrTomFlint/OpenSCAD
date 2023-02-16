//=================================================================================
// Rosa.scad
//
//
// Dr Tom Flint, 11 Feb 2023
//=================================================================================

use <./Rosalees.scad>
use <../Parts/rounder.scad>

sx = 35;       // size of square
thick = 1.8;    // thickness
rx=1.5;           // rounding of corners

wide=5;   // frame width
tol=0.3;  // space between frame and part
ry=2;     // founder on frame

//-----------------------------------------------------------------------------------
module rosaBlack(){
  
  difference(){
    intersection(){
      scale([sx+1,sx+1,thick])
      Rosalees();
      translate([0,0,thick/2])
      cube([sx,sx,thick],center=true);
    }
    translate([sx/2,sx/2,-1])
    rotate([0,0,180])
    rounder(r=rx,h=thick+2,f=77);
    translate([-sx/2,sx/2,-1])
    rotate([0,0,-90])
    rounder(r=rx,h=thick+2,f=77);
    translate([-sx/2,-sx/2,-1])
    rotate([0,0,0])
    rounder(r=rx,h=thick+2,f=77);
    translate([sx/2,-sx/2,-1])
    rotate([0,0,90])
    rounder(r=rx,h=thick+2,f=77);
  }
}

//-----------------------------------------------------------------------------------
module rosaWhite(){
  
  difference(){
    translate([0,0,thick/2])
    cube([sx-1,sx-1,thick],center=true);
    translate([0,0,-1])
    scale([sx+1,sx+1,thick+2])
    Rosalees();
  }
}

//----------------------------------------------------------------------------------
module rosaFrame(){

  difference(){
    union(){
      translate([0,0,(thick-0.3)/2])
      cube([sx+wide,sx+wide,thick-0.3],center=true);
      hull(){
        translate([sx/3+1,0,(thick-0.3)/2])
        cube([sx/3,sx/2,thick-0.3],center=true);
        translate([sx+10,0,(thick-0.3)/2])
        cube([sx/4,sx/4,thick-0.3],center=true);
      }
      hull(){
        translate([0,sx/3+1,(thick-0.3)/2])
        cube([sx/2,sx/3,thick-0.3],center=true);
        translate([0,sx+10,(thick-0.3)/2])
        cube([sx/4,sx/4,thick-0.3],center=true);
      }
    }
    // center hole
    translate([0,0,thick])
    cube([sx+tol,sx+tol,3*thick],center=true);
    // material reduction
    hull(){
      translate([sx/2+7,0,(thick-0.3)/2])
      cylinder(r=4,h=10,center=true,$fn=44);
      translate([sx+8,0,(thick-0.3)/2])
      cylinder(r=2,h=10,center=true,$fn=44);
    }
    hull(){
      translate([0,sx/2+7,(thick-0.3)/2])
      cylinder(r=4,h=10,center=true,$fn=44);
      translate([0,sx+8,(thick-0.3)/2])
      cylinder(r=2,h=10,center=true,$fn=44);
    }
    
    translate([sx/2+wide/2,sx/2+wide/2,-1])
    rotate([0,0,180])
    rounder(r=ry,h=thick+2,f=77);
    translate([-sx/2-wide/2,sx/2+wide/2,-1])
    rotate([0,0,-90])
    rounder(r=ry,h=thick+2,f=77);
    translate([-sx/2-wide/2,-sx/2-wide/2,-1])
    rotate([0,0,0])
    rounder(r=ry,h=thick+2,f=77);
    translate([sx/2+wide/2,-sx/2-wide/2,-1])
    rotate([0,0,90])
    rounder(r=ry,h=thick+2,f=77);


  }

  // tabs
  translate([0,sx+13.5,1.5*thick])
  cube([sx/4,2,3*thick],center=true);
  translate([sx+13.5,0,1.5*thick])
  cube([2,sx/4,3*thick],center=true);

}


//===================================================================================
rosaBlack();
//rosaWhite();

rosaFrame();

//===================================================================================

