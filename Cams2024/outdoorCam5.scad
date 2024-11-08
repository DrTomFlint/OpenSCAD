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

el=0;     // elevation
zPan=12;
panAngle=360-30;

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

zWall=12;

showUsb=0;
showDr=0;       // approx model
showSolar=0;    // approx model

showPi=0;
showCam=1;

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

  // make a pass-through for the camera cable
  difference(){
    union(){
      // back plate
      translate([-2,0,31.5])
      cube([40,41,6],center=true);
      
      // fillet
      translate([-2-20,-14.8,19+10])
      rotate([0,90,0])
      rounder(r=4,h=40,f=F2);

      // keyway 2
      translate([-2,0,34])
      linear_extrude(height=4,scale=[1,1.3])
      square([10+30,16],center=true);
    }
    // camera cable cut
    translate([-2,0,31.5])
    rotate([0,-35,0])
    cube([80,18,3],center=true);
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
    cylinder(r=23.65/2+0.05,h=1.6+0.15+5,$fn=F2);
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
    cylinder(r=4,h=4.5,$fn=F2);
    
    // cut for output axle    
    translate([0,0,8-0.1])
    cylinder(r=3,h=20,$fn=6);
  }


}
  
//--------------------------------------------------------------------------------
// shaft matching spline
module servoShaft(){

$fn=F2;
  
  translate([0,0,13.5])
  cylinder(r=3-0.15,h=8,$fn=6);
  translate([0,0,12.5+6.5])
  cylinder(r=4-0.15,h=3,$fn=F2);
  translate([0,0,12.5+7.25+2])
  cylinder(r=3-0.15,h=3,$fn=F2);
  translate([0,0,12.5+7.25+2+3])
  cylinder(r=2-0.15,h=3,$fn=6);

}
  
//--------------------------------------------------------------------------------
// shaft matching spline, gear for pan 
module servoShaft2(){

$fn=F2;
  
  translate([0,0,13.5])
  cylinder(r=3-0.15,h=8,$fn=6);
  translate([0,0,12.5+6.5])
  cylinder(r=4-0.15,h=3,$fn=F2);
  translate([0,0,12.5+7.25])
  spur_gear (modul=1, tooth_number=12, width=5, bore=0, pressure_angle=20, helix_angle=0, optimized=false);


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
  
  // keyway 1 for servoBracket
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
module servoGearFull(axle=1){


  servoGearA(bolt=0);
  servoGearB();
  servoGearC();
  servoGearD();
  servoSpline();
  if(axle==1){
    servoShaft();
  }
  if(axle==2){
    servoShaft2();
  }
  //~ servoGearMount(bolt=1);

  translate([-5.25,0,-34]){
    servo1();
    translate([5.25,0,28])
    servoDisk();
  }

}

//--------------------------------------------------------------------------------
module servoMountDouble(){

intersection(){
  union(){
    // top link
    translate([-50.5-0.1,0,40])
    cube([17,41,3],center=true);

    // bottom link
    translate([-50.6,0,0.15])
    cube([17,16,3],center=true);

    // pan
    translate([-59-0.15,-13.5,23.9])
    rotate([0,-90,0])
    rotate([0,0,0])
    servoGearMount(bolt=0);

    // tilt
    translate([-42,13.5,23.9])
    rotate([0,90,0])
    rotate([0,0,180])
    servoGearMount(bolt=0);
  }
  // ensure print down edge is perfectly flat, (some 0.15's missing)
  translate([-50.5-0.1,0,20])
  cube([16.75,48,45],center=true);
}

  // tail for mounting pi0, extends into panSkirt
  translate([-66-1.8,0,40])
  cube([22,41,3],center=true);

  // tiltcam link
  translate([-32,0,40])
  cube([22,41,3],center=true);
  
  // back plate
  difference(){
    translate([-2,0,38])
    cube([40,41,7],center=true);
    // keyway -2 to holderC
    translate([-2,0,34])
    linear_extrude(height=4+0.2,scale=[1,1.3])
    square([10+30+0.4,16+0.4],center=true);

    // camera cable cut
    translate([-2,0,31.5])
    rotate([0,-35,0])
    cube([80,18,3],center=true);
    
  }
  
  // extra bit at the top mates into hat
  translate([20,0,40])
  cube([6,41,3],center=true);

  // posts for pi0
    translate([-65,-12.5,43]){
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
      translate([0,yPi-2*rPi,0])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
      
      translate([xPi-2*rPi-1,0,0])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
      translate([xPi-2*rPi-1,yPi-2*rPi,0])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
    }
    translate([-65,-12.5,41.5]){
      cylinder(r=2,h=2.5,center=true,$fn=F2);
      translate([0,yPi-2*rPi,0])
      cylinder(r=2,h=2.5,center=true,$fn=F2);
      translate([xPi-2*rPi-1,0,0])
      cylinder(r=2,h=2.5,center=true,$fn=F2);
      translate([xPi-2*rPi-1,yPi-2*rPi,0])
      cylinder(r=2,h=2.5,center=true,$fn=F2);
    }
  
  
  // keyway +3 to panPost
  translate([-91,0,12])
  translate([37,7,0])
  rotate([90,0,0])
  linear_extrude(height=4+0.2,scale=[1,1.3])
  square([10,10],center=true);

}


//--------------------------------------------------------------------------------
module panRingMate(bearing=0){


  translate([-84-7,0,0])
  rotate([0,90,0]){
    difference(){
      translate([0,0,-1])
      metric_thread (diameter=46-0.4, pitch=2, length=5+1-0.1, internal=false, n_starts=1,
                      thread_size=-1, groove=false, square=false, rectangle=0,
                      angle=30, taper=0, leadin=0, leadfac=1.0, test=false);
      translate([0,0,-2])
      cylinder(r=19,h=7+4,$fn=F2);
    }
  }
}

//--------------------------------------------------------------------------------
module panRing(bearing=1){

  translate([-84,0,0])
  rotate([0,90,0])
  ring_gear (modul=1, tooth_number=48, width=5, rim_width=3, pressure_angle=20, helix_angle=0, $fn=F2);

  // base 
  translate([-84-7,0,0])
  rotate([0,90,0])
  difference(){
    cylinder(r=28,h=7,$fn=F2);
    translate([0,0,-1])
    cylinder(r=11+0.15,h=7+2,$fn=F2);

    translate([0,0,-1])
    metric_thread (diameter=46, pitch=2, length=5+1, internal=true, n_starts=1,
                    thread_size=-1, groove=false, square=false, rectangle=0,
                    angle=30, taper=0, leadin=0, leadfac=1.0, test=false);

  }

  // bearing sleeve
  translate([-84-7,0,0])
  rotate([0,90,0])
  difference(){
    cylinder(r=13,h=7,$fn=F2);
    translate([0,0,-1])
    cylinder(r=11+0.15,h=7+2,$fn=F2);
  }

  // center bearing
  if(bearing==1){
    translate([-84-7,0,0])
    rotate([0,90,0])
    difference(){
      cylinder(r=11,h=7,$fn=F2);
      translate([0,0,-1])
      cylinder(r=4,h=7+2,$fn=F2);
    }
  }
}

//--------------------------------------------------------------------------------
module panSkirt(bearing=0){
rs=12;

  difference(){
    // skirt out to shell
    intersection(){
      translate([-78.75,0,0])
      rotate([0,90,0])
      cylinder(r=60,h=2.5,$fn=F2);
      // main bore
      translate([-100-0.05,0,6])
      rotate([0,90,0])
      linear_extrude(height=130+0.1,scale=0.9)
      offset(r=rs-0.2,$fn=F2)
      square([74-2*rs, 58-2*rs],center=true);
    }
      
    // cut for center post  
    translate([0,0,0])
    panPost(tol=0.2);

    // cut for pan pinion gear
    translate([-80,-13.5,12])
    rotate([0,90,0])
    cylinder(r=8,h=40,center=true,$fn=F2);
    
    // tail for mounting pi0
    translate([-66-1.8,0,40-12])
    cube([22+0.4,41+0.4,3+0.4],center=true);

    // ventilation at base of pi
    translate([-80,-20,36])
    rotate([0,90,0])
    hexcut1(R=1.6,x0=0,y0=0,h0=10,N0=13);
    
  }
}

//--------------------------------------------------------------------------------
module panPost(bearing=0,tol=0){
rs=12;
  // post
  difference(){
    union(){
      translate([-84-7,0,0])
      rotate([0,90,0])
      cylinder(r=4-0.15,h=7,$fn=F2);
      
      translate([-84,0,0])
      rotate([0,90,0])
      cylinder(r=5+tol,h=1+tol,$fn=F2);
      
      translate([-84+1,0,0])
      rotate([0,90,0])
      cylinder(r=10+tol,h=4+tol,$fn=F2);


    }
    // cut for 5V0 in wires
    translate([-84+1,0,0])
    rotate([0,90,0])
    cylinder(r=2,h=20,center=true,$fn=F2);
  }
  
  // riser to main chassis
  translate([-84-7,0,0])
  difference(){
    translate([25,4,0])
    cube([34+tol,5+tol,20.5+tol],center=true);

    // keyway 3
    translate([37,7,0])
    rotate([90,0,0])
    linear_extrude(height=4+0.2,scale=[1,1.3])
    square([10+0.4,10+0.4],center=true);
  
    // cut for 5V0 in wires
    translate([10,0,0])
    rotate([0,90,0])
    cylinder(r=2,h=20,center=true,$fn=F2);
  }
    
  // center bearing
  if(bearing==1){
    translate([-84-7,0,0])
    rotate([0,90,0])
    difference(){
      cylinder(r=11,h=7,$fn=F2);
      translate([0,0,-1])
      cylinder(r=4,h=7+2,$fn=F2);
    }
  }

}

//--------------------------------------------------------------------------------
module shell(bearing=0){

rs=12;

  difference(){    
    // main surround
    translate([-100,0,6])
    rotate([0,90,0])
    linear_extrude(height=130,scale=0.9)
    offset(r=rs+2,$fn=F2)
    square([74-2*rs, 58-2*rs],center=true);
    // main bore
    translate([-100-0.05,0,6])
    rotate([0,90,0])
    linear_extrude(height=130+0.1,scale=0.9)
    offset(r=rs,$fn=F2)
    square([74-2*rs, 58-2*rs],center=true);
    
    // cut front glass
    translate([2+4,0,-36])
    cube([120,40,30],center=true);

    // cut hat angle
    translate([65,0,10])
    rotate([0,-10,0])
    cube([80,80,120],center=true);
    
    // cut ventilation slot
    translate([15.5,0,40])
    rotate([0,0,0])
    cube([8,24,7],center=true);
    
  }
  
  // window sill
  intersection(){
    translate([-8,0,-31])
    rotate([0,-2,0])
    difference(){    
      linear_extrude(height=8,scale=0.7)
      offset(r=5,$fn=F2)
      square([100, 36],center=true);
      
      translate([0,0,-0.05])
      linear_extrude(height=8.1-3,scale=0.7)
      offset(r=2,$fn=F2)
      square([100, 36],center=true);

      // glass slot, 20 mm of frost on one end
      translate([5,0,6])
      cube([76+10,25,1.5],center=true);
      // glass viewport
      translate([2,0,7])
      cube([76-2,25-2,20],center=true);
      // rain drain
      translate([-36,0,4.0])
      rotate([0,20,0])
      cube([5,23,3],center=true);
  
    }
    // main surround
    translate([-100,0,6])
    rotate([0,90,0])
    linear_extrude(height=130,scale=0.9)
    offset(r=rs+2,$fn=F2)
    square([74-2*rs, 58-2*rs],center=true);
  }
}


//--------------------------------------------------------------------------------
module hat(){

rs=12;

  // inset into shell
  difference(){    
    // main bore
    translate([-100-0.05,0,6])
    rotate([0,90,0])
    linear_extrude(height=130+0.1,scale=0.9)
    offset(r=rs,$fn=F2)
    square([74-0.4-2*rs, 58-0.4-2*rs],center=true);

    // lip inner bore
    translate([-100-0.05,0,6])
    rotate([0,90,0])
    linear_extrude(height=130+0.1,scale=0.9)
    offset(r=rs-2,$fn=F2)
    square([74-4-2*rs, 58-4-2*rs],center=true);

    // hat cut angle
    translate([66,0,10])    
    rotate([0,-10,0])
    cube([80,80,120],center=true);

    // hat cut lower
    translate([-17,0,-10])    
    rotate([0,-10,0])
    cube([80,80,120],center=true);
    
    // cut lower part
    translate([-80,0,10])
    cube([160,100,100],center=true);
    
    // cut front glass
    translate([2,0,-36])
    cube([120,40,30],center=true);
    
    // cut ventilation slot
    translate([14,0,38])
    rotate([0,-10,0])
    cube([10,30,7],center=true);
    
  }

  // overhanging roof
  difference(){    
    // lip and pyramid
    union(){
      translate([24.5,0,6])
      rotate([0,80,0])
      linear_extrude(height=2,scale=1)
      offset(r=15,$fn=F2)
      square([55, 39],center=true);
      
      translate([24.5+2,0,6])
      rotate([0,80,0])
      linear_extrude(height=7+0.1,scale=0.3)
      offset(r=15,$fn=F2)
      square([55, 39],center=true);
    }
    
    // extra bit at the top mates into hat
    translate([20,0,40-12])
    cube([6+0.4,41+0.4,3+0.4],center=true);

  }

  // outer lip
  difference(){    
      translate([24.5-4,0,6-1])
      rotate([0,80,0])
      linear_extrude(height=4.2,scale=1)
      offset(r=15,$fn=F2)
      square([55, 39],center=true);
      
      translate([24.5-4.1,0,6-1])
      rotate([0,80,0])
      linear_extrude(height=4.2,scale=1)
      offset(r=13,$fn=F2)
      square([55, 39],center=true);
    
    // cut lower part
    translate([-61,0,10])
    rotate([0,-10,0])
    cube([160,140,140],center=true);

  }
  
  // add ventilation flap
  translate([13,0,46])
  rotate([0,0,0])
  cube([10,30,3],center=true);
  
}

//--------------------------------------------------------------------------------
module panTube(){

  panRingMate();

  translate([-116,0,0])
  rotate([0,90,0]){
    difference(){
      cylinder(r=21,h=25,$fn=F2);
      translate([0,0,-0.5])
      cylinder(r=21-2,h=25+1,$fn=F2);
    }
  }

  translate([-29.9,0,0])
  panRingMate();
    
}

//--------------------------------------------------------------------------------
module wallHat(){

    difference(){
      union(){
        translate([20,0,91.5-31+zWall])   
        scale([1,2,1])
        cylinder(r=19+2,h=30+3,$fn=F2);
        translate([16,0,78-1+zWall])    
        color("green")
        cube([10,72+12,27+4+2],center=true);

        // hump for usb and ventilation  
        translate([14,0,64+zWall])    
        color("green")
        rotate([0,90,0])
        scale([0.8,1,1])
        cylinder(r=18+4,h=6,$fn=F2);

        translate([14+5-1,0,64+zWall])    
        scale([1,1,0.8])
        sphere(r=18+5,$fn=F2);
        
      }
      
      translate([20-1,0,91.5-31+2+zWall])   
      scale([1,2,1])
      cylinder(r=19+0.,h=31.1,$fn=F2);

      translate([16,0,78+zWall])    
      color("green")
      cube([10-4,72+12-8+0.4,31+0.4],center=true);

      translate([14+5-1,0,64+zWall])    
      scale([1,1,0.8])
      sphere(r=18+2+0.2,$fn=F2);

      // slice lower half off
      translate([4,0,78+zWall])    
      color("green")
      cube([20,90,80],center=true);

      // hump for usb and ventilation  
      translate([14,0,64+zWall])    
      color("green")
      rotate([0,90,0])
      scale([0.8,1,1])
      cylinder(r=18+2,h=6,$fn=F2);

    }
    
    // side slots
    difference(){
      translate([20,-36,78+zWall])    
      cube([12,6,27],center=true);
      translate([17,-37,78+zWall])    
      cube([9,3,27],center=true);
    }
    translate([20+6,-36+1.5,78+zWall])    
    cube([6,3,27],center=true);
      // side slots
    difference(){
      translate([20,36,78-1+zWall])    
      cube([12,6,20],center=true);
      translate([17,37,78-1+zWall])    
      cube([9,3,20],center=true);
    }
    translate([20+6,36-1.5,78+zWall])    
    cube([6,3,27],center=true);

}

//--------------------------------------------------------------------------------
module wallMount(){

  // ring for panTube
  translate([-122,0,0])
  rotate([0,90,0])
  difference(){
    cylinder(r1=30,r2=28,h=7,$fn=F2);

    translate([0,0,-0.05])
    metric_thread (diameter=46, pitch=2, length=7.1, internal=true, n_starts=1,
                    thread_size=-1, groove=false, square=false, rectangle=0,
                    angle=30, taper=0, leadin=0, leadfac=1.0, test=false);
  }


  difference(){
    // outer volume
    union(){
      // main box
      translate([-60,0,78+zWall])    
      color("green")
      cube([158+4,72+4,27+4],center=true);
      // hump for usb and ventilation  
      translate([-60-158/2-2,0,64+zWall])    
      color("green")
      rotate([0,90,0])
      scale([0.6,1,1])
      cylinder(r=18+2,h=158+4,$fn=F2);

      // arm to panRing
      hull(){
        translate([-122-19,0,0])
        rotate([0,90,0])
        cylinder(r=30,h=19,$fn=F2);

        translate([-122-19+19/2+5,0,78+zWall])    
        color("green")
        cube([19+10,72+2+6,27+4],center=true);
      }

    } // end union

    // cut for locking tab, bottom side door
    translate([-137,0,90+zWall])    
    cube([3,18,10],center=true);
        
    // inner volume
    translate([-60-4,0,78+zWall])    
    color("green")
    cube([158+8+10,72,27],center=true);
    
    translate([-140,0,72+zWall])    
    color("green")
    cube([20,66,27],center=true);

    translate([-60-158/2-2-5,0,64+zWall])    
    color("green")
    rotate([0,90,0])
    scale([0.6,1,1])
    cylinder(r=18,h=158+10,$fn=F2);


    // ring below tube
    hull(){
      translate([-122-19+2,0,0])
      rotate([0,90,0])
      cylinder(r=30-2,h=19-4,$fn=F2);

      translate([-122-19+19/2+5,0,78])    
      color("green")
      cube([19-4+10,72+2-4,27+2-4],center=true);
    }
    
    // cut through to panTube
    translate([-130,0,0])
    rotate([0,90,0])
    cylinder(r=24,h=19-4,$fn=F2);
  }

  // lower side tabs for wall attach
  if(1){
    difference(){
      hull(){
        translate([-126.5,57,91.5+zWall])    
        cylinder(r=29/2,h=4,center=true,$fn=F2);
        translate([-126.5,40,91.5+zWall])    
        cube([19+10,4,4],center=true);
      }
      
      translate([-126.5,63,91.5+zWall])    
      rotate([0,0,0])
      cylinder(r=2,h=12,center=true,$fn=F2);
    }
    translate([-126.5-14.5,40,91.5-2+zWall])    
    rotate([0,90,0])
    rounder(r=10,h=29,f=44);
    
    mirror([0,1,0]){
      difference(){
        hull(){
          translate([-126.5,57,91.5+zWall])    
          cylinder(r=29/2,h=4,center=true,$fn=F2);
          translate([-126.5,40,91.5+zWall])    
          cube([19+10,4,4],center=true);
        }
        
        translate([-126.5,63,91.5+zWall])    
        rotate([0,0,0])
        cylinder(r=2,h=12,center=true,$fn=F2);
      }
      translate([-126.5-14.5,40,91.5-2+zWall])    
      rotate([0,90,0])
      rounder(r=10,h=29,f=44);
    }
  }
  
  // upper side tab for wall attach
  if(1){
    difference(){
      translate([20,0,91.5+zWall])   
      scale([1,2,1])
      cylinder(r=19,h=2,$fn=F2);
      
      translate([32,0,91.5+zWall])    
      rotate([0,0,0])
      cylinder(r=2,h=12,center=true,$fn=F2);
    }
  }
  
  
  
  if(showUsb==1){
    translate([-50,0,60+zWall])    
    color("green")
    rotate([0,0,180])
    usbPower(plug=1);
  }
  if(showDr==1){
    translate([-40,0,60+13+5+zWall])    
    color("green")
    cube([97,64,26],center=true);
  }
  if(showSolar==1){
    translate([-40,0,60+13+5+zWall])    
    color("green")
    cube([109,72,26],center=true);
  }

}

//======================================================================

// Printing List:
// parts are not aligned for assembly
if(0){
  
//~ outdoorCamHolderA();
//~ outdoorCamHolderB();
//~ outdoorCamHolderC();
//~ servoGearA();
//~ servoGearB();
//~ servoGearC();
//~ servoGearD();
//~ servoSpline();
//~ servoShaft();
//~ servoShaft2();
//~ servoMountDouble();
//~ panRing(bearing=0);
//~ panSkirt();
//~ panPost();
//~ shell();
hat();

}

//======================================================================

// Design List:
// parts are aligned for assembly, duplicates are shown
if(1){
  
//~ intersection(){
//~ difference(){

//~ translate([0,0,100])
//~ rotate([0,-90,0])
union(){

  wallMount();
  
  translate([1.2,0,0])
  wallHat();

//~ // rotation for pan
//translate([0,0,zPan])
rotate([panAngle,0,0])
translate([0,0,-zPan]){



  //~ // glass, 20 mm of frost on one end
  //~ translate([0,0,zPan])
  //~ translate([-10,0,-25])
  //~ rotate([0,-2,0])
  //~ #cube([76,25,1.2],center=true);


  translate([0,0,zPan])
  hat();

  translate([0,0,zPan])
  shell();

  translate([0,0,zPan])
  panRing();

  translate([0,0,zPan])
  panTube();

  //~ translate([0,0,zPan])
  //~ wallMount();

  //~ translate([0,0,zPan])
  //~ panRingMate();

  //~ translate([0,0,zPan])
  //~ panPost(bearing=0);
  //~ translate([0,0,zPan])
  //~ panSkirt(bearing=0);
  
  //~ translate([-68,-15,42.5])
  //~ pi0();

  //~ servoMountDouble();

  //~ // pan
  //~ translate([-59-0.15,-13.5,23.9])
  //~ rotate([0,-90,0])
  //~ rotate([0,0,0])
  //~ servoGearFull(axle=2);

  //~ // tilt
  //~ translate([-42,13.5,23.9])
  //~ rotate([0,90,0])
  //~ rotate([0,0,180])
  //~ servoGearFull(axle=1);

    
    //~ // rotation for elevation:
    //~ translate([xCam,0,zCam])
    //~ rotate([0,-el,0])
    //~ translate([-xCam,0,-zCam]){
      //~ outdoorCamHolderA();
      //~ if(showCam==1){
        //~ // camera module 3
        //~ color("silver")
        //~ translate([0,0,zPcb])
        //~ rotate([0,180,0])
        //~ rotate([0,0,90])
        //~ cameraV3();
      //~ }
    //~ } // end of rotate for elevation

  //~ outdoorCamHolderB();
  //~ outdoorCamHolderC();

} // end of pan

} // end of union


  //~ // cut across the worm gear
  //~ translate([0,30+13.5,0])
  //~ cube([200,60,120],center=true);

  //~ // cut across the servo
  //~ translate([0,-30,0])
  //~ cube([90,60,90],center=true);

  //~ // cut across rotational axis
  //~ translate([-30,-30,0])
  //~ cube([240,60,300],center=true);

  //~ // cut across rotational axis
  //~ translate([-40,-30,-80])
  //~ cube([240,60,300],center=true);


//~ }// end diff or intersection

} // end of design list
