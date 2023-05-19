//======================================================================
// Rewinder.scad
//
// New version of the filament spool rewinder.
//
// DrTomFlint 31 March 2023
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

x3=8;         // thickness of the tower

F2=66;

//----------------------------------------------------------------------
module spool(){

rotate([0,90,0])
translate([0,0,-wide/2])
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
module shaft(){

  difference(){
    union(){
      // barrel
      rotate([0,90,0])
      cylinder(r=r1,h=x1,$fn=F2,center=true);
      // flat end
      translate([x1/2-x2/2-10,0,0])
      rotate([0,90,0])
      cylinder(r=r2,h=x2,$fn=F2,center=true);
      // flat end bevel
      translate([x1/2-x2/2-x2-10,0,0])
      rotate([0,90,0])
      cylinder(r1=r1,r2=r1+x2,h=x2,$fn=F2,center=true);

      // collar for clutch action
      translate([x1/2-6,0,0])
      rotate([0,90,0])
      cylinder(r=18-0.2,h=8,$fn=F2,center=true);

      // thread for clutch action
      translate([x1/2-6,0,0])
      rotate([0,90,0])
      metric_thread (diameter=30, pitch=2, length=16, internal=false, n_starts=1, thread_size=-1, groove=false, square=false, rectangle=0,angle=30, taper=0, leadin=1, leadfac=1.0, test=false);
      //cylinder(r=15,h=16,$fn=F2);
    }
    
    // cut for bearings
    translate([x1/2-7/2+10,0,0])
    bearing(tol=0.15);  
    translate([-x1/2+7/2,0,0])
    bearing(tol=0.15);

    // cut for bearing clearance
//    translate([x1/2+10,0,0])
//    rotate([0,90,0])
//    cylinder(r=11+1,h=20,center=true,$fn=F2);  
    
    // cut for axle
    rotate([0,90,0])
    cylinder(r=7/2+0.5,h=x1+30,$fn=F2,center=true);  
    
    // locking cuts
    
    translate([x1/2+6,0,0])
    rotate([0,90,0])
    for(i=[0:7]){
      rotate([0,0,i*360/8])
      translate([14.5,0,0])
      cylinder(r=2,h=4,$fn=22);
    }

  }
}

//----------------------------------------------------------------------
module nut(){
  color("red")
  translate([x1/2+4,0,0])
  rotate([0,90,0])
  difference(){
    cylinder(r=26,h=11,$fn=12,center=true);
    //cylinder(r=15,h=16,$fn=F2,center=true);
    translate([0,0,-6])
    metric_thread (diameter=30, pitch=2, length=12, internal=true, n_starts=1, thread_size=-1, groove=false, square=false, rectangle=0,angle=30, taper=0, leadin=3, leadfac=1.0, test=false);
    
    // locking cuts
    for(i=[0:8]){
      rotate([0,0,i*360/9])
      translate([14.5,0,2])
      cylinder(r=2,h=4,$fn=22);
    }
  }
}

//----------------------------------------------------------------------
module spur(){
      translate([x1/2-10,0,0])
      rotate([0,90,0])
      spur_gear (modul=2, tooth_number=32, width=10, bore=35, pressure_angle=20, helix_angle=0, optimized=false);
}

//----------------------------------------------------------------------
module post(){

  //rack(modul=1, length=60, height=5, width=20, pressure_angle=20, helix_angle=0);
  color("gray")
  translate([x1/2-10,-32,3])
  rotate([0,90,0])
  rack(modul=2, length=148, height=10, width=10, pressure_angle=20, helix_angle=0);

}

//----------------------------------------------------------------------
module axle(){

    // axle
    translate([5,0,0])
    rotate([0,90,0])
    cylinder(r=7/2,h=x1+20+10,$fn=F2,center=true);  
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

  difference(){
    hull(){
      translate([x1/2+x3/2,0,0])
      rotate([0,90,0])
      cylinder(r=16,h=x3,center=true,$fn=F2);
        
      translate([x1/2+x3/2,-30,16])
      rotate([0,90,0])
      cylinder(r=4,h=x3,center=true,$fn=F2);

      translate([x1/2+x3/2,-30,-16])
      rotate([0,90,0])
      cylinder(r=4,h=x3,center=true,$fn=F2);
    }
    // cut for axle
    rotate([0,90,0])
    cylinder(r=7/2,h=x1+20,$fn=F2,center=true);  
  }
  
  // idler pins
  translate([x1/2-x3/2,-30,16])
  rotate([0,90,0])
  cylinder(r=4,h=x3,center=true,$fn=F2);

  translate([x1/2-x3/2,-30,-16])
  rotate([0,90,0])
  cylinder(r=4,h=x3,center=true,$fn=F2);
}

//======================================================================

//spool();
shaft();
//axle();
//spur();
nut();
//post();

//tower();

if(0){
  color("cyan")
  translate([x1/2-7/2+10,0,0])
  bearing(tol=0.15);  
  color("cyan")
  translate([-x1/2+7/2,0,0])
  bearing(tol=0.15);
}



//======================================================================

