//=================================================================================
// cargo1.scad
//
// Corner pads for the trailer hitch cargo carrier
//
// Dr Tom Flint, 11 Sept 2021
//=================================================================================

use <../Parts/rounder.scad>

r0=4;
thick1=2.25+0.3;

r1=10;
f1=44;

x2=30;  // length of the pad
z2=r1;  // height above the rail
f2=44;  // for the spheres
z3=69-r1;  // height of pad

boltx = 20;
boltz = 40;

//------------------------------------------------------------------
// draw it a bit thick and use as a cutter

module corner(tol=0.0){
  
  difference(){  
    cube([200,200,69]);
    rounder(r=r0,h=69,f=80);
    
    translate([thick1,thick1,thick1]){
      difference(){
        cube([200,200,69]);
        rounder(r=r0-thick1,h=69-thick1,f=80);
      }
    }
    translate([20.5,20.5,-10]){
      cube([200,200,69]);
    }

if(0){
    translate([thick1,thick1,-10]){
      rotate([0,0,-45])
      translate([-2.7/2,1.5,0])
      cube([2.7,80,20]);
    }
}    
  }

}

//--------------------------------------------------------------------
module pad1(){

// corner post
cylinder(r=r1,h=z3,$fn=f1);
sphere(r=r1,$fn=f2);

translate([0,0,z3])
sphere(r=r1,$fn=f2);

// x-leg
translate([0,-r1,0])
cube([x2,2*r1,z3]);

translate([x2,0,0])
cylinder(r=r1,h=z3,$fn=f1);

translate([x2,0,z3])
sphere(r=r1,$fn=f2);
translate([x2,0,0])
sphere(r=r1,$fn=f2);

translate([0,0,z3])
rotate([0,90,0])
cylinder(r=r1,h=x2,$fn=f1);

rotate([0,90,0])
cylinder(r=r1,h=x2,$fn=f1);


// y-leg
translate([-r1,0,0])
cube([2*r1,x2,z3]);

translate([0,x2,0])
cylinder(r=r1,h=z3,$fn=f1);

translate([0,x2,z3])
sphere(r=r1,$fn=f2);
translate([0,x2,0])
sphere(r=r1,$fn=f2);

translate([0,0,z3])
rotate([-90,0,0])
cylinder(r=r1,h=x2,$fn=f1);
rotate([-90,0,0])
cylinder(r=r1,h=x2,$fn=f1);


}
//----------------------------------------------------------------
module pad2(){
  
  difference(){
    translate([0,0,r1])
    pad1();
    corner();
    
    // cuts for a bolt thru, p#ad is 2*r1 thick, 20 mm now
    // use M4x16 with 2 washers and a nylock nut
    // through hole
    translate([boltx,0,boltz])
    rotate([90,0,0])
    cylinder(r=2.0,h=30,center=true,$fn=f1);

    // head and washer clearance
    translate([boltx,-10+4.8,boltz])
    rotate([90,0,0])
    cylinder(r=4.5,h=4.8,$fn=f1);

    // nylock and washer clearance
    translate([boltx,10-5.6,boltz])
    rotate([-90,0,0])
    cylinder(r=6.5,h=5.6,$fn=f1);

    // through hole
    translate([0,boltx,boltz])
    rotate([0,90,0])
    cylinder(r=2.0,h=30,center=true,$fn=f1);

    // nylock and washer clearance
    translate([10-4.8,boltx,boltz])
    rotate([0,90,0])
    cylinder(r=6.5,h=4.8,$fn=f1);

    // head and washer clearance
    translate([-10+5.6,boltx,boltz])
    rotate([0,-90,0])
    cylinder(r=4.5,h=5.6,$fn=f1);

  }
}
//============================================================

if(0){
  intersection(){
  //difference(){
    difference(){
      pad2();

      // extra cuts to make a rounded shape
      translate([0,2.55/2,69])
      rotate([0,90,0])
      cylinder(r=2.55/2,h=100,$fn=f1);

      // extra cuts to make a rounded shape
      translate([2.55/2,0,69])
      rotate([-90,0,0])
      cylinder(r=2.55/2,h=100,$fn=f1);
    }
    
    translate([-40,-40,-10])
    rotate([0,0,45])
    cube([300,300,100]);

  }
}

pad2();

if(1){
  color("gray")
  corner();
}

//============================================================



