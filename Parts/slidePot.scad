//=================================================================================
// slidePot.scad
//
// Slide style potentiometers.
//
// Dr Tom Flint, 3 Nov 2021
//=================================================================================


use <../Parts/rounder.scad>

//---------------------------------------------------------------------
module slidePot1(tol=0,pos=0){

x0 = 60.0;
y0 = 9.2;
z0 = 6.48;
  difference(){
    // main body
    cube([x0,y0,z0]);
    
    // slot
    translate([4.2,(y0-2.6)/2,2])
    cube([x0-2*4.2,2.6,z0]);

    // screw holes
    translate([2.0,y0/2,1])
    cylinder(r=1,h=8,$fn=23);
    translate([x0-2.0,y0/2,1])
    cylinder(r=1,h=8,$fn=23);
  }
  
  // slider - simplified shape
  translate([2.4+2.5+(x0-2*4.2-6)*pos,(y0-1.2)/2, 1])
  cube([5.0,1.2,20]);
  
  // terminals are on 0.1" grid = 2.54 mm
  // 3 pins on the case:
  translate([1,3.0,-4])
  cube([0.4,0.8,5]);
  translate([1,6.0,-4])
  cube([0.4,0.8,5]);
  translate([x0-1,6.0,-4])
  cube([0.4,0.8,5]);
  // 2 pins on each end
  translate([5.3,0,-4])
  cube([0.8,0.4,5]);
  translate([6.6,y0-0.4,-4])
  cube([0.8,0.4,5]);

  translate([x0-5.3,0,-4])
  cube([0.8,0.4,5]);
  translate([x0-6.6,y0-0.4,-4])
  cube([0.8,0.4,5]);
  
}

//---------------------------------------------------------------------
module slidePot2(tol=0,pos=0){

x0 = 75.25;
y0 = 9.2;
z0 = 6.48;
  difference(){
    // main body
    cube([x0,y0,z0]);
    
    // slot
    translate([4.2,(y0-2.6)/2,2])
    cube([x0-2*4.2,2.6,z0]);

    // screw holes
    translate([2.0,y0/2,1])
    cylinder(r=1,h=8,$fn=23);
    translate([x0-2.0,y0/2,1])
    cylinder(r=1,h=8,$fn=23);
  }
  
  // slider - simplified shape
  translate([2.4+2.5+(x0-2*4.2-6)*pos,(y0-1.2)/2, 1])
  cube([5.0,1.2,20]);
  
  // terminals are on 0.1" grid = 2.54 mm
  // 3 pins on the case:
  translate([1,3.0,-4])
  cube([0.4,0.8,5]);
  translate([1,6.0,-4])
  cube([0.4,0.8,5]);
  translate([x0-1,6.0,-4])
  cube([0.4,0.8,5]);
  // 2 pins on each end
  translate([5.3,0,-4])
  cube([0.8,0.4,5]);
  translate([6.6,y0-0.4,-4])
  cube([0.8,0.4,5]);

  translate([x0-5.3,0,-4])
  cube([0.8,0.4,5]);
  translate([x0-6.6,y0-0.4,-4])
  cube([0.8,0.4,5]);
  
}


//=================================================================================

slidePot1(pos=0);
translate([0,20,0])
slidePot2(pos=0);

//=================================================================================
