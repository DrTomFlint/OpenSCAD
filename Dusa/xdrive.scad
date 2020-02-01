// xdrive
// submodel to generate plastic

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <frame.scad>
use <zaxis.scad>


//======================================
yoff3=6;               // tower to z-axis distance
yoff=-(30+42.3/2+yoff3); // tower offset from center
yoff2=30+42.3/2+yoff3;   // offset of z motor, leadscrew, shaft
zoff=62;         // z offset of the x-rods
zoff2=43;           // z offset of y=rods

x1=480;         // length front, back, top rails
y1=330;         // length side rails
z1=380;         // height of towers

x3=25;      // distance zrod to zscrew
z3=20;      // distance between x motors

z4=45;     // height of motors and belts

x2=x1/2;
y2=y1/2;
F2=88;

//-------------------

// boss
// lm10u cover
color("pink")
translate([x2-30+x3,yoff+yoff2,zoff+16])
cylinder(r=11,h=73,$fn=F2);

// left znut
color("pink")
translate([x2-30,yoff+yoff2,zoff+90])
rotate([180,0,0])
znut();



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
translate([x2-30+x3,yoff+yoff2,zoff+16])
cylinder(r=19.2/2,h=29,$fn=F2);

// left lm10u bearing upper
color("red")
translate([x2-30+x3,yoff+yoff2,zoff+60])
cylinder(r=19.2/2,h=29,$fn=F2);

// left znut
color("red")
translate([x2-30,yoff+yoff2,zoff+90])
rotate([180,0,0])
znut();

// left z-motor bracket lower
color("pink")
translate([x2-30,yoff+yoff2,15])
zleft1(yoff3=yoff3);


// left z bracket upper
color("pink")
translate([x2-30,yoff+yoff2,15])
zleft2(yoff3=yoff3);

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
translate([-x2+30-x3,yoff+yoff2,zoff+16])
cylinder(r=19.2/2,h=29,$fn=F2);

// right  lm10u bearing upper
color("green")
translate([-x2+30-x3,yoff+yoff2,zoff+60])
cylinder(r=19.2/2,h=29,$fn=F2);

// right znut
color("green")
translate([-x2+30,yoff+yoff2,zoff+90])
rotate([180,0,0])
znut();

// right z-motor bracket 
color("pink")
translate([-x2+30,yoff+yoff2,15])
mirror([1,0,0])
zleft1(yoff3=yoff3);


// right z bracket upper
color("pink")
translate([-x2+30,yoff+yoff2,15])
mirror([1,0,0])
zleft2(yoff3=yoff3);



//-------orange-----------------

// upper x rod
color("orange")
translate([-480/2,yoff+yoff2+14,zoff+z4+32])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);

// lower x rod
color("orange")
translate([-480/2,yoff+yoff2+14,zoff+30])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);

// right x motor
z5=z4+15;
color("blue")
translate([-480/2-25,yoff+yoff2-40,zoff+z5])
rotate([90,90,180])
xymotor();

color("blue")
difference(){
    hull(){
        // pulley
        translate([-480/2-25,yoff+yoff2+10,zoff+z5])
        rotate([-90,-90,0])
        cylinder(r=5.0,h=10,$fn=F2);

        // idler
        translate([480/2-20,yoff+yoff2+10,zoff+z5])
        rotate([-90,-90,0])
        cylinder(r=7.5,h=10,$fn=F2);
    }
    hull(){
        // pulley
        translate([-480/2-25,yoff+yoff2+10-1,zoff+z5])
        rotate([-90,-90,0])
        cylinder(r=3.5,h=12,$fn=F2);

        // idler
        translate([480/2-20,yoff+yoff2+10-1,zoff+z5])
        rotate([-90,-90,0])
        cylinder(r=6.0,h=12,$fn=F2);
    }
}

// left x motor
color("gray")
translate([480/2+25,yoff+yoff2-40,zoff+z4])
rotate([90,90,180])
xymotor();

color("gray")
difference(){
    hull(){
        // right x idler
        translate([-480/2+20,yoff+yoff2+10,zoff+z4])
        rotate([-90,-90,0])
        cylinder(r=7.5,h=10,$fn=F2);

        // left x pulley
        translate([+480/2+25,yoff+yoff2+10,zoff+z4])
        rotate([-90,-90,0])
        cylinder(r=5.0,h=10,$fn=F2);
    }
    hull(){
        // right x idler
        translate([-480/2+20,yoff+yoff2+10-1,zoff+z4])
        rotate([-90,-90,0])
        cylinder(r=6.1,h=12,$fn=F2);

        // left x pulley
        translate([+480/2+25,yoff+yoff2+10-1,zoff+z4])
        rotate([-90,-90,0])
        cylinder(r=3.5,h=12,$fn=F2);
    }
}

// left extruder
xextL=150;
color("gray")
translate([+480/2-xextL,yoff+yoff2+2,zoff+26])
rotate([90,0,180])
import("aqua5.stl");
// left emotor
color("gray")
translate([+480/2-xextL+67,yoff+yoff2-57,zoff+44])
rotate([90,-90,180])
emotor();
// Add a screw head for clearance check
color("pink")
translate([+480/2-xextL+95,yoff+yoff2-24.5,zoff+80])
rotate([90,-90,180])
cylinder(r=6.8/2,h=4);


// x rod lm8u bearing low
color("gray")
translate([+480/2-xextL+79,yoff+yoff2+14,zoff+30])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-xextL+80+18,yoff+yoff2+14,zoff+z4+32])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-xextL+80-18,yoff+yoff2+14,zoff+z4+32])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);


xextR=82;
// right extruder
color("blue")
translate([+480/2-xextR,yoff+yoff2+2,zoff+26])
rotate([90,0,180])
mirror([1,0,0])
import("aqua5.stl");
// right emotor
color("blue")
translate([+480/2-xextR-68,yoff+yoff2-57,zoff+44])
rotate([90,-90,180])
emotor();

// x rod lm8u bearing low
color("blue")
translate([+480/2-xextR-56,yoff+yoff2+14,zoff+30])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("blue")
translate([+480/2-xextR-56+18,yoff+yoff2+14,zoff+z4+32])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("blue")
translate([+480/2-xextR-56-18,yoff+yoff2+14,zoff+z4+32])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);



//========================================
