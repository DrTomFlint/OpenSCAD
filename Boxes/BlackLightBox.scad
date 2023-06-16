//=================================================================================
// BlackLightBox.scad
//
// Add black light led strip to inside lid of smallest Fairy Crystal display box.
//
// *** Needs to have a switch set into lid 
//
// Dr Tom Flint, 14 June 2023
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/switch4.scad>

x0 = 16.6;    // length of 1 segment
y0 = 0.5;     // thickness of tape
z0 = 8.0;     // width of tape

x1 = 2.8;     // length of led chip
y1 = 0.8;     // thickness of chip
z1 = 3.5;     // width of chip

x2 = 1.3;     // resistor
y2 = 0.5;
z2 = 3.6;

x3 = 137;
y3 = 87;
z3 = 24;
r3 = 2;       // rounding on outside of frame

in3 = 1.5;      // inset of tape from edge
lip3 = 2;
in3b = 6.5;     // inset of center bore

//----------------------------------------------------------------------------------
module tape(tol=0,extra=0){

// tape  
translate([0,y0/2,0])
cube([x0+tol,y0+tol,z0+tol],center=true);

// chip
translate([0,y0+y1/2,0])
cube([x1+tol,y1+tol,z1+tol],center=true);
  
// resistor
translate([3.6,y0+y2/2,0])
cube([x2+tol,y2+tol,z2+tol],center=true);

if(extra>0){
  // window above chip
  translate([0,y0+3,0])
  rotate([90,0,0])
  cylinder(r1=x1+0.5,r2=x1-0.5,h=3,$fn=55);
}  

}
  
//----------------------------------------------------------------------------------
module back(tol=0.4){

// cut on backside of tape
translate([0,y0/2-2,0])
cube([x0+4+tol,y0+tol+4,z0+tol],center=true);

if(0){
  // cut on backside of tape, top lip is bevel
  translate([0,y0/2-4.9,-3.3])
  rotate([45,0,0])
  cube([x0+4+tol,y0+tol+5,z0+tol],center=true);
}else{
  // cut on backside of tape, make top lip square
  translate([0,y0/2-4.7,5.0])
  rotate([45,0,0])
  cube([x0+4+tol,y0+tol+5,z0+tol],center=true);
}

}
  
//----------------------------------------------------------------------------------
module frame(){

difference(){
  
  linear_extrude(height=z3)
  offset(r=r3,$fn=55)
  square([x3-2*r3,y3-2*r3],center=true);

  // main central bore for crystal tops
  translate([0,0,-12])
  linear_extrude(height=z3+2)
  offset(r=r3,$fn=55)
  square([x3-2*r3-in3b,y3-2*r3-in3b],center=true);

  // bevel central bore
  translate([0,0,-1])
  linear_extrude(height=2,scale=[0.985,0.97])
  offset(r=r3,$fn=55)
  square([x3-2*r3-in3b+2,y3-2*r3-in3b+2.5],center=true);

  // cuts for tape
  for(i=[0:7]){
    translate([i*x0-7/2*x0,-y3/2+in3,z0/2+lip3]){
    tape(tol=0.2,extra=1);
    back();
  }
  }
  for(i=[0:7]){
    translate([i*x0-7/2*x0,y3/2-in3,z0/2+lip3])
    rotate([0,0,180]){
    tape(tol=0.2,extra=1);
    back();
  }
  }
  for(i=[0:4]){
    translate([x3/2-in3,i*x0-4/2*x0,z0/2+lip3])
    rotate([0,0,90]){
    tape(tol=0.2,extra=1);
    back();
  }
  }
  for(i=[0:4]){
    translate([-x3/2+in3,i*x0-4/2*x0,z0/2+lip3])
    rotate([0,0,-90]){
    tape(tol=0.2,extra=1);
    back();
  }
  }
  // rounders on tape corners
  translate([-x3/2+in3+0.7,y3/2-in3-0.7,z0/2+lip3-4-0.25])
  rotate([0,0,-90])
  rounder(r=2,h=8.5,f=33);
  translate([-(-x3/2+in3+0.7),y3/2-in3-0.7,z0/2+lip3-4-0.25])
  rotate([0,0,180])
  rounder(r=2,h=8.5,f=33);
  translate([-(-x3/2+in3+0.7),-(y3/2-in3-0.7),z0/2+lip3-4-0.25])
  rotate([0,0,90])
  rounder(r=2,h=8.5,f=33);
  translate([-x3/2+in3+0.7,-(y3/2-in3-0.7),z0/2+lip3-4-0.25])
  rotate([0,0,0])
  rounder(r=2,h=8.5,f=33);
    
  // battery
  translate([0,0,16])
  linear_extrude(height=8.1)
  offset(r=1,$fn=55)
  square([60,37],center=true);
  
  // charger
  translate([50,0,16])
  linear_extrude(height=8.1)
  offset(r=0.5,$fn=55)
  square([38,23],center=true);
  translate([54,-14,16])
  linear_extrude(height=8.1)
  offset(r=0.5,$fn=55)
  square([20,10],center=true);
  
  // power line from charger to strip
  translate([52,20,24])
  rotate([0,0,-40])
  cube([3,70,12],center=true);
  
  translate([x3/2-0.8,y3/2-4,12])
  cube([3,4,12],center=true);
  
  // switch
  translate([-x3/2+10,0,14+2])
  rotate([0,0,90])
  rotate([180,0,0])
  switch4(pos=1,holes=0,tol=0.25);
  translate([-x3/2+10,0,16])
  rotate([0,0,90])
  cube([11.2+0.2,5.3+0.2,20],center=true);
  
  // switch wires
  translate([-x3/2+10,20,20])
  cube([3,30,8],center=true);
  translate([-10,35,20])
  cube([100,3,8],center=true);
  translate([38.5,20,20])
  cube([3,30,8],center=true);
  
}

}

//-----------------------------------------------------------------------------------
module ring(){

  intersection(){
    frame();
    translate([0,0,5.5])
    cube([200,200,11],center=true);
  }
}

//-----------------------------------------------------------------------------------
module base(){

  difference(){  
    frame();
    translate([0,0,-6.0+2])
    cube([200,200,40],center=true);
  }
}

//===================================================================================  

//ring();
base();

if(0){
  // switch
  translate([-x3/2+10,0,14])
  rotate([0,0,90])
  rotate([180,0,0])
  switch4(pos=1,holes=1,tol=0);
}

//tape(extra=1);

//===================================================================================  

