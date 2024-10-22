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

xHold=120;
zCam=6;
zWing=6.5;

showUsb=1;
showPi=1;
showCam=1;

showLeftWing=1;
showRightWing=0;

//----------------------------------------------------------------------
module windowCamLid(){

  difference(){
    translate([10,0,33.5])
    cube([60,38,5],center=true);

    translate([10+2,0,33.5-1.5])
    cube([60-2,38-6,5],center=true);

    // vertical 
    translate([-20,19,-10])
    rotate([0,0,-90])
    rounder(r=4,h=60,f=F2);
    
    translate([-20,-19,-10])
    rotate([0,0,0])
    rounder(r=4,h=60,f=F2);

    // side cuts
    translate([-20,19,36])
    rotate([0,90,0])
    rotate([0,0,-90])
    rounder(r=4,h=60,f=F2);
    
    translate([-20,-19,36])
    rotate([0,90,0])
    rotate([0,0,0])
    rounder(r=4,h=60,f=F2);

    translate([-20,30,36])
    rotate([90,0,0])
    rotate([0,0,-90])
    rounder(r=4,h=60,f=F2);
    
    windowCamText();
  }
  
  // insert into cut for AC plugs
  translate([-9-0.2,0,27])
  linear_extrude(height=8)
  offset(r=2-0.2,$fn=F2)
  square([16-4,30-4],center=true);

    
}


//----------------------------------------------------------------------
module windowCamText(){

    translate([10,0,36-0.6])
    rotate([0,0,-90])
    linear_extrude(height=0.605)
    text("7", font = "Open Sans:style=Bold", size=12,halign="center",valign="center",spacing=1.1);

    //~ translate([20,0,36-0.6])
    //~ rotate([0,0,-90])
    //~ #linear_extrude(height=0.6)
    //~ text("Ver6", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

    //~ translate([10,0,36-0.6])
    //~ rotate([0,0,-90])
    //~ #linear_extrude(height=0.6)
    //~ text("2024", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

    //~ translate([-5,0,36-0.6])
    //~ rotate([0,0,-90])
    //~ #linear_extrude(height=0.6)
    //~ text("Flint", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
}

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
      translate([15,0,31/2])
      cube([70,38,31],center=true);
      
      // add back plate to increase clearance from cam to window
      //~ translate([15,0,-6])
      //~ cube([70,38,12],center=true);

      if(showLeftWing==1){
        // left side wing
        translate([20,30,zWing])
        cube([60,30,3],center=true);
        // fillet
        translate([-10,19,zWing+1.5])
        rotate([0,90,0])
        rotate([0,0,90])
        rounder(r=10,h=60,f=F2);
      }
      
      if(showRightWing==1){
        // mirror left side wing
        mirror([0,1,0]){
          translate([20,30,zWing])
          cube([60,30,3],center=true);
          // fillet
          translate([-10,19,zWing+1.5])
          rotate([0,90,0])
          rotate([0,0,90])
          rounder(r=10,h=60,f=F2);
        }
      }
      
      // ring holder
      intersection(){
        translate([40,0,20])
        rotate([0,90,0])
        cylinder(r=22,h=10,$fn=F1);
        translate([45,0,1])
        cube([10,48,120],center=true);
      }
      // taper
      intersection(){
        translate([40-4,0,20])
        rotate([0,90,0])
        cylinder(r1=14,r2=22,h=4,$fn=F1);
        translate([45,0,12])
        cube([40,48,60],center=true);
      }
      
      // corners to match lid
      translate([45,0,30])
      cube([10,38,12],center=true);
    }

    // cut for lid
    translate([10,0,33.5])
    cube([60,38,5+0.5],center=true);
    
    translate([0,19,36])
    rotate([0,90,0])
    rotate([0,0,-90])
    rounder(r=4,h=60,f=F2);
    
    translate([0,-19,36])
    rotate([0,90,0])
    rotate([0,0,0])
    rounder(r=4,h=60,f=F2);

    translate([-20,19,-20])
    rotate([0,0,-90])
    rounder(r=4,h=60,f=F2);
    
    translate([-20,-19,-20])
    rotate([0,0,0])
    rounder(r=4,h=60,f=F2);
    
    // cut for main boss, add 0.2 tolerance
    translate([0,0,xUsb/2+3])
    rotate([0,90,0])
    linear_extrude(height=zUsb+0.5,scale=0.96)
    offset(r=rUsb+0.2,$fn=F2)
    square([xUsb-2*rUsb,yUsb-2*rUsb],center=true);
    
    // cut for AC plugs
    translate([0,0,7])
    linear_extrude(height=26)
    offset(r=2,$fn=F2)
    square([34-4,30-4],center=true);
    
    // cuts for power line in
    translate([-30,0,11])
    rotate([0,90,0])
    cylinder(r=4.9/2,h=20,$fn=F2);
    translate([-5,40,11])
    rotate([90,0,0])
    cylinder(r=4.9/2,h=80,$fn=F2);
    
    // top cut for rotation
    translate([40-1,0,20])
    rotate([0,90,0])
    cylinder(r1=18-0.3,r2=18,h=12,$fn=F1);
        
    //~ // cut to make feet
    //~ translate([16,30,-12])    
    //~ rotate([90,0,0])
    //~ linear_extrude(height=60)
    //~ offset(r=4,$fn=F2)
    //~ square([50,12],center=true);
    
    // cuts to round left side wing
    translate([-10,45,-20])
    rotate([0,0,-90])
    rounder(r=8,h=60,f=F2);
    translate([50,45,-20])
    rotate([0,0,180])
    rounder(r=8,h=60,f=F2);
    
    // cuts for left side wing attach
    translate([0,35,zWing])
    cylinder(r=2,h=20,center=true,$fn=F2);
    translate([40,35,zWing])
    cylinder(r=2,h=20,center=true,$fn=F2);

    // mirror cuts to round left side wing
    mirror([0,1,0]){
      translate([-10,45,-20])
      rotate([0,0,-90])
      rounder(r=8,h=60,f=F2);
      translate([50,45,-20])
      rotate([0,0,180])
      rounder(r=8,h=60,f=F2);
      
      // cuts for left side wing attach
      translate([0,35,zWing])
      cylinder(r=2,h=20,center=true,$fn=F2);
      translate([40,35,zWing])
      cylinder(r=2,h=20,center=true,$fn=F2);
    }
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
    cylinder(r=18-0.15,h=32,$fn=F1);
    
    // bore cut
    translate([40-0.01,0,20])
    rotate([0,90,0])
    cylinder(r1=13,r2=17,h=32.1,$fn=F1);
    
    // pi side cut
    translate([70,0,46])
    cube([30,50,40],center=true);

    // cut for pi support
    translate([92,0,22])
    cube([94,36-4,2.5+0.2],center=true);
    
  }

  // add liddish
  difference(){
    translate([70,0,20])
    sphere(r=18,$fn=F2);
    translate([70,0,20])
    sphere(r=17,$fn=F2);
    translate([52,0,20])
    cube([40,40,40],center=true);
    translate([70,0,41-0.3])
    cube([40,40,40],center=true);
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
    translate([70+3,-15,25.5])
    color("silver")
    pi0();
  }

  // pi0 support
  difference(){
    translate([92,0,22])
    cube([94,36,2.5],center=true);

    // trim corners to fit ring
    translate([52.5,20,22])
    cube([40,8,4],center=true);
    translate([52.5,-20,22])
    cube([40,8,4],center=true);
    
    // round off top corners
    translate([139,18,18])
    rotate([0,0,180])
    rounder(r=5,h=10,f=F2);
    translate([139,-18,18])
    rotate([0,0,90])
    rounder(r=5,h=10,f=F2);

    // clearance for usb power plug
    translate([48,0,20])
    scale([1.8,1,1])
    rotate([0,0,360/16])
    cylinder(r=15,h=10,center=true,$fn=8);

    // cut for back bar
    translate([xHold,0,24-0.6])
    cube([16+0.15,36+1,2.2],center=true);
    translate([xHold,16+1-0.2,24])
    cube([16+0.15,3+2,8],center=true);
    translate([xHold,-16-1+0.2,24])
    cube([16+0.15,3+2,8],center=true);

  }
  
    // mounting pegs  
    translate([73+3,-12,26.5]){
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
      translate([0,yPi-2*rPi,0])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
      
      translate([xPi-2*rPi-1,0,0])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
      translate([xPi-2*rPi-1,yPi-2*rPi,0])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
    }
    translate([73+3,-12,24]){
      cylinder(r=2,h=2.5,center=true,$fn=F2);
      translate([0,yPi-2*rPi,0])
      cylinder(r=2,h=2.5,center=true,$fn=F2);
      translate([xPi-2*rPi-1,0,0])
      cylinder(r=2,h=2.5,center=true,$fn=F2);
      translate([xPi-2*rPi-1,yPi-2*rPi,0])
      cylinder(r=2,h=2.5,center=true,$fn=F2);
    }
}    
}

//----------------------------------------------------------------------
module windowCamPiBracket(){

// rotation for azimuth:
translate([0,0,20])
rotate([az,0,0])
translate([0,0,-20]){
      
  // camera supports
  difference(){
    hull(){
      translate([xHold,16-0.5,zCam])
      rotate([90,0,0])
      cylinder(r=8,h=2,center=true,$fn=F2);
      translate([xHold,16.25,zCam+16])
      cube([16,3.5,2],center=true);
    }
    translate([xHold,16,zCam])
    rotate([90,0,0])
    cylinder(r=4,h=5,center=true,$fn=F2);
  }

  difference(){
    hull(){
      translate([xHold,-16+0.5,zCam])
      rotate([90,0,0])
      cylinder(r=8,h=2,center=true,$fn=F2);
      translate([xHold,-16.25,zCam+16])
      cube([16,3.5,2],center=true);
    }
    translate([xHold,-16,zCam])
    rotate([90,0,0])
    cylinder(r=4,h=5,center=true,$fn=F2);
  }
  // back bar
  translate([xHold,0,zCam+18-0.3])
  cube([16,36,2],center=true);
  
  // latching tabs
  translate([xHold,15.4,zCam+13.5])
  rotate([20,0,0])
  cube([16,3.5,4],center=true);
  translate([xHold,-15.4,zCam+13.5])
  rotate([-20,0,0])
  cube([16,3.5,4],center=true);
  
}    
}

//----------------------------------------------------------------------
module windowCamHolder(){

// rotation for azimuth:
translate([0,0,20])
rotate([az,0,0])
translate([0,0,-20]){

// rotation for elevation:
translate([xHold,0,zCam])
rotate([0,-el,0])
translate([-xHold,0,-zCam]){

  if(showCam==1){
    // camera module 3
    color("silver")
    translate([xHold,0,zCam])
    rotate([0,180,0])
    rotate([0,0,90])
    cameraV3();
  }
  
  // pivots
  translate([xHold,13.5,zCam])
  rotate([90,0,0])
  cylinder(r=8,h=2,center=true,$fn=F2);
  translate([xHold,15.5,zCam])
  rotate([90,0,0])
  cylinder(r1=3.5,r2=4,h=2,center=true,$fn=F2);
  
  translate([xHold,-13.5,zCam])
  rotate([90,0,0])
  cylinder(r=8,h=2,center=true,$fn=F2);
  translate([xHold,-15.5,zCam])
  rotate([90,0,0])
  cylinder(r1=4,r2=3.5,h=2,center=true,$fn=F2);

  // cam lid
  difference(){
    
    // boss
    translate([xHold+3-3,0,zCam-1])
    rotate([0,180,0])
    linear_extrude(height=7,scale=[0.8,0.9])
    offset(r=2,$fn=F2)
    square([25-4+6,29-4],center=true);
      
    // main cut  
    translate([xHold+3-3,0,zCam])
    rotate([0,180,0])
    linear_extrude(height=7,scale=[0.8,0.9])
    offset(r=1,$fn=F2)
    square([25-4+6,22-4],center=true);

    // lens cut
    translate([xHold,0,-20])
    rotate([0,0,360/16])
    cylinder(r=5.5,h=40,$fn=8);

  }
    
  // mounting posts
  translate([xHold-2.5+12.5,0,zCam-3])
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

//~ translate([0,-12,0])
//~ rotate([0,0,90])
//~ rotate([0,-90,0]){

//~ windowCamText();

//~ intersection(){
//~ difference(){

  //~ translate([0,0,0.1])
  windowCamLid();

  //~ translate([0,15,10])
  //~ cube([40,30,90],center=true);
//~ }

windowCamBase();

//~ }

windowCamRing();

windowCamPi();

windowCamPiBracket();

windowCamHolder();

if(0){
  difference(){
    windowCamHolder();
    translate([xHold,15,10])
    cube([40,30,30],center=true);
  }
}

//~ }

//======================================================================
