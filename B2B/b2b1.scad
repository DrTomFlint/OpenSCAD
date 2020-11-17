//=================================================================================
// B2B1.scad
// Back-to-back motor rig version 1
// Two Tek2310 motors, coupler, resolver, 30x60 T-slot
//
// Dr Tom Flint, 16 Nov 2020
//=================================================================================


use <./tek2310.scad>
use <./resolver.scad>
use <../Parts/tslot.scad>
use <../Parts/rounder.scad>

z0 = 42;      // height of the shafts
x1 = 40;      // x position of right motor

//---------------------------------------------------------------------------------
module bracket1(){
 
 
  
  // base plate
  difference(){
//    translate([-35,-30,-1])
//    cube([130,60,9]);
    translate([-35,-30,-1])
    cube([77,60,9]);

    // round 4 corners
    translate([-35,-30,-1])
    rounder(r=5,h=12,f=44);
    translate([-35,30,-1])
    rotate([0,0,-90])
    rounder(r=5,h=12,f=44);
    
    translate([42,30,-1])
    rotate([0,0,180])
    rounder(r=5,h=12,f=44);
    
    translate([42,-30,-1])
    rotate([0,0,90])
    rounder(r=5,h=12,f=44);
    
    // cut for the T-slot
    translate([-150,0,-15])
    rotate([0,90,0])
    tslot1(type=2,len=300,tol=0.15);
    
    // M4 tie downs to the T-slot with countersink
    translate([-25,15,-1])
    cylinder(r=2,h=20,$fn=22);
    translate([-25,15,6])
    cylinder(r=3.8,h=4,$fn=22);
    
    translate([-25,-15,-1])
    cylinder(r=2,h=20,$fn=22);
    translate([-25,-15,6])
    cylinder(r=3.8,h=4,$fn=22);

    // material reduction
//    translate([22,0,-2])
//    scale([1.4,1,1])
//    cylinder(r=10,h=20,$fn=44);
    
    // slots for side panel
    translate([-50,-30.1,2.5])
    cube([100,3.1,3]);
    translate([-8,-30.1,2.5])
    cube([3,3.1,100]);

    translate([-50,30-3,2.5])
    cube([100,3.1,3]);
    translate([-8,30-3,2.5])
    cube([3,3.1,100]);
    
  }
  
  
  
  // vertical plate
  difference(){
    translate([-12,-30,0])
    cube([12,60,z0+30]);

    // circular lip
    translate([-1.9,0,z0])
    rotate([0,90,0])
    cylinder(r=38.1/2+0.1,h=1.91,$fn=120);

    // shaft clearance
    translate([-18,0,z0])
    rotate([0,90,0])
    cylinder(r=13,h=22,$fn=120);

    // cut bolt holes
    translate([0,0,z0])
    for(i=[0:3]){
      rotate([45+90*i,0,0])
      translate([-18,33.34,0])
      rotate([0,90,0])
      cylinder(r=5.2/2,h=22,$fn=22);
    }
    
    // body of the resolver
    translate([0,0,z0])
    rotate([180,0,0])
    resbody(tol=0.15);
    
    // clearance to install resolver body
    translate([-22,0,z0])
    rotate([0,90,0])
    cylinder(r=37/2,h=12,$fn=120);
    
    translate([-18,-23/2,z0+10])
    cube([12,23,22]);
    
    // round off upper corners
    translate([-13,-30,z0+30])
    rotate([0,90,0])
    rounder(r=6,h=14,f=88);
    translate([-13,30,z0+30])
    rotate([0,90,0])
    rotate([0,0,-90])
    rounder(r=6,h=14,f=88);
    
    // slots for side panel
    translate([-50,-30.1,2.5])
    cube([100,3.1,3]);
    translate([-8,-30.1,2.5])
    cube([3,3.1,100]);
    
    translate([-50,30-3,2.5])
    cube([100,3.1,3]);
    translate([-8,30-3,2.5])
    cube([3,3.1,100]);

  }


  // fillets
  translate([0,30,8])
  rotate([90,0,0])
  rounder(r=5,h=60,f=88);

  translate([-12,30,8])
  rotate([90,0,0])
  rotate([0,0,90])
  rounder(r=5,h=60,f=88);


  
/*
  // side plates
  hull(){
    translate([-35,-30-4,-1])
    cube([2,4,9]);
    translate([40,-30-4,-1])
    cube([2,4,9]);
    translate([-12,-30-4,z0+30-2])
    cube([12,4,2]);
  }
  translate([0,64,0])
  hull(){
    translate([-35,-30-4,-1])
    cube([2,4,9]);
    translate([40,-30-4,-1])
    cube([2,4,9]);
    translate([-12,-30-4,z0+30-2])
    cube([12,4,2]);
  }
*/
  
}

//---------------------------------------------------------------------------------
module b2b1(){
  
// T-slot base
if(1){  
  translate([-150,0,-15])
  rotate([0,90,0])
  tslot1(type=2,len=300);
}

//  motor
if(1){  
  color("green")
  translate([x1,0,z0])
  tek2310();
}
  
// bracket
if(1){  
  color("gray")
  translate([x1,0,0])
  bracket1();
}


if(1){  
  translate([x1,0,z0])
  rotate([180,0,0])
  resbody();
}

if(1){
  color("cyan")
  translate([x1-10,0,z0])
  rotate([180,0,0])
  resrotor();
}

if(1){
  color("red")
  translate([x1-3,0,z0])
  rotate([0,0,180])
  resadapt();
}



/*
  color("green")
  translate([-40,0,z0])
  rotate([0,0,180])
  tek2310();
  
  translate([-40,0,z0])
  rotate([0,0,180])
  resbody();
*/
  
}

//=================================================================================

b2b1();

//bracket1();

//=================================================================================
