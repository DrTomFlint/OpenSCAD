//======================================================================
// windowCam.scad
//
// Inside window mounting for Frigate Cam2024
//
// DrTomFlint, 19 Oct 2024
//======================================================================

use <./usbPower.scad>
use <./pi0.scad>
use <./cameraV3.scad>

az=0;     // azimuth
el=60;     // elevation

F2=33;
F1=99;

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

showUsb=1;
showPi=1;
showCam=1;

//----------------------------------------------------------------------
module windowCamBase(){

  if(showUsb==1){
    translate([0,0,3])
    color("green")
    usbPower(plug=1);
  }
  
  // base
  difference(){
    union(){
      translate([10+4.5,0,31/2])
      cube([62+9,40,31],center=true);
      
      // add back plate to increase clearance from cam to window
      translate([14.5,0,-5])
      cube([71,40,10],center=true);
      translate([14.5,0,-8.5])
      cube([71,54,3],center=true);
      
      hull(){
        translate([40,0,20])
        rotate([0,90,0])
        cylinder(r=20,h=10,$fn=F1);
        translate([45,0,1])
        cube([10,40,2],center=true);
      }
    }
    
    // cut for main boss, add 0.2 tolerance
    translate([0,0,xUsb/2+3])
    rotate([0,90,0])
    linear_extrude(height=zUsb,scale=0.96)
    offset(r=rUsb+0.2,$fn=F2)
    square([xUsb-2*rUsb,yUsb-2*rUsb],center=true);
    
    // cut for AC plugs
    translate([0,0,20])
    cube([34,30,26],center=true);
    
    // cut for power line in
    translate([-30,0,11])
    rotate([0,90,0])
    cylinder(r=4.9/2,h=20,$fn=F2);
    
    // top cut for rotation
    translate([40-1,0,20])
    rotate([0,90,0])
    cylinder(r=18,h=12,$fn=F1);
    
    // material reduction
    translate([20,0,-15])
    scale([2,1.5,1])
    cylinder(r=9,h=60,center=true,$fn=6);
    
    translate([20,0,15])
    rotate([90,0,0])
    scale([2,1.3,1])
    cylinder(r=9,h=60,center=true,$fn=6);
    
  }
  
}


//----------------------------------------------------------------------
module windowCamRing(){

// rotation for azimuth:
translate([0,0,20])
rotate([az,0,0])
translate([0,0,-20]){

  // ring for rotation
  difference(){
    translate([40,0,20])
    rotate([0,90,0])
    cylinder(r=18-0.15,h=40,$fn=F1);
    
    // bore cut
    translate([55+8,0,20])
    rotate([0,90,0])
    cylinder(r=16,h=44,$fn=F1);
    
    translate([40-1,0,20])
    rotate([0,90,0])
    cylinder(r=13,h=44,$fn=F1);

    // camera side cut
    translate([70,0,-12])
    rotate([0,-37,0])
    cube([60,50,40],center=true);

    // pi side cut
    translate([70,0,53.5])
    rotate([0,32,0])
    cube([60,50,40],center=true);

    // cut for pi support
    translate([88,0,22])
    cube([95,36-4,3+0.3],center=true);
  }
  
}
}

//----------------------------------------------------------------------
module windowCamPi(){

// rotation for azimuth:
translate([0,0,20])
rotate([az,0,0])
translate([0,0,-20]){
  
  if(showPi==1){
    translate([70+3,-15,24])
    color("silver")
    pi0();
  }

  // pi0 support
  difference(){
    translate([88+1.5,0,22])
    cube([95+3,36,3],center=true);

    // trim corners to fit ring
    translate([60,20,22])
    cube([40,8,4],center=true);
    translate([60,-20,22])
    cube([40,8,4],center=true);

    // clearance for usb power plug
    translate([40+4,0,20])
    scale([2.8,1,1])
    cylinder(r=14.5,h=10,center=true,$fn=6);

    // mounting holes  
    translate([73+3,-12,24]){
      cylinder(r=1.3,h=10,center=true,$fn=F2);
      translate([0,yPi-2*rPi,0])
      cylinder(r=1.3,h=10,center=true,$fn=F2);
      translate([xPi-2*rPi,0,0])
      cylinder(r=1.3,h=10,center=true,$fn=F2);
      translate([xPi-2*rPi,yPi-2*rPi,0])
      cylinder(r=1.3,h=10,center=true,$fn=F2);
    }
  }
    
  // camera supports
  difference(){
    hull(){
      translate([100,16,8])
      rotate([90,0,0])
      cylinder(r=8,h=3,center=true,$fn=F2);
      translate([105,16,21])
      cube([30,3,2],center=true);
    }
    translate([100,16,8])
    rotate([90,0,0])
    cylinder(r=4,h=5,center=true,$fn=F2);
  }
  difference(){
    hull(){
      translate([100,-16,8])
      rotate([90,0,0])
      cylinder(r=8,h=3,center=true,$fn=F2);
      translate([105,-16,21])
      cube([30,3,2],center=true);
    }
    translate([100,-16,8])
    rotate([90,0,0])
    cylinder(r=4,h=5,center=true,$fn=F2);
  }
  
}    
}

//----------------------------------------------------------------------
module windowCamHolder(){

// rotation for azimuth:
translate([0,0,20])
rotate([az,0,0])
translate([0,0,-20]){

// rotation for elevation:
translate([100,0,8])
rotate([0,-el,0])
translate([-100,0,-8]){

  if(showCam==1){
    // camera module 3
    translate([100,0,8])
    rotate([0,180,0])
    rotate([0,0,-90])
    cameraV3();
  }
  
  difference(){
    union(){
      translate([100,13.5,8])
      rotate([90,0,0])
      cylinder(r=8,h=2,center=true,$fn=F2);
      translate([100,16,8])
      rotate([90,0,0])
      cylinder(r=4-0.15,h=3,center=true,$fn=F2);
      
      translate([100,-13.5,8])
      rotate([90,0,0])
      cylinder(r=8,h=2,center=true,$fn=F2);
      translate([100,-16,8])
      rotate([90,0,0])
      cylinder(r=4-0.15,h=3,center=true,$fn=F2);
    }
    translate([100,0,0])
    cube([50,50,10],center=true);
  }

      // sides
      translate([85,13.5-5,5])
      cube([24,5,2]);
      translate([85,-13.5,5])
      cube([24,5,2]);
      // cable end
      translate([107,-13.5,5])
      cube([3,27,2]);
      // non-cable end
      translate([85,-13.5,5])
      cube([2,27,2]);
      
      // mounting posts
      translate([97.5,0,5])
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
}
}

//======================================================================

windowCamBase();

windowCamRing();

windowCamPi();

windowCamHolder();

//======================================================================
