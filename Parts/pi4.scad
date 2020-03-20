// pi4.scad
// 

use <../Parts/rounder.scad>

//---------------------
module pi4case(tol=0){

difference(){
  union(){
    // base block
    color("gray"){
      cube([88.2,56,4.3]);

      // feet on base block
      cube([6.9,6.6,7.5]);
      translate([58.5,0,0])
      cube([6.0,6.6,7.5]);
      translate([58.5,56-6.6,0])
      cube([6.0,6.6,7.5]);
      translate([0,56-6.6,0])
      cube([6.9,6.6,7.5]);
    }
    
    // pcb
    color("green")
    translate([0,0,7.5])
    cube([85,56,1.65]);

    // top block
    color("gray")
    translate([0,0,9.1])
    cube([70,56,15.5]);
  }

  // round the 4 corners
  rounder(r=2,h=25);
  translate([88.2,0,0])
  rotate([0,0,90])
  rounder(r=2,h=25);
  translate([88.2,56,0])
  rotate([0,0,180])
  rounder(r=2,h=25);
  translate([0,56,0])
  rotate([0,0,270])
  rounder(r=2,h=25);

  // cut for ethernet
  translate([65.25,36.8,9.1])
  cube([22,20,24]);

  // cut for ribbon cable
  translate([5.6,49,9.1])
  cube([54.5,8,24]);

  // cut for display cable
  translate([-0.1,17,15.7])
  cube([5.6,22,15]);

  // cut for camera cable
  translate([44,2.2,9.0])
  cube([4,17.8,20]);

}

// screw heads on bottom side stick out a bit
translate([3.3,3.3,-0.7])
cylinder(r=4.5/2,h=1,$fn=18);
translate([3.3,52.5,-0.7])
cylinder(r=4.5/2,h=1,$fn=18);
translate([62,3.3,-0.7])
cylinder(r=4.5/2,h=1,$fn=18);
translate([62,52.5,-0.7])
cylinder(r=4.5/2,h=1,$fn=18);

// usb host
translate([70.4,1.0,9.1])
cube([17.5,14.6,15.7]);
translate([70.4,21.5,9.1])
cube([17.5,14.6,15.7]);

// ethernet
translate([66.25,37.8,9.1])
cube([21,16,13.3]);

// ribbon cable
translate([6.3,49.5,9.1])
cube([52.5,6.3,14]);

// SD card, oversize so we get a single solid
color("red")
translate([-3,22.5,5.5])
cube([15,11.2,2]);

// USB power jack
translate([6.5,-1.5,9.1])
cube([9,5,3.25]);

// micro HDMI 0
translate([22.5,-1.5,9.1])
cube([7.3,5,3.6]);

// micro HDMI 1
translate([36.5,-1.5,9.1])
cube([7.3,5,3.6]);

// stereo out jack
translate([55,-2.5,9.1+3])
rotate([-90,0,0])
cylinder(r=3,h=5,$fn=19);

}

//==========================

pi4case();


//==========================
