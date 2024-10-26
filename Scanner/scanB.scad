//======================================================================
// scanB.scad
//
// Hack up scanner to make a turntable from the old spinner.
// Slew bearing copied from Slewing/slew10.scad
//
// scanner5.scad
// ** try new slew13 bearing with GT2 pulley on inner race.
//
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

//~ use <../Slewing/slew10.scad>
//~ use <../Slewing/slew11.scad>
//~ use <../Slewing/slew12.scad>
//~ use <../Slewing/slew13.scad>
use <../Slewing/slew14.scad>
use <./slewScanB.scad>
use <../Parts/motors.scad>
use <../Parts/bearings1.scad>
use <../Parts/timing2.scad>
use <../Parts/timing3.scad>
use <../Parts/rounder.scad>
use <../Fractals/Lsystem.scad>

use <./arm2.scad>
use <./lid.scad>
use <./table.scad>
use <./swingarm.scad>
use <./axle.scad>
use <./wheels.scad>
use <./towers.scad>
use <./shells.scad>


F2=88;
F1=222;

// Compute:
  // azimuth motor
  rm=112;   // azimuth motor radius
  phi=180;
//  phi2=phi+4.35;
  ax1=rm*cos(phi);  // azimuth motor
  ay1=rm*sin(phi);
//  ax2=102.9*cos(phi2);  // idler
//  ay2=102.9*sin(phi2);
  echo(AX1 = ax1);
  echo(AY1 = ay1);
//  echo(AX2 = ax2);
//  echo(AY2 = ay2);

  // elevation motor
  r2=143;
  theta=90;
  theta2=theta+4.35;
  y1=r2*cos(theta);
  z1=r2*sin(theta);
  y2=102.9*cos(theta2);
  z2=102.9*sin(theta2);

// from slewScanB:
ood=75;        // outer race outer rad
oid=50;         // outer race inner rad
ohi=15;         // outer race height

iooff=0.525;     // offset race in the boss

iogap=4;        // inner outer gap

Ntabo=8;      // number of bolt down tabs outer 
Ntabi=6;      // number of bolt down tabs inner
Ntab2=6;      // number of bolt down tabs outer race inner side 
Ntab3=8;      // number of bolt down tabs inner race outer side

//--------------------------------------------------------------------
module baseplate(){
  
Ntabi=6;  
oid=50;         // outer race inner rad
ohi=15;         // outer race height
thick5=3.5;
  
  translate([0,0,2])
  difference(){
    union(){
      // main disk
      translate([0,0,0])
      cylinder(r=58,h=thick5,$fn=222);
      hull(){
        // main disk
        intersection(){
          translate([0,0,0])
          cylinder(r=58,h=thick5,$fn=222);
          translate([-ax1/2-10,0,3.75])  
          cube([15,70,7.5],center=true);
        }

        // azimuth motor
        translate([138,18,0])
        cylinder(r=8,h=thick5,$fn=88);
        translate([138,-18,0])
        cylinder(r=8,h=thick5,$fn=88);

      }
    }
    
    // bore hole
    translate([0,0,-1])
    cylinder(r=50,h=25,$fn=F2,center=true);
    
    // additional cuts for material reduction   **************************************************************
    if(1){
    for (i=[-1:1]){
      rotate([0,0,i*15])
      translate([70,0,0])
      rotate([0,0,-i*15])
      scale([1.6,1,1])
      cylinder(r=7,h=40,center=true,$fn=99);
    }
  }
    
  // make motor mount slide to tension the belt:
  dxa=8;

  // cuts for feet
  rotate([0,0,60+10])
  translate([ax1/2+2,0,3.75])  
  cube([4+0.2,10+0.2,7.5],center=true);
  rotate([0,0,60-10])
  translate([ax1/2+2,0,3.75])  
  cube([4+0.2,10+0.2,7.5],center=true);

  rotate([0,0,-60+10])
  translate([ax1/2+2,0,3.75])  
  cube([4+0.2,10+0.2,7.5],center=true);
  rotate([0,0,-60-10])
  translate([ax1/2+2,0,3.75])  
  cube([4+0.2,10+0.2,7.5],center=true);

  // azimuth motor
  hull(){  
    translate([-ax1-dxa,ay1,1])
    cylinder(r=12,h=2.2,center=true);
    translate([-ax1+dxa,ay1,1])
    cylinder(r=12,h=2.2,center=true);
  }
  hull(){  
    translate([-ax1-dxa,ay1,1])
    cylinder(r=3,h=12,center=true);
    translate([-ax1+dxa,ay1,1])
    cylinder(r=3,h=12,center=true);
  }
  
  // M3 bolts for azimuth motor
  hull(){
    translate([-ax1+31/2-dxa,ay1+31/2,0])
    cylinder(r=1.7,h=10,$fn=12);
    translate([-ax1+31/2+dxa,ay1+31/2,0])
    cylinder(r=1.7,h=10,$fn=12);
  }
  hull(){
    translate([-ax1-31/2-dxa,ay1+31/2,0])
    cylinder(r=1.7,h=10,$fn=12);
    translate([-ax1-31/2+dxa,ay1+31/2,0])
    cylinder(r=1.7,h=10,$fn=12);
  }
  hull(){
    translate([-ax1-31/2-dxa,ay1-31/2,0])
    cylinder(r=1.7,h=10,$fn=12);
    translate([-ax1-31/2+dxa,ay1-31/2,0])
    cylinder(r=1.7,h=10,$fn=12);
  }
  hull(){
    translate([-ax1+31/2-dxa,ay1-31/2,0])
    cylinder(r=1.7,h=10,$fn=12);
    translate([-ax1+31/2+dxa,ay1-31/2,0])
    cylinder(r=1.7,h=10,$fn=12);
  }
  
}

    // inner tabs for bolting down  
    translate([0,0,-5.5])
      for(i=[0:Ntabi-1]){
        rotate([0,0,i*360/Ntabi+0]){
          color("gray")
          difference(){
            hull(){
              translate([0,oid,ohi/2])
              scale([1,1.5,1])
              cylinder(r=5,h=3.5,$fn=F1);      

              translate([0,oid+2,ohi/2])
              scale([3,1,1])
              cylinder(r=3,h=3.5,$fn=F1);      
            }
            translate([0,oid-4,ohi/2-4])
            cylinder(r=1.7,h=8.5,$fn=F1);
          }
        }
      }

  

}

//--------------------------------------------------------------------
module feet(ang=60){


  intersection(){
    difference(){
      // main disk
      translate([0,0,-50-20+4])
      cylinder(r=58,h=7.5+50-4,$fn=222);
      // bore hole
      translate([0,0,-71])
      cylinder(r=50,h=60,$fn=F2);
      rotate([0,0,ang])
      translate([ax1/2+6.5,0,-62])
      scale([1,2,1])  
      cylinder(r=5.5,h=44,$fn=F2);
    }
  
    rotate([0,0,ang])
    translate([ax1/2+2,0,-40+2+0.5])  {
    cube([12,30,47.5-1],center=true);
    }

  }


  // inserts for feet
  rotate([0,0,ang+10])
  translate([ax1/2+2,0,3.75-18])  
  cube([4,10,7.5],center=true);

  rotate([0,0,ang-10])
  translate([ax1/2+2,0,3.75-18])  
  cube([4,10,7.5],center=true);
  
}

//--------------------------------------------------------------------
module azimuth(){

  // Turntable
  color("green")
  rotate([0,0,0])
  rotate([180,0,0])
  slewB();
  

  // azimuth motor
  if(1){
    color("green")
    translate([-ax1,ay1,-60])
    rotate([0,0,90])
    xymotor();
  }    
  
  // azimuth pulley
  translate([-ax1,ay1,10]){
    color("green")
    rotate([180,0,0])
    pulley();
  }

  // azimuth belt
  if(1){
  color("gray")
  difference(){
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

//----------------------------------------------------------------
module scanner(){

AzOn=0;     // azimuth axis, turntable
TableOn=0;  // rotational table, 0=off, 1=flat, 2=pillar, 3=modular
TableHigh=80;   // height of table pedistal
FeetOn=1;
BaseOn=0;   // base plate

//~ intersection(){
  
  // azimuth
  if(AzOn){
    azimuth();
  }
  
  if(TableOn){
    table(type=TableOn);
    riser1(hi=TableHigh);
  }
  
      
  if(BaseOn){
    color("tan")
    translate([0,0,-16])
    baseplate();

  }
  
  if(FeetOn){
    //~ feet(60);
    //~ feet(-60);
    feet(0);
  }
  

//~ }

}
//=================================================================

scanner();

//==================================================================


