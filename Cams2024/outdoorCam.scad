//======================================================================
// outdoorCam.scad
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
xOut=40;
yOut=30;
rOut=5;

showUsb=0;
showPi=0;
showCam=0;

//----------------------------------------------------------------------
module outdoorCamShell(){
  
    // main shell
    difference(){
      translate([0,0,-34])
      linear_extrude(height=90)
      offset(r=rOut,$fn=F2)
      square([xOut,yOut],center=true);
  
      translate([0,0,-34-1])
      linear_extrude(height=90+2)
      offset(r=rOut-2,$fn=F2)
      square([xOut,yOut],center=true);
    }
    
    // rain top
    //~ translate([0,0,90-34])
    //~ intersection(){
    //~ translate([0,0,-13])
      //~ scale([70/60,1,0.5])
      //~ sphere(r=40,$fn=F2);
      //~ linear_extrude(height=10)
      //~ offset(r=rOut,$fn=F2)
      //~ square([xOut,yOut],center=true);
    //~ }
}

//----------------------------------------------------------------------
module outdoorCamBase(){

  intersection(){
    union(){
      outdoorCamInner();
    }
  
    translate([0,0,-34-1])
    linear_extrude(height=90+2)
    offset(r=rOut-2-0.25,$fn=F2)
    square([xOut,yOut],center=true);
  }
  
    //
}

//----------------------------------------------------------------------
module outdoorCamInner(){

    // pi support
    translate([-23,0,0])
    cube([4,44,90],center=true);
  
    // mounting pegs  
    translate([-21,-12,-22])
    rotate([0,90,0])
    rotate([0,0,90]){
      translate([0,0,2])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
      translate([0,58,2])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
      translate([23,0,2])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
      translate([23,58,2])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);

      translate([0,0,0])
      cylinder(r=2,h=2.5,center=true,$fn=F2);
      translate([0,58,0])
      cylinder(r=2,h=2.5,center=true,$fn=F2);
      translate([23,0,0])
      cylinder(r=2,h=2.5,center=true,$fn=F2);
      translate([23,58,0])
      cylinder(r=2,h=2.5,center=true,$fn=F2);
    }

    // floor
    translate([0,0,-34])
    cube([xOut+2*rOut,yOut+2*rOut,3],center=true);
    
    // front plate
    difference(){
      translate([23.5,0,0])
      cube([18,44,96],center=true);
      
      // cut for usb
      translate([5.5,0,-16])
      rotate([0,0,0])
      linear_extrude(height=zUsb,scale=0.96)
      offset(r=rUsb+0.2,$fn=F2)
      square([xUsb-2*rUsb,yUsb-2*rUsb],center=true);

      // lens cut
      translate([25,0,39])
      rotate([0,-90,0])
      cylinder(r=4,h=30,$fn=F2);
      translate([16,0,36])
      cube([10,18,26],center=true);
    
    }
    
    // mounting posts
    translate([15,0,36])
    rotate([0,-90,0])
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

//======================================================================

if(showUsb==1){
  translate([21,0,-16])
  rotate([0,-90,0])
  usbPower(plug=2);
}
if(showPi==1){
  translate([-20,15,-26])
  rotate([0,0,180])
  rotate([0,-90,0])
  pi0();
}
if(showCam==1){
  translate([13,0,39])
  rotate([0,90,0])
  rotate([0,0,-90])
  cameraV3();
}


//~ outdoorCamShell();
outdoorCamBase();
//~ outdoorCamInner();

//~ intersection(){
//~ difference(){


if(0){
  difference(){
    windowCamHolder();
    translate([xHold,15,10])
    cube([40,30,30],center=true);
  }
}

//~ }

//======================================================================
