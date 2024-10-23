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
el=20;     // elevation

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

xHold=15;
zCam=70;

showUsb=1;
showPi=1;
showCam=1;

//----------------------------------------------------------------------
module outdoorCamShell(){
  
    // main shell
    difference(){
      translate([2,0,-34-1-5])
      linear_extrude(height=135+2+5)
      offset(r=rOut-1,$fn=F2)
      square([xOut,yOut],center=true);
    
      translate([2,0,-34-1-5])
      linear_extrude(height=135+2+5)
      offset(r=rOut-2,$fn=F2)
      square([xOut,yOut],center=true);
      
      // cut for cam
      translate([15,0,zCam])
      cube([60,29,52],center=true);
      
    }
    
    // rain top
    translate([2,0,135-34])
    difference(){
    intersection(){
      translate([0,0,-13])
      scale([70/60,1,0.5])
      sphere(r=40,$fn=F2);
      linear_extrude(height=10)
      offset(r=rOut-1,$fn=F2)
      square([xOut,yOut],center=true);
    }
    translate([0,0,-13])
    scale([70/60,1,0.5])
    sphere(r=40-8,$fn=F2);
  }
}

//----------------------------------------------------------------------
module outdoorCamBase(){

  intersection(){
    union(){
      //~ outdoorCamInner();
      outdoorCamInner2();
    }
  
    translate([2,0,-34-1])
    linear_extrude(height=135+2)
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


//----------------------------------------------------------------------
module outdoorCamInner2(){

    // pi support
    if(0){
    translate([6,0,50]){
      translate([-23,0,-20])
      cube([4,44,145],center=true);
    
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
    }
  }
  
    // floor
    translate([0,0,-34])
    cube([xOut+2*rOut,yOut+2*rOut,3],center=true);
    
    // front plate
    difference(){
      union(){
        translate([23.5,0,10])
        cube([18,44,130],center=true);
        translate([16,0,70])
        rotate([90,0,0])
        cylinder(r=26,h=44,$fn=F2,center=true);
      }

      // cut for usb
      translate([5.5,0,-16])
      rotate([0,0,0])
      linear_extrude(height=zUsb,scale=0.96)
      offset(r=rUsb+0.2,$fn=F2)
      square([xUsb-2*rUsb,yUsb-2*rUsb],center=true);

      // cut for cam
      translate([-1,0,zCam])
      cube([40,29,55],center=true);
      translate([12,0,zCam])
      cube([20,24,55],center=true);
      translate([xHold,0,zCam])
      rotate([0,-90,0])
      outdoorCamHolder();

      // cut for cam glass window
      translate([21,0,zCam-8])
      cube([1.5,25,75],center=true);
      
      // cut for tilt tightener
      for(i=[-60:1:60])
    // rotation for elevation:
    translate([xHold,0,zCam])
    rotate([0,i,0])
    translate([-xHold,0,-zCam])
      
    translate([-4,0,zCam])
    rotate([90,0,0])
    cylinder(r=2,h=70,center=true,$fn=F2);

    translate([xHold-15,-21,zCam])
    cube([20,10,60],center=true);
    translate([xHold-15,21,zCam])
    cube([20,10,60],center=true);
    
    }
    
  
}



//----------------------------------------------------------------------
module outdoorCamTilt(){

// rotation for elevation:
translate([xHold,0,zCam])
rotate([0,-el,0])
translate([-xHold,0,-zCam]){


  translate([xHold,0,zCam])
  rotate([0,-90,0])
  rotate([0,0,180])
  outdoorCamHolder();
  
}
}

//----------------------------------------------------------------------
module outdoorCamHolder(){

zPcb=10;

  if(showCam==1){
    // camera module 3
    color("silver")
    translate([0,0,zPcb])
    rotate([0,180,0])
    rotate([0,0,90])
    cameraV3();
  }
  
  // pivots
  difference(){
    union(){
      hull(){
        translate([0,13.5,0])
        rotate([90,0,0])
        cylinder(r=4,h=2,center=true,$fn=F2);
        translate([0,13.5,0+20])
        rotate([90,0,0])
        cylinder(r=4,h=2,center=true,$fn=F2);
      }
      translate([0,15.5,0])
      rotate([90,0,0])
      cylinder(r1=2,r2=2.5,h=2,center=true,$fn=F2);
      hull(){
        translate([0,-13.5,0])
        rotate([90,0,0])
        cylinder(r=4,h=2,center=true,$fn=F2);
        translate([0,-13.5,0+20])
        rotate([90,0,0])
        cylinder(r=4,h=2,center=true,$fn=F2);
      }
      translate([0,-15.5,0])
      rotate([90,0,0])
      cylinder(r1=2.5,r2=2,h=2,center=true,$fn=F2);
    }
    translate([0,0,0+20])
    rotate([90,0,0])
    cylinder(r=2,h=70,center=true,$fn=F2);
  }
    
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


//======================================================================

//~ intersection(){
//~ difference(){
//~ union(){
  
if(showUsb==1){
  translate([21,0,-16])
  rotate([0,-90,0])
  usbPower(plug=2);
}
if(showPi==1){
  translate([6,0,50])
  translate([-20,15,-26])
  rotate([0,0,180])
  rotate([0,-90,0])
  pi0();
}
//~ if(showCam==1){
  //~ translate([13,0,39])
  //~ rotate([0,90,0])
  //~ rotate([0,0,-90])
  //~ cameraV3();
//~ }


//~ outdoorCamShell();
outdoorCamBase();
//~ outdoorCamInner();
//~ outdoorCamInner2();

//~ outdoorCamHolder();

outdoorCamTilt();

//~ outdoorCamYolk();

//~ }
    //~ translate([50,50,50])
    //~ cube([100,100,200],center=true);
//~ }

//~ }

//======================================================================
