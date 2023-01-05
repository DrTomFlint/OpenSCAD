//=================================================================================
// boxCorners2.scad
//
// For Fairy Crystal storage box.
// Adjusted for the medium boxes.
//
// Dr Tom Flint, 1 Jan 2023
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>
use <../Fractals/Lsystem.scad>


r1=4;   // radius of knob
$fn=8;

// medium box
xbox=100;  
ybox=75;  
ztop=26;
zbase=54;
baseScale=0.7;
baseWide=0.3;


//-----------------------------------------------------------------------------------
module top1(){

extra=2.0;

difference(){
  union(){
    translate([xbox,ybox, zbase-extra])
    rotate([0,0,180/8])
    cylinder(r=r1,h=ztop+extra);

    translate([xbox,ybox, zbase+ztop])
    rotate([90,0,0])
    rotate([0,0,180/8])
    cylinder(r=r1,h=ybox+extra);

    translate([xbox,ybox, zbase+ztop])
    rotate([0,-90,0])
    rotate([0,0,180/8])
    cylinder(r=r1,h=xbox+extra);

    translate([xbox+0.2,ybox+0.2, zbase+ztop])
    rotate([0,0,180/8])
    sphere(r=r1);
  }
  boxTop(a=0);
  boxBase();
}
}

//-----------------------------------------------------------------------------------
module base1(){

extra=2.0;
foot=10;

difference(){
  union(){
    translate([xbox,ybox, -foot])
    rotate([0,0,180/8])
    cylinder(r=r1,h=zbase+extra+foot);

    translate([xbox-13,ybox-3, -foot]){
      difference(){
        cube([13,4,foot]);
        translate([-2.5,0,-1])
        rotate([90,0,0])
        cylinder(r=10,h=20,center=true,$fn=88);
      }
    }
    
    translate([xbox-3,ybox-13, -foot]){
      difference(){
        cube([4,13,foot]);
        translate([0,-2.5,-1])
        rotate([0,90,0])
        cylinder(r=10,h=20,center=true,$fn=88);
      }
    }
    intersection(){
      translate([xbox-2,ybox-2, -1.0])
      cylinder(r=11,h=1,$fn=44);
      translate([xbox-15,ybox-15, -2.0])
      cube([15,15,3]);
    }
  }

  boxTop(a=0,tol=0);
  boxBase(tol=0);
  base2(tol=0.1);
  base3(tol=0.1);

  translate([xbox-5,ybox-4 -1.0])
  cylinder(r=0.7,h=10,center=true);
}



if(0){
  base2();
  base3();
}

}

//-----------------------------------------------------------------------------------
module base2(tol=0){

extra=0.5;
foot=10;
thick=0.9;

  translate([xbox,ybox,0])
  rotate([-90,0,0])
  intersection(){
    linear_extrude(height=thick+tol)
    scale([10*baseScale,10*baseScale])
    rotate(10)
    offset(tol)
    penrose_tiling(n=4, w=0.3);   // Recommended n <= 6

    translate([-ybox,-ybox,-1])
    cube([ybox,ybox,2]);
  }

  translate([xbox-64*baseScale,ybox,0])
  cube([64*baseScale,0.9,3*baseScale]);  

  translate([xbox-3,ybox,0])
  cube([3*baseScale,0.9,67*baseScale]);  

  // tab under box
  difference(){
    union(){
      translate([xbox-66*baseScale,ybox-4+0.9, -1.1])
//      #cube([52.8*baseScale,4,1.2]);                        // baseScale didn't work here
      cube([47*baseScale,4,1.2]);                        // baseScale didn't work here
      translate([xbox-60*baseScale,ybox-4+0.9, -1.1])
      cylinder(r=4,h=1.2,$fn=88);
    }
      translate([xbox-60*baseScale,ybox-4+0.9, -1.1])
    cylinder(r=0.7,h=8,center=true,$fn=88);
  }
}

//-----------------------------------------------------------------------------------
module base3(tol=0){

extra=0.5;
foot=10;
thick=0.9;


  translate([xbox,ybox,0])
  rotate([0,90,0])
  intersection(){
    linear_extrude(height=thick+tol)
    scale([10*baseScale,10*baseScale])
    rotate(10)
    offset(tol)
    penrose_tiling(n=4, w=0.3);   // Recommended n <= 6

    translate([-ybox,-ybox,-1])
    cube([ybox,ybox,2]);
  }

  translate([xbox,ybox-66*baseScale,0])
  cube([0.9,66*baseScale,3*baseScale]);  

  translate([xbox,ybox-3*baseScale,0])
  cube([0.9,3*baseScale,67.7*baseScale]);  

  // tab under box
  difference(){
    union(){
//      translate([xbox-4+0.9,ybox-54*baseScale-13.2, -1.1])
//      cube([4,54*baseScale,1.2]);
      translate([xbox-4+0.9,ybox-49*baseScale-13.2, -1.1])
      cube([4,49*baseScale,1.2]);
      translate([xbox-4+0.9,ybox-49*baseScale-9.2, -1.1])
      cylinder(r=4,h=1.2,$fn=88);
    }
    translate([xbox-4+0.9,ybox-49*baseScale-9.2, -1.1])
    cylinder(r=0.7,h=8,center=true,$fn=88);
  }
}

//-----------------------------------------------------------------------------------
module boxTop(a=0,tol=0){

translate([-xbox-tol,-ybox-tol,zbase-tol])
translate([0,-2,0])
rotate([a,0,0])
translate([0,2,0])
cube([2*xbox+2*tol,2*ybox+2*tol,ztop+2*tol]);

}

//-----------------------------------------------------------------------------------
module boxBase(tol=0){

translate([0,0,zbase/2])
cube([2*xbox+2*tol,2*ybox+2*tol,zbase+2*tol],center=true);

}

//================================================================================

if(0){
  color("cyan")
  boxTop(a=0);

  color("green")
  boxBase();
}

if(1){
  top1();
  base1();
  base2();
  base3();
}


if(1){
  mirror([1,0,0])
  top1();
  mirror([1,0,0])
  base1();

  mirror([1,0,0])
  base2();
  mirror([1,0,0])
  base3();
}

if(1){
  difference(){
  rotate([0,0,180]){
    top1();
    base1();
    base2();
    base3();
    mirror([1,0,0])
    top1();
    mirror([1,0,0])
    base1();
    mirror([1,0,0])
    base2();
    mirror([1,0,0])
    base3();
  }
  // trim for hinge clearance
  // Don't actually print with the trim, do it later with draw saw or knife
  translate([-1.5*xbox,-ybox-20,zbase-0.707*40*0.707])
  rotate([45,0,0])
  cube([3*xbox,0.707*40,0.707*40]);
}

}

//================================================================================

