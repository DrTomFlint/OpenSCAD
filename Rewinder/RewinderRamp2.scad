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
//wide=62;		// width of a spool
wide=75;      // wider spools for the UV filament
r0=100;     // radius of spool
wall=4.5;   // thickness of spool wall
bore=54.5/2;  // radius of bore hole

// main shaft
r1=16;        // radius of the main shaft
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
xroller=6;
rroller=5.75;
rlip=8;
xgear=6;

// rack beam
xrack = 100;

// box outer dimensions
bx3=123.5;
by3=350;
bz3=220;
thick=3;

F1=201;
F2=66;

//----------------------------------------------------------------------
module spool(pos=0){

translate([0,pos,0])

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
// 2:32 to render make one set of threads be backwards so pulling on the
// spool will tighten both ends.  Color code the spurs and nuts.
module shaft2(pos=0){

  translate([0,pos,0])

  difference(){
    union(){
      // threaded end
      translate([-x1/2,0,0])
      rotate([0,90,0])
      if(draft==1){
        cylinder(r=r1,h=x1,$fn=F2);
      }else{
        metric_thread (diameter=2*r1, pitch=3, length=x1/3, internal=false, n_starts=1, thread_size=-1, groove=false, square=false, rectangle=0,angle=30, taper=0, leadin=2, leadfac=1.0, test=false);
      }
      mirror([1,0,0])
      translate([-x1/2,0,0])
      rotate([0,90,0])
      if(draft==1){
        cylinder(r=r1,h=x1,$fn=F2);
      }else{
        metric_thread (diameter=2*r1, pitch=3, length=x1/3, internal=false, n_starts=1, thread_size=-1, groove=false, square=false, rectangle=0,angle=30, taper=0, leadin=2, leadfac=1.0, test=false);
      }
      translate([0,0,0])
      rotate([0,90,0])
      cylinder(r=r1,h=x1/3,$fn=F2,center=true);

    }
    
    // cuts to insert gear ends
    translate([-x1/2-0.1,0,0])
    rotate([0,90,0])
    cylinder(r=rroller+0.15,h=12.25,$fn=99);

    translate([x1/2+0.1,0,0])
    rotate([0,-90,0])
    cylinder(r=rroller+0.15,h=12.25,$fn=99);
    
    // center cuts to allow an M3 bolt to strengthen attachment of spurs
    rotate([0,-90,0])
    cylinder(r=1.7,h=x1+20,$fn=22,center=true);
    
  }
        
}

//----------------------------------------------------------------------
// straight = red right side
// mirror = green left side
module nut(pos=0){

  translate([0,pos,0])

  translate([wide/2-10,0,0])
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
      metric_thread (diameter=2*r1+0.4, pitch=3, length=x1, internal=true, n_starts=1, thread_size=-1, groove=false, square=false, rectangle=0,angle=30, taper=0, leadin=0, leadfac=1.0, test=false);
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
module nut2(pos=0){

  translate([0,pos,0])

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
      metric_thread (diameter=2*r1+0.4, pitch=3, length=x1, internal=true, n_starts=1, thread_size=-1, groove=false, square=false, rectangle=0,angle=30, taper=0, leadin=3, leadfac=1.0, test=false);
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

  translate([0,pos,0])
  
  difference(){
    union(){
      // insert into shaft
      translate([x1/2-xgear-xroller/2-3,0,0])
      rotate([0,90,0])
      cylinder(r=rroller,h=12,$fn=99);
      
      // roller section
      translate([x1/2,0,0])
      rotate([0,90,0])
      cylinder(r=rroller,h=xroller,$fn=F1);

      // gear
      translate([x1/2+xroller,0,0])
      rotate([0,90,0])
      
      // rotate gear to mesh with rack here
      rotate([0,0,360/24])
      spur_gear (modul=1, tooth_number=12, width=xgear, bore=2, pressure_angle=20, helix_angle=0, optimized=false);

      // overhanging lip section
      translate([x1/2+xroller+xgear,0,0])
      rotate([0,90,0])
      cylinder(r2=9,r1=7,h=0.5,$fn=F2);
      translate([x1/2+xroller+xgear+0.5,0,0])
      rotate([0,90,0])
      cylinder(r=9,h=1.5,$fn=F2);
    }
    
    // cut a center hole
    rotate([0,90,0])
    cylinder(r=1.7,h=x1+40,$fn=F2,center=true);
    translate([x1/2+xroller+xgear+0.5,0,0])  
    rotate([0,90,0])
    cylinder(r=3,h=3.5,center=true,$fn=22);
    
  }

}

//----------------------------------------------------------------------
// straight = green left side
// mirror = red right side
module beam3(){

translate([0,0,-0.1])
difference(){
  union(){
    // rack
    translate([x1/2+xroller,0,-6.25])
    rotate([90,0,0])
    rotate([0,90,0])
    rack(modul=1, length=xrack+10, height=11.5, width=xgear, pressure_angle=20, helix_angle=0);

    // roller section  
    translate([x1/2+xroller/2+0.5,0,-rroller-6])
    cube([xroller-1,xrack+10,12],center=true);

    // lower roller stop  
    difference(){
      translate([x1/2+xroller/2+0.5,xrack/2,-5])
      cube([xroller-1,10,20],center=true);

      translate([x1/2+xroller/2+0.5,xrack/2+3,-5.75])
      translate([0,-8,rroller])
      rotate([0,90,0])
      cylinder(r=rroller,h=xroller+1,center=true,$fn=F2);
    }
    
    // upper roller stop  
    difference(){
      translate([x1/2+xroller/2+0.5,-xrack/2,-5])
      cube([xroller-1,10,20],center=true);

      translate([x1/2+xroller/2+0.5,-xrack/2-3,-5.75])
      translate([0,8,rroller])
      rotate([0,90,0])
      cylinder(r=rroller,h=xroller+1,center=true,$fn=F2);
    }
    
    // offset for lip clearance
    translate([x1/2+xroller/2+10,0,-rroller-8])
    cube([xroller-1,xrack+10,8],center=true);

  }   // end of union

  // cuts to mount with M3, bolt and head clearance
  translate([x1/2+xroller/2,0,-13])
  translate([3,xrack/2,1])  
  rotate([0,90,0]){
    cylinder(r=1.7,h=20,center=true,$fn=22);
    translate([0,0,-3.5])  
    cylinder(r=3,h=3.5,center=true,$fn=22);
  }
  
  translate([x1/2+xroller/2,0,-13])
  translate([3,-xrack/2,1])  
  rotate([0,90,0]){
    cylinder(r=1.7,h=20,center=true,$fn=22);
    translate([0,0,-3.5])  
    cylinder(r=3,h=3.5,center=true,$fn=22);
  }

  translate([x1/2+xroller/2,0,-13])
  translate([3,0,1])  
  rotate([0,90,0]){
    cylinder(r=1.7,h=20,center=true,$fn=22);
    translate([0,0,-3.5])  
    cylinder(r=3,h=3.5,center=true,$fn=22);
  }

}

}

//----------------------------------------------------------------------
// make the beams at slope = 0 degrees, make the box as small as possible
// and tilt the entire assembly as required to get good torque
module box3(thick=3){
  
  translate([0,-5,0])
  difference(){
    cube([bx3,by3,bz3],center=true);
    translate([0,0,thick])
    cube([bx3-2*thick,by3-2*thick,bz3],center=true);
  }
  
  
}
  
//======================================================================

// change pos1 to move the spool, spur, and shaft
//pos1=-xrack/2+6;   // top
pos1=xrack/2-6;   // bottom
//pos1=0;

// cutaway view of the box
if(0){
  difference(){
    union(){
      box3();
      //top3();
    }
    translate([0,by3/2-5-thick/2,0])
    cube([bx3+20,thick+0.1,bz3+20],center=true);
    translate([bx3/2-thick/2,0,0])
    cube([thick+0.1,by3+20,bz3+20],center=true);
  }
}

//box3();
//top3();

//color("gray",alpha=0.3)
//spool(pos=pos1);

shaft2(pos=pos1);

nut(pos=pos1);
mirror([1,0,0]) nut(pos=pos1);

//nut2(pos=pos1);
//mirror([1,0,0]) nut2();

//color("cyan")
spur(pos=pos1);
mirror([1,0,0]) spur(pos=pos1);

//color("gray",alpha=0.3)
beam3();
mirror([1,0,0]) beam3();


//======================================================================

