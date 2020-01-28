// dusa1
// assembly level file for Prusa Dusa 3D printer

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <frame.scad>


//======================================
yoff=-62;       // tower and top offset from center
yoff2=0;        // offset of z motor, leadscrew, shaft
zoff=50;        // z offset of the y-rods

x1=480;         // length front, back, top rails
y1=330;         // length side rails
z1=380;         // height of towers


x2=x1/2;
y2=y1/2;
F2=88;

// main frame
frame(yoff=yoff,x1=x1,y1=y1,z1=z1);

// left z motor
color("red")
translate([x2-30,yoff+30+21+yoff2,15])
rotate([0,0,180])
zmotor();

// left z rod
color("red")
translate([x2-12,yoff+30+21+yoff2,15+42])
cylinder(r=5,h=350,$fn=F2);

// lower left lm10u bearing
color("cyan")
translate([x2-12,yoff+30+21+yoff2,15+60])
cylinder(r=19.2/2,h=29,$fn=F2);
// upper left lm10u bearing
color("cyan")
translate([x2-12,yoff+30+21+yoff2,15+60+40])
cylinder(r=19.2/2,h=29,$fn=F2);

// right z motor
color("green")
translate([-x2-12+42.4,yoff+30+21+yoff2,15])
zmotor();

// right z rod
color("green")
translate([-x2+12,yoff+30+21+yoff2,15+42])
cylinder(r=5,h=350,$fn=F2);

// right left lm10u bearing
color("cyan")
translate([-x2+12,yoff+30+21+yoff2,15+60])
cylinder(r=19.2/2,h=29,$fn=F2);
// right left lm10u bearing
color("cyan")
translate([-x2+12,yoff+30+21+yoff2,15+60+40])
cylinder(r=19.2/2,h=29,$fn=F2);


// Y motor
// ??? Where is center of belt when pulley is on shaft
color("cyan")
translate([47.3+10.0,-y2+42.3/2,30])
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






//========================================
