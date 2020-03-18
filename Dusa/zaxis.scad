// zaxis

use <../Parts/tslot.scad>
use <../Parts/motors.scad>

// Center to motor screw
x1=-7; 

// Center to rod
x3=19;

// Label?
yoff3=6;

// sides2
F2=88;


//------------------------------
module zleft1(
x1=-10,
x3=15,
yoff3=6
){

F2=88;
F3=88;

z4=41;  // translate 38
z5=6;  // thick 10

difference(){
// boss
minkowski(){    
union(){
    // over motor
    color("gray")
    translate([-6,-2,z4])
    linear_extrude(height=z5,convexity=10)
    square([44,48],center=true);

    // back corner
    color("pink")
    translate([20,-13,z4])
    linear_extrude(height=z5,convexity=10)
    square([16,24],center=true);

    // rounded corner
    color("green")
    translate([16,-2,z4])
    scale([1,2,1])
    cylinder(r=12,h=z5,$fn=F2);

    // collar around rod
    color("red")
    translate([x3,0,z4+z5])
    cylinder(r=7,h=2,$fn=F2);

    difference(){
        // vertical tab
        color("orange")
        translate([0,-22,z4])
        linear_extrude(height=21,convexity=10)
        square([56,8],center=true);

        // corner cutout for extruder body
        translate([x1-19,-10,62])
        rotate([90,0,0])
        cylinder(r=8,h=30,$fn=F2);
    }

    // fillet
    color("blue")
    translate([0,-16.0,z4+3])
    rotate([45,0,0])
    linear_extrude(height=6,convexity=10)
    square([56,6],center=true);

    // collar around screw
    translate([x1,0,z4+z5])
    cylinder(r=7,h=2,$fn=F2);
}
sphere(r=2,$fs=0.2);
}


// left tower
translate([0,-30-42.3/2-yoff3,0])
tslot1(type=3,len=100,tol=0.15);

// left z motor
color("red")
translate([x1,0,0])
rotate([0,0,180])
zmotor(tol=0.15);

// left z rod, add some tolerance
color("red")
translate([x3,0,42])
cylinder(r=5+0.05,h=350,$fn=F2);
    
    // mounting holes,
    translate([15.5+x1,15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([-15.5+x1,15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([15.5+x1,-15.5,30])
    cylinder(r=1.6,h=20,$fn=F3);
    translate([-15.5+x1,-15.5,30])
    cylinder(r=1.6,h=20,$fn=F3);

    // countersink for the heads
    translate([15.5+x1,15.5,46])
    cylinder(r=2.8,h=4,$fn=F3);
    translate([-15.5+x1,15.5,46])
    cylinder(r=2.8,h=4,$fn=F3);
    translate([15.5+x1,-15.5,46])
    cylinder(r=2.8,h=30,$fn=F3);
    translate([-15.5+x1,-15.5,46])
    cylinder(r=2.8,h=30,$fn=F3);


    // extra clearance for leadscrew
    translate([x1,0,z4-5])
    cylinder(r=5,h=20,$fn=F2);

    // tslot mounts
    translate([15,-42.3/2-5-yoff3,56])
    rotate([-90,0,0])
    cylinder(r=5.9/2,h=20,$fn=F2);

    translate([15,-42.3/2+0.5-yoff3+5,56])
    rotate([-90,0,0])
    cylinder(r=5,h=6,$fn=F2);

    translate([-15,-42.3/2-5-yoff3,56])
    rotate([-90,0,0])
    cylinder(r=5.9/2,h=20,$fn=F2);

    translate([-15,-42.3/2+0.5-yoff3+5,56])
    rotate([-90,0,0])
    cylinder(r=5,h=6,$fn=F2);
}

    
}

//------------------------------
module zleft2a(
x1=-8,
x3=17,
yoff3=6
){

F2=88;
F3=22;


difference(){
// boss
translate([0,0,342])
union(){
minkowski(convexity=10){    
difference(){
union(){
    // over rods
    color("gray")
    translate([4.5,-7,38+4])
    linear_extrude(height=20,convexity=10)
    square([47,32],center=true);

    // fillet
    color("blue")
    translate([4.5,-16,38+2])
    rotate([45,0,0])
    linear_extrude(height=6,convexity=10)
    square([47,6],center=true);

    // collar around rod
    color("red")
    translate([x3,0,38+2])
    cylinder(r=7,h=2,$fn=F2);

    // collar around screw
    translate([x1,0,38+2])
    cylinder(r=7,h=2,$fn=F2);

    // vertical tab
    color("orange")
    translate([4.5,-22,16])
    linear_extrude(height=46)
    square([47,8],center=true);

}
    // corner cuts
    color("pink")
    translate([31,0,35])
    rotate([0,0,45])
    cube([20,20,30]);

    // corner cuts
    color("pink")
    translate([-19,0,35])
    rotate([0,0,45])
    cube([20,20,30]);
}

sphere(r=2,$fs=0.2);
}
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
translate([x1,0,0])
rotate([0,0,180])
zmotor(tol=0.15);

// left z rod, add some tolerance
color("red")
translate([x3,0,42+1])
cylinder(r=5+0.1,h=350,$fn=F2);

    
// extra clearance for leadscrew
translate([x1,0,330+40])
cylinder(r=5,h=20,$fn=F3);


// tslot mounts
translate([15,-42.3/2-yoff3-5,365])
rotate([-90,0,0])
cylinder(r=5.9/2,h=20,$fn=F2);

translate([15,-42.3/2+0.5-yoff3+5,365])
rotate([-90,0,0])
cylinder(r=5,h=6,$fn=F2);

translate([-15,-42.3/2-yoff3-5,365])
rotate([-90,0,0])
cylinder(r=5.9/2,h=20,$fn=F2);


translate([-15,-42.3/2+0.5-yoff3+5,365])
rotate([-90,0,0])
cylinder(r=5,h=6,$fn=F2);

// third hole
translate([5,-42.3/2-yoff3-5,380+15])
rotate([-90,0,0])
cylinder(r=5.9/2,h=20,$fn=F2);

translate([5,-42.3/2+0.5-yoff3+5,380+15])
rotate([-90,0,0])
cylinder(r=5,h=60,$fn=F2);

// extra clearance for inserting screw
translate([5,-42.3/2+0.5+6-yoff3+5,380+15])
rotate([-90,0,0])
cylinder(r1=5.0,r2=6.5,h=40,$fn=F2);
  
    
}

    
}
//---------------------------------
module zleft2(
x1=-8,
x3=17,
yoff3=6
){

F2=88;
F3=22;
    
    zleft2a(x1=x1,x3=x3,yoff3=yoff3);

    
}
//---------------------------------
module zright2(
x1=-8,
x3=17,
yoff3=6
){

F2=88;
F3=22;
    
    mirror([1,0,0])
    zleft2a(x1=x1,x3=x3,yoff3=yoff3);
    
}


//===============================


//mirror([1,0,0])
zleft1(x1=x1,x3=x3,yoff3=yoff3);

//translate([70,0,0])
zleft2(x1=x1,x3=x3,yoff3=yoff3);

//zright2(x1=x1,x3=x3,yoff3=yoff3);

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
translate([x1,0,0])
rotate([0,0,180])
zmotor(tol=0.15);

// left z rod, add some tolerance
color("red")
translate([x3,0,42])
cylinder(r=5+0.1,h=350,$fn=F2);
}

//================================

