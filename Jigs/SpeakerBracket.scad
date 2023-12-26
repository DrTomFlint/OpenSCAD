//======================================================================
// SpeakerBracket.scad
// 
// Bracket for kitchen tweeters
//
// DrTomFlint 12 Sept 2023
//======================================================================

thick=2.1;
wide = 80;
use <../Parts/rounder.scad>

//----------------------------------------------------------------------
module top(){

  difference(){
    union(){
      translate([0,0,0])
      cube([105,wide,thick]);
      translate([0,0,thick])
      cube([104,thick,thick]);
      translate([0,wide-thick,thick])
      cube([104,thick,thick]);
      translate([105-thick,0,thick])
      cube([thick,wide,thick]);
    }

    translate([0,thick,+thick/2])
    side(tol=0.2);

    translate([0,wide-thick,+thick/2])
    mirror([0,1,0])
    side(tol=0.2);
    
    translate([105/2,wide/2,-2])
    linear_extrude(height=5)
    offset(r=5,$fn=99)
    square([70,45],center=true);
    
    translate([105,0,-2])
    rotate([0,0,90])
    rounder(r=2,h=10,f=33);
    translate([105,wide,-2])
    rotate([0,0,180])
    rounder(r=2,h=10,f=33);
    
  }



}

//----------------------------------------------------------------------
module side(tol=0){

  difference(){
    translate([thick,0,0])
    scale([2,1,1])
    rotate([-90,0,0])
    rounder(r=30,h=thick+tol,f=99);
    translate([45,-5,-5])
    cube([20,10,10]);
  }
    
  translate([0,0,-30])
  cube([thick+tol,6+tol,30]);

  difference(){
    translate([thick,6,0])
    scale([1,1,1])
    rotate([0,0,90])
    rotate([-90,0,0])
    rounder(r=20,h=thick+tol,f=99);

    translate([-thick,15,-8])
    cube([3*thick,15,10]);
    
    translate([0,8,-5])
    rotate([0,90,0])
    cylinder(r=1.0,h=10,center=true,$fn=33);
  }

  translate([thick,thick,-20])
  rounder(r=3+tol,h=20,f=99);
}

//======================================================================

//top();

//translate([0,thick,+thick/2])
mirror([0,1,0])
difference(){
  side(tol=0);
  translate([-1,-1,-40])
  cube([20,20,20]);
}

//translate([0,wide-thick,+thick/2])
//mirror([0,1,0])
//side();
  
//======================================================================
