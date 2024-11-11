//======================================================================
// outdoorCam6.scad
//
// Outdoor camera mounting for Frigate Cam2024
//
// DrTomFlint, 11 Nov 2024
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

panAngle=360-0;

// pan ring 
zGear=6;
mod=1;
nRing=65;
nSpur=12;
offAng=90;
nSpur2=12;

nGear2=20;  // pan2 worm

yPan=12;
zPan=-14;   // pan servo

twist=45;

xTilt=17-1;
yTilt=0+1;
zTilt=-36;  // tilt servo

zShell=100;

// derived pan ring
rRing=(nRing*mod)/2;
rSpur=(nSpur*mod)/2;
rSpur2=(nSpur2*mod)/2;
offLen=rRing-rSpur;
offX=cos(offAng)*offLen;
offY=sin(offAng)*offLen;

offX2=offX;
offY2=offY-rSpur-rSpur2;

F2=88;
F1=299;


// 
xIdler=(25+12)/2;

showUsb=0;
showDr=0;       // approx model
showSolar=0;    // approx model
showGlass=0;

showPi=1;
showCam=1;

//--------------------------------------------------------------------------------
module panTube(){


  difference(){
    union(){
      panRingMate();
      
      translate([-116+10,0,0])
      rotate([0,90,0])
      cylinder(r=23,h=15,$fn=F2);
      
      translate([-29+10,0,0])
      panRingMate();
    }
    translate([-130,0,0])
    rotate([0,90,0])
    translate([0,0,-0.5])
    cylinder(r=23-1.5,h=50,$fn=F2);
  }
    
}

//----------------------------------------------------------------------
// camera and spur gear with pivots
module outdoorCamHolderA(){
zPcb=6;
      
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
    //~ #cylinder(r=2.9/2+0.15,h=12,$fn=F2);
    cylinder(r=2.9/2+0.15,h=20,$fn=F2);
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

    // cut for output spline
    translate([0,0,8])
    cylinder(r=6+0.15,h=4.1,$fn=6);
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
      //~ // tab into chassis
      //~ hull(){
        //~ translate([9.5,0,10.1+1])
        //~ cube([10,10,2],center=true);
        //~ translate([0,0,10.1])
        //~ cylinder(r=11,h=2);
      //~ }
      //~ translate([20-5,0,10.1+1])
      //~ cube([6,6,2],center=true);

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
// retain and center gears A and C, anchor to gearB and gearMount
module servoGearD_old(){

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
// output spline with attached pan pinion gear
module servoSpline2(){

$fn=F2;
  
  // lower section
  difference(){
    union(){
      translate([0,0,8])
      cylinder(r=6,h=6,$fn=6);

      intersection(){
        translate([0,0,12.5+7.25-zGear])
        rotate([0,0,180/nSpur2])
        spur_gear (modul=mod, tooth_number=nSpur2, width=zGear, bore=0, pressure_angle=20, helix_angle=0, optimized=false,$fn=F2);
        translate([0,0,14])
        cylinder(r1=6,r2=12,h=6,$fn=F2);
      }
    }
    // cut M3 nut clearance
    translate([0,0,8-0.1])
    cylinder(r=4,h=6,$fn=F2);
    
    // cut M3x20 bolt from GearA 
    translate([0,0,8-0.1])
    cylinder(r=1.8,h=14,$fn=F2);
    
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
    
    // cut for M3 bolt access
    translate([-xIdler,0,-18])
    cylinder(r=7/2+0.15,h=8.15,$fn=F2);

    // heatset insert
    translate([-xIdler,0,-10])
    cylinder(r=2.3,h=3.5,$fn=22);

    translate([-xIdler,0,-10+3])
    cylinder(r=2.9/2,h=35,$fn=F2);
    
  }
  
  if(bolt==1){
    // M3x25
    translate([-xIdler,0,16])
    cylinder(r=5.6/2+0.15,h=3.15,$fn=F2);
    translate([-xIdler,0,-9])
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


  servoGearA(bolt=1);
  servoGearB();
  servoGearC();
  //~ servoGearD();
  if(axle==1){
    servoSpline();
    servoShaft();
  }
  if(axle==2){
    servoSpline2();
  }

  translate([-5.25,0,-34]){
    servo1();
    translate([5.25,0,28])
    servoDisk();
  }
  servoGearMount(bolt=1);

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
    servoGearMount(bolt=1);

    // tilt
    translate([-42,13.5,23.9])
    rotate([0,90,0])
    rotate([0,0,180])
    servoGearMount(bolt=1);
  }
  // ensure print down edge is perfectly flat, (some 0.15's missing)
  translate([-50.5-0.1,0,20])
  cube([16.75,48,45],center=true);
}

  // tail for mounting pi0, extends into panSkirt
  difference(){
    translate([-66-1.8,0,40])
    cube([22,41,3],center=true);

    translate([-59-0.15,-13.5,23.9])
    rotate([0,-90,0])
    rotate([0,0,0])
    translate([20-5,0,10.1+1])
    cube([6+0.3,6+0.3,2+0.3],center=true);
  }

  // tiltcam link
  difference(){
    translate([-32,0,40])
    cube([22,41,3],center=true);
  
    // cut for tiltcam Gear D
    translate([-42,13.5,23.9])
    rotate([0,90,0])
    rotate([0,0,180])
    translate([20-5,0,10.1+1])
    cube([6+0.3,6+0.3,2+0.3],center=true);
  }
  
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
    translate([-57,-12.5,44]){
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
      translate([0,yPi-2*rPi,0])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
      
      translate([xPi-2*rPi-1,0,0])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
      translate([xPi-2*rPi-1,yPi-2*rPi,0])
      cylinder(r1=1.3,r2=1.0,h=3,center=true,$fn=F2);
    }
    translate([-57,-12.5,42]){
      cylinder(r=3,h=2.5,center=true,$fn=F2);
      translate([0,yPi-2*rPi,0])
      cylinder(r=3,h=2.5,center=true,$fn=F2);
      translate([xPi-2*rPi-1,0,0])
      cylinder(r=3,h=2.5,center=true,$fn=F2);
      translate([xPi-2*rPi-1,yPi-2*rPi,0])
      cylinder(r=3,h=2.5,center=true,$fn=F2);
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

  translate([-84-10,0,0])
  rotate([0,90,0]){
    difference(){
      translate([0,0,-0.05])
      metric_thread (diameter=50-1, pitch=3, length=8.1, internal=false, n_starts=3,
                      thread_size=-1, groove=false, square=false, rectangle=0,
                      angle=30, taper=0, leadin=2, leadfac=1.0, test=false);
      
      translate([0,0,-2])
      cylinder(r=20,h=7+4,$fn=F2);
    }
  }
}

//--------------------------------------------------------------------------------
module panRing(bearing=0){

  translate([0,0,0])
  ring_gear (modul=mod, tooth_number=nRing, width=zGear, rim_width=1, pressure_angle=20, helix_angle=0,$fn=F2);

  //~ translate([offX,offY,0])
  //~ spur_gear (modul=mod, tooth_number=nSpur, width=zGear, bore=0, pressure_angle=20, helix_angle=0, optimized=false,$fn=F2);

  //~ translate([offX2,offY2,0])
  //~ rotate([0,0,180/nSpur2])
  //~ spur_gear (modul=mod, tooth_number=nSpur2, width=zGear, bore=0, pressure_angle=20, helix_angle=0, optimized=false,$fn=F2);

}

//--------------------------------------------------------------------------------
module panIdler(bearing=0){

  intersection(){
    translate([offX,offY,0])
    spur_gear (modul=mod, tooth_number=nSpur, width=zGear, bore=0, pressure_angle=20, helix_angle=0, optimized=false,$fn=F2);
    translate([offX,offY,-4])
    cylinder(r1=16,r2=3,h=zGear+7,$fn=F2);
    translate([offX,offY,-3])
    cylinder(r2=16,r1=3,h=zGear+7,$fn=F2);
  }
  
  // axle
  translate([offX,offY,-4])
  cylinder(r=3,h=zGear+7,$fn=F2);
}

//--------------------------------------------------------------------------------
module panPost(bearing=1){
  
  // post through bearing
  translate([0,0,8])
  cylinder(r=4-0.15,h=7,$fn=F2);
  
  // 
  difference(){
    translate([0,0,-8])
    cylinder(r=31,h=8+6+3,$fn=F2);

    // idler
    hull(){
      translate([offX,offY,-0.15])
      cylinder(r=8.4,h=6.3,$fn=F2);
      translate([offX,offY+10,-0.15])
      cylinder(r=8.4,h=6.3,$fn=F2);
    }
    
    // idler axle
    hull(){
      translate([offX,offY,-0.15-4.5])
      cylinder(r=3+0.15,h=6.3+8,$fn=F2);
      translate([offX,offY+10,-0.15-4.5])
      cylinder(r=3-0.15,h=6.3+8,$fn=F2);
    }
    
    // drive pinion
    translate([offX2,offY2,-0.15])
    cylinder(r=8.4,h=6.3,$fn=F2);
    
    // cut for M3 from GearA
    translate([offX2,offY2,-0.15])
    cylinder(r=1.8,h=14,$fn=F2);


    // gearC collar
    translate([offX2,offY2,-0.15-6])
    cylinder(r=8+0.15,h=6.3,$fn=F2);
    
    // gear AC stack clearance
    translate([offX2,offY2,-0.15-18-4.5])
    cylinder(r=14+0.15,h=18.3,$fn=F2);
    
    // stack B
    translate([offX2-xIdler*cos(45),offY2-xIdler*sin(45),-10])
    cylinder(r=8.2,h=6,$fn=F2);
    translate([offX2-xIdler*cos(45),offY2-xIdler*sin(45),-4])
    cylinder(r=1.7,h=6,$fn=F2);
    translate([offX2-xIdler*cos(45),offY2-xIdler*sin(45),2])
    cylinder(r=3.5,h=10,$fn=F2);


    // pan servo
    translate([offX2,offY2,zPan-34])
    rotate([0,0,0])
    rotate([0,0,twist])
    translate([-5,0,0])
    servo1cut(tol=0.2);

    // tilt servo
    translate([xTilt,yTilt,zPan])
    rotate([0,0,-45-90])
    rotate([0,180,0])
    translate([-5,0,-12])
    servo1cut(tol=0.2);
    // cut for servo wires
    translate([xTilt,yTilt,zPan])
    rotate([0,0,-45-90])
    translate([-10,0,0])
    cube([10,8,20],center=true);
    
  }
  
  // center bearing
  if(bearing==1){
    translate([0,0,8])
    difference(){
      cylinder(r=11,h=7,$fn=F2);
      translate([0,0,-1])
      cylinder(r=4,h=7+2,$fn=F2);
    }
  }

}


//--------------------------------------------------------------------------------
module panRing2(bearing=0){

  rotate([0,0,90])
  translate([nGear2/2,0,zGear/2])
  worm_gear(modul=mod, tooth_number=nGear2, thread_starts=1, width=zGear, length=20, worm_bore=1.7, gear_bore=1, pressure_angle=20, lead_angle=10, optimized=0, together_built=1, show_spur=1, show_worm=1);

  //~ // bearing sleeve
  //~ difference(){
    //~ cylinder(r1=13.5,r2=13.5,h=10,$fn=F2);
    //~ translate([0,0,3-0.1])
    //~ cylinder(r1=11,r2=11+0.2,h=7.2,$fn=F2);
    //~ translate([0,0,-1])
    //~ cylinder(r=9,h=12,$fn=F2);
    //~ translate([0,0,2])
    //~ cube([40,1,10],center=true);
    //~ translate([0,0,2])
    //~ cube([1,40,10],center=true);
  //~ }

  // center bearing
  if(bearing==1){
    difference(){
      cylinder(r=11,h=7,$fn=F2);
      translate([0,0,-1])
      cylinder(r=4,h=7+2,$fn=F2);
    }
  }
}

//----------------------------------------------------------------------------------------------------
module arm(bearing=1){



  // center bearing
  if(bearing==1){
    translate([0,0,9.1])
    difference(){
      cylinder(r=11,h=7,$fn=F2);
      translate([0,0,-1])
      cylinder(r=4,h=7+2,$fn=F2);
    }
  }

  if(showUsb==1){
    translate([-80,0,20])    
    rotate([0,0,0])
    #usbPower(plug=1);
  }
}


//----------------------------------------------------------------------------------------------------
module panServo(){

    translate([offX2,offY2,zPan])
    rotate([0,0,0])
    rotate([0,0,twist])
    servoGearFull(axle=2);


}
//----------------------------------------------------------------------------------------------------
module tiltServo(){

    translate([xTilt,yTilt,zTilt])
    rotate([0,0,twist])
    rotate([180,0,0])
    servoGearFull(axle=0);

    translate([xTilt,yTilt,zTilt])
    rotate([0,0,twist-90-45])
    translate([-24,-13.25,-35])
    rotate([0,90,0]){
      outdoorCamHolderB();
    }
    
    xCam=0;
    el=45;
    zPcb=6;
    translate([xTilt,yTilt,zTilt])
    //~ rotate([0,0,twist-90-45])
    rotate([0,0,twist-90])
    translate([-24,-13.25,-35])
    rotate([0,90,0])

    // rotation for elevation:
    translate([xCam,0,0])
    rotate([0,-el,0])
    translate([-xCam,0,0]){
      outdoorCamHolderA();
      if(showCam==1){
        // camera module 3
        color("silver")
        translate([0,0,zPcb])
        rotate([0,180,0])
        rotate([0,0,90])
        cameraV3();
      }
    } // end of rotate for elevation


    if(showPi==1){
      translate([xTilt,yTilt,zTilt])
      rotate([0,0,twist-90])
      translate([14,-25,20])
      rotate([0,90,0])
      pi0();
    }
      

}

//----------------------------------------------------------------------------------------------------
module shell(){

rGlass=22;
thick=1.5;

  difference(){
    // outer shell
    translate([0,0,-zShell-thick])
    cylinder(r1=35+thick,r2=35+thick,h=zShell+6+thick,$fn=F2);
    // inner cut
    difference(){
      translate([0,0,-zShell])
      cylinder(r1=35,r2=35,h=zShell+6+0.1,$fn=F2);
      
      translate([-rGlass-5,rGlass+5,-zShell+34])
      rotate([0,0,-45])
      cube([20,100,100],center=true);
    }    
    // glass cut
    translate([-rGlass,rGlass,-zShell+38-2])
    rotate([0,0,-45])
    rotate([0,90,0])
    cube([76+4,25+0.6,1.2+0.3],center=true);
    
    // window cut
    translate([-rGlass+2.5,rGlass-2.5,-zShell+38])
    rotate([0,0,-45])
    rotate([0,-90,0])
    linear_extrude(height=15,scale=[1.4,1.8])
    offset(r=1,$fn=F2)
    square([62,16],center=true);
    
  }
  
  // glass, 20 mm of frost on one end
  if(showGlass==1){
    translate([-rGlass,rGlass,-zShell+38])
    rotate([0,0,-45])
    rotate([0,90,0])
    #cube([76,25,1.2],center=true);
  }

}

//======================================================================


// Design List:
// parts are aligned for assembly, duplicates are shown
if(1){
  
//~ intersection(){
//~ difference(){


//~ union(){

  //~ arm();
  //~ panRing();
  
  // panRing2();

  #panPost(bearing=0);

  // rotation for pan
  rotate([0,0,panAngle])
  translate([0,0,0]){

  panServo();
  panIdler();
  tiltServo();
  
  //~ shell();

  //~ translate([0,0,zPan])
  //~ panTube();

  //~ translate([0,0,zPan])
  //~ panRingMate();

  //~ translate([0,0,zPan])
  //~ translate([0,0,zPan])
  //~ panSkirt(bearing=0);
  
  //~ translate([-60,-15,43.1])
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

//~ } // end of union


  //~ // cut across the worm gear
  //~ translate([0,30+13.5,0])
  //~ cube([200,60,120],center=true);

  //~ // cut across the servo
  //~ translate([0,-30,0])
  //~ cube([90,60,90],center=true);

  //~ // cut across rotational axis
  //~ translate([-30,-30,0])
  //~ cube([240,60,300],center=true);

  // cut across rotational axis
  //~ rotate([0,0,90])
  //~ translate([0,-100,0])
  //~ cube([240,200,300],center=true);


//~ }// end diff or intersection

} // end of design list

//==================================================================
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
//~ servoSpline2();
//~ servoShaft();
//~ servoShaft2();
//~ servoMountDouble();
//~ panRing(bearing=0);
//~ panSkirt();
//~ panTube();
panPost(bearing=0);
panIdler();
//~ shell();
//~ hat();
//~ wallMount();
//~ wallMount2();
//~ wallMount3();
//~ wallMount3Plug();
//~ Number();
//~ wallHat();


  //~ // support blocker for wallMount2
    //~ translate([-122-19+10+4,-15,0])
    //~ rotate([40,0,0])
    //~ scale([1,2,1])
    //~ cylinder(r1=3,r2=3,h=120,$fn=F2);

//~ difference(){
  //~ union(){
    //~ panRing(bearing=0);
    //~ translate([-0.1,0,0])    
    //~ panRingMate();
  //~ }
    //~ translate([-80,-20,0])    
    //~ cube([80,40,100],center=true);
  //~ }

}


//======================================================================
