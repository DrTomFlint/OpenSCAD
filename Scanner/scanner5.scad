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

use <../Slewing/slew10.scad>
use <../Slewing/slew11.scad>
use <../Slewing/slew12.scad>
use <../Slewing/slew13.scad>
use <../Slewing/slew14.scad>
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


ElOn=0;     // elevation axis, ewheel
AzOn=1;     // azimuth axis, turntable
TableOn=0;  // rotational table, 0=off, 1=flat, 2=pillar, 3=modular
TableHigh=80;   // height of table pedistal

ShellOn=0;  // shell cover
Shell2On=0;  // shell cover
ShellFOn=0;
ShellROn=0;

LidOn=0;    // lid

TowerOn=0;  // towers
Tower4On=0;
BaseOn=1;   // base plate
Arm2On=0;    // camera arm
Az=0;       // azimuth angle -80 min, 0=flat back, 90=overhead, 180=front
CamOn=0;    // picamera

TowerHigh=104;  // adjusts hub height, 92 min
BearingsOn=0;   // show bearings in the towers
Tower2X=-110;   // offset for elevation and left tower
Tower3X=-110;   // offset for elevation and left tower

WheelOn=0;  // show the ewheel by itself

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


//--------------------------------------------------------------------
module baseplate(){
  
Ntabi=6;  
oid=50;         // outer race inner rad
ohi=15;         // outer race height
thick5=10;
  
  translate([0,0,-2])
  difference(){
    union(){
      hull(){
        // main disk
        translate([0,0,0])
        cylinder(r=96,h=thick5,$fn=222);

        // azimuth motor
        translate([132,18,0])
        cylinder(r=8,h=thick5,$fn=88);
        translate([132,-18,0])
        cylinder(r=8,h=thick5,$fn=88);


        // near tower3 for elevation axis
        translate([Tower2X+14,50,0])
        cylinder(r=8,h=thick5,$fn=88);
        translate([Tower2X+14,-50,0])
        cylinder(r=8,h=thick5,$fn=88);
        
      }

      // tower support
      //translate([94,0,10])
      //#cube([13,24,14],center=true);

    }

    // bolts between base and tower 3
    translate([-83,57,-50])
    cylinder(r=1.7,h=200,$fn=22);
    translate([-83,-57,-50])
    cylinder(r=1.7,h=200,$fn=22);
    
    // bolt holes for the slew10
    for(i=[0:7]){
      rotate([0,0,i*360/8+180/8]){
        color("gray")
        translate([0,82,-10])
        cylinder(r=1.7,h=20,$fn=F2);      
      }
    }

    // center recess
    translate([0,0,5])
    cylinder(r=88,h=10,$fn=F2);
       
    // bore hole
    translate([0,0,-1])
//    cylinder(r=58,h=25,$fn=F2,center=true);
    cylinder(r=58,h=25,$fn=F2,center=true);
    
    // additional cuts for material reduction   **************************************************************
    if(1){
    Ncut=16;
    for (i=[0:Ncut-1]){
      rotate([0,0,i*360/Ncut+180/Ncut])
      translate([75,0,0])
      cylinder(r=11,h=40,center=true,$fn=99);
    }
  }
    
    // rounding on azimuth mount
    translate([138,-52/2,-1])
    rotate([0,0,90])
    rounder(r=4,h=11,f=88);
    translate([138,52/2,-1])
    rotate([0,0,180])
    rounder(r=4,h=11,f=88);

  // azimuth motor
  color("green")
  translate([-ax1,ay1,-42.5-4])  
  rotate([0,0,180])
  xymotor(tol=0.15);

  translate([-ax1,ay1,10])
  cylinder(r=12,h=20,center=true);

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
  translate([-ax1-31/2,ay1+31/2,6.1])
  cylinder(r=3,h=10,$fn=22);
  translate([-ax1-31/2,ay1-31/2,6.1])
  cylinder(r=3,h=10,$fn=22);
  translate([-ax1+31/2,ay1+31/2,6.1])
  cylinder(r=3,h=4,$fn=22);
  translate([-ax1+31/2,ay1-31/2,6.1])
  cylinder(r=3,h=4,$fn=22);

  // extra holes for different swing arm mounts
  if(1){
    translate([-ax1-31/2-5,ay1+30,-10])
    cylinder(r=1.7,h=30,$fn=12);
    translate([-ax1-31/2+10,ay1+28,-10])
    cylinder(r=1.7,h=30,$fn=12);
    translate([-ax1-31/2-5,-ay1-30,-10])
    cylinder(r=1.7,h=30,$fn=12);
    translate([-ax1-31/2+10,-ay1-28,-10])
    cylinder(r=1.7,h=30,$fn=12);
  }

  // locking pin for swing arm
  if(1){
    for(i=[-1:2]){
      translate([-ax1+i*4,ay1-31/2-5-i*4,-1])
      cylinder(r=1,h=42,$fn=12);
      translate([-ax1+i*4-4,ay1-31/2-5-i*4,-1])
      cylinder(r=1,h=42,$fn=12);
      translate([-ax1+i*4-8,ay1-31/2-5-i*4,-1])
      cylinder(r=1,h=42,$fn=12);
    }
  }

/*
  // cuts for elevation motor bolt holes?
  translate([-90,y1+31/2,-23.5+31/2])  
  rotate([0,-90,0])
  #cylinder(r=1.7,h=10,$fn=12);
  translate([-90,y1-31/2,-23.5+31/2])  
  rotate([0,-90,0])
  #cylinder(r=1.7,h=10,$fn=12);
  translate([-90,y1-31/2,-23.5-31/2])  
  rotate([0,-90,0])
  #cylinder(r=1.7,h=10,$fn=12);
  translate([-90,y1+31/2,-23.5-31/2])  
  rotate([0,-90,0])
  #cylinder(r=1.7,h=10,$fn=12);
*/
        
  // shell
  translate([0,0,16])
  shell(tol=0.2);
  // shell2
  translate([0,0,16])
  shell2(tol=0.2);

  // towers 
  translate([0,0,5]){
    //tower3(tol=0.15);   
    tower4(tol=0.15); 
    mirror([1,0,0])
    tower5(tol=0.15);
  }    
    

}

  
}

//--------------------------------------------------------------------
module azimuth(){

  // Turntable
  color("green")
  rotate([0,0,180/8])
  rotate([180,0,0])
  slew10();
  

  // azimuth motor
  if(1){
    color("green")
    translate([-ax1,ay1,-60-4])
    rotate([0,0,90])
    xymotor();
  }    
  
  // azimuth pulley
  translate([-ax1,ay1,10]){
    color("green")
    rotate([180,0,0])
    pulley();
    

    color("green")
    rotate([180,0,0])
    translate([31/2,-31/2,2])
    rotate([0,0,125])
    swingarm2(length=50);
/*    
    translate([31/2,-31/2,2])
    swingcog(angle=0);
*/
    
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
  color("orange")
  translate([4,0,TowerHigh]) 
  rotate([0,90,0])
  rotate([0,0,30])
  rotate([180,0,0])
//  slew13();
  slew14();
      
  // elevation motor
  color("red")
  translate([54,y1,TowerHigh-z1])  
  rotate([0,-90,0])
  rotate([0,0,90])
  xymotor();


  // elevation pulley
  color("red")
  translate([1,y1,TowerHigh-z1])  
  rotate([0,-90,0]){
    pulley();
    translate([-31/2,-31/2,2.5])
    rotate([0,0,-7])
    swingarm2(length=44);
    translate([-31/2,-31/2,2.5])
    translate([25,-25,0])
    swingcog(angle=180);
  }

  // elevation belt
  rbelt=114.08/2;
  color("gray")
  translate([-13,0,0])
  difference(convexity=6){
    hull(){
      // pulley
      translate([1,y1,TowerHigh-z1])  
      rotate([0,90,0])
      cylinder(r=9.6/2+1.5,h=7,$fn=F2);
      // ewheel
      translate([2,0,TowerHigh])  
      rotate([0,90,0])
      cylinder(r=rbelt+1.5,h=7,$fn=F2);
    }
    hull(){
      translate([0,y1,TowerHigh-z1])  
      rotate([0,90,0])
      cylinder(r=9.6/2,h=9,$fn=F2);
      translate([2,0,TowerHigh])  
      rotate([0,90,0])
      cylinder(r=rbelt,h=9,$fn=F2);
    }
  }
  
} // end elevation

//----------------------------------------------------------------
module scanner(){

  if(ElOn){
    translate([Tower3X,0,0])
    elevation();
  }

  // azimuth
  if(AzOn){
    azimuth();
  }
  
  if(TableOn){
    table(type=TableOn);
    riser1(hi=TableHigh);
  }
  
  // shell
  if(ShellOn){
    color("gray")
    shell();
  }
  if(Shell2On){
    color("lightgray")
    shell2();
  }
  if(ShellFOn){
    color("gray")
    shellF();
  }
  if(ShellROn){
    color("gray")
    shellR();
  }
  
  // arm2
  if(Arm2On){
    color("cyan")
    translate([0,0,TowerHigh])
    rotate([Az,0,0])
//    arm2();
    arm3();
  }
    
  // lid
  if(LidOn){
    translate([0,0,TowerHigh]){
 //     lid2();
      lid3();
    }
  }
  
  if(WheelOn){
    ewheel();
  }
    
  if(BaseOn){
    color("tan")
    translate([0,0,-16])
    baseplate();

  }
  
  // slice up the baseplate for multi-color print
  if(0){
    color("tan")
    difference(){
    //translate([0,0,-16])
    baseplate();

    translate([0,0,50])
    cube([300,300,100],center=true);
  }
  }
  if(0){
    color("blue")
    intersection(){
    //translate([0,0,-16])
    baseplate();

    translate([0,0,2.5])
    cube([300,300,5],center=true);
  }
  }
  if(0){
    color("red")
    intersection(){
    //translate([0,0,-16])
    baseplate();

    translate([0,0,50+5])
    cube([300,300,100],center=true);
  }
}
  
  if(TowerOn==1){
    mirror([1,0,0])
    tower5();
  }
  if(TowerOn==2){
    tower3();
  }
  if(TowerOn==3){
    tower3();
    mirror([1,0,0])
    tower5();
  }

  if(Tower4On){
    color("red")
    tower4();
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


