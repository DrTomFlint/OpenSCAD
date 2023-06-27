//======================================================================
// Rewinder3.scad
//
// New version of the filament spool rewinder.
//
// DrTomFlint 26 June 2023
//
//======================================================================


use <../Parts/rounder.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>

wide=62;		// width of a spool
r0=100;     // radius of spool
wall=4.5;   // thickness of spool wall
bore=54.5/2;  // radius of bore hole

r1=15;        // radius of the main shaft
x1=90;        // length of main shaft

r2=50;        // radius of the flat end
x2=3;         // thickness of the flat

x3=26;         // thickness of the tower

xgear=8;     // thickness of the spur gear and rack

F2=66;

//----------------------------------------------------------------------
module spool(){

translate([-3.1,0,0])
rotate([0,-90,0])
difference(){
  union(){
    cylinder(r=r0,h=wall,$fn=F2);
    translate([0,0,wall])
    cylinder(r=bore+wall,h=wide-2*wall,$fn=F2);
    translate([0,0,wide-wall])
    cylinder(r=r0,h=wall,$fn=F2);
  }
  translate([0,0,-1])
  cylinder(r=bore,h=wide+2,$fn=F2);
}

}


//----------------------------------------------------------------------
module spur(){
      // clutch plate
      rotate([0,90,0])
      difference(){
        cylinder(r=44/2,h=4,$fn=99);
        cylinder(r=8/2,h=9,center=true,$fn=44);
      }
      
      translate([4,0,0])
      rotate([0,90,0])
      difference(){
        cylinder(r1=44/2,r2=28/2,h=1,$fn=99);
        cylinder(r=8/2,h=9,center=true,$fn=44);
      }

      // gear
      translate([5,0,0])
      rotate([0,90,0])
      spur_gear (modul=2, tooth_number=12, width=xgear, bore=8, pressure_angle=20, helix_angle=0, optimized=false);
}

//----------------------------------------------------------------------
module washer(){

  translate([5+xgear,0,0])
  rotate([0,90,0])
  difference(){
    cylinder(r2=44/2,r1=28/2,h=1,$fn=99);
    cylinder(r=8/2,h=9,center=true,$fn=44);
  }

  translate([5+xgear+1,0,0])
  rotate([0,90,0])
  difference(){
    cylinder(r=44/2,h=4,$fn=99);
    cylinder(r=8/2,h=9,center=true,$fn=44);
  }

}

//----------------------------------------------------------------------
module post(){

  // rack
  translate([5+0.3,-12,3])
  rotate([0,90,0])
  rack(modul=2, length=148, height=12, width=xgear-0.6, pressure_angle=20, helix_angle=0);
  
  // stop block on bottom
  translate([14,-20,-67])
  cube([xgear-0.6,8,8],center=true);

  // top post for washers as weight
  translate([9,-21.4,75])
  cylinder(r=3,h=40,$fn=6);  

}

//----------------------------------------------------------------------
module offside(){

  difference(){
    translate([-100,0,-3])
    cube([12,30,34],center=true);
    
    translate([-94.7,0,7.5])
    cube([5,24.4,20],center=true);
      
    translate([-94.7-5.5,0,7.5])
    cube([7,14.4,20],center=true);

    translate([-94.7-11,0,7.5])
    cube([5,24.4,20],center=true);
    
    // cut for box
    translate([-100,-4,-16])
    cube([3.5,80,16],center=true);
    
    // cut for lock pin
    translate([-100,-4,10.8])
    rotate([90,0,0])
    cylinder(r=1,h=50,center=true,$fn=22);
  }
}


//----------------------------------------------------------------------
module axle(){

difference(){
  union(){
    // axle
    translate([xgear+16,0,0])
    rotate([0,-90,0])
    cylinder(r=7.7/2,h=93.6+10+xgear+18,$fn=F2);  
    
    // threaded end
    translate([xgear+16,0,0])
    rotate([0,90,0])
    if(0){
      cylinder(r=7/2,h=10,$fn=F2);
    }else{
      metric_thread (diameter=7, pitch=1, length=12, internal=false, n_starts=1, thread_size=-1, groove=false, square=false, rectangle=0,angle=30, taper=0, leadin=1, leadfac=1.0, test=false);
    }

    // block end
    translate([-93.7,0,0])
    rotate([0,-90,0])
    cylinder(r=10/2,h=1,$fn=F2);  
    
    translate([-94.7-0.75,0,3.5])
    cube([3,24,12],center=true);
      
    translate([-94.7-5.5,0,3.5])
    cube([7,14,12],center=true);

    translate([-94.7-10.25,0,3.5])
    cube([3,24,12],center=true);

  }
  // cut a flat side for printing
  translate([-40,0,-15-2.5])
  cube([200,200,30],center=true);
}
    
    
}

//----------------------------------------------------------------------
module nut(){

  translate([26,0,0])
  rotate([0,90,0])
  difference(){
    union(){
      cylinder(r=10,h=6,$fn=44);
      translate([0,0,6])
      cylinder(r=16,h=3,$fn=44);
    }
    translate([0,0,-0.1])
    metric_thread (diameter=7+0.5, pitch=1, length=6.2+3, internal=true, n_starts=1, thread_size=-1, groove=false, square=false, rectangle=0,angle=30, taper=0, leadin=1, leadfac=1.0, test=false);
    
    for(i=[0:2]){
      rotate([0,0,i*120])
      translate([18,0,6])
      scale([1,1.4,1])
      cylinder(r=8,h=20,center=true);
    }
  }
  
}  

//----------------------------------------------------------------------
module bearing(tol=0){

  rotate([0,90,0])
  difference(){
    cylinder(r=22/2+tol/2,h=7+tol,$fn=F2,center=true);
    cylinder(r=8/2-tol/2,h=7+1,$fn=F2,center=true);
  }
}

//----------------------------------------------------------------------
module tower(){

x4=xgear+5.5;

  difference(){
    hull(){
      translate([x4,0,0])
      rotate([0,90,0])
      cylinder(r=10,h=x3,center=true,$fn=F2);
        
      translate([x4,6,-16])
      rotate([0,90,0])
      cylinder(r=4,h=x3,center=true,$fn=F2);
        
      translate([x4,-30,16])
      rotate([0,90,0])
      cylinder(r=4,h=x3,center=true,$fn=F2);

      translate([x4,-30,-16])
      rotate([0,90,0])
      cylinder(r=4,h=x3,center=true,$fn=F2);
    }

    // cut for axle
    translate([0,0,0])
    rotate([0,90,0])
    cylinder(r=8/2,h=x1,$fn=F2,center=true);  

    // cut for gear and washer
    translate([8.2,-4,0])
    cube([20,37,60],center=true);

    // cut for post
    translate([9.0,-4,0])
    cube([8.4,40.4,60],center=true);

    // cut for box
    translate([22.5,-4,-16])
    cube([3.5,80,16],center=true);

  }
  
}

//----------------------------------------------------------------------
// original spool holder with spring and collar removed
module old(){
  rotate([0,-90,0])
  difference(){
    union(){
      cylinder(r=100.5/2,h=3.1,$fn=55);
      translate([0,0,3.1])
      cylinder(r=30/2,h=90.5,$fn=55);
    }
  
    // cut for the axle
    translate([0,0,-0.1])
    cylinder(r=8/2,h=120,$fn=55);

    // cuts for the bearings
    translate([0,0,3.1+90.5-3])
    rotate([0,90,0])
    bearing(tol=0.15);  
    translate([0,0,3.1])
    rotate([0,90,0])
    bearing(tol=0.15);  
  }
  

}

//======================================================================

old();

//color("gray")
//spool();

//axle();
//offside();
nut();
//spur();
//washer();

//post();

//tower();

if(1){
  color("cyan")
  translate([-3.5,0,0])
  bearing(tol=0.15);  
  color("cyan")
  translate([-x1/2+7/2,0,0])
  bearing(tol=0.15);
}



//======================================================================

