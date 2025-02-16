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
use <../Parts/rounder.scad>




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
//----------------------------------------------------------------------
module camMountDusa(){

thick=2.7;
wide=20;
hi=57;

  // top side
  difference(){
    translate([-27,-27,hi-4])
    cube([45,45,6]);
  
    camLoop();

    translate([18,18,hi-3])
    rotate([0,0,180])
    rounder(r=30,h=10,f=99);

    // azimuth swivel
    translate([0,0,hi-4])
    cylinder(r=6,h=10,$fn=99);

    // cut away rounded corner
    translate([-27,-27,hi-4])
    cylinder(r=25,h=10,$fn=99);

    // thin out area away from loop
    translate([-20,-20,hi-3-1.1])
    cube([45,45,4]);
  }
}

//----------------------------------------------------------------------
module camPostDusa(tol=0.15){

thick=2.7;
wide=20;
hi=57;

    // azimuth swivel
    translate([0,0,hi-2])
    cylinder(r=6-tol,h=6,$fn=99);
    // washer
    translate([0,0,hi-2])
    cylinder(r=12,h=2,$fn=99);

    translate([0,0,57])
    mirror([0,0,1]){
      translate([0,0,hi-2])
      cylinder(r=6-tol,h=6,$fn=99);
      translate([0,0,hi-2])
      cylinder(r=12,h=2,$fn=99);
    }

    // post
    translate([-3,-3,56/2])
    rotate([0,0,az])
    cube([4,20,56],center=true);
    
    // wings
    translate([-3,-3,56/2])
    rotate([0,0,az])
    cube([4,38,20],center=true);

    difference(){
      union(){
        // wings
        translate([-3,-3,56/2])
        rotate([0,0,az])
        translate([0,17.5,0])
        rotate([90,0,0])
        cylinder(r=10,h=3,center=true,$fn=77);

        translate([-3,-3,56/2])
        rotate([0,0,az])
        translate([0,-17.5,0])
        rotate([90,0,0])
        cylinder(r=10,h=3,center=true,$fn=77);
      }
      
      az=45;
      rotate([0,0,90+az])
      translate([-12.5,0,20])
      rotate([90,0,0]){
        cambase4(tol=0.15);
        //~ camlid1();
      }
      
    }

}

//----------------------------------------------------------------------
module camLoop(){

thick=2.7;
wide=20;
hi=57;

  translate([-25,-25,0]){
    cube([100,thick,hi]);
    cube([thick,100,hi]);
  }

}

//======================================================================

az=45;

//~ cam1();

//~ camLoop();

if(1){
  difference(){
    camPostDusa();

    rotate([0,0,az])
    translate([-12,0,56/2])
    cube([12,60,70],center=true);
    rotate([0,0,az])
    translate([12,0,56/2])
    cube([12,60,70],center=true);
  }  
}

  //~ camMountDusa();
  
  //~ translate([0,0,57])
  //~ mirror([0,0,1])
  //~ camMountDusa();
  
if(0){
  rotate([0,0,90+az])
  translate([-12.5,0,20])
  rotate([90,0,0]){
    cambase4();
    camlid1();
  }
}


//======================================================================

