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
zGear=8;
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
zTilt=-40+2;  // tilt servo

zShell=100;
rGlass=22;
thick=1.5;
//~ thick=0.9;
lockAngle=-15;
ventAngle=-45;

xIdler=(25+12)/2; // distance Gears A-B and B-C

// derived pan ring
rRing=(nRing*mod)/2;
rSpur=(nSpur*mod)/2;
rSpur2=(nSpur2*mod)/2;
offLen=rRing-rSpur;
offX=cos(offAng)*offLen;
offY=sin(offAng)*offLen;

offX2=offX;
offY2=offY-rSpur-rSpur2;

F2=299;
F1=299;

showUsb=0;
showDr=0;       // approx model
showSolar=0;    // approx model
showGlass=0;

showPi=0;
showCam=1;

Version="B";
CamID="1";

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
module camHolderA(){
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
  translate([0-2.5,0,-3+zPcb])
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
module camHolderB(){

  $fn=99;
  translate([-3,13.5,21])
  rotate([0,-90,0])
  rotate([90,0,0])
  worm_gear(modul=1, tooth_number=42, thread_starts=1, width=2, length=24, worm_bore=0, gear_bore=3, pressure_angle=20, lead_angle=10, optimized=0, together_built=1, show_spur=0, show_worm=1);

  // small end insert into pocket
  translate([13+4,13.5,23.9])
  rotate([0,-90,0])
  cylinder(r=4,h=6,$fn=F2);

  // large end attaches to shaft
  difference(){
    union(){
      translate([-12,13.5,23.9])
      rotate([0,-90,0])
      cylinder(r=4,h=13.5,$fn=F2);

      translate([-23,13.5,23.9])
      rotate([0,-90,0])
      rotate([0,0,15])
      cylinder(r=6,h=4,$fn=6);
    }
    
    translate([-17,13.5,23.9])
    rotate([0,-90,0])
    rotate([0,0,30])
    cylinder(r=1.7,h=10,$fn=F2);

  }
}
//----------------------------------------------------------------------

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
    
    // heatset insert
    translate([-xIdler,0,-14-6])
    cylinder(r=2.3,h=3.5+6,$fn=22);
  
    // M3 bolt hole
    translate([-xIdler,0,-20])
    cylinder(r=1.7,h=35,$fn=F2);
    
  }
  
  if(bolt==1){
    // M3x25
    translate([-xIdler,0,16])
    cylinder(r=5.6/2+0.15,h=3.15,$fn=F2);
    translate([-xIdler,0,-9])
    cylinder(r=1.7,h=25,$fn=F2);
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
  //~ servoGearMount(bolt=1);

}

//--------------------------------------------------------------------------------
module camHolderC(){

  // pivot offside
  translate([0,0,zPan])
  rotate([0,0,45])
  translate([-15.75,13.5,-61])
  rotate([0,90,0]){
    cylinder(r1=2.5,r2=2,h=3,$fn=F2);
    translate([0,0,-2+0.1])
    cylinder(r=4,h=2,$fn=F2);
  }
  
  // pivot gearside
  translate([0,0,zPan])
  rotate([0,0,45])
  translate([10.25,13.5,-61])
  rotate([0,90,0]){
    // pin
    cylinder(r2=2.5,r1=2,h=3,$fn=F2);
    // washer
    translate([0,0,3-0.1])
    cylinder(r=4,h=2,$fn=F2);
  }
    
  // capture top end of Worm
  translate([xTilt,yTilt,zPan-77])
  difference(){
    rotate([0,0,45])
    translate([2,-1,0])
    cube([16,12,4],center=true);
    translate([0,0,2])
    cylinder(r=4+0.2,h=6,center=true,$fn=33);
  }
  
  // capture base of Worm
  translate([xTilt,yTilt,zPan-39])
  difference(){
    rotate([0,0,45])
    union(){
      translate([-10,0,0])
      cube([40,14,6],center=true);

      // back panel
      rotate([0,0,-90])
      translate([8,-10,-18.5])
      cube([2,40,43],center=true);
    }
    // worm
    translate([0,0,2])
    cylinder(r=4+0.2,h=12,center=true,$fn=F2);

    // Gear C collar
    translate([0,0,2])
    cylinder(r=8+0.2,h=3,center=true,$fn=33);
    
    // M3 from Gear B
    translate([-xIdler*cos(45),-xIdler*cos(45),0])
    cylinder(r=1.7,h=10,center=true,$fn=33);
    
  }

  // arm to offside pivot, thin to flex!
  hull(){
    translate([xTilt,yTilt,zPan-58.5+1])
    rotate([0,0,-45])
    translate([1,-31,0])
    cube([16,2,43],center=true);
    // pivot offside
    translate([0,0,zPan])
    rotate([0,0,45])
    translate([-15.75,13.5,-61])
    rotate([0,90,0])
    translate([0,0,-3])
    cylinder(r=4,h=2,$fn=F2);
  }
  
  // peg for pi0, moved down 1 mm 
  translate([0,0,-2+1])
  rotate([0,0,45])
  translate([-20,-15,-89])
  rotate([0,-90,0])
  pi0pegs(two=0,three=0,four=0);
  
  
  // arm to gearside pivot
  hull(){
    translate([xTilt,yTilt,zPan-58.5])
    rotate([0,0,-45])
    translate([0,8,0])
    cube([14,4,34],center=true);

    // pivot gearside
    translate([0,0,zPan])
    rotate([0,0,45])
    translate([10.25,13.5,-61])
    rotate([0,90,0])
    translate([0,0,4])
    cylinder(r=4,h=2,$fn=F2);
  }
  
  // Tab back side
  difference(){
    hull(){
      translate([0,0,zPan-20])
      rotate([0,0,twist])
      translate([0,-20,-27])
      cube([40,1,22],center=true);

      translate([0,0,zPan-20])
      rotate([0,0,twist])
      translate([0,-32,-27])
      cube([18,1,22],center=true);
    }
    rail(tol=0.2);
  }

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

  translate([0,0,-1])
  ring_gear (modul=mod, tooth_number=nRing, width=zGear+3, rim_width=1, pressure_angle=20, helix_angle=0,$fn=F2);


  translate([0,0,-1.5])
  difference(){
    metric_thread (diameter=nRing*mod+20, pitch=3, length=zGear+6, internal=false, n_starts=1,
                thread_size=-1, groove=false, square=false, rectangle=0,
                angle=30, taper=0, leadin=3, leadfac=1.0, test=false);
    
    translate([0,0,-0.01])
    cylinder(r=nRing*mod/2+2,h=zGear+2+0.4,$fn=F2);
    
    // cut for bearing
    translate([0,0,9])
    cylinder(r=11,h=zGear+0.4+5,$fn=F2);
    
    // version number
    translate([24,0,14.0-0.6])
    rotate([0,0,0])
    rotate([0,0,90])
    linear_extrude(height=0.605)
    text(Version, font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.1);

  }  
}

//--------------------------------------------------------------------------------
module panLock(bearing=0){

  difference(){
    union(){
      translate([0,0,2])
      cylinder(r1=nRing*mod/2+14,r2=nRing*mod/2+12,h=4,$fn=F2);

      translate([0,0,-8])
      cylinder(r=nRing*mod/2+14,h=10,$fn=F2);

      translate([0,0,-12])
      cylinder(r1=nRing*mod/2+14-3,r2=nRing*mod/2+14,h=4,$fn=F2);
    }
    
    translate([0,0,-3.1])
    metric_thread (diameter=nRing*mod+20+1, pitch=3, length=zGear+6, internal=false, n_starts=1,
                thread_size=-1, groove=false, square=false, rectangle=0,
                angle=30, taper=0, leadin=2, leadfac=1.0, test=false);


    translate([0,0,-8])
    cylinder(r=41+0.4,h=8+0.6,$fn=F2);

    translate([0,0,-12])
    cylinder(r1=38,r2=37,h=4+0.6,$fn=F2);

   // knurl
   k=30;
   for(i=[0:(k-1)]){
     rotate([0,0,360/k*i])
     translate([48,0,-15])
     cylinder(r=3,h=zGear+6+15,$fn=88);
   }

    // cut for version number
    translate([0,50,-2])
    rotate([90,0,0])
    cylinder(r=5,h=6,$fn=F2);
  }
  
 
    // version number
    translate([0,44.6,-2])
    rotate([90,0,0])
    rotate([0,0,0])
    linear_extrude(height=1.605)
    text(Version, font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);



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
  
  // 
  difference(){
    union(){
      // post through bearing
      translate([0,0,6.5])
      cylinder(r1=4,r2=4.2,h=10,$fn=F2);
      
      // washer
      translate([0,0,8])
      cylinder(r=5.5,h=1,$fn=F2);
      
      // boss around gears
      translate([0,0,-8])
      cylinder(r=31,h=8+6+3,$fn=F2);
      
      // drag ring / retainer
      intersection(){
        translate([0,0,-8.0])
        cylinder(r=41-0.5,h=8-0.15,$fn=F2);
        translate([0,0,-8.0])
        cylinder(r1=39.5,r2=39.5+6,h=8.2,$fn=F2);
        translate([0,0,-8.0])
        cylinder(r2=39.5,r1=39.5+6,h=8.2,$fn=F2);
      }
    }
    
    // version number
    translate([25,0,-0.6])
    rotate([0,0,0])
    rotate([0,0,90])
    linear_extrude(height=0.605)
    text(Version, font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.1);
    
    rotate([0,0,30])
    translate([-25,0,-8.0])
    rotate([0,0,-90])
    linear_extrude(height=0.605)
    text(Version, font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.1);
    
    // bearing post cuts
    translate([0,0,19])
    cube([0.5,10,11],center=true);
    translate([0,0,19])
    cube([10,0.5,11],center=true);
    
    // material reduction
    rxx=21;
    axx=-108;
    rotate([0,0,axx])
    translate([rxx,0,0])
    cylinder(r=9,h=40,center=true,$fn=F2);
    
    // material reduction
    rotate([0,0,0])
    difference(){
      translate([0,0,20-0.15])
      cube([100,100,40],center=true);
      hull(){
        translate([0,0,9])
        cylinder(r1=12,r2=8,h=20,center=true,$fn=F2);
        translate([0,80,9])
        cylinder(r1=12+2,r2=8+2,h=20,center=true,$fn=F2);
      }
    }
      
    // cut for rail
    rail(tol=0.2);
    
    // cut for front post
    rotate([0,0,twist])
    translate([0,24,-16])
    cylinder(r=2+0.15,h=30,center=true,$fn=6);

    // cut for shell
    translate([0,0,-9])
    difference(){
      translate([0,0,-zShell-thick])
      cylinder(r=35+thick+0.3,h=zShell+6+thick,$fn=F2);
      translate([0,0,-zShell])
      cylinder(r=34-0.15,h=zShell+6+0.1,$fn=F2);
    }
    
    // wiring pass through
    translate([0,-2,-10])
    rotate([-3,0,0])
    cylinder(r=1.5,h=40,$fn=F2);
    
    // idler
    hull(){
      translate([offX,offY,-0.15])
      cylinder(r=8.4,h=6.3,$fn=F2);
      translate([offX,offY+20,-0.15])
      cylinder(r=8.4,h=6.3,$fn=F2);
    }
    
    // idler axle
    hull(){
      translate([offX,offY,-0.15-4.5])
      cylinder(r=3+0.15,h=6.3+8,$fn=F2);
      translate([offX,offY+20,-0.15-4.5])
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
    translate([offX2-xIdler*cos(45),offY2-xIdler*sin(45),-0.15])
    cylinder(r=4,h=10,$fn=F2);

    // pan servo
    translate([offX2,offY2,zPan-34])
    rotate([0,0,0])
    rotate([0,0,twist])
    translate([-5,0,0])
    servo1cut(tol=0.2);

    // tilt servo
    translate([xTilt,yTilt,zTilt+26])
    rotate([0,0,-45-90])
    rotate([0,180,0])
    translate([-5,0,-8.15])
    servo1cut(tol=0.2);
    
    // cut for servo wires
    translate([xTilt,yTilt,zPan])
    rotate([0,0,-45-90])
    translate([-10,0,0])
    cube([10,8,20],center=true);
    
    
    // twist lock vertical cut
    for(i=[0:2]){
      rotate([0,0,i*120+15+lockAngle])
      translate([32,0,-5.5])
      rotate([0,90,0])
      hull(){
        cylinder(r1=0.5+0.15,r2=2+0.15,h=2+0.15,$fn=F2);
        translate([4,0,0])
        // upper end is larger
        cylinder(r1=0.5+0.5,r2=2+0.5,h=2+0.5,$fn=F2);
      }
    }
    // twist lock horizontal cut
    for(i=[0:2]){
      for(j=[0:15]){
        rotate([0,0,i*120+j+lockAngle])
        translate([32,0,-5.5])
        rotate([0,90,0])
        cylinder(r1=0.5+0.15,r2=2+0.15,h=2+0.15,$fn=F2);
      }
    }
    
  }
}

//----------------------------------------------------------------------------------------------------
module arm(bearing=0){

  panRing();

  difference(){
    union(){
      // main plate
      translate([0,0,12-0.1])
      cylinder(r=60,h=7,$fn=F2);
      
      // drip ring / locking collar
      translate([0,0,0-0.1])
      cylinder(r1=53,r2=57,h=12,$fn=F2);
      
      // usb arm
      translate([-75,0,-19.1])    
      linear_extrude(height=38)
      offset(r=3,$fn=F2)
      square([38-6,100-6],center=true);
            
      // usb arm extension to main plate
      translate([-75+30,0,19-2.1])    
      linear_extrude(height=2)
      offset(r=3,$fn=F2)
      square([38-6,100-6],center=true);

      // side tabs
      difference(){
        translate([-95,0,-1.1])    
        linear_extrude(height=20)
        offset(r=1,$fn=F2)
        square([4-2,150-2],center=true);
        
        translate([-95,0,20])    
        cube([4,108,13],center=true);
      }
      

      // bottom tab
      translate([-95,0,-1.1-35])    
      linear_extrude(height=44)
      offset(r=1,$fn=F2)
      square([4-2,20-2],center=true);
    }
    
    // mounting holes in the tabs
    translate([-100,0,-28])    
    rotate([0,90,0])
    cylinder(r=3,h=40,$fn=F2);
    
    translate([-100,65,9])    
    rotate([0,90,0])
    cylinder(r=3,h=40,$fn=F2);
    
    translate([-100,-65,9])    
    rotate([0,90,0])
    cylinder(r=3,h=40,$fn=F2);
    
    // main plate
    translate([0,0,12-0.1])
    translate([0,0,-0.1])
    cylinder(r1=30,r2=34,h=7.2,$fn=F2);

    // drip ring / locking collar 
    translate([0,0,0-0.1])
    translate([0,0,-0.1])
    cylinder(r1=50,r2=49,h=8.1,$fn=F2);

    // knurl cuts
    k=32;
    for(i=[0:(k-1)]){
     rotate([0,0,360/k*i])
     translate([49,0,-18])
     cylinder(r=3,h=zGear+6+15,$fn=88);
    }    

    // cut for DC wire
    translate([-20,0,20])
    rotate([0,-90,0])
    cylinder(r=7,h=60,$fn=F2);

    // cut for AC wire
    translate([-85,-40,-60])
    cylinder(r=2.5,h=60,$fn=F2);
    
    // cuts to secure lid
    translate([-50,-44,-20])
    cylinder(r=3,h=60,$fn=F2);
    translate([-50,44,-20])
    cylinder(r=3,h=60,$fn=F2);
    
    // cut usb arm
    translate([-75,0,-19.1+1.5])    
    linear_extrude(height=38-3+3)
    offset(r=1.5,$fn=F2)
    square([38-6,100-6-1.5],center=true);
     
    // cut panPost 
    translate([0,0,-6])
    cylinder(r=4.3,h=20,$fn=F2);
  }
  
  // bearing retainer
  translate([0,0,12-0.1])
  difference(){
    cylinder(r1=14,r2=13,h=7,$fn=F2);
    translate([0,0,-1])
    cylinder(r1=11-0.15,r2=11+0.15,h=7+2,$fn=F2);
    translate([0,0,-6])
    cylinder(r=4.3,h=20,$fn=F2);
    translate([0,0,7])
    cube([40,1,13],center=true);
    translate([0,0,7])
    cube([1,40,13],center=true);
  }
    
  // center bearing
  if(bearing==1){
    translate([0,0,12.1])
    difference(){
      cylinder(r=11,h=7,$fn=F2);
      translate([0,0,-1])
      cylinder(r=4,h=7+2,$fn=F2);
    }
  }

  // usb power block
  if(showUsb==1){
    translate([-90,-30,0])    
    rotate([0,0,90])
    rotate([90,0,0])
    #usbPower(plug=1);
  }


}

//----------------------------------------------------------------------------------------------------
module arm2(bearing=1){

  difference(){
    panRing();
  
    // ventilation holes
    for(i=[0:2])
    rotate([0,0,i*120+60])
    translate([22.5,0,20])
    cylinder(r=7,h=60,center=true,$fn=F2);
  }
  
  difference(){
    union(){
      // main plate
      translate([0,0,5.5])
      metric_thread (diameter=120, pitch=3, length=7, internal=false, n_starts=1,
                thread_size=-1, groove=false, square=false, rectangle=0,
                angle=30, taper=0, leadin=1, leadfac=1.0, test=false);
            
      // drip ring / locking collar
      translate([0,0,-1.5])
      cylinder(r1=54,r2=57,h=7.5,$fn=F2);
      
    }

    // version number
    translate([20,0,6.0])
    rotate([0,0,0])
    rotate([0,0,90])
    linear_extrude(height=2.605)
    text(Version, font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

    // ventilation holes
    for(i=[0:2])
    rotate([0,0,i*120+60])
    translate([22.5,0,20])
    cylinder(r=7,h=60,center=true,$fn=F2);
    
    // main plate
    translate([0,0,12-0.1])
    translate([0,0,-0.1])
    cylinder(r1=44-4,r2=44,h=7.2,$fn=F2);

    // drip ring / locking collar 
    translate([0,0,-2])
    cylinder(r1=50,r2=49,h=10.1,$fn=F2);

    // knurl cuts
    k=32;
    for(i=[0:(k-1)]){
     rotate([0,0,360/k*i])
     translate([49,0,-21.1])
     cylinder(r=3,h=zGear+6+15,$fn=88);
    }    

    // cut for bearing
    translate([0,0,0])
    cylinder(r=11,h=20,$fn=F2);
  }
  
  // center bearing
  if(bearing==1){
    translate([0,0,8.1])
    difference(){
      cylinder(r=11,h=7,$fn=F2);
      translate([0,0,-1])
      cylinder(r=4,h=7+2,$fn=F2);
    }
  }

}

//----------------------------------------------------------------------------------------------------
module arm3(){

  difference(){
    union(){
      // base ring
      translate([0,0,12-0.1])
      cylinder(r1=66,r2=66,h=7,$fn=F2);
      
      // hood
      hull(){
        translate([0,0,12-0.1+7])
        cylinder(r1=66,r2=66,h=3,$fn=F2);
        translate([-80,0,12-0.1+3.5+4])
        cube([4,40,7],center=true);

        translate([15,0,45])
        scale([1,1,0.5])
        sphere(r=20,$fn=F2);
        translate([-35,0,45])
        scale([1,1,0.5])
        sphere(r=20,$fn=F2);
      }      
      
      // wall connection
      hull(){
        translate([0,0,12-0.1])
        cylinder(r1=66,r2=66,h=7,$fn=F2);
        
        translate([-80,0,12-0.1+3.5])
        cube([4,40,7],center=true);
      }
      
      // tab
      hull(){
        translate([-78.5,26,40])
        rotate([0,90,0])
        cylinder(r=9,h=7,center=true,$fn=F2);
        
        translate([-78.5,-26,40])
        rotate([0,90,0])
        cylinder(r=9,h=7,center=true,$fn=F2);
        
        // center
        translate([-78.5,0,54])
        rotate([0,90,0])
        cylinder(r=9,h=7,center=true,$fn=F2);

        translate([-80+4,0,12-0.1+3.5])
        cube([12,40,4],center=true);
      }
    }

    // version number
    translate([-72,14,11.75])
    rotate([0,0,0])
    rotate([0,0,90])
    linear_extrude(height=0.605)
    text(Version, font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.1);
    
    // cut mounting holes in the tab
    translate([-73,26,40])
    rotate([0,90,0])
    cylinder(r=6,h=4,center=true,$fn=F2);
    translate([-73,26,40])
    rotate([0,90,0])
    cylinder(r=2,h=20,center=true,$fn=F2);

    translate([-73,-26,40])
    rotate([0,90,0])
    cylinder(r=6,h=4,center=true,$fn=F2);
    translate([-73,-26,40])
    rotate([0,90,0])
    cylinder(r=2,h=20,center=true,$fn=F2);

    translate([-73,0,54])
    rotate([0,90,0])
    cylinder(r=6,h=4,center=true,$fn=F2);
    translate([-73,0,54])
    rotate([0,90,0])
    cylinder(r=2,h=20,center=true,$fn=F2);

    // ac cord for usb block
    translate([-69,0,16])
    rotate([0,30,0])
    cylinder(r=2.5,h=12,center=true,$fn=F2);

    // cut for arm2
    translate([0,0,12-0.1])
    metric_thread (diameter=120+1, pitch=3, length=7, internal=false, n_starts=1,
              thread_size=-1, groove=false, square=false, rectangle=0,
              angle=30, taper=0, leadin=1, leadfac=1.0, test=false);
                  

      // cut hood
      hull(){
        translate([0,0,12-0.1+7])
        cylinder(r1=62,r2=62,h=3,$fn=F2);
        translate([-80+12,0,12-0.1+3.5+4+3])
        cube([4,36,7],center=true);
        
        translate([15,0,45-0.5])
        scale([1,1,0.5])
        sphere(r=17,$fn=F2);
        translate([-35,0,45-0.5])
        scale([1,1,0.5])
        sphere(r=17,$fn=F2);
      }      

  }
    
        
}

//----------------------------------------------------------------------------------------------------
module arm4(bearing=0){

  difference(){
    panRing();
  
    // ventilation holes
    for(i=[0:2])
    rotate([0,0,i*120+60])
    translate([22.5,0,20])
    cylinder(r=7,h=60,center=true,$fn=F2);
    
    // version number
    rotate([0,0,120])
    translate([20,0,9.5-0.65])
    rotate([0,0,90])
    linear_extrude(height=0.605)
    text(Version, font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);

    
  }
    
  // center bearing
  if(bearing==1){
    translate([0,0,9.1])
    difference(){
      cylinder(r=11,h=7,$fn=F2);
      translate([0,0,-1])
      cylinder(r=4,h=7+2,$fn=F2);
    }
  }

}

//----------------------------------------------------------------------------------------------------
module arm5(){

  difference(){
    union(){
      // hood
      hull(){
        // base ring
        translate([0,0,12-0.1+7])
        cylinder(r=50,h=3,$fn=F2);
        
        // wall side
        translate([-55,0,5+12])
        cube([4,50,10],center=true);
        
        translate([-55,0,30])
        scale([1,1,0.6])
        rotate([0,90,0])
        cylinder(r=18,h=4,center=true,$fn=F2);
        
        // front hump
        translate([-8,0,38])
        scale([1,1,0.5])
        sphere(r=24,$fn=F2);
        // back hump
        translate([-20,0,38])
        scale([1,1,0.5])
        sphere(r=24,$fn=F2);
      }      
      
      // wall connection
      hull(){
        translate([0,0,12-0.1])
        cylinder(r=50,h=7,$fn=F2);
        
        translate([-55,0,12-0.1+3.5])
        cube([4,50,7],center=true);
      }
      
      // tab
      hull(){
        translate([-55,30,40])
        rotate([0,90,0])
        cylinder(r=5,h=4,center=true,$fn=F2);
        
        translate([-55,-30,40])
        rotate([0,90,0])
        cylinder(r=5,h=4,center=true,$fn=F2);
        
        translate([-55+0,0,12-0.1+2])
        cube([4,50,4],center=true);
      }

    }  // end of union
                  
    // hood
    hull(){
      // base ring
      translate([0,0,12-0.1+7])
      cylinder(r=50-3,h=3,$fn=F2);
      
      // wall side
      translate([-55+4,0,5+12+4])
      cube([4,50-4,10-6],center=true);

      translate([-55+4,0,30])
      scale([1,1,0.6])
      rotate([0,90,0])
      cylinder(r=18,h=4,center=true,$fn=F2);
      
      // front hump
      translate([-8,0,38])
      scale([1,1,0.5])
      sphere(r=22,$fn=F2);
      // back hump
      translate([-20,0,38])
      scale([1,1,0.5])
      sphere(r=22,$fn=F2);
    }      

    // version number
    translate([-53.6,24,38])
    rotate([0,90,0])
    rotate([0,0,90])
    linear_extrude(height=0.605)
    text(Version, font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
    
    // camera ID
    translate([-53.6,-24,38])
    rotate([0,90,0])
    rotate([0,0,90])
    linear_extrude(height=0.605)
    text(CamID, font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
    
    // cut mounting holes in the tab
    translate([-55,30,40])
    rotate([0,90,0])
    cylinder(r=2,h=6,center=true,$fn=F2);

    translate([-55,-30,40])
    rotate([0,90,0])
    cylinder(r=2,h=6,center=true,$fn=F2);

    // ventilation cuts into the tab
    translate([-56.1,0,30])
    cube([3.5,20,60],center=true);
    
    translate([-56.1,0,35])
    cube([10,0.7,10],center=true);
    translate([-56.1,8,35])
    cube([10,0.7,8],center=true);
    translate([-56.1,-8,35])
    cube([10,0.7,8],center=true);

    // ac cord for usb block
    translate([-50,0,20])
    rotate([0,25,0])
    cylinder(r=2.5,h=25,center=true,$fn=F2);

    // cut for arm4
    translate([0,0,12-0.1])
    rotate([0,0,90])
    metric_thread (diameter=nRing*mod+20+1, pitch=3, length=6, internal=false, n_starts=1,
                thread_size=-1, groove=false, square=false, rectangle=0,
                angle=30, taper=0, leadin=2, leadfac=1.0, test=false);
    

    // lip so arm4 stops screwing in at some point
    translate([0,0,12-0.1])
    cylinder(r=40,h=20,center=true,$fn=F2);

    // cut to make a rain lip, base ring is 50 rad
    translate([0,0,13])
    difference(){
      cylinder(r1=49.5,r2=46.5,h=6,center=true,$fn=F2);
      cylinder(r1=43.5,r2=46.5,h=6.1,center=true,$fn=F2);
    }

  }
    
  word = ["O","U","T","P","O","S","T"];
  for(i=[0:6])
  rotate([0,0,10*(i-3)])
  translate([49.5,0,17])
  rotate([0,90,0])
  rotate([0,0,90])
  linear_extrude(height=0.8)
  text(word[i], font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
    
        
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

}

//----------------------------------------------------------------------------------------------------
module camera(){
  
    translate([xTilt,yTilt,zTilt])
    rotate([0,0,twist-90-45])
    translate([-24,-13.25,-37])
    rotate([0,90,0]){
      camHolderB();
    }
    
    xCam=0;
    el=-45;
    zPcb=6;
    translate([xTilt,yTilt,zTilt])
    //~ rotate([0,0,twist-90-45])
    rotate([0,0,twist-90])
    translate([-24,-13.25,-35])
    rotate([0,90,0]){

    // rotation for elevation:
    translate([xCam,0,0])
    rotate([0,-el,0])
    translate([-xCam,0,0]){
      camHolderA();
      if(showCam==1){
        // camera module 3
        color("silver")
        translate([0,0,zPcb])
        rotate([0,180,0])
        rotate([0,0,-90])
        cameraV3();
      }
    } // end of rotate for elevation
  }
}

//----------------------------------------------------------------------------------------------------
module shellA(){

  difference(){
    shell();
    
    union(){
      translate([0,0,-zShell-10])
      cylinder(r=35+0.15,h=15+0.15,$fn=F2);

      rotate([0,0,45])
      translate([0,25,-zShell])
      cube([34+0.3,30,20+0.15],center=true);
    }
  }

}

//----------------------------------------------------------------------------------------------------
module shellB(){

  difference(){
    intersection(){
      shell();
      
      union(){
        translate([0,0,-zShell-10])
        cylinder(r=35,h=20,$fn=F2);
        
        // glass support
        rotate([0,0,45])
        translate([0,25,-zShell])
        cube([34,30,20],center=true);

      }
    }

    // trim excess ribs
    rotate([0,0,45])
    translate([0,-10,-zShell+10])
    cube([80,70,10],center=true);
  }
}

//----------------------------------------------------------------------------------------------------
module shell(){

  difference(){
    // outer shell
    translate([0,0,-zShell-thick])
    cylinder(r1=35+thick-0.5,r2=35+thick,h=zShell-3.25+thick,$fn=F2);
    
    // inner cut less window area
    difference(){
      translate([0,0,-zShell+0.8])
      cylinder(r1=35,r2=35,h=zShell-10-0.8,$fn=F2);
      
      translate([-rGlass-5,rGlass+5,-zShell+34])
      rotate([0,0,-45])
      cube([20,100,100],center=true);
    }    
    
    // version number near glass shellA part
    rotate([0,0,45])
    translate([0,rGlass+6.5,-zShell+78])
    rotate([0,0,180])
    rotate([-90,0,0])
    linear_extrude(height=0.605)
    text(Version, font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);

    // version number in shellB part
    rotate([0,0,45])
    translate([0,0,-zShell+0.5])
    rotate([0,0,0])
    rotate([0,0,0])
    linear_extrude(height=0.605)
    text(Version, font = "Open Sans:style=Bold", size=12,halign="center",valign="center",spacing=1.1);

    // bevel and thicker at top
    translate([0,0,-10.1])
    cylinder(r1=35,r2=34,h=2.2,$fn=F2);
    translate([0,0,-8.1])
    cylinder(r1=34,r2=34,h=5.2,$fn=F2);

    // glass cut
    translate([-rGlass,rGlass,-zShell+38-2])
    rotate([0,0,-45])
    rotate([0,90,0])
    cube([76+4,25+0.6,1.2+0.3],center=true);
    
    // extra glass cut
    translate([-rGlass,rGlass,-zShell+75])
    rotate([0,0,-45])
    rotate([0,90,0])
    cube([8,25+0.6,2],center=true);
    
    // window cut
    translate([-rGlass+2.5,rGlass-2.5,-zShell+38])
    rotate([0,0,-45])
    rotate([0,-90,0])
    linear_extrude(height=15,scale=[1.4,1.8])
    offset(r=1,$fn=F2)
    square([62,16],center=true);
    
    // ventilation cut
    intersection(){
      rotate([0,0,ventAngle])
      translate([0,-32-1,-zShell])
      cube([40,10,12],center=true);
      // outer shell
      difference(){
        translate([0,0,-zShell-thick])
        cylinder(r=33+0.7,h=zShell-3.25+thick,$fn=F2);
        translate([0,0,-zShell-thick])
        cylinder(r=33,h=zShell-3.25+thick,$fn=F2);
      }
    }        
  }
  // ribs
  for(i=[10,-100,70,-170, -45])
  rotate([0,0,i])
  translate([35,0,-zShell-1.5])
  scale([1,2,1])
  cylinder(r=1.0,h=zShell-2-4,$fn=33);
  
  // vent block
  difference(){
    intersection(){
      rotate([0,0,ventAngle])
      translate([0,-32,-zShell])
      cube([60,10,10],center=true);
      // outer shell
      difference(){
        translate([0,0,-zShell-thick])
        cylinder(r=35+thick-0.5,h=zShell-3.25+thick,$fn=F2);
        translate([0,0,-zShell-thick])
        cylinder(r=32,h=zShell-3.25+thick,$fn=F2);
      }
    }
    // cut
    intersection(){
      rotate([0,0,ventAngle])
      translate([0,-32-1,-zShell])
      cube([40,10,12],center=true);
      // outer shell
      difference(){
        translate([0,0,-zShell-thick])
        cylinder(r=33+0.7,h=zShell-3.25+thick,$fn=F2);
        translate([0,0,-zShell-thick])
        cylinder(r=33,h=zShell-3.25+thick,$fn=F2);
      }
    }
  }
  
  // twist lock
  for(i=[0:2]){
    rotate([0,0,i*120+lockAngle])
    translate([32,0,-5.0])
    rotate([0,90,0])
    cylinder(r1=0.25,r2=1.75,h=2,$fn=F2);
  }

  // Camera ID near glass shellA part
  rotate([0,0,45])
  translate([0,36,-18])
  rotate([0,180,0])
  rotate([-90,0,0])
  linear_extrude(height=0.7)
  text(CamID, font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);


  // glass, 20 mm of frost on one end
  if(showGlass==1){
    translate([-rGlass,rGlass,-zShell+38])
    rotate([0,0,-45])
    rotate([0,90,0])
    #cube([76,25,1.2],center=true);
  }

}

//----------------------------------------------------------------------------------------------------
module chassisA(){

  difference(){
    chassis();
    rotate([0,0,45])
    translate([-8,-12,-34])
    cube([14+0.4,18+0.4,10+0.4],center=true);
  }
  
}

//----------------------------------------------------------------------------------------------------
module chassisB(){

  intersection(){
    chassis();
    rotate([0,0,45])
    translate([-8,-12,-34])
    cube([14,18,10],center=true);
  }
}

//----------------------------------------------------------------------------------------------------
module chassis(){

    // non-pi side
    translate([0,0,0])
    rotate([0,0,twist])
    translate([26,0,-26])
    cube([4,35,10],center=true);

    // pi side
    translate([0,0,0])
    rotate([0,0,twist])
    translate([-16,0,-26])
    cube([8,35,10],center=true);
    
    translate([0,0,0])
    rotate([0,0,45])
    translate([-20,-15,-89])
    rotate([0,-90,0])
    pi0pegs(one=0,two=0);
    
    // pan servo mount
    translate([offX2,offY2,zPan])
    rotate([0,0,0])
    rotate([0,0,twist])
    servoGearMount(bolt=0);

    // tilt servo mount
    translate([xTilt,yTilt,zTilt])
    rotate([0,0,twist])
    rotate([180,0,0])
    servoGearMount(bolt=0);
    
    // Tab pi side
    difference(){
      hull(){
        rotate([0,0,twist])
        translate([0,17,-26])
        cube([8,1,10],center=true);

        rotate([0,0,twist])
        translate([0,24,-26])
        cylinder(r=3,h=10,center=true,$fn=F2);
      }
      rotate([0,0,twist])
      translate([0,24,-16])
      cylinder(r=2+0.15,h=40,center=true,$fn=6);
    }
    rotate([0,0,twist])
    translate([4,18,-26])
    cube([48,2,10],center=true);

    // Tab back side
    difference(){
      hull(){
        translate([0,0,0])
        rotate([0,0,twist])
        translate([4,-18,-26])
        cube([48,1,10],center=true);

        translate([0,0,0])
        rotate([0,0,twist])
        translate([0,-32,-26])
        cube([18,1,10],center=true);
      }
      rail(tol=0.2);
    }
}

//----------------------------------------------------------------------------------------------------
module rail2(tol=0){

      rotate([0,0,twist])
      translate([0,24,-16])
      cylinder(r=2,h=30,center=true,$fn=6);
}

//----------------------------------------------------------------------------------------------------
module rail(tol=0){

      // main rail
      rotate([0,0,twist])
      translate([0,-27,-37])
      cube([16+tol,4+tol,70+tol],center=true);

      rotate([0,0,twist])
      translate([5,-29,-37])
      cube([2+tol,4+tol,70+tol],center=true);
      rotate([0,0,twist])
      translate([-5,-29,-37])
      cube([2+tol,4+tol,70+tol],center=true);


      // spacer between panPost and chassis
      rotate([0,0,twist])
      translate([0,-27-2,-14.5])
      cube([16+tol,6+tol,13+tol],center=true);

}


//======================================================================

Design=0;

// Design List:
// parts are aligned for assembly, duplicates are shown
if(Design==1){
  
//~ intersection(){
difference(){


union(){

  // usb power block
  if(showUsb==1){
    //~ translate([-30,0,20])    
    //~ rotate([0,0,0])
    //~ rotate([0,0,0])
    //~ usbPower(plug=1);
    translate([-14,0,28])    
    cube([28.3,35,19],center=true);
  }


  //~ translate([0,0,1.5])
  //~ arm();
  
  //~ translate([0,0,1.5])
  //~ arm2();
  //~ translate([0,0,-5.0])
  //~ arm3();

  //~ translate([0,0,1.5])
  //~ arm4();

  //~ translate([0,0,-5.0])
  //~ arm5();

  //~ translate([0,0,-0.1])
  //~ panLock();

  // rotation for pan ------------
  rotate([0,0,panAngle])
  translate([0,0,0]){

  //~ panPost(bearing=0);
  //~ panServo();
  //~ tiltServo();

  //~ translate([0,0,2])
  //~ camera();
  //~ translate([0,0,2])
  //~ camHolderC();
  
  //~ chassis();
  //~ rail();
  //~ rail2();
    
  //~ shell();

  //~ shellA();
  shellB();

  if(showPi==1){
    translate([0,0,0])
    rotate([0,0,45])
    translate([-22,-15,-89])
    rotate([0,-90,0])
    pi0();
  }
      
} // end of pan -----------------

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
  //~ rotate([0,0,-45])
  //~ translate([0,-100,0])
  //~ cube([240,200,300],center=true);

  // cut across rotational axis
  rotate([0,0,-45+180])
  translate([0,-100,0])
  cube([240,200,300],center=true);

} // end diff or intersection

} // end of design list

//==================================================================
// Printing List:
// parts are not aligned for assembly
if(Design==0){
  
//~ camHolderA();
//~ camHolderB();
//~ camHolderC();
//~ servoGearA();
//~ servoGearB();
//~ servoGearC();
//~ servoGearD();
//~ servoSpline();
//~ servoSpline2();
//~ servoShaft();
//~ servoShaft2();
//~ panPost(bearing=0);
//~ panIdler();
//~ panLock();

//~ arm4(bearing=0);
//~ arm5();

//~ chassisA();
//~ chassisB();

//~ rail();
//~ rail2();

shellA();
//~ shellB();


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
