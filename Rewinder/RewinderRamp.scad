//======================================================================
// RewinderRamp.scad
//
// New version of the filament spool rewinder.
//
// DrTomFlint 26 June 2023
//
//======================================================================


use <../Parts/rounder.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>

// draft setting removes threads
draft=0;

// spool
wide=62;		// width of a spool
r0=100;     // radius of spool
wall=4.5;   // thickness of spool wall
bore=54.5/2;  // radius of bore hole

// main shaft
r1=15;        // radius of the main shaft
x1=95;        // length of main shaft
x1b=20;       // length of thread on shaft2
r2=8;         // radius of gear-shaft inserts

// taper nuts on main shaft
r3=20;        // radius of nut body
r4=40;        // radius of nut wings
r5=12;        // taper cut radius

// lock nut
r6=20;        // radius of nut body
r7=30;        // radius of wings

// spur gears
xroller=3;
rroller=11.5;
rlip=13.75;
xgear=6;

// rack beam
slope = 20;
//xrack = 148;
xrack = 120;

F1=201;
F2=66;


//----------------------------------------------------------------------
module spool(){

translate([wide/2,0,0])
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
// 4:21 to render if threads run entire length of shaft
module shaft(pos=0){

  translate([0,pos*cos(slope),-pos*sin(slope)])

  difference(){

    // threaded end
    translate([-x1/2,0,0])
    rotate([0,90,0])
    if(draft==1){
      cylinder(r=r1,h=x1,$fn=F2);
    }else{
      metric_thread (diameter=2*r1, pitch=2, length=x1, internal=false, n_starts=3, thread_size=-1, groove=false, square=false, rectangle=0,angle=30, taper=0, leadin=1, leadfac=1.0, test=false);
    }

    // cuts to insert gear ends
    translate([-x1/2-0.1,0,0])
    rotate([0,90,0])
    cylinder(r=r2,h=10.2,$fn=6);

    translate([x1/2+0.1,0,0])
    rotate([0,-90,0])
    cylinder(r=r2,h=10.2,$fn=6);
    
    // center cuts to allow an M3 bolt to strengthen attachment of spurs
    rotate([0,-90,0])
    cylinder(r=1.7,h=x1+20,$fn=22,center=true);
    
  }
    
    
}

//----------------------------------------------------------------------
module nut(){

//  translate([x1/2-15,0,0])
  translate([x1/2-25,0,0])
  rotate([0,90,0])
  difference(){
    cylinder(r=r4,h=14,$fn=99);
    
    translate([0,0,-1])
    rotate_extrude($fn=99)
    translate([r4+2,0,0])
    scale([1.8,1])
    circle(r=r5,$fn=88);
    
    // main bore
    translate([0,0,-0.1])
    if(draft==1){
      cylinder(r=r1+0.4, h=x1);
    }else{
      metric_thread (diameter=2*r1+0.4, pitch=2, length=x1, internal=true, n_starts=1, thread_size=-1, groove=false, square=false, rectangle=0,angle=30, taper=0, leadin=1, leadfac=1.0, test=false);
    }
    
// cuts for wings
    for(i=[0:4]){
      rotate([0,0,i*72])
      translate([r4,0,12])
      scale([1,1.4,1])
      cylinder(r=10,h=6,center=true,$fn=99);
    }
  }
  
}  

//----------------------------------------------------------------------
// make a locking nut
module nut2(){

  translate([x1/2-7,0,0])
  rotate([0,90,0])
  difference(){
    union(){
      cylinder(r1=r6,r2=r7,h=4,$fn=44);
      translate([0,0,4])
      cylinder(r=r7,h=2,$fn=44);
    }
    
    // main bore
    translate([0,0,-0.1])
    if(draft==1){
      cylinder(r=r1+0.4, h=x1);
    }else{
      metric_thread (diameter=2*r1+0.4, pitch=2, length=x1, internal=true, n_starts=1, thread_size=-1, groove=false, square=false, rectangle=0,angle=30, taper=0, leadin=1, leadfac=1.0, test=false);
    }
    
// cuts for wings
    for(i=[0:4]){
      rotate([0,0,i*72])
      translate([r4-10,0,6])
      scale([1,1.4,1])
      cylinder(r=10,h=16,center=true);
    }
  }
  
}  

//----------------------------------------------------------------------
module spur(pos=0){

  translate([0,pos*cos(slope),-pos*sin(slope)])
  
  difference(){
    union(){
      // insert into shaft
      translate([x1/2-xgear-2,0,0])
      rotate([0,90,0])
      cylinder(r=r2-0.15,h=9,$fn=6);
      

      // roller section
      translate([x1/2,0,0])
      rotate([0,90,0])
      cylinder(r=rroller,h=xroller,$fn=F1);

      // gear
      translate([x1/2+xroller,0,0])
      rotate([0,90,0])
      
      // rotate gear to mesh with rack here
      rotate([0,0,17])
      spur_gear (modul=2, tooth_number=12, width=xgear, bore=2, pressure_angle=20, helix_angle=0, optimized=false);

      // overhanging lip section
      translate([x1/2+xroller+xgear,0,0])
      rotate([0,90,0])
      cylinder(r=rlip,h=1,$fn=F2);
    }
    
    // cut a center hole
    rotate([0,90,0])
    cylinder(r=1.7,h=x1+40,$fn=F2,center=true);
  }

}

//----------------------------------------------------------------------
module beam(){

intersection(){
  union(){
    // rack
    translate([x1/2+xroller,0,-13])
    rotate([90-slope,0,0])
    rotate([0,90,0])
    rack(modul=2, length=xrack, height=12, width=xgear-0.3, pressure_angle=20, helix_angle=0);

    // roller section  
    translate([x1/2+xroller/2+0.1,0,-19])
    rotate([-slope,0,0])
    translate([0,-3.2,0])  
    cube([xroller,xrack,12.8],center=true);
  }
  // trimming rack and roller with intersection
  translate([x1/2+xroller/2+0.1,0,-19])
  rotate([-slope,0,0])
  translate([0,-3.2,0.2])  
  cube([xroller+20,xrack-1,12.8],center=true);
}

}

//----------------------------------------------------------------------
module beam2(){

intersection(){
  union(){
    // rack
    translate([x1/2+xroller,0,-13])
    rotate([90-slope,0,0])
    rotate([0,90,0])
    rack(modul=2, length=xrack, height=12, width=xgear-0.3, pressure_angle=20, helix_angle=0);

    difference(){
      union(){
        // roller section  
        translate([x1/2+xroller/2+0.1,0,-19])
        rotate([-slope,0,0])
        translate([0,-3.2-10,0])  
        cube([xroller,xrack+40,12.8],center=true);
        // thicken ends
        translate([x1/2+xroller/2,0,-21.15])
        rotate([-slope,0,0])
        translate([3,-14,1])  
        cube([xroller+xgear-0.6,xrack+40,8],center=true);
      }
      // cuts to mount with M3
      translate([x1/2+xroller/2,0,-21.15])
      rotate([-slope,0,0])
      translate([3,xrack/2+2,1])  
      rotate([0,90,0])
      cylinder(r=1.7,h=20,center=true,$fn=22);

      translate([x1/2+xroller/2,0,-21.15])
      rotate([-slope,0,0])
      translate([3,-xrack/2-30,1])  
      rotate([0,90,0])
      cylinder(r=1.7,h=20,center=true,$fn=22);
    }

    // lower roller stop  
    translate([x1/2+xroller/2+0.1,0,-19])
    rotate([-slope,0,0])
    translate([0,xrack/2-0.75,15])  
    difference(){
      cube([xroller,15,20],center=true);

      translate([0,-8,3])
      rotate([0,90,0])
      cylinder(r=rroller,h=xroller+1,center=true,$fn=F2);
    }
    
    // upper roller stop  
    translate([x1/2+xroller/2+0.1,0,-19])
    rotate([-slope,0,0])
    translate([0,-xrack/2-25.75,15])  
    difference(){
      cube([xroller,15,20],center=true);

      translate([0,8,3])
      rotate([0,90,0])
      cylinder(r=rroller,h=xroller+1,center=true,$fn=F2);
    }
  }
  
  // trimming rack and roller with intersection
  translate([x1/2+xroller/2+0.1,0,-19])
  rotate([-slope,0,0])
  translate([0,0,15])  
  cube([xroller+20,xrack+80,40],center=true);
}

}

//======================================================================

// spur position +57 bottom, -68 is the top
pos1=-60;

//color("gray",alpha=0.3)
//spool(pos=pos1);

shaft(pos=pos1);

//nut();
//mirror([1,0,0]) nut();

//nut2();
//mirror([1,0,0]) nut2();

//color("cyan")
spur(pos=pos1);
//mirror([1,0,0]) spur();

//color("gray",alpha=0.3)
beam2();
//mirror([1,0,0]) beam2();

//======================================================================

