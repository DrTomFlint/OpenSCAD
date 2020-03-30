// acin.scad
// Delta AC input, with switch, fuse, and EMI line filter
// 115V/6A, 250V/4A, PN 06AR2D

use <tslot.scad>
use <rounder.scad>

//---------------------------------------------------------
module acin(tol=0,cut=0){
translate([-tol/2,-tol/2,-tol/2])


difference(){
  union(){
    // body
    cube([44+tol,26.8+tol,65+tol]);
    // front plate
    translate([ 44, -(29-26.8)/2, -(67.35-65)/2 ])
    cube([3+tol,29+tol,67.35+tol]);
  }
  if(cut==0){
    translate([ 47-18, 6, 5 ])
    cube([18.7,16.5,24.5]);
  }
}
  
// switch
translate([ 42, 3, 48 ])
rotate([0,0,30])
cube([13,15,11]);

// ground tab
translate([ -12, 10, 63 ])
cube([12,6.3,1]);

// line tab
translate([ -12, 5.5, 49 ])
cube([12,1,6.3]);

// neutral tab
translate([ -12, 26-5.5, 49 ])
cube([12,1,6.3]);

}

//--------------------------------------
module acbox(){
  
  difference(){
    translate([-58,15.1,34])
    cube([53,33,50]);

    translate([-60,14,57])
    rotate([0,-23,0])
    cube([65,40,30]);

    translate([-60,14,78])
    cube([65,40,30]);

    translate([-55,18,36])
    acin(tol=0.15,cut=1);

    translate([-9,20,38])   // for support
    cube([5,24,34]);
    
    translate([-22,32,30])
    cylinder(r=9,h=10,$fn=22);

    translate([-44,32,30])
    cylinder(r=9,h=10,$fn=22);

    translate([-24,50,52])
    rotate([90,0,0])
    cylinder(r=10,h=10,$fn=22);

    translate([-45,50,49])
    rotate([90,0,0])
    cylinder(r=7,h=10,$fn=22);

    translate([-60,32,46])
    rotate([0,90,0])
    cylinder(r=6,h=10,$fn=22);

  }


    difference(){
      color("pink")
      translate([-58,11.0,50.2-2])
      cube([53,5,6]);

      color("gray")
      translate([-59,11.0,52-2.5])
      rotate([45,0,0])
      cube([55,7,6]);
    }
    
    color("cyan")
    difference(){
      hull(){
        translate([-58,11,44.5])
        cube([53,5,5]);
        translate([-33,0,44.5])
        scale([1.5,1,1])
        cylinder(r=13,h=5,$fn=88);
      }

      // back rail
      color("gray")
      translate([-200,0,15])
      rotate([90,0,90])
      tslot1(type=2,len=200,tol=0.15);
      
      // tslot mounts
      translate([-33,0,40])
      cylinder(r=5.9/2,h=20,$fn=22);

    }
}

//===============================
//acbox();

// support for the bar above the plug
if(1){
color("pink")
translate([-8,20,38])   // for support
cube([3,24,34]);

      hull(){
        translate([-58,11,34])
        cube([53,5,12]);
        translate([-33,0,34])
        scale([1.5,1,1])
        cylinder(r=13,h=12,$fn=88);
      }
}

if(0){
color("orange")
translate([-55,18,36])
acin();
}

if(0){
    // back rail
    color("gray")
    translate([-200,0,15])
    rotate([90,0,90])
    tslot1(type=2,len=200);

    // left rail
    color("green")
    translate([-30,15,0])
    rotate([0,90,90])
    tslot1(type=2,len=150);

    // left tower corner 1
    color("gray")
    translate([-15,60+25+15,15])
    rotate([90,0,-90])
    tbrace();
    
    // left tower corner 2
    color("gray")
    translate([-45,60+25+15,15])
    rotate([90,0,-90])
    tbrace();
}

//===============================





