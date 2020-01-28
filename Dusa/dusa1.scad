// dusa1
// assembly level file for Prusa Dusa 3D printer

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <frame.scad>


//======================================
yoff=-62;       // tower and top offset from center
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
translate([x2-30,yoff+30+21,15])
rotate([0,0,180])
zmotor();

// left z rod
color("red")
translate([x2-12,yoff+30+21,15+50])
cylinder(r=5,h=330,$fn=F2);

// lower left lm10u bearing
color("cyan")
translate([x2-12,yoff+30+21,15+60])
cylinder(r=19.2/2,h=29,$fn=F2);
// upper left lm10u bearing
color("cyan")
translate([x2-12,yoff+30+21,15+60+40])
cylinder(r=19.2/2,h=29,$fn=F2);

// right z motor
color("green")
translate([-x2-12+42.4,yoff+30+21,15])
zmotor();

// right z rod
color("green")
translate([-x2+12,yoff+30+21,15+50])
cylinder(r=5,h=330,$fn=F2);

// right left lm10u bearing
color("cyan")
translate([-x2+12,yoff+30+21,15+60])
cylinder(r=19.2/2,h=29,$fn=F2);
// right left lm10u bearing
color("cyan")
translate([-x2+12,yoff+30+21,15+60+40])
cylinder(r=19.2/2,h=29,$fn=F2);


// spare lm8u bearing
color("cyan")
translate([0,yoff+30+21,15+60])
cylinder(r=15/2,h=24,$fn=F2);


//========================================
