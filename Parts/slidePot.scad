//=================================================================================
// slidePot.scad
//
// Slide style potentiometers.
//
// Dr Tom Flint, 3 Nov 2021
//=================================================================================


use <../Parts/rounder.scad>

//---------------------------------------------------------------------
module slidePotKnob1(tol=0,pos=0){

x0 = 60.0;
y0 = 9.2;
z0 = 6.48;

    color("cyan")
    
  difference(){
    // main body
    linear_extrude(height=12,scale=0.8){
      offset(r=1,$fn=99)
      square([10,3],center=true);
    }
    
    // cut for the slider post
    translate([0,0,4.49])
    cube([4.2,1.4,9],center=true);

    // cut for marker
    if(0){
//    translate([0,0,11])
    translate([0,0,12])
    rotate([90,0,0])
    cylinder(r=0.75,h=7,center=true,$fn=89);
}

    // cut for finger shape
    if(0){
      translate([0,0,12])
      rotate([90,0,0])
      scale([6,1,1])
      cylinder(r=1,h=7,center=true,$fn=89);
    }
  }
  
  
}


//---------------------------------------------------------------------
module slidePotCut1(tol=0,pos=0){

x0 = 60.0;
y0 = 9.2;
z0 = 6.48;

    // main body
    translate([-tol/2,-tol/2,-tol/2])
    cube([x0+tol,y0+tol,z0+tol]);
}


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

//slidePot1(pos=0);
//difference(){
slidePotKnob1();
//translate([0,0,-1])
//cube([40,40,40]);
//}

if(0){
  translate([0,20,0])
  slidePot2(pos=0);
}

//=================================================================================
