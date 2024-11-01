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
zPcb=6;

showUsb=0;
showPi=0;
showCam=0;

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


//----------------------------------------------------------------------
// camera and spur gear with pivots
module outdoorCamHolderA(){
      
  // gear
  difference(){
    intersection(){
      $fn=99;
      translate([0,13.5,21])
      rotate([0,-90,0])       // rotate to get worm behind the cam
      rotate([90,0,0])
      worm_gear(modul=1, tooth_number=42, thread_starts=1, width=2, length=24, worm_bore=0, gear_bore=0, pressure_angle=20, lead_angle=10, optimized=0, together_built=1, show_spur=1, show_worm=0);

      translate([0,0,zPcb+10])
      rotate([90,0,0])
      cylinder(r=20,h=40,center=true,$fn=F2);
    }
    // pivot gear side
    translate([0,14.5,0])
    rotate([90,0,0])
    cylinder(r1=2.5,r2=2,h=3,$fn=F2);
  }

  // offside round
  difference(){
    intersection(){
      translate([0,-13.5,0])
      rotate([90,0,0])
      cylinder(r=10,h=2,$fn=F2,center=true);
      translate([0,0,zPcb+10])
      rotate([90,0,0])
      cylinder(r=20,h=40,center=true,$fn=F2);
    }
    // pivot offside
    translate([0,-14.5,0])
    rotate([-90,0,0])
    cylinder(r1=2.5,r2=2,h=3,$fn=F2);
  }  
      
  // cam lid
  difference(){    
    // boss
    intersection(){
      translate([0,0,zPcb-5.75])
      cube([34,25,9],center=true);
      translate([0,0,zPcb+10])
      rotate([90,0,0])
      cylinder(r=20,h=30,center=true,$fn=F2);
    }
    // lens box cut  
    translate([0,0,zPcb-2])
    cube([13,13,10],center=true);
    translate([0,0,zPcb-2])
    cube([26,16,4],center=true);

    // lens cut
    translate([0,0,-20+zPcb])
    rotate([0,0,360/16])
    cylinder(r=5.5,h=40,$fn=8);

    // pivot gear side
    translate([0,14.5,0])
    rotate([90,0,0])
    cylinder(r1=2.5,r2=2,h=3,$fn=F2);
    // pivot offside
    translate([0,-14.5,0])
    rotate([-90,0,0])
    cylinder(r1=2.5,r2=2,h=3,$fn=F2);
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
  translate([-3,13.5,21])
  rotate([0,-90,0])
  rotate([90,0,0])
  worm_gear(modul=1, tooth_number=42, thread_starts=1, width=2, length=24, worm_bore=0, gear_bore=3, pressure_angle=20, lead_angle=10, optimized=0, together_built=1, show_spur=0, show_worm=1);

  // small end insert into pocket
  translate([13,13.5,23.9])
  rotate([0,-90,0])
  cylinder(r=4,h=2,$fn=F2);
  translate([13+4,13.5,23.9])
  rotate([0,-90,0])
  cylinder(r1=1.5,r2=2,h=4,$fn=F2);

  // large end attaches to shaft
  difference(){
    translate([-12,13.5,23.9])
    rotate([0,-90,0])
    cylinder(r=4,h=5,$fn=F2);
    translate([-14,13.5,23.9])
    rotate([0,-90,0])
    rotate([0,0,30])
    cylinder(r=2,h=3,$fn=6);
  }
}
//----------------------------------------------------------------------
// drive shaft
module outdoorCamHolderB2(){

    // main shaft
    difference(){
      union(){
        translate([-14-3,13.5,23.9])
        rotate([0,-90,0])
        cylinder(r=2,h=1.5,$fn=F2);
        
        translate([-14-3,13.5,23.9])
        rotate([0,-90,0])
        cylinder(r=1.5,h=30,$fn=F2);
      }
      // side cut to make printable edge
      translate([-14-3-11,13.5,23.9-6.5])
      cube([50,10,10],center=true);
    } 
    
    // mate into worm gear
    translate([-14,13.5,23.9])
    rotate([0,-90,0])
    rotate([0,0,30])
    cylinder(r=2-0.15,h=3,$fn=6);
}

//----------------------------------------------------------------------
// support structure
module outdoorCamHolderC(){

  difference(){
    // boss
    translate([-2,13.5+1,23.9+1])
    cube([40,12,12],center=true);
    
    // center cut for worm
    translate([0,13.5,23.9])
    cube([24+0.2,10.1,10.1],center=true);

    // small end insert into pocket
    translate([13+0.15,13.5,23.9])
    rotate([0,-90,0])
    cylinder(r=4+0.15,h=2+0.15,$fn=F2);
    translate([13+4+0.15,13.5,23.9])
    rotate([0,-90,0])
    cylinder(r=2+0.15,h=4+0.15,$fn=F2);
    
    // large end
    hull(){
      translate([-12,13.5,23.9])
      rotate([0,-90,0])
      cylinder(r=4+0.15,h=5+0.15,$fn=F2);
      translate([-12,13.5-10,23.9])
      rotate([0,-90,0])
      cylinder(r=4+0.15,h=5+0.15,$fn=F2);
    }

    // shaft
    translate([-14-3,13.5,23.9])
    rotate([0,-90,0])
    cylinder(r=2,h=20,$fn=F2);

  } // end of diff

  // arm to gear side pivot
  hull(){
    translate([-2,13.5+4+0.15,19])
    cube([40,6-0.3,1],center=true);
    
    translate([0,14.5+2.15,0])
    rotate([90,0,0])
    cylinder(r=4,h=2,$fn=F2);
  }
  
  // pivot gear side
  translate([0,14.5+0.15,0])
  rotate([90,0,0])
  cylinder(r1=2.5,r2=2,h=3,$fn=F2);
  
  // arm to offside pivot
  hull(){
    translate([-2,-(13.5+4+0.15),19+10])
    cube([40,6-0.3,1],center=true);
    
    translate([0,-(14.5+0.15),0])
    rotate([90,0,0])
    cylinder(r=4,h=2,$fn=F2);
  }

  // pivot offside
  translate([0,-14.5-0.15,0])
  rotate([-90,0,0])
  cylinder(r1=2.5,r2=2,h=3,$fn=F2);

  // back plate
  translate([-2,0,19+11])
  cube([40,41,2],center=true);
  translate([-2-20,-14.8,19+10])
  rotate([0,90,0])
  rounder(r=4,h=40,f=F2);

}



//======================================================================

//~ servoMate();

//~ intersection(){


  
  
//~ difference(){
  
//~ union(){

  // rotation for elevation:
  translate([xCam,0,zCam])
  rotate([0,-el,0])
  translate([-xCam,0,-zCam]){
    //~ outdoorCamHolderA();
  if(showCam==1){
    // camera module 3
    color("silver")
    translate([0,0,zPcb])
    rotate([0,180,0])
    rotate([0,0,90])
    cameraV3();
  }
  } // end of rotate for elevation

outdoorCamHolderB();
//~ outdoorCamHolderB2();
//~ outdoorCamHolderC();

//~ } // end of union


  //~ // cut across the worm gear
  //~ translate([0,30+13.5,0])
  //~ cube([90,60,60],center=true);



//~ }// end diff or intersection
