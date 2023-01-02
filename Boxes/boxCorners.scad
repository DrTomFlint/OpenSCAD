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


r1=3;   // radius of knob
$fn=8;

//-----------------------------------------------------------------------------------
module top1(){

extra=0.5;

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

extra=0.5;
foot=10;

difference(){
  union(){
    translate([125,100, -foot])
    rotate([0,0,180/8])
    cylinder(r=r1,h=84+extra+foot);

    translate([125-14,100-5, -foot]){
      difference(){
        cube([14,6,foot]);
        translate([-1.5,0,0.4])
        rotate([90,0,0])
        cylinder(r=10,h=20,center=true,$fn=88);
      }
    }
    
    translate([125-5,100-14, -foot]){
      difference(){
        cube([6,14,foot]);
        translate([0,-1.5,0.4])
        rotate([0,90,0])
        cylinder(r=10,h=20,center=true,$fn=88);
      }
    }
    
  }
  boxTop(a=0,tol=0);
  boxBase(tol=0);
  base2(tol=0.1);
  base3(tol=0.1);
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

//top1();
//base1();

//color("silver")
//base2();

//base3();

if(1){
  //mirror([1,0,0])
  //top1();
  mirror([1,0,0])
  base1();
}

if(0){
  rotate([0,0,180]){
    top1();
    base1();
    mirror([1,0,0])
    top1();
    mirror([1,0,0])
    base1();
  }
}

//================================================================================

