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
use <../Slewing/slew11.scad>
use <../Slewing/slew12.scad>
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


ElOn=1;     // elevation axis, ewheel
AzOn=1;     // azimuth axis, turntable
ShellOn=0;  // shell cover
Shell2On=0;  // shell cover
LidOn=1;    // rear lid
TableOn=1;  // rotational table, 0=off, 1=flat, 2=pillar

BaseOn=1;   // base plate

TowerOn=3;  // towers
TowerHigh=104;  // adjusts hub height, 92 min
BearingsOn=0;   // show bearings in the towers
Tower2X=-110;   // offset for elevation and left tower

ArmOn=0;    // camera arm
Arm2On=1;    // camera arm
Az=0;       // azimuth angle -80 min, 0=flat back, 90=overhead, 180=front

WheelOn=0;  // show the ewheel by itself

F2=88;
F1=222;

// Compute:
  // azimuth motor
  rm=112;   // azimuth motor radius
  phi=180;
  phi2=phi+4.35;
  ax1=rm*cos(phi);  // azimuth motor
  ay1=rm*sin(phi);
  ax2=102.9*cos(phi2);  // idler
  ay2=102.9*sin(phi2);
  echo(AX1 = ax1);
  echo(AY1 = ay1);
  echo(AX2 = ax2);
  echo(AY2 = ay2);

  // elevation motor
  r2=143;
  theta=90;
  theta2=theta+4.35;
  y1=r2*cos(theta);
  z1=r2*sin(theta);
  y2=102.9*cos(theta2);
  z2=102.9*sin(theta2);


//--------------------------------------------------------------------
module baseplate(){
  
Ntabi=6;  
oid=50;         // outer race inner rad
ohi=15;         // outer race height

  
  difference(){
    union(){
      hull(){
        // main disk
        translate([0,0,0])
        cylinder(r=102,h=9,$fn=F2);

        // azimuth motor
        translate([130,18,0])
        cylinder(r=8,h=9,$fn=88);
        translate([130,-18,0])
        cylinder(r=8,h=9,$fn=88);

        // near tower2 for elevation axis
        translate([Tower2X-16,40,4.5])
        cylinder(r=8,h=9,$fn=88);
        translate([Tower2X-16,-40,4.5])
        cylinder(r=8,h=9,$fn=88);
      }
      
      // tower support
      translate([94,0,10])
      cube([13,20,14],center=true);

      // tower2 support
      translate([Tower2X-19,-78/2,8])
      cube([34,78,30]);

    }

    // bolt holes for the slew10
    for(i=[0:7]){
      rotate([0,0,i*360/8+180/8]){
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

  // locking pin for swing arm
  for(i=[1:7]){
    translate([-ax1-31/4,ay1-31/2-5-i*4+4,-1])
    cylinder(r=1,h=12,$fn=12);
    translate([-ax1-31/4-4,ay1-31/2-5-i*4+2,-1])
    cylinder(r=1,h=12,$fn=12);
  }
  
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
  translate([0,0,16])
  shell(tol=0.2);
  // shell2
  translate([0,0,16])
  shell2(tol=0.2);

  // towers 
  translate([0,0,5]){
    tower2in(tol=0.15);    
    tower2out(tol=0.15);    
    mirror([1,0,0])
    tower(tol=0.15);
  }    
    
  // added cut near tower2
  translate([Tower2X+6,0,5])
  cube([20,67,100],center=true);
  
  translate([Tower2X+15,100,38])
  rotate([90,0,0])
  rotate([0,0,180])
  rounder(r=20,h=200,f=88);
}

}

//--------------------------------------------------------------------
module azimuth(){

  // Turntable
  rotate([0,0,180/8])
  rotate([180,0,0])
  slew10();
  

  // azimuth motor
  if(1){
    color("green")
    translate([-ax1,ay1,-60])
    rotate([0,0,180])
    rotate([0,0,0])
    xymotor();
  }    
  
  // azimuth pulley
  translate([-ax1,ay1,10])
  rotate([180,0,0]){
    color("orange")
    pulley();
    swingarm(length=50,angle=-60);
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

//-------------------------------------------------------------------
module elevation(){

  // elevation wheel
  translate([6,0,TowerHigh]) 
  rotate([0,90,0])
  rotate([0,0,30])
  gwheel();
    
  // elevation motor
  color("red")
  translate([-59,y1,TowerHigh-z1])  
  rotate([0,90,0])
  rotate([0,0,90])
  xymotor();

  // elevation pulley
  color("cyan")
  translate([14,y1,TowerHigh-z1])  
  rotate([0,-90,0]){
    pulley();
    rotate([0,0,180])
    swingarm(length=40,angle=-30);
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
      cylinder(r=101.35/2+1.5,h=7,$fn=F2);
    }
    hull(){
      translate([0,y1,TowerHigh-z1])  
      rotate([0,90,0])
      cylinder(r=9.6/2,h=9,$fn=F2);
      translate([2,0,TowerHigh])  
      rotate([0,90,0])
      cylinder(r=101.35/2,h=9,$fn=F2);
    }
  }
  
} // end elevation
//---------------------------------------------------------------------
module shell(tol=0){

  translate([0,0,-10]){
    difference(){
      // hollow cylinder
      cylinder(r=92+tol/2,h=TowerHigh+10+tol,$fn=F1);
      translate([0,0,-1])
      cylinder(r=91-tol/2,h=TowerHigh+12+tol,$fn=F1);
      
      // cuts for the towers
      translate([0,0,10])
      tower2in(tol=0.2,holes=0);
      translate([0,0,10])
      tower2out(tol=0.2,holes=0);
      
      mirror([1,0,0])
      translate([0,0,10])
      tower(tol=0.2,holes=0);
      
      // cut for belt and idler 
      
    }
  }

} // end shell  
//--------------------------------------------------------------------
module shell2(tol=0){
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

z8=-10;
hi8=22;
thick8=1;

difference(){
  hull(){
  // corners of the shell
    translate([-ax1+31/2,ay1+31/2,z8])
    cylinder(r=9+tol,h=hi8,$fn=88);
    translate([-ax1-31/2-10,ay1+31/2+30,z8])
    cylinder(r=11+tol,h=hi8,$fn=88);
    translate([-ax1-31/2-10,ay1-31/2-30,z8])
    cylinder(r=11+tol,h=hi8,$fn=88);
    translate([-ax1+31/2,ay1-31/2,z8])
    cylinder(r=9+tol,h=hi8,$fn=88);
  }
  translate([0,0,-0.01])
  hull(){
    translate([-ax1+31/2,ay1+31/2,z8])
    cylinder(r=9-thick8-tol,h=hi8-thick8,$fn=88);
    translate([-ax1-31/2-10,ay1+31/2+30,z8])
    cylinder(r=11-thick8-tol,h=hi8-thick8,$fn=88);
    translate([-ax1-31/2-10,ay1-31/2-30,z8])
    cylinder(r=11-thick8-tol,h=hi8-thick8,$fn=88);
    translate([-ax1+31/2,ay1-31/2,z8])
    cylinder(r=9-thick8-tol,h=hi8-thick8,$fn=88);
  }
  // cut for the main shell
  translate([0,0,-20])
  cylinder(r=92+tol/2,h=TowerHigh+10+tol,$fn=F1);
  // cut for the tower
  translate([0,0,-20])
  mirror([1,0,0])
  tower(tol=0.2);

}

}


//----------------------------------------------------------------
module scanner(){

  if(ElOn){
    translate([Tower2X,0,0])
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
  if(Shell2On){
    shell2();
  }
  
  // arm2
  if(Arm2On){
    translate([0,0,TowerHigh])
    rotate([Az,0,0])
    arm2();
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
    translate([0,0,-16])
    baseplate();
  }
  
  if(TowerOn==1){
    mirror([1,0,0])
    tower();
  }
  if(TowerOn==2){
    tower2out();
    tower2in();
  }
  if(TowerOn==3){
    tower2out();
    tower2in();
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


