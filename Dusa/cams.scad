//======================================================================
// cams.scad
//
// Add cameras to Dusa printer
//
// DrTomFlint 27 July 2024
//======================================================================

use <../Parts/tslot.scad>
use <../Parts/cambase1.scad>
use <../Parts/camlid1.scad>
use <../Parts/cambracket1.scad>



//----------------------------------------------------------------------
module old_cam1(hi=150){

thick=6;
wide=27;
dent=1;
  
  difference(){  
    union(){
      translate([-thick/2+dent,0,hi/2])
      cube([thick,wide,hi],center=true);
      translate([-thick+dent,wide/2,hi/2])
      cylinder(r=thick,h=hi,$fn=22,center=true);
      translate([-thick+dent,-wide/2,hi/2])
      cylinder(r=thick,h=hi,$fn=22,center=true);

      hull(){
        translate([-thick+dent,wide/2,hi-thick/2])
        cylinder(r=thick,h=thick,$fn=22,center=true);
        translate([-thick+dent,-wide/2,hi-thick/2])
        cylinder(r=thick,h=thick,$fn=22,center=true);
      }
    }
    
    // left rail
    translate([30,-50,15])
    rotate([0,90,90])
    tslot1(type=2,len=100,tol=0.2);
    
    // cut for M5 bolt to tslot
    translate([0,0,15])
    rotate([0,90,0])
    cylinder(r=2.7,h=30,center=true,$fn=22);
    
    // cut for the camera bracket  
    translate([-thick,-0.5,hi+0])
    cylinder(r1=2,r2=2+0.5,h=30,center=true,$fn=22);

  }

}

//----------------------------------------------------------------------
module cam1(hi=150){

thick=3;
wide=27;
dent=-1;

  difference(){  
    union(){
      translate([+dent,0,hi/2])
      cube([thick,wide,hi],center=true);
      translate([-thick+dent,wide/2,hi/2])
      cube([3*thick,thick,hi],center=true);
      translate([-thick+dent,-wide/2,hi/2])
      cube([3*thick,thick,hi],center=true);
      translate([-thick+dent,0,hi-1.5*thick])
      cube([3*thick,wide,3*thick],center=true);

    }
    
    // left rail
    translate([30,-50,15])
    rotate([0,90,90])
    tslot1(type=2,len=100,tol=0.2);
    
    // cut for M5 bolt to tslot
    translate([0,0,15])
    rotate([0,90,0])
    cylinder(r=2.7,h=30,center=true,$fn=22);
    
    // cut for the camera bracket  
    translate([-1.5*thick,-0.5,hi+0])
    cylinder(r1=2,r2=2+0.5,h=30,center=true,$fn=22);

  }

}

//======================================================================

cam1();

if(0){
  translate([-thick/2,12,hi+20])
  rotate([0,0,-90])
  rotate([90,0,0]){
    cambase1();
    camlid1();
    cambracket1();
  }
}  

//======================================================================

