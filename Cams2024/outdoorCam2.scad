//======================================================================
// outdoorCam2.scad
//
// Outdoor camera mounting for Frigate Cam2024
//
// DrTomFlint, 19 Oct 2024
//======================================================================

use <./usbPower.scad>
use <./pi0.scad>
use <./cameraV3.scad>
use <../Parts/rounder.scad>
use <../Parts/hexcut.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>
use <../Parts/servo1.scad>

az=0;     // azimuth
el=0;     // elevation

F2=99;
F1=299;

// from usbPower:
rUsb=6.0;     
xUsb=31.2;
yUsb=32.7;  
zUsb=39;

// from pi0:
rPi=3.0;       // radius of pcb corners
thick=1.4;    // pcb thickness
xPi=65.0;
yPi=30.0;  

// offsets for the pivot point
xOut=34;
yOut=36;
rOut=5;

xCam=0;
zCam=0;

showUsb=0;
showPi=0;
showCam=0;

//----------------------------------------------------------------------
// camera and spur gear with pivots
module outdoorCamHolderA(){

zPcb=4.5;

  if(showCam==1){
    // camera module 3
    color("silver")
    translate([0,0,zPcb])
    rotate([0,180,0])
    rotate([0,0,90])
    cameraV3();
  }
      
  // gear
  difference(){
    $fn=99;
    translate([0,15,21])
    rotate([0,-90,0])       // rotate to get worm behind the cam
    rotate([90,0,0])
    worm_gear(modul=1, tooth_number=42, thread_starts=1, width=5, length=26, worm_bore=0.6, gear_bore=0, pressure_angle=20, lead_angle=10, optimized=0, together_built=1, show_spur=1, show_worm=0);

    // trim gear to minimum size
    translate([33,15,0])
    rotate([0,-55,0])
    cube([50,6,30],center=true);
    translate([-33,15,0])
    rotate([0,55,0])
    cube([50,6,30],center=true);
    translate([0,15,-18.5])
    cube([50,6,30],center=true);
  }

  // side rounds
  difference(){
    translate([0,15,0])
    rotate([90,0,0])
    cylinder(r=10,h=5,$fn=F2,center=true);
    translate([0,15,-18.5])
    cube([50,6,30],center=true);
  }
  difference(){
    translate([0,-15,0])
    rotate([90,0,0])
    cylinder(r=10,h=5,$fn=F2,center=true);
    translate([0,-15,-18.5])
    cube([50,6,30],center=true);
  }
  
  // pivots
  translate([0,15+2.5,0])
  rotate([-90,0,0])
  cylinder(r1=2.5,r2=2,h=3,$fn=F2);
  translate([0,-15-2.5,0])
  rotate([90,0,0])
  cylinder(r1=2.5,r2=2,h=3,$fn=F2);
    
  // cam lid
  difference(){    
    // boss
    translate([0+0,0,-1+zPcb])
    rotate([0,180,0])
    linear_extrude(height=7,scale=[0.8,0.9])
    offset(r=2,$fn=F2)
    square([25-4+6,29-4],center=true);
      
    // main cut  
    translate([0,0,zPcb])
    rotate([0,180,0])
    linear_extrude(height=7,scale=[0.8,0.9])
    offset(r=1,$fn=F2)
    square([25-4+6,22-4],center=true);

    // lens cut
    translate([0,0,-20+zPcb])
    rotate([0,0,360/16])
    cylinder(r=5.5,h=40,$fn=8);

  }
    
  // mounting posts
  translate([0-2.5+12.5,0,-3+zPcb])
  rotate([0,0,90]){
    translate([10.5,9.8,0])
    cylinder(r1=1,r2=0.8,h=4,$fn=22);
    translate([-10.5,9.8,0])
    cylinder(r1=1,r2=0.8,h=4,$fn=22);
    translate([10.5,9.8-12.5,0])
    cylinder(r1=1,r2=0.8,h=4,$fn=22);
    translate([-10.5,9.8-12.5,0])
    cylinder(r1=1,r2=0.8,h=4,$fn=22);
  }
}

//----------------------------------------------------------------------
// worm gear and extensions
module outdoorCamHolderB(){

  $fn=99;
  translate([0,15,21])
  rotate([0,-90,0])
  rotate([90,0,0])
  worm_gear(modul=1, tooth_number=42, thread_starts=1, width=5, length=26, worm_bore=0, gear_bore=3, pressure_angle=20, lead_angle=10, optimized=0, together_built=1, show_spur=0, show_worm=1);

  // small end insert into pocket
  translate([15,15,23.9])
  rotate([0,-90,0])
  cylinder(r=4,h=2,$fn=F2);
  translate([15+4,15,23.9])
  rotate([0,-90,0])
  cylinder(r=2,h=4,$fn=F2);

  // large end attaches to shaft
  difference(){
    translate([-12,15,23.9])
    rotate([0,-90,0])
    cylinder(r=4,h=5,$fn=F2);
    translate([-13,15,23.9])
    rotate([0,-90,0])
    rotate([0,0,30])
    cylinder(r=2,h=5,$fn=6);
  }
}
//----------------------------------------------------------------------
// drive shaft
module outdoorCamHolderB2(){

    // main shaft
    difference(){
      translate([-12-6,15,23.9])
      rotate([0,-90,0])
      cylinder(r=2,h=30,$fn=F2);
      translate([-12-6-11,15,23.9-6.6])
      cube([50,10,10],center=true);
    } 
    
    // mate into worm gear
    translate([-13,15,23.9])
    rotate([0,-90,0])
    rotate([0,0,30])
    cylinder(r=2-0.15,h=5,$fn=6);
}

//----------------------------------------------------------------------
// support structure
module outdoorCamHolderC(){

  
  difference(){
    // main boss
    translate([0,0,2])
    cube([80,41,36],center=true);
    
    // cut camera mount
    translate([0,0,4])
    cube([82,35+0.4,34],center=true);
    
    // pivots
    translate([0,15+2.5,0])
    rotate([-90,0,0])
    cylinder(r1=2.5,r2=2,h=3,$fn=F2);
    translate([0,-15-2.5,0])
    rotate([90,0,0])
    cylinder(r1=2.5,r2=2,h=3,$fn=F2);
    
    // cut for glass, not yet offset by 10 mm for frosted end
    translate([2,0,-14.5])
    #cube([78,25+0.4,1.5],center=true);
    // cut through for glass
    translate([0,0,-15.5])
    cube([76-2,25-2,8],center=true);
    
    // material reduction 
    translate([50,-25,0])
    rotate([0,22,0])
    cube([150,50,30],center=true);

    translate([-50,-25,0])
    rotate([0,-22,0])
    cube([150,50,30],center=true);
  }

  // add retension for worm gear
  difference(){
    // boss
    translate([0,15,24])
    cube([80,11,10],center=true);
    // center cut for worm
    translate([0,14.5,24])
    cube([26,13,11],center=true);
    // end cut for small pocket
    translate([15,15,23.9])
    rotate([0,-90,0])
    cylinder(r=4+0.2,h=2,$fn=F2);
    translate([15+4,15,23.9])
    rotate([0,-90,0])
    cylinder(r=2+0.2,h=4,$fn=F2);
    // end cut for large pocket
    hull(){
      translate([-12,15,23.9])
      rotate([0,-90,0])
      cylinder(r=4+0.2,h=5,$fn=F2);
      translate([-12,15,23.9+5])
      rotate([0,-90,0])
      cylinder(r=4+0.2,h=5,$fn=F2);
    }
    // cut for drive shaft
    translate([-13,15,23.9])
    rotate([0,-90,0])
    cylinder(r=2+0.2,h=45,$fn=F2);


  }
  
  // add fillets
  translate([-35,-17.75,-13])
  rotate([0,90,0])
  rotate([0,0,90])
  rounder(r=2,h=70,f=F2);

  translate([-35,17.75,-13])
  rotate([0,90,0])
  rotate([0,0,180])
  rounder(r=2,h=70,f=F2);
}


//----------------------------------------------------------------------
// slice up holderA to make printable
module outdoorCamHolderA1(){

  difference(){
    outdoorCamHolderA();

    // alignment hole for assembly
    translate([0,0,0])
    rotate([90,0,0])
    cylinder(r=1,h=100,center=true,$fn=F2);
    
    // cut off everything but the gear
    translate([0,-20+12.5,0])
    cube([80,40,60],center=true);
  }
}

//----------------------------------------------------------------------
// slice up holderA to make printable
module outdoorCamHolderA2(){

  difference(){
    outdoorCamHolderA();

    // alignment hole for assembly
    translate([0,0,0])
    rotate([90,0,0])
    cylinder(r=1,h=100,center=true,$fn=F2);
    
    // cut off sides
    translate([0,20+12.5,0])
    cube([80,40,60],center=true);
    translate([0,-20-12.5,0])
    cube([80,40,60],center=true);
  }
}

//----------------------------------------------------------------------
// slice up holderA to make printable
module outdoorCamHolderA3(){

  difference(){
    outdoorCamHolderA();

    // alignment hole for assembly
    translate([0,0,0])
    rotate([90,0,0])
    cylinder(r=1,h=100,center=true,$fn=F2);
    
    // cut off everything but the side pivot
    translate([0,20-12.5,0])
    cube([80,40,60],center=true);
  }
}
//--------------------------------------------------------------------------------
module servoMate(){

difference(){

  // body
  union(){
    translate([0,0,-0.6])
    cylinder(r=2.4+1.5,h=3.4+0.6,$fn=99);

    translate([0,0,-0.6-2])
    cylinder(r=2.4+1.5,h=2,$fn=99);

    // base for test print only!
    translate([0,0,-3.5])
    cylinder(r=5,h=1.2,$fn=8);
  }

  // center hole
  translate([0,0,0])
  cylinder(r=2.0,h=4,$fn=22);
  
  // splines
  for(i=[0:19]){
    rotate([0,0,360/20*i])
    translate([1.9,0,0])
    rotate([0,4,0])
    cylinder(r1=0.4,r2=0.4,h=5,$fn=22);
  }

  // through hole
  translate([0,0,-4])
  cylinder(r=0.5,h=8,$fn=22);
  
  // x cuts
  translate([0,0,3])
  cube([10,0.5,6],center=true);
  translate([0,0,3])
  cube([0.5,10,6],center=true);

  
}

}


//======================================================================

// rotation for elevation:
translate([xCam,0,zCam])
rotate([0,-el,0])
translate([-xCam,0,-zCam]){

  //~ outdoorCamHolderA();
  //~ outdoorCamHolderA1();
  //~ outdoorCamHolderA2();
  //~ outdoorCamHolderA3();

}

//~ outdoorCamHolderB();
outdoorCamHolderB2();

//~ outdoorCamHolderC();

//~ servoMate();
