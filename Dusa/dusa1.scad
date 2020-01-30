// dusa1
// assembly level file for Prusa Dusa 3D printer

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <frame.scad>
use <zaxis.scad>


//======================================
yoff=-(30+42.3/2+5); // tower offset from center
yoff2=30+42.3/2+5;   // offset of z motor, leadscrew, shaft
zoff=43+0;         // z offset of the x-rods
zoff2=43;           // z offset of y=rods

x1=480;         // length front, back, top rails
y1=330;         // length side rails
z1=380;         // height of towers

x3=25;      // distance zrod to zscrew
z3=20;      // distance between x motors

z4=125;     // height of motors and belts

x2=x1/2;
y2=y1/2;
F2=88;

// main frame
frame(yoff=yoff,x1=x1,y1=y1,z1=z1);

//----------- red-----------
// left z motor
color("red")
translate([x2-30,yoff+yoff2,15])
rotate([0,0,180])
zmotor();

// left z rod
color("red")
translate([x2-30+x3,yoff+yoff2,15+42])
cylinder(r=5,h=350,$fn=F2);

// left lm10u bearing lower
color("red")
translate([x2-30+x3,yoff+yoff2,zoff+25])
cylinder(r=19.2/2,h=29,$fn=F2);

// left lm10u bearing upper
color("red")
translate([x2-30+x3,yoff+yoff2,zoff+98])
cylinder(r=19.2/2,h=29,$fn=F2);

// left znut
color("red")
translate([x2-30,yoff+yoff2,zoff+98+22])
rotate([180,0,0])
znut();

// left z-motor bracket lower
color("pink")
translate([x2-30,yoff+yoff2,15])
zleft1();

/*
// left z bracket upper
color("pink")
translate([x2-30,yoff+yoff2,15])
zleft2();
*/
// ----- green ---------
// right z motor
color("green")
translate([-x2+30,yoff+yoff2,15])
zmotor();

// right z rod
color("green")
translate([-x2+30-x3,yoff+yoff2,15+42])
cylinder(r=5,h=350,$fn=F2);

// right  lm10u bearing lower
color("green")
translate([-x2+30-x3,yoff+yoff2,zoff+25])
cylinder(r=19.2/2,h=29,$fn=F2);

// right  lm10u bearing lower
color("green")
translate([-x2+30-x3,yoff+yoff2,zoff+98])
cylinder(r=19.2/2,h=29,$fn=F2);

// right znut
color("green")
translate([-x2+30,yoff+yoff2,zoff+98+22])
rotate([180,0,0])
znut();

// right z-motor bracket 
color("pink")
translate([-x2+30,yoff+yoff2,15])
mirror([1,0,0])
zleft1();

/*
// left z bracket upper
color("pink")
translate([-x2+30,yoff+yoff2,15])
mirror([1,0,0])
zleft2();
*/


//-------orange-----------------

// upper x rod
color("orange")
translate([-480/2,yoff+yoff2-15,zoff+z4+16])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);

// lower x rod
color("orange")
translate([-480/2,yoff+yoff2-15,zoff+48])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);

// right x motor
color("blue")
translate([-480/2-25,yoff+yoff2+28,zoff+z4])
rotate([90,-90,0])
xymotor();

color("blue")
difference(){
    hull(){
        // pulley
        translate([-480/2-25,yoff+yoff2-32,zoff+z4])
        rotate([-90,-90,0])
        cylinder(r=5.0,h=10,$fn=F2);

        // idler
        translate([480/2-20,yoff+yoff2-32,zoff+z4+2.5])
        rotate([-90,-90,0])
        cylinder(r=7.5,h=10,$fn=F2);
    }
    hull(){
        // pulley
        translate([-480/2-25,yoff+yoff2-32-1,zoff+z4])
        rotate([-90,-90,0])
        cylinder(r=3.5,h=12,$fn=F2);

        // idler
        translate([480/2-20,yoff+yoff2-32-1,zoff+z4+2.5])
        rotate([-90,-90,0])
        cylinder(r=6.0,h=12,$fn=F2);
    }
}

// left x motor
color("gray")
translate([480/2+25,yoff+yoff2+42,zoff+z4])
rotate([90,90,0])
xymotor();

color("gray")
difference(){
    hull(){
        // right x idler
        translate([-480/2+20,yoff+yoff2-20,zoff+z4+2.5])
        rotate([-90,-90,0])
        cylinder(r=7.5,h=10,$fn=F2);

        // left x pulley
        translate([+480/2+25,yoff+yoff2-20,zoff+z4])
        rotate([-90,-90,0])
        cylinder(r=5.0,h=10,$fn=F2);
    }
    hull(){
        // right x idler
        translate([-480/2+20,yoff+yoff2-20-1,zoff+z4+2.5])
        rotate([-90,-90,0])
        cylinder(r=6.1,h=12,$fn=F2);

        // left x pulley
        translate([+480/2+25,yoff+yoff2-20-1,zoff+z4])
        rotate([-90,-90,0])
        cylinder(r=3.5,h=12,$fn=F2);
    }
}

// left extruder
color("gray")
translate([+480/2-200,yoff+yoff2+5,zoff+60])
rotate([90,0,180])
import("aqua5.stl");
// left emotor
color("gray")
translate([+480/2-200+67,yoff+yoff2-57,zoff+77])
rotate([90,-90,180])
emotor();

// right extruder
color("blue")
translate([+480/2-200,yoff+yoff2+5,zoff+60])
rotate([90,0,180])
mirror([1,0,0])
import("aqua5.stl");
// right emotor
color("blue")
translate([+480/2-335+67,yoff+yoff2-57,zoff+77])
rotate([90,-90,180])
emotor();



// ----- cyan ---------
if(0){
// Y motor
// ??? Where is center of belt when pulley is on shaft
color("cyan")
translate([47.3+10.0,-y2+42.3/2,zoff2-20])
rotate([-90,0,90])
xymotor();

// left Y rod
color("cyan")
translate([170/2,-330/2,zoff2])
rotate([-90,0,0])
cylinder(r=4,h=330,$fn=F2);

// right Y rod
color("cyan")
translate([-170/2,-330/2,zoff2])
rotate([-90,0,0])
cylinder(r=4,h=330,$fn=F2);

// y rod lm8u bearing left
color("cyan")
translate([170/2,0,zoff2])
rotate([-90,0,0])
cylinder(r=15/2,h=24,$fn=F2);

// y rod lm8u bearing right front
color("cyan")
translate([-170/2,70/2,zoff2])
rotate([-90,0,0])
cylinder(r=15/2,h=24,$fn=F2);

// y rod lm8u bearing right rear
color("cyan")
translate([-170/2,-70/2,zoff2])
rotate([-90,0,0])
cylinder(r=15/2,h=24,$fn=F2);

// spider
#color("cyan")
translate([0,0,zoff2+8.4])
cube([227,222,6.2],center=true);

// hotbed
#color("cyan")
translate([0,0,zoff2+8.4+10.25])
cube([254,245,3.15],center=true);

}

//========================================
