//=================================================================================
// birdcam.scad
//
// Bird camera redux
//
// Dr Tom Flint, 9 Dec 2024
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>

zRoof = 400;    // height of the roof

xSmall = 10;      // offset from back plate
zSmall = 200;     // height of small shelf

xBig = 60;   // offset from back plate
zBig = 0;     // height of small shelf

//-----------------------------------------------------------------------------------
module cable1(){
 
  difference(){
    translate([0,0,10])
    cube([15,15,20],center=true);
    metric_thread (diameter=12.3, pitch=6.3, length=20, thread_size=3, groove=true);
  }
}

//-----------------------------------------------------------------------------------
module cable2(){

  difference(){
    cable1();
    translate([20,0,-1])
    cube([40,40,60], center=true);
    
    cylinder(r=5.2,h=60,center=true,$fn=89);
  }
}

//-----------------------------------------------------------------------------------
module box1(){

  // small mat
  translate([150/2+xSmall,0,zSmall+1/2])
  cube([150,180,1],center=true);

  // big mat
  translate([220/2+xBig,0,zBig+1/2])
  cube([220,250,1],center=true);
  
  // back plate
  translate([-0.5,0,zBig+zRoof/2])
  cube([1,250,zRoof],center=true);
  
  // left plate
  translate([0,-250/2,0])
  rotate([0,0,60])
  translate([-0.5,-200/2,zBig+zRoof/2])
  cube([1,200,zRoof],center=true);
  
  // right plate
  translate([0,250/2,0])
  rotate([0,0,-60])
  translate([-0.5,200/2,zBig+zRoof/2])
  cube([1,200,zRoof],center=true);
  

}

//======================================================================================

box1();  

//======================================================================================

