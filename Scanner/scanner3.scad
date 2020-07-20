// scanner1.scad
// Design for a 3D scanner using photogrammetry.
// Slewing bearing used as a turntable, azimuth.
// Camera mounted on circular arm to gain different views, elevation.
// Will want to estimate the radius from the center of the sphere, radius.
// So this is spherical co-ordinates for the volume to be scanned.
// A LED strip mounts on the camera arm to provide light from different
// directions, intensity, and color.
// Elevation and azimuth driven axis use stepper motors 0.9 deg driven
// from expansion board 3HC off the Duet 3 main controller on Dusa.
// Use gates tooth GT2 continuous belts and 16 tooth pulley.

use <../Slewing/slew10.scad>
use <../Parts/motors.scad>
use <../Parts/bearings1.scad>
use <../Parts/timing2.scad>
use <../Parts/timing3.scad>
use <../Parts/rounder.scad>
use <../Fractals/Lsystem.scad>


ElOn=0;     // elevation axis, ewheel
AzOn=1;     // azimuth axis, turntable
ShellOn=0;  // shell cover
LidOn=0;    // rear lid
TableOn=0;  // rotational table, 0=off, 1=flat, 2=pillar

BaseOn=1;   // base plate

TowerOn=0;  // 0 = off, 1=left, 2=right, 3=both
TowerHigh=104;  // adjusts hub height, 92 min
BearingsOn=0;   // show bearings in the towers


ArmOn=0;    // camera arm
Az=-20;       // azimuth angle -80 min, 0=flat back, 90=overhead, 180=front

WheelOn=0;  // show the ewheel by itself

F2=88;
F1=222;

//--------------------------------------------------------------------
module baseplate(){
  
Ntabi=6;  
oid=50;         // outer race inner rad
ohi=15;         // outer race height

  
  difference(){
    union(){
      // main disk
      translate([0,0,0])
      cylinder(r=102,h=9,$fn=F2);
      // tower support
      translate([-94,0,10])
      cube([13,20,14],center=true);
      translate([94,0,10])
      cube([13,20,14],center=true);
      // azimuth motor
      translate([112,0,4.5])
      cube([52,52,9],center=true);
      // elevation motor
      translate([-94,0,-22])
      cube([8,46,46],center=true);
      
    }

    // bolt holes for the slew10
    for(i=[0:7]){
      rotate([0,0,i*360/8]){
        color("gray")
        translate([0,82,-10])
        cylinder(r=1.7,h=20,$fn=F2);      
      }
    }

    // center recess
    translate([0,0,3])
    cylinder(r=88,h=10,$fn=F2);
       
    // bore hole
    translate([0,0,-1])
    cylinder(r=58,h=15,$fn=F2);
    
    // rounding on azimuth mount
    translate([138,-52/2,-1])
    rotate([0,0,90])
    rounder(r=4,h=11,f=88);
    translate([138,52/2,-1])
    rotate([0,0,180])
    rounder(r=4,h=11,f=88);
    
  // azimuth motor
  rm=112;   // azimuth motor radius
  phi=180;
  phi2=phi+4.35;
  ax1=rm*cos(phi);
  ay1=rm*sin(phi);
  ax2=102.9*cos(phi2);
  ay2=102.9*sin(phi2);
  echo(AX1 = ax1);
  echo(AY1 = ay1);
  echo(AX2 = ax2);
  echo(AY2 = ay2);

  // azimuth motor
  color("green")
  translate([-ax1,ay1,-42.5])
  rotate([0,0,180])
  xymotor(tol=0.15);

  // M3 bolts for azimuth motor
  translate([-ax1+31/2,ay1+31/2,0])
  cylinder(r=1.7,h=10,$fn=12);
  translate([-ax1-31/2,ay1+31/2,0])
  cylinder(r=1.7,h=10,$fn=12);
  translate([-ax1-31/2,ay1-31/2,0])
  cylinder(r=1.7,h=10,$fn=12);
  translate([-ax1+31/2,ay1-31/2,0])
  cylinder(r=1.7,h=10,$fn=12);

  // clearance for heads
  translate([-ax1-31/2,ay1+31/2,9])
  cylinder(r=3,h=10,$fn=12);
  translate([-ax1-31/2,ay1-31/2,9])
  cylinder(r=3,h=10,$fn=12);

if(0){  
  // indent for the slew10
  translate([0,0,13.5])
  rotate([180,0,0])
  innerHi(tol=0.25);
  }

  // elevation motor
  r2=141;
  theta=90;
  theta2=theta+4.35;
  y1=r2*cos(theta);
  z1=r2*sin(theta);
  y2=102.9*cos(theta2);
  z2=102.9*sin(theta2);
  translate([-45,y1,-23.5])  
  rotate([0,-90,0])
  rotate([0,0,90])
  xymotor(tol=0.15);


  translate([-90,y1+31/2,-23.5+31/2])  
  rotate([0,-90,0])
  cylinder(r=1.7,h=10,$fn=12);
  translate([-90,y1-31/2,-23.5+31/2])  
  rotate([0,-90,0])
  cylinder(r=1.7,h=10,$fn=12);
  translate([-90,y1-31/2,-23.5-31/2])  
  rotate([0,-90,0])
  cylinder(r=1.7,h=10,$fn=12);
  translate([-90,y1+31/2,-23.5-31/2])  
  rotate([0,-90,0])
  cylinder(r=1.7,h=10,$fn=12);

        
  // shell
  shell(tol=0.2);

  // towers 
  tower(tol=0.15);    
  mirror([1,0,0])
  tower(tol=0.15);
    
  }  
}

//--------------------------------------------------------------------
module axle(){

  // ewheel engage
  cylinder(r=7,$fn=6,h=11);
  // thru the bearing
  translate([0,0,11])
  cylinder(r=7.8/2,h=8,$fn=F2);
  // arm engage
  translate([0,0,11+8])
  cylinder(r1=3.6,r2=3.5,h=4.5,$fn=6);
  
  // Add a fancy button top
  difference(){
    translate([0,0,-3])
    cylinder(r1=10,r2=12,h=2,$fn=F2);
    translate([0,0,-3.1])
    linear_extrude(height=1,convexity=6)
    scale([3.5,3.5])
    penrose_tiling(n=2, w=0.2);
  }
  translate([0,0,-1])
  cylinder(r1=12,r2=12,h=1,$fn=F2);
  
  
}

// ------------------------------------------------------------
module swingarm(tol=0){
thick=13;
z5=2;

  // zero is shaft of a servo
    color("pink")
    translate([31/2,31/2,z5])
    cylinder(r=5,h=thick,$fn=44);
    translate([31/2,-31/2,z5])
    cylinder(r=5,h=thick,$fn=44);

  rm=112;   // azimuth motor radius
  ri=40;    // idler swing arm length
  phi=180;    // main motor angle
  phi2=-60;     // angle of idler arm
  ax1=rm*cos(phi);
  ay1=rm*sin(phi);
  ax2=ri*cos(phi2);
  ay2=ri*sin(phi2);

  translate([-ax2,-ay2,z5])
   # cylinder(r=5,h=thick,$fn=44);    //****************************************************************
    
}
  
//--------------------------------------------------------------------
module azimuth(){
rm=112;   // azimuth motor radius
ri=40;    // idler swing arm length

  // Turntable
  rotate([180,0,0])
  slew10();
  
  phi=180;    // main motor angle
  phi2=-60;     // angle of idler arm
  ax1=rm*cos(phi);
  ay1=rm*sin(phi);
  ax2=ax1+ri*cos(phi2);
  ay2=ay1+ri*sin(phi2);
  echo(AX1 = ax1);
  echo(AY1 = ay1);
  echo(AX2 = ax2);
  echo(AY2 = ay2);

  // azimuth motor
  color("green")
//  translate([ax1,ay1,-56])
//  rotate([0,0,180])
//  rotate([0,0,0])
  translate([-ax1,ay1,-56])
  rotate([0,0,180])
  rotate([0,0,0])
  xymotor();
    
  // azimuth pulley
  color("orange")
  translate([-ax1,ay1,10])
  rotate([180,0,0]){
    //pulley();
    swingarm();
  }

if(1){  
  // azimuth idler
  color("green")
  translate([-ax2,ay2,5])
  rotate([180,0,0])
  idler();
}

  // azimuth belt
  if(1){
  color("gray")
  difference(convexity=6){
    hull(){
      translate([-ax1,ay1,-9+6])
      cylinder(r=9.6/2+1.5,h=7,$fn=F2);
      translate([0,0,-3.5])
      cylinder(r=152.2/2+1.5,h=7,$fn=F2);
    }
    hull(){
      translate([-ax1,ay1,-9+6-1])
      cylinder(r=9.6/2,h=9,$fn=F2);
      translate([0,0,-3.5])
      cylinder(r=152.2/2,h=9,$fn=F2);
    }
  }
  }
  
} // end azimuth

// --------------------------------------------------------------------
module table(type=1){
  
  // plain flat base
  color("gray")
  translate([0,0,11.5])
  cylinder(r=90,h=2,$fn=F2);
  
  // add the support pillar in the center
  if(type==2){
    color("gray")
    translate([0,0,11.5])
    cylinder(r=6,h=100-11.5-10,$fn=F2);
  }
  
}
//-------------------------------------------------------------------
module ewheel(){

Nspokes=7;

  // outer rim is GT2 pulley
  time3();

  difference(){
    union(){
      // hub for shaft
      translate([0,0,3])
      cylinder(r=12,h=6,$fn=F2);
      // fancy disk
      intersection(){
        translate([0,0,0])
        linear_extrude(height=6,convexity=10)
        scale([14,14])
        penrose_tiling(n=3, w=0.2);
        
        cylinder(r=60,h=20,center=true);
      }
    }
    // cut for the axle
    cylinder(r=7,$fn=6,h=20);  
  }
}
//-------------------------------------------------------------------
module fwheel(){


  // outer rim
  translate([0,0,3])
  difference(){
    cylinder(r=34,h=6,$fn=F2);
    cylinder(r=32,h=20,$fn=F2,center=true);
  }

  difference(){
    union(){
      // hub for shaft
      translate([0,0,3])
      cylinder(r=12,h=6,$fn=F2);
      // fancy disk
      intersection(){
        translate([0,0,4])
        linear_extrude(height=3,convexity=10)
        scale([12,12])
        penrose_tiling(n=2, w=0.2);
        
        cylinder(r=76,h=20,center=true);
      }
    }
    // cut for the axle
    cylinder(r=7,$fn=6,h=20);  
  }
}

//-------------------------------------------------------------------
module elevation(){

r2=141;

  // elevation wheel
  translate([0,0,TowerHigh])  
  rotate([0,90,0])
  ewheel();
  
  theta=90;
  theta2=theta+4.35;
  y1=r2*cos(theta);
  z1=r2*sin(theta);
  y2=102.9*cos(theta2);
  z2=102.9*sin(theta2);
  echo(EY1 = y1);
  echo(EZ1 = z1);
  echo(EY2 = y2);
  echo(EZ2 = z2);
  
  // elevation motor
  color("red")
//  translate([-58,y1,TowerHigh-z1])  
//  rotate([0,90,0])
//  rotate([0,0,90])
  translate([65,y1,TowerHigh-z1])  
  rotate([0,-90,0])
  rotate([0,0,90])
  xymotor();

  // elevation pulley
  color("cyan")
  translate([14,y1,TowerHigh-z1])  
  rotate([0,-90,0])
  pulley();

/*
  // elevation idler
  color("cyan")
  translate([0,y2,TowerHigh-z2])  
  rotate([0,90,0])
  idler();
*/

  // left axle
  translate([3,0,TowerHigh])  
  rotate([0,90,0])
  axle();

  // right axle
  translate([220,0,TowerHigh])  
  rotate([0,-90,0])
  axle();
  
  // fwheel
if(1){
  translate([209,0,TowerHigh])  
  rotate([0,90,0])
  fwheel();
}

  // elevation belt
  color("gray")
  difference(convexity=6){
    hull(){
      // pulley
      translate([1,y1,TowerHigh-z1])  
      rotate([0,90,0])
      cylinder(r=9.6/2+1.5,h=7,$fn=F2);
      // ewheel
      translate([2,0,TowerHigh])  
      rotate([0,90,0])
      cylinder(r=126.8/2+1.5,h=7,$fn=F2);
    }
    hull(){
      translate([0,y1,TowerHigh-z1])  
      rotate([0,90,0])
      cylinder(r=9.6/2,h=9,$fn=F2);
      translate([2,0,TowerHigh])  
      rotate([0,90,0])
      cylinder(r=126.8/2,h=9,$fn=F2);
    }
  }
  
} // end elevation
//---------------------------------------------------------------------
module shell(tol=0){

  // cylinder shell
  translate([0,0,6]){
    difference(){
      cylinder(r=92+tol/2,h=TowerHigh+6+tol,$fn=F2);
      translate([0,0,-1])
      cylinder(r=91-tol/2,h=112,$fn=F2);
    }
  }

} // end shell  
//--------------------------------------------------------------------
module zdrive(){

}

//---------------------------------------------------------------------
module tower(tol=0){

TowerLow=6;
TowerXoff=95;
TowerWide=14;

  difference(){
    union(){
      // left tower
      translate([-TowerXoff,-TowerWide/2,-TowerLow])
      cube([4+tol,TowerWide+tol,TowerHigh+TowerLow+tol]);
      // make I beams
      translate([-TowerXoff-3,-TowerWide/2,-TowerLow])
      cube([4+tol,3+tol,TowerHigh+TowerLow+tol]);
      translate([-TowerXoff-3,TowerWide/2,-TowerLow])
      cube([4+tol,3+tol,TowerHigh+TowerLow+tol]);
    
      // left bearing housing
      translate([-TowerXoff+5,0,TowerHigh])  
      rotate([0,-90,0])
      cylinder(r=12,h=8,$fn=F2);
      
      // left bearing light shield
      translate([-TowerXoff+2.5,0,TowerHigh])  
      rotate([0,-90,0])
      cylinder(r=16,h=4,$fn=F2);
      
      
    }
    // cut left bearing insert
    translate([-TowerXoff+2,0,TowerHigh])  
    rotate([0,-90,0])
    cylinder(r=11+0.15,h=9,$fn=F2);

    // cut left bearing shaft 
    translate([-TowerXoff+6,0,TowerHigh])  
    rotate([0,-90,0])
    cylinder(r=7,h=9,$fn=F2);
  }
  
} // end tower  

//---------------------------------------------------------------------
module dome(Rin=81,thick=1){
  
  difference(){
    sphere(r=Rin+thick,$fn=F1);
    sphere(r=Rin,$fn=F1);
    translate([0,0,-50])
    cube([200,200,100],center=true);    
  }
}

//-------------------------------------------------------------------
// 1 = back lid
// 2 = back lid + front lip
// 3 = front lid
// 4 = front lid + front lip

module lid(type=1){
  
  difference(){
    union(){
      // dome part
      difference(){
        dome(Rin=81,thick=1);
        rotate([-60,0,0])         // here is the cut angle
        translate([0,-100,50])    
        cube([200,200,100],center=true);    
        translate([0,-100,40])    
        cube([200,200,100],center=true);    
      }
      // overlapping lip
      color("green")
      translate([0,0,-2])
      difference(){
        cylinder(r=83,h=4,$fn=F1);
        translate([0,0,-1])
        cylinder(r=82,h=6,$fn=F1);
        translate([0,-97,40])
        cube([200,200,100],center=true);    
      }
      if(type==2){
        // add front lip
        color("orange")
        rotate([30,0,0])
        translate([0,0,-2])
        difference(){
          cylinder(r=83,h=4,$fn=F1);
          translate([0,0,-1])
          cylinder(r=82,h=6,$fn=F1);
          translate([0,-97,40])
          cube([200,200,100],center=true);    
        }
      }        
    } // end union
      
    // cuts for hinge spot
    translate([-90,0,0])
    rotate([0,90,0])
    cylinder(r=12.1,h=15,$fn=F2);

    // cuts for hinge spot
    translate([78,0,0])
    rotate([0,90,0])
    cylinder(r=12.1,h=15,$fn=F2);
  } 
}

//---------------------------------------------------------------
// assemble lid parts to make total top
module backlid(){
  union(){
    lid(type=1);
    rotate([30,0,0])
    lid(type=1);
    rotate([60,0,0])
    lid(type=1);
    
    rotate([90,0,0])
    lid(type=1);
    rotate([120,0,0])
    lid(type=1);
    rotate([150,0,0])
    lid(type=2);
  }
}
//-------------------------------------------------------------------
module arm(){
    
ra=88;

  difference(){
    union(){
      // main loop
      difference(){
        // boss
        cylinder(r=ra,h=12,$fn=F2, center=true);
        
        // cut to make a loop
        cylinder(r=ra-2,h=14,$fn=F2, center=true);
        
        // remove the front edge
        translate([0,-110,0])
        cube([160,160,40],center=true);
      }
      // reinforce at axles
      translate([-ra-1.5,0,0])  
      rotate([0,90,0])
      cylinder(r=12,h=3.5,$fn=F2);
      
      translate([ra+1.5,0,0])  
      rotate([0,-90,0])
      cylinder(r=12,h=3.5,$fn=F2);
      
    } // end union  

    // cut for the left axle  
    translate([-ra-1.5,0,0])  
    rotate([0,90,0])
    cylinder(r=3.6,h=6,$fn=6);

    // cut for the right axle  
    translate([ra+1.5,0,0])  
    rotate([0,90,0])
    cylinder(r=3.6,h=6,$fn=6);
  }
}

//----------------------------------------------------------------
module scanner(){

  if(ElOn){
    translate([-110,0,0])
    elevation();
  }

  // azimuth
  if(AzOn){
    azimuth();
  }
  
  if(TableOn){
    table(type=TableOn);
  }
  
  // shell
  if(ShellOn){
    shell();
  }
  
  // arm
  if(ArmOn){
    translate([0,0,TowerHigh])
    rotate([Az,0,0])
    arm();
  }
    
  // back lid
  if(LidOn){
    translate([0,0,TowerHigh]){
      backlid();
    }
  }
  
  if(WheelOn){
    ewheel();
  }
    
  if(BaseOn){
    translate([0,0,-13.5])
    baseplate();
  }
  if(TowerOn){
    tower();
    mirror([1,0,0])
    tower();
  }

  if(BearingsOn){
    // add left bearing
    color("red")
    translate([-81-9,0,TowerHigh])  
    rotate([0,-90,0])
    balls1(tol=0);
    
    // add right bearing
    color("red")
    translate([88+9,0,TowerHigh])  
    rotate([0,-90,0])
    balls1(tol=0);
  }  

}
//=================================================================

scanner();

//==================================================================


