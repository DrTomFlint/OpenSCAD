//======================================================================
// outdoorCam5.scad
//
// Outdoor camera mounting for Frigate Cam2024
//
// DrTomFlint, 6 Nov 2024
//======================================================================

use <./usbPower.scad>
use <./pi0.scad>
use <./cameraV3.scad>
use <../Parts/rounder.scad>
use <../Parts/hexcut.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>
use <../Parts/servo1.scad>
use <../Parts/arm1.scad>

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
zCam=0;
zPcb=6;
xCam=0;

xIdler=19;

showUsb=0;
showPi=0;
showCam=0;

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

    // mate into worm gear
    translate([-14,13.5,23.9])
    rotate([0,-90,0])
    rotate([0,0,30])
    cylinder(r=2-0.15,h=3+10,$fn=6);
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
    cylinder(r=3,h=20,$fn=F2);

    // retain gear C
    translate([-14-6,13.5,23.9])
    rotate([0,-90,0])
    cylinder(r=4,h=2.1,$fn=F2);

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

  // keyway
  translate([-17+15,13.5,31])
  linear_extrude(height=3,scale=[1,1.3])
  square([10+30,6],center=true);

}


//--------------------------------------------------------------------------------
module servoBracket(){
  
  // cam end
  difference(){
    // block
    translate([-17+15,13.5,34])
    cube([10+30,14,6],center=true);
    // keyway
    translate([-17+15,13.5,31])
    linear_extrude(height=3,scale=[1,1.3])
    square([10+30+0.4,6],center=true);
  }

  // servo end
  difference(){
    // block
    translate([-32.5+15,13.5,38.15+0.5])
    cube([41+30,14,4],center=true);
    // keyway
    translate([-48,13.5,36])
    linear_extrude(height=3,scale=[1,1.3])
    square([10+0.4,6],center=true);
  }

}


//--------------------------------------------------------------------------------
module servoGearA(bolt=0){

  difference(){
    // boss
    union(){
      // base
      translate([0,0,-6.5])
      cylinder(r=13,h=5.5,$fn=F2);
      translate([0,0,-1.0])
      cylinder(r1=8,r2=7,h=1,$fn=F2);

      // input gear
      $fn=99;
      rotate([0,0,180/12])
      translate([0,0,0])
      spur_gear (modul=1, tooth_number=12, width=4, bore=0, pressure_angle=20, helix_angle=0, optimized=false);
      // washer
      translate([0,0,3.5])
      cylinder(r=4.75,h=1);
    }
    // cut for servoDisk
    translate([0,0,2.3-6-5])
    cylinder(r=23.65/2+0.15,h=1.6+0.15+5,$fn=F2);
    // cut topside clearance for nut
    translate([0,0,2.3+1.6-6])
    cylinder(r=5.44/2+0.15,h=0.5+0.15,$fn=F2);  
    // cut for M3 bolt
    translate([0,0,-2])
    cylinder(r=5.6/2+0.15,h=3.15,$fn=F2);
    translate([0,0,-2])
    cylinder(r=2.9/2+0.15,h=15,$fn=F2);
  }
  
  if(bolt==1){
    // M3x12 bolt
    translate([0,0,-2])
    cylinder(r=5.6/2+0.15,h=3.15,$fn=F2);
    translate([0,0,-2+3])
    cylinder(r=2.9/2+0.15,h=12,$fn=F2);
  }
  
}
//--------------------------------------------------------------------------------
module servoGearB(){

  // mid gears
  $fn=99;
  intersection(){
    translate([-xIdler,0,0])  
    spur_gear (modul=1, tooth_number=25, width=4, bore=3, pressure_angle=20, helix_angle=0, optimized=false);
    translate([-xIdler,0,-1])  
    cylinder(r1=11,r2=17,h=6);
  }
  difference(){
    translate([-xIdler,0,3.5])
    cylinder(r1=8,r2=7,h=1);
    translate([-xIdler,0,3.5])
    cylinder(r=1.6,h=1);
  }
  translate([-xIdler,0,4.5])
  rotate([0,0,180/12])
  spur_gear (modul=1, tooth_number=12, width=5, bore=3, pressure_angle=20, helix_angle=0, optimized=false);
  
}

//--------------------------------------------------------------------------------
module servoGearC(){


  // top washer
  difference(){
    union(){
      translate([0,0,9.5])
      cylinder(r=8,h=2.5);
      // output gear
      $fn=99;
      intersection(){
        translate([0,0,4.5])
        rotate([0,0,180/20])
        spur_gear (modul=1, tooth_number=25, width=5, bore=3, pressure_angle=20, helix_angle=0, optimized=false);
        translate([0,0,4.0])
        cylinder(r1=11,r2=17,h=6);
      }
    }
    // cut for axle
    translate([0,0,9])
    cylinder(r=1.6,center=true,h=6);

    // cut for output spline
    translate([0,0,8])
    cylinder(r=6+0.15,h=4,$fn=6);
  }
  
}

//--------------------------------------------------------------------------------
// retain and center gears A and C, anchor to gearB and gearMount
module servoGearD(){

$fn=F2;
  
  difference(){
    union(){
      translate([-xIdler,0,9.5])
      cylinder(r=4,h=0.6);
      translate([0,0,9.5])
      cylinder(r=11,h=0.6);
      hull(){
        translate([-xIdler,0,10.1])
        cylinder(r=4,h=2);
        translate([0,0,10.1])
        cylinder(r=11,h=2);
      }

    }
    // cut for axle B
    translate([-xIdler,0,9.5])
    cylinder(r=1.6,h=10,center=true);
    // cut for axle AC
    translate([0,0,9.5])
    cylinder(r=8+0.2,center=true,h=6);
  }

}
  

//--------------------------------------------------------------------------------
// output spline to avoid M3 bolt and nut
module servoSpline(){

$fn=F2;
  
  // lower section
  difference(){
    union(){
      translate([0,0,8])
      cylinder(r=6,h=8,$fn=6);
      translate([0,0,16])
      cylinder(r1=6,r2=3,h=3,$fn=6);
    }
    // cut bolt clearances
    translate([0,0,8-0.1])
    cylinder(r=4,h=4.2,$fn=F2);
    
    // cut for output axle    
    translate([0,0,8-0.1])
    cylinder(r=3,h=20,$fn=6);
  }


}
  
//--------------------------------------------------------------------------------
// shaft matching spline
module servoShaft(){

$fn=F2;
  
  difference(){
    union(){
      translate([0,0,12])
      cylinder(r=3-0.15,h=10,$fn=6);
      translate([0,0,12+10])
      cylinder(r=0.866*3-0.15,h=4,$fn=F2);
    }
    translate([0,0,12+10])
    cylinder(r=1,h=40,center=true,$fn=6);
  }
}
  
//--------------------------------------------------------------------------------
module servoGearMount(bolt=0){


  difference(){
    union(){
      translate([-5.25,0,-12])
      cube([40,14,10],center=true);
      translate([-19.25,0,-5.1])
      cube([12,14,10],center=true);
    }
    translate([-5.25,0,-34])
    servo1cut(tol=0.15);
    
    // cut for M3 bolt
    translate([-xIdler,0,-18])
    cylinder(r=7/2+0.15,h=8.15,$fn=F2);

    //~ translate([-xIdler,0,-10])
    //~ cylinder(r=5.6/2+0.15,h=3.15,$fn=F2);
    
    // heatset insert
    translate([-xIdler,0,-10])
    cylinder(r=2.3,h=3.5,$fn=22);
    translate([-xIdler,0,-5])
    cylinder(r=1.8,h=3.5+5,center=true,$fn=22);

    translate([-xIdler,0,-10+3])
    cylinder(r=2.9/2+0.15,h=35,$fn=F2);
    
  }
  
  // keyway for servoBracket
  rotate([0,0,180])
  rotate([0,-90,0])
  translate([34,-13.5,-23.9]){
    //~ translate([-46,13.5,36])
    //~ linear_extrude(height=2-0.15,scale=[1,1.3])
    //~ square([10,6-0.3],center=true);
    translate([-46,13.5,38])
    linear_extrude(height=3,scale=[1,1.3])
    square([10,6],center=true);
  }

  if(bolt==1){
    // M3x25
    translate([-xIdler,0,12])
    cylinder(r=5.6/2+0.15,h=3.15,$fn=F2);
    translate([-xIdler,0,-12.5])
    cylinder(r=2.9/2+0.15,h=25,$fn=F2);
  }
  
}

//--------------------------------------------------------------------------------
module servoDisk(){

  difference(){
    cylinder(r=6.8/2,h=2.3,$fn=F2);
    translate([0,0,-1])
    cylinder(r=4.65/2,h=2.3+2,$fn=F2);
  }

  translate([0,0,2.3])
  difference(){
    cylinder(r=23.65/2,h=1.6,$fn=F2);
    translate([0,0,-1])
    cylinder(r=2/2,h=1.6+2,$fn=F2);
  }
    
  translate([0,0,2.3+1.6])
  difference(){
    cylinder(r=5.44/2,h=0.5,$fn=F2);
    translate([0,0,-1])
    cylinder(r=4.5/2,h=0.5+2,$fn=F2);
  }
}

//--------------------------------------------------------------------------------
module servoGearFull(){


  servoGearA(bolt=1);
  servoGearB();
  servoGearC();
  servoGearD();
  servoSpline();
  servoShaft();
  servoGearMount(bolt=1);


  translate([-5.25,0,-34]){
    servo1();
    translate([5.25,0,28])
    //arm1()
    //arm2();
    servoDisk();
  }

}

//======================================================================

//~ intersection(){
difference(){

servoGearFull();

//~ translate([-36,13.5,23.9])
//~ rotate([0,90,0])
//~ rotate([0,0,180]){

  //~ servoGearA();
  //~ servoGearB();
  //~ servoGearC();
  
  //~ servoGearMount();


  //~ translate([-5.25,0,-34]){
    //~ servo1();
    //~ translate([5.25,0,28])
    //arm1()
    //~ arm2();
  //~ }
//~ }

//~ servoBracket();  
  
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

//~ outdoorCamHolderB();
//~ outdoorCamHolderB2();
//~ outdoorCamHolderC();

//~ } // end of union


  //~ // cut across the worm gear
  //~ translate([0,30+13.5,0])
//~ #  cube([90,60,60],center=true);

  // cut across the servo
  translate([0,-30,0])
  cube([90,60,90],center=true);


}// end diff or intersection
