// dusa1
// assembly level file for Prusa Dusa 3D printer

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <frame.scad>


//======================================
yoff=-(30+42.3/2); // tower offset from center
yoff2=30+42.3/2;   // offset of z motor, leadscrew, shaft
zoff=45-2;         // z offset of the y-rods

x1=480;         // length front, back, top rails
y1=330;         // length side rails
z1=380;         // height of towers

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
translate([x2-12,yoff+yoff2,15+42])
cylinder(r=5,h=350,$fn=F2);

// left lm10u bearing upper
color("red")
translate([x2-12,yoff+yoff2,15+60])
cylinder(r=19.2/2,h=29,$fn=F2);

// left lm10u bearing lower
color("red")
translate([x2-12,yoff+yoff2,15+60+40])
cylinder(r=19.2/2,h=29,$fn=F2);

// ----- green ---------
// right z motor
color("green")
translate([-x2-12+42.4,yoff+yoff2,15])
zmotor();

// right z rod
color("green")
translate([-x2+12,yoff+yoff2,15+42])
cylinder(r=5,h=350,$fn=F2);

// right  lm10u bearing upper
color("green")
translate([-x2+12,yoff+yoff2,15+60])
cylinder(r=19.2/2,h=29,$fn=F2);

// right  lm10u bearing lower
color("green")
translate([-x2+12,yoff+yoff2,15+60+40])
cylinder(r=19.2/2,h=29,$fn=F2);


// ----- cyan ---------
// Y motor
// ??? Where is center of belt when pulley is on shaft
color("cyan")
translate([47.3+10.0,-y2+42.3/2,zoff-20])
rotate([-90,0,90])
xymotor();

// left Y rod
color("cyan")
translate([170/2,-330/2,zoff])
rotate([-90,0,0])
cylinder(r=4,h=330,$fn=F2);

// right Y rod
color("cyan")
translate([-170/2,-330/2,zoff])
rotate([-90,0,0])
cylinder(r=4,h=330,$fn=F2);

// y rod lm8u bearing left
color("cyan")
translate([170/2,0,zoff])
rotate([-90,0,0])
cylinder(r=15/2,h=24,$fn=F2);

// y rod lm8u bearing right front
color("cyan")
translate([-170/2,70/2,zoff])
rotate([-90,0,0])
cylinder(r=15/2,h=24,$fn=F2);

// y rod lm8u bearing right rear
color("cyan")
translate([-170/2,-70/2,zoff])
rotate([-90,0,0])
cylinder(r=15/2,h=24,$fn=F2);

// spider
#color("cyan")
translate([0,0,zoff+8.4])
cube([227,222,6.2],center=true);

// hotbed
#color("cyan")
translate([0,0,zoff+8.4+10.25])
cube([254,245,3.15],center=true);

//-------orange-----------------

// upper x rod
color("orange")
translate([-480/2,yoff+yoff2-13,zoff+110])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);

// lower x rod
color("orange")
translate([-480/2,yoff+yoff2-13,zoff+25])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);

// left x motor
color("orange")
translate([-480/2-25,yoff+yoff2-70,zoff+50])
rotate([-90,-90,0])
xymotor();

// left x motor
color("orange")
translate([480/2+25,yoff+yoff2-70,zoff+50+30])
rotate([-90,-90,0])
xymotor();



//========================================
