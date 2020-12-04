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
x1 = 26;      // x position of right motor with resolver
x2 = -35;     // x position of left motor no resolver
x3 = -5;       // x position of the coupler

//---------------------------------------------------------------------------------
module bracket1(type=1){
 
 
  
  // base plate
  difference(){

    union(){
      hull(){
        translate([-35+10,-30,-1])
        cube([77-10,60,9]);

        translate([83-8,15,-1])
        cylinder(r=8,h=9,$fn=22);
        
        translate([83-8,-15,-1])
        cylinder(r=8,h=9,$fn=22);
      }

      // fillets to vertical plate
      translate([0,30,8])
      rotate([90,0,0])
      rounder(r=5,h=60,f=88);

      translate([-12,30,8])
      rotate([90,0,0])
      rotate([0,0,90])
      rounder(r=5,h=60,f=88);

    }
    
    // round short corners
    translate([-35+10,-30,-1])
    rounder(r=5,h=12,f=44);
    
    translate([-35+10,30,-1])    
    rotate([0,0,-90])
    rounder(r=5,h=12,f=44);

    // cut for the T-slot
    translate([-150,0,-15])
    rotate([0,90,0])
    tslot1(type=2,len=300,tol=0.15);
    
    // M4 tie downs to the T-slot with countersink
    translate([-19.5,15,-1])
    cylinder(r=2,h=20,$fn=22);
    translate([-19.5,15,7])
    cylinder(r=5,h=2,$fn=22);
    
    translate([-19.5,-15,-1])
    cylinder(r=2,h=20,$fn=22);
    translate([-19.5,-15,7])
    cylinder(r=5,h=2,$fn=22);

    // tail end M4's
    translate([83-7,15,-1])
    cylinder(r=2,h=20,$fn=22);
    translate([83-7,15,7])
    cylinder(r=5,h=2,$fn=22);
    
    translate([83-7,-15,-1])
    cylinder(r=2,h=20,$fn=22);
    translate([83-7,-15,7])
    cylinder(r=5,h=2,$fn=22);

    
    // slots for side panel
    translate([-50,-30.1,2.5])
    cube([100,3.1,3]);
    translate([-8,-30.1,2.5])
    cube([3,3.1,100]);

    translate([-50,30-3,2.5])
    cube([100,3.1,3]);
    translate([-8,30-3,2.5])
    cube([3,3.1,100]);

    translate([-10.8,-30.1,5])
    rotate([0,45,0])
    cube([6,3.1,6]);
    translate([-10.8,30-3,5])
    rotate([0,45,0])
    cube([6,3.1,6]);
    
    // tail end grooves
    translate([10,0,10])
    rotate([0,90,0])
    scale([1,1.6,1])
    cylinder(r=6,h=120,$fn=44);    

    translate([10,17,10])
    rotate([0,90,0])
    scale([1,1.6,1])
    cylinder(r=4,h=52,$fn=44);    
    translate([10,-17,10])
    rotate([0,90,0])
    scale([1,1.6,1])
    cylinder(r=4,h=52,$fn=44);    
    
  }
  
  
  
  // vertical plate
  difference(){
    translate([-12,-30,1])
    cube([12,60,z0+30-1]);

    // circular lip
    translate([-1.9,0,z0])
    rotate([0,90,0])
    cylinder(r=38.1/2+0.15,h=2.2,$fn=120);

    // shaft clearance
    translate([-18,0,z0])
    rotate([0,90,0])
    cylinder(r=15,h=22,$fn=120);

    // cut bolt holes
    translate([0,0,z0])
    for(i=[0:3]){
      rotate([45+90*i,0,0])
      translate([-18,33.34,0])
      rotate([0,90,0])
      cylinder(r=5.2/2,h=22,$fn=22);
    }
    
    if(type==1){
      // body of the resolver
      translate([0,0,z0])
      rotate([180,0,0])
      resbody(tol=0.15);
      
      // bevel cut for install
      translate([-12.1,0,z0])
      rotate([0,90,0])
      cylinder(r1=39/2,r2=34/2,h=5,$fn=120);

      // wiring box
//      translate([-18,-23/2,z0+10])
//      cube([12,23,22]);

      hull(){
        translate([-11.8,-9,z0+10])
        cylinder(r=4,h=22,$fn=45);
        translate([-11.8,9,z0+10])
        cylinder(r=4,h=22,$fn=45);
      }
    }
        
    
    // round off upper corners
    translate([-13,-30,z0+30])
    rotate([0,90,0])
    rounder(r=5,h=14,f=88);
    translate([-13,30,z0+30])
    rotate([0,90,0])
    rotate([0,0,-90])
    rounder(r=5,h=14,f=88);
    
    // slots for side panel
    translate([-50,-30.1,2.5])
    cube([100,3.1,3]);
    translate([-8,-30.1,2.5])
    cube([3,3.1,100]);
    
    translate([-50,30-3,2.5])
    cube([100,3.1,3]);
    translate([-8,30-3,2.5])
    cube([3,3.1,100]);

    translate([-10.8,-30.1,5])
    rotate([0,45,0])
    cube([6,3.1,6]);
    translate([-10.8,30-3,5])
    rotate([0,45,0])
    cube([6,3.1,6]);
    
    translate([-8,-50,z0+30-3])
    cube([3,100,3.1]);

  }


// was fillets

  
}

//-----------------------------------------------------------------------------
module bracket2(tol=0,type=1){
  
  if(type==1){
      
   // slots for side panel
    // front base
    color("cyan")
    translate([-20,-30.2,2.6])
    cube([58,3.0,2.8]);  
    // front vertical
    color("blue")
    translate([-7.9,-30.2,2.6])
    cube([2.8,3.0,64]);
    
    difference(){
      hull(){
        translate([-16,-30,4])
        rotate([90,0,0])
        cylinder(r=5,h=4,$fn=33);
        translate([36,-30,4])
        rotate([90,0,0])
        cylinder(r=5,h=4,$fn=33);
        translate([-6,-30,z0+19])
        rotate([90,0,0])
        cylinder(r=7,h=4,$fn=33);
      }
      
      translate([14,-26,18])
      rotate([90,0,0])
      cylinder(r=8,h=10,$fn=66);
      translate([9,-26,36])
      rotate([90,0,0])
      cylinder(r=4,h=10,$fn=66);
    }
        
  }
    
  if(type==2){  
    // back base
    color("green")
    translate([-20,30-2.8,2.6])
    cube([58,3.0,2.8]);
    // back vertical
    color("red")
    translate([-7.9,30-2.8,2.6])
    cube([2.8,3.0,64]);
    
    translate([0,64,0])
    difference(){
      hull(){
        translate([-16,-30,4])
        rotate([90,0,0])
        cylinder(r=5,h=4,$fn=33);
        translate([36,-30,4])
        rotate([90,0,0])
        cylinder(r=5,h=4,$fn=33);
        translate([-6,-30,z0+19])
        rotate([90,0,0])
        cylinder(r=7,h=4,$fn=33);
      }

      translate([14,-26,18])
      rotate([90,0,0])
      cylinder(r=8,h=10,$fn=66);
      translate([9,-26,36])
      rotate([90,0,0])
      cylinder(r=4,h=10,$fn=66);

    }
  }
}

//---------------------------------------------------------------------------------
module coupler(type=1){

  difference(){
    // body
    rotate([0,90,0])
    cylinder(r=25.5/2,h=32.8,center=true,$fn=99);
    
    // bore
    rotate([0,90,0])
    cylinder(r=9.5/2,h=35,center=true,$fn=99);
  
    // horizontal view cut
    cube([20,40,8],center=true);

    // vertical view cut
    cube([20,8,40],center=true);
  }
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

// side bracket 
if(1){  
  color("gray")
  translate([x1,0,0])
  bracket2();
}
if(1){  
  color("gray")
  translate([x1,0,0])
  bracket2(type=2);
}



if(0){  
  translate([x1,0,z0])
  rotate([180,0,0])
  resbody();
}

if(0){
  color("cyan")
  translate([x1-10,0,z0])
  rotate([180,0,0])
  resrotor();
}

if(0){
  color("red")
  translate([x1-3,0,z0])
  rotate([0,0,180])
  resadapt();
}


// coupler
if(1){
  color("pink")
  translate([x3,0,z0])
  coupler();
}

//  motor
if(1){  
  color("red")
  translate([x2,0,z0])
  rotate([0,0,180])
  tek2310();
}
  
// bracket
if(1){  
  color("gray")
  translate([x2,0,0])
  rotate([0,0,180])
  bracket1(type=2);
}

// side bracket 
if(1){  
  color("gray")
  translate([x2,0,0])
  rotate([0,0,180])
  bracket2();
}
if(1){  
  color("gray")
  translate([x2,0,0])
  rotate([0,0,180])
  bracket2(type=2);
}
  
}

//=================================================================================

//b2b1();
//tek2310();

//coupler();

//bracket1(type=2);
bracket1(type=1);

//bracket2();
//bracket2(type=2);

//=================================================================================
