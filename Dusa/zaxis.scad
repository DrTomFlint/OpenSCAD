// zaxis

use <../Parts/tslot.scad>
use <../Parts/motors.scad>

x3=25;
F2=88;

//------------------------------
module zleft1(
x3=25,
yoff3=6
){

F2=88;
F3=22;

difference(){
// boss
minkowski(){    
union(){
    color("orange")
    translate([0,0,38])
    linear_extrude(height=10)
    square([56,48],center=true);

    color("orange")
    translate([x3,0,38])
    linear_extrude(height=10)
    circle(r=16,$fn=88);

    color("orange")
    translate([0,-24,38])
    linear_extrude(height=24)
    square([56,10],center=true);

    translate([0,0,48])
    cylinder(r=7,h=2,$fn=F3);
}
sphere(r=2,$fs=0.1);
}

// left tower
translate([0,-30-42.3/2-yoff3,0])
tslot1(type=3,len=100,tol=0.15);

// left z motor
color("red")
rotate([0,0,180])
zmotor(tol=0.15);

// left z rod, add some tolerance
color("red")
translate([x3,0,42])
cylinder(r=5+0.1,h=350,$fn=F2);
    
    // mounting holes,
    translate([15.5,15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([-15.5,15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([15.5,-15.5,30])
    cylinder(r=1.6,h=20,$fn=F3);
    translate([-15.5,-15.5,30])
    cylinder(r=1.6,h=20,$fn=F3);

    // countersink for the heads
    translate([15.5,15.5,46])
    cylinder(r=2.8,h=4,$fn=F3);
    translate([-15.5,15.5,46])
    cylinder(r=2.8,h=4,$fn=F3);
    translate([15.5,-15.5,46])
    cylinder(r=2.8,h=30,$fn=F3);
    translate([-15.5,-15.5,46])
    cylinder(r=2.8,h=30,$fn=F3);


    // extra clearance for leadscrew
    translate([0,0,38])
    cylinder(r=5,h=20,$fn=F3);

    // tslot mounts
    translate([15,-42.3/2-5-yoff3,56])
    rotate([-90,0,0])
    cylinder(r=5.9/2,h=20,$fn=F2);

    translate([15,-42.3/2+0.5-yoff3+5,56])
    rotate([-90,0,0])
    cylinder(r=5,h=5,$fn=F2);

    translate([-15,-42.3/2-5-yoff3,56])
    rotate([-90,0,0])
    cylinder(r=5.9/2,h=20,$fn=F2);

    translate([-15,-42.3/2+0.5-yoff3+5,56])
    rotate([-90,0,0])
    cylinder(r=5,h=5,$fn=F2);
}

    
}

//------------------------------
module zleft2(
x3=25,
yoff3=6
){

F2=88;
F3=22;


difference(){
// boss
translate([0,0,342])
minkowski(){    
union(){
    color("orange")
    translate([0,-6,38])
    linear_extrude(height=22)
    square([56,44],center=true);

    color("orange")
    translate([x3+2,0,38])
    linear_extrude(height=22)
    circle(r=16.0,$fn=88);

    color("orange")
    translate([0,-24,16])
    linear_extrude(height=44)
    square([56,10],center=true);
}
sphere(r=2,$fs=0.1);
}

// left tower
translate([0,-30-42.3/2-yoff3,0])
tslot1(type=3,len=380,tol=0.15);

// top rail
translate([-30,-30-42.3/2-yoff3,380+15])
rotate([0,90,0])
tslot1(type=2,len=60,tol=0.15);

// left z motor
color("red")
rotate([0,0,180])
zmotor(tol=0.15);

// left z rod, add some tolerance
color("red")
translate([x3,0,42])
cylinder(r=5+0.1,h=350,$fn=F2);
    
    // extra clearance for leadscrew
    translate([0,0,330+40])
    cylinder(r=5,h=20,$fn=F3);

    // tslot mounts
    translate([15,-42.3/2-yoff3-5,365])
    rotate([-90,0,0])
    cylinder(r=5.9/2,h=20,$fn=F2);

    translate([15,-42.3/2+0.5-yoff3+5,365])
    rotate([-90,0,0])
    cylinder(r=5,h=5,$fn=F2);

    translate([-15,-42.3/2-yoff3-5,365])
    rotate([-90,0,0])
    cylinder(r=5.9/2,h=20,$fn=F2);

    translate([-15,-42.3/2+0.5-yoff3+5,365])
    rotate([-90,0,0])
    cylinder(r=5,h=5,$fn=F2);
}

    
}

//===============================

zleft1();
zleft2();
yoff3=6;

if(1){
// left tower
color("gray")
translate([0,-30-42.3/2-yoff3,0])
tslot1(type=3,len=380,tol=0.15);

// top rail
color("gray")
translate([-30,-30-42.3/2-yoff3,380+15])
rotate([0,90,0])
tslot1(type=2,len=60,tol=0.15);

// left z motor
color("red")
rotate([0,0,180])
zmotor(tol=0.15);

// left z rod, add some tolerance
color("red")
translate([x3,0,42])
cylinder(r=5+0.1,h=350,$fn=F2);
}

//================================

