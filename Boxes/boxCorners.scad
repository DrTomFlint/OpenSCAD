//=================================================================================
// boxCorners.scad
//
// For Fairy Crystal storage box.
//
// Dr Tom Flint, 1 Jan 2023
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>
use <../Fractals/Lsystem.scad>


r1=4;   // radius of knob
$fn=8;

//-----------------------------------------------------------------------------------
module top1(){

extra=3.0;

difference(){
  union(){
    translate([125,100, 84-extra])
    rotate([0,0,180/8])
    cylinder(r=r1,h=26+extra);

    translate([125,100, 84+26])
    rotate([90,0,0])
    rotate([0,0,180/8])
    cylinder(r=r1,h=100+extra);

    translate([125,100, 84+26])
    rotate([0,-90,0])
    rotate([0,0,180/8])
    cylinder(r=r1,h=125+extra);

    translate([125.2,100.2, 84+26])
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
    translate([125,100, -foot])
    rotate([0,0,180/8])
    cylinder(r=r1,h=84+extra+foot);

    translate([125-13,100-3, -foot]){
      difference(){
        cube([13,4,foot]);
        translate([-2.5,0,-1])
        rotate([90,0,0])
        cylinder(r=10,h=20,center=true,$fn=88);
      }
    }
    
    translate([125-3,100-13, -foot]){
      difference(){
        cube([4,13,foot]);
        translate([0,-2.5,-1])
        rotate([0,90,0])
        cylinder(r=10,h=20,center=true,$fn=88);
      }
    }
    intersection(){
      translate([125-2,100-2, -1.0])
      cylinder(r=11,h=1,$fn=44);
      translate([125-15,100-15, -2.0])
      cube([15,15,3]);
    }
  }

  boxTop(a=0,tol=0);
  boxBase(tol=0);
  base2(tol=0.1);
  base3(tol=0.1);

  translate([125-5,100-4 -1.0])
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

  translate([125,100,0])
  rotate([-90,0,0])
  intersection(){
    linear_extrude(height=thick+tol)
    scale([10,10])
    rotate(10)
    offset(tol)
    penrose_tiling(n=4, w=0.3);   // Recommended n <= 6

    translate([-100,-100,-1])
    cube([100,100,2]);
  }

  translate([125-64,100,0])
  cube([64,0.9,3]);  

  translate([125-3,100,0])
  cube([3,0.9,67]);  

  // tab under box
  difference(){
    union(){
      translate([125-66,100-4+0.9, -1.1])
      cube([52.8,4,1.2]);
      translate([63,100-4+0.9, -1.1])
      cylinder(r=4,h=1.2,$fn=88);
    }
    translate([63,100-4+0.9, -1.1])
    cylinder(r=0.7,h=8,center=true,$fn=88);
  }
}

//-----------------------------------------------------------------------------------
module base3(tol=0){

extra=0.5;
foot=10;
thick=0.9;


  translate([125,100,0])
  rotate([0,90,0])
  intersection(){
    linear_extrude(height=thick+tol)
    scale([10,10])
    rotate(10)
    offset(tol)
    penrose_tiling(n=4, w=0.3);   // Recommended n <= 6

    translate([-100,-100,-1])
    cube([100,100,2]);
  }

  translate([125,100-66,0])
  cube([0.9,66,3]);  

  translate([125,100-3,0])
  cube([0.9,3,67.7]);  

  // tab under box
  difference(){
    union(){
      translate([125-4+0.9,100-54-13.2, -1.1])
      cube([4,54,1.2]);
      translate([125-4+0.9,100-54-9.2, -1.1])
      cylinder(r=4,h=1.2,$fn=88);
    }
    translate([125-4+0.9,100-54-9.2, -1.1])
    cylinder(r=0.7,h=8,center=true,$fn=88);
  }
}

//-----------------------------------------------------------------------------------
module boxTop(a=0,tol=0){

translate([-250/2-tol,-200/2-tol,84-tol])
translate([0,-2,0])
rotate([a,0,0])
translate([0,2,0])
cube([250+2*tol,200+2*tol,26+2*tol]);



}

//-----------------------------------------------------------------------------------
module boxBase(tol=0){

translate([0,0,84/2])
cube([250+2*tol,200+2*tol,84+2*tol],center=true);




}

//================================================================================

if(0){
  color("cyan")
  boxTop(a=0);

  color("green")
  boxBase();
}

if(0){
  intersection(){
    translate([250/2-30,200/2-20,100])
    cube([40,40,40]);

    top1();
  }
}

if(1){
  //~ top1();
  //~ base1();
//  base2();
  base3();
}


if(0){
  mirror([1,0,0])
  top1();
//  mirror([1,0,0])
//  base1();

//  mirror([1,0,0])
//  base2();
//  mirror([1,0,0])
//  base3();
}

// hinge trim doesn't work because posts are purposefully too long
// cut them down to fit the actual box
if(0){
  difference(){
  rotate([0,0,180]){
    color("gray")
    top1();
    //~ base1();
    //~ base2();
    //~ base3();
    //~ mirror([1,0,0])
    //~ top1();
    //~ mirror([1,0,0])
    //~ base1();
    //~ mirror([1,0,0])
    //~ base2();
    //~ mirror([1,0,0])
    //~ base3();
  }
  // trim for hinge clearance
  translate([-160,-200/2-19,66])
  rotate([45,0,0])
  cube([300,0.707*40,0.707*40]);
}

}

//================================================================================

