//=================================================================================
// lems.scad
// fixtures for LEM current sensors
//
// Dr Tom Flint, 30 April 2021
// add new LEM cases to allow use of 12 AWG wiring, 18 Nov 2021
//
//=================================================================================


use <../Parts/tslot.scad>
use <../Parts/rounder.scad>


//---------------------------------------------------------------------------------
module lem15(){

difference(){
  cube([13.4,23.7,22.0]);
 
  translate([-0.1,-0.01,-0.01])
  cube([1.1,17,14.5]);  
  translate([12.4,-0.01,-0.01])
  cube([1.1,17,14.5]);

  translate([0,14,11.4])
  rotate([0,90,0])
  cylinder(r=1.6,h=20);
  
  translate([-1,23.7,22.0])
  rotate([0,90,0])
  rotate([0,0,-90])
  rounder(r=1.6,h=20,f=89);
  
  translate([-1,0,22.0])
  rotate([0,90,0])
  rounder(r=1.6,h=20,f=89);
  
}

 $fn=55;
 
 // power pins
 translate([0.5,9.2,-3.75])
 cylinder(r=0.5,h=8.5);
 translate([0.5,11.8,-3.75])
 cylinder(r=0.5,h=8.5);
 translate([0.5,14.2,-3.75])
 cylinder(r=0.5,h=8.5);

 translate([12.9,9.2,-3.75])
 cylinder(r=0.5,h=8.5);
 translate([12.9,11.8,-3.75])
 cylinder(r=0.5,h=8.5);
 translate([12.9,14.2,-3.75])
 cylinder(r=0.5,h=8.5);
 
  // attach the pins to the body
  translate([0,7,0])
  cube([1,8,3]);  
  translate([12.4,7,0])
  cube([1,8,3]);
 
  // signal pins
  for(i=[0:3]){
    translate([4+1.5*i,22.0,-3.75])
    cylinder(r=0.15,h=8.5);
  }
 
}

//-------------------------------------------------------------------------------
module lemPack3(){

rfoot=2;
fit=0.15;

  $fn=89;
  difference(){
  hull(){
    translate([rfoot,rfoot,0])
    cylinder(r1=rfoot,r2=rfoot,h=9);
    translate([rfoot,rfoot+13.4,0])
    cylinder(r1=rfoot,r2=rfoot,h=9);

    translate([rfoot+23.7*3+4,rfoot,0])
    cylinder(r1=rfoot,r2=rfoot,h=9);
    translate([rfoot+23.7*3+4,rfoot+13.4,0])
    cylinder(r1=rfoot,r2=rfoot,h=9);
  }


  for(i=[0:2]){
    translate([3+(23.7+2)*i-fit/2,2-fit/2,1.8]){
    cube([22.0+fit,13.4+fit,20]);
    hull(){
    translate([23.7*0.3,13.4/2,0])
    cylinder(r=4,h=10,center=true);
    translate([23.7*0.7,13.4/2,0])
    cylinder(r=4,h=10,center=true);
  }
    }
  }
}

  difference(){
    translate([10,-21.7-1,0])
    cube([55.2+2,21.7+2,6.8+2]);

    translate([11,-21.7,2.1])
    cube([55.2,21.7,6.8]);
  }
  difference(){
    translate([10,17,0])
    cube([55.2+2,21.7+2,6.8+2]);

    translate([11,17,2.1])
    cube([55.2,21.7,6.8]);
  }

if(0){
  color("red")
  translate([40,1,4])
  rotate([84,0,0])
  linear_extrude(height=1,scale=1)
  text("Aero Amp", font = "Open Sans:style=Bold", size=5.5,halign="center",valign="center",spacing=1.1);
}

}
  
//---------------------------------------------------------------------------------
// replacement shell for the LEM15's which don't allow enough space to get a 12 awg 
// wire through the loop
module lemcase(round=1){

thick=1.0;

  // outer body
  difference(){
    translate([0,thick/2,0])
    cube([20.0+2*thick,11+1*thick,21.32+2*thick],center=true);

    if(round==1){
      translate([10+thick,6+thick,21.32/2+thick])
      rotate([90,0,0])
      rotate([0,0,180])
      rounder(r=2+thick,h=14,f=99);

      translate([-10-thick,6+thick,21.32/2+thick])
      rotate([90,0,0])
      rotate([0,0,-90])
      rounder(r=2+thick,h=14,f=99);
    }
    
    // bore for conductor
    translate([1,0,0.6])
    rotate([90,0,0])
    cylinder(r=5/2,h=15,center=true,$fn=45);
    
    // cut for pcb signal wires
    translate([-10,-6-thick/2,-21.32/2-thick-0.1])
    cube([2.8,12,3]);

    difference(){
      // main hole
      cube([20.0,11.1,21.32],center=true);
      translate([10,5,21.32/2])
      rotate([90,0,0])
      rotate([0,0,180])
      rounder(r=2,h=11.1,f=33);
      translate([-10,5,21.32/2])
      rotate([90,0,0])
      rotate([0,0,-90])
      rounder(r=2,h=11.1,f=33);

      // bottom right notches
      translate([10-0.5,0,-21.32/2+1.8])
      cube([1.0,11+2,0.73],center=true);
      translate([10-0.5,0,-21.32/2+1.5+2.2])
      cube([1.0,11+2,0.73],center=true);

      // left side notches
      translate([-10+3.0,0,-21.32/2])
      cube([0.55,11+2,0.45],center=true);
      translate([-10+5.25,0,21.32/2-0.4])
      cube([1.0,11+2,1.0],center=true);
      
      // right side isn't as deep
      translate([-4,3.75+1,-21.32/2])
      cube([14,1,25]);
      
      // bore for conductor
      translate([1,0,0.6])
      rotate([90,0,0])
      cylinder(r=5/2+0.8,h=15,center=true,$fn=45);
    }
  }  
}
//-------------------------------
module lemcase3(){

  difference(){
    lemcase(round=0);
    translate([-10-1,8,21.32/2+1])
    rotate([90,0,0])
    rotate([0,0,-90])
    rounder(r=3,h=14.1,f=33);
  }
  translate([21,0,0])
  lemcase(round=0);
  difference(){
    translate([42,0,0])
    lemcase(round=0);
    translate([53,8,21.32/2+1])
    rotate([90,0,0])
    rotate([0,0,180])
    rounder(r=3,h=14.1,f=33);
  }
  
  
if(0){  
  difference(){  
    translate([-11,-5.5,23/2])
    cube([64,12,0.6]);
    
    color("red")
    translate([22,0,23/2])
    linear_extrude(height=0.6,scale=1)
    text("Aero Amp", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
  }
}

}
  
//=================================================================================


//lemcase();
lemcase3();

//lemPack3();


if(0){
color("gray")  
for(i=[0:2]){
  translate([2+(23.7+2)*i,2,2]){

    translate([0,0,22.0])
    rotate([180,0,90])
    lem15();
  }
}
}



//=================================================================================
 
