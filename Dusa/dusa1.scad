// dusa1
// assembly level file for Prusa Dusa 3D printer

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <frame.scad>
use <zaxis.scad>


//======================================
// Customizer Values:
// These must be at the top of the main file, cannot contain any
// computations, and should have a comment above to provide text

// Height of x rods, 62-304
High0=150;        

// Left extruder position, 150+
LeftX0=150; 

// Right extruder position, 82+
RightX0=82;

// Show frame
frameOn=1;

// Show top z brackets
tops=1;  

// Show ybed ------------------
ybed=1;    

// Length front, back, top rail
x1=480;         

// Length side rails
y1=330;      

// Length of towers -----------
z1=380;       

// Center to Tower 
ytower=-57.2; 

// Tower to Z-axis, >0
ybracket=6;            

// Height of z rods
zoff2=43;   

// Distance zrod to zscrew
xrodscrew=29;     

// Offset of zscrew
zscrew = -8;

// Height of bottom x motor
zmotor1=45;    

// Delta between x motors
zmotorD=19;    

// Offset x motors from center of towers
xmot0=-2;

//----------------------------------
// a module here to end the customizer section
module dummy(){
        }
//---------------------------------
// Computed values based on parameters
zmotor2=zmotor1+zmotorD;

x2=x1/2;
y2=y1/2;
F2=88;

//=================================================

// main frame
if(frameOn==1){
frame(yoff=ytower,x1=x1,y1=y1,z1=z1);
}

//----------- red-----------
// left z motor
color("red")
translate([x2-30+zscrew,0,15])
rotate([0,0,180])
zmotor();

// left z rod
color("red")
translate([x2-30+zscrew+xrodscrew,0,15+42])
cylinder(r=5,h=350,$fn=F2);

// left lm10u bearing lower
color("red")
translate([x2-30+zscrew+xrodscrew,0,High0+16])
cylinder(r=19.2/2,h=29,$fn=F2);

// left lm10u bearing upper
color("red")
translate([x2-30+zscrew+xrodscrew,0,High0+60])
cylinder(r=19.2/2,h=29,$fn=F2);

// left znut
color("red")
translate([x2-30+zscrew,0,High0+90])
rotate([180,0,0])
znut();

// left z-motor bracket lower
color("pink")
translate([x2-30,0,15])
zleft1(yoff3=ybracket,x1=zscrew,x3=xrodscrew+zscrew);

if(tops==1){
// left z bracket upper
color("pink")
translate([x2-30,0,15])
zleft2(yoff3=ybracket,x1=zscrew,x3=xrodscrew+zscrew);
}

// ----- green ---------
// right z motor
color("green")
translate([-x2+30-zscrew,0,15])
zmotor();

// right z rod
color("green")
translate([-x2+30-zscrew-xrodscrew,0,15+42])
cylinder(r=5,h=350,$fn=F2);

// right  lm10u bearing lower
color("green")
translate([-x2+30-zscrew-xrodscrew,0,High0+16])
cylinder(r=19.2/2,h=29,$fn=F2);

// right  lm10u bearing upper
color("green")
translate([-x2+30-zscrew-xrodscrew,0,High0+60])
cylinder(r=19.2/2,h=29,$fn=F2);

// right znut
color("green")
translate([-x2+30-zscrew,0,High0+90])
rotate([180,0,0])
znut();

// right z-motor bracket 
color("pink")
translate([-x2+30,0,15])
mirror([1,0,0])
zleft1(yoff3=ybracket,x1=zscrew,x3=xrodscrew+zscrew);


// right z bracket upper
if(tops==1){
    color("pink")
    translate([-x2+30,0,15])
    mirror([1,0,0])
    zleft2(yoff3=ybracket,x1=zscrew,x3=xrodscrew+zscrew);
}

//-------orange-----------------


// upper x rod
color("orange")
translate([-480/2,0+16,High0+zmotor1+34])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);

// lower x rod
color("orange")
translate([-480/2,0+16,High0+30])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);

// right x motor
color("blue")
translate([-480/2+30+xmot0,0+76,High0+zmotor2])
rotate([90,90,0])
xymotor();

// right x motor pulley
color("orange")
translate([-480/2+30+xmot0,0+24,High0+zmotor2])
rotate([90,90,0])
pulley();

color("orange")
translate([-480/2+30+xmot0,0+24,High0+zmotor1])
rotate([90,90,0])
idler();

// belt
color("blue")
difference(){
    hull(){
        // pulley
        translate([-480/2+30+xmot0,0+17,High0+zmotor2])
        rotate([-90,-90,0])
        cylinder(r=5.0,h=6,$fn=F2);

        // idler
        translate([480/2-30-xmot0,0+17,High0+zmotor2])
        rotate([-90,-90,0])
        cylinder(r=7.5,h=6,$fn=F2);
    }
    hull(){
        // pulley
        translate([-480/2+30+xmot0,0+17-1,High0+zmotor2])
        rotate([-90,-90,0])
        cylinder(r=3.5,h=8,$fn=F2);

        // idler
        translate([480/2-30-xmot0,0+17-1,High0+zmotor2])
        rotate([-90,-90,0])
        cylinder(r=6.0,h=8,$fn=F2);
    }
}

// left x motor
color("gray")
translate([480/2-30-xmot0,0+76,High0+zmotor1])
rotate([90,90,0])
xymotor();

color("orange")
translate([480/2-30-xmot0,0+24,High0+zmotor1])
rotate([90,90,0])
pulley();

color("orange")
translate([480/2-30-xmot0,0+24,High0+zmotor2])
rotate([90,90,0])
idler();

// belt
color("gray")
difference(){
    hull(){
        // right x idler
        translate([-480/2+30+xmot0,0+17,High0+zmotor1])
        rotate([-90,-90,0])
        cylinder(r=7.5,h=6,$fn=F2);

        // left x pulley
        translate([+480/2-30-xmot0,0+17,High0+zmotor1])
        rotate([-90,-90,0])
        cylinder(r=5.0,h=6,$fn=F2);
    }
    hull(){
        // right x idler
        translate([-480/2+30+xmot0,0+17-1,High0+zmotor1])
        rotate([-90,-90,0])
        cylinder(r=6.1,h=8,$fn=F2);

        // left x pulley
        translate([+480/2-30-xmot0,0+17-1,High0+zmotor1])
        rotate([-90,-90,0])
        cylinder(r=3.5,h=8,$fn=F2);
    }
}

// left extruder
color("gray")
translate([+480/2-LeftX0,0+4,High0+26])
rotate([90,0,180])
import("aqua5.stl");
// left emotor
color("gray")
translate([+480/2-LeftX0+67,0-55,High0+44])
rotate([90,-90,180])
emotor();
// Add a screw head for clearance check
color("pink")
translate([+480/2-LeftX0+95,0-22.5,High0+80])
rotate([90,-90,180])
cylinder(r=6.8/2,h=4);


// x rod lm8u bearing low
color("gray")
translate([+480/2-LeftX0+79,0+16,High0+30])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-LeftX0+80+18,0+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-LeftX0+80-18,0+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// right extruder
color("blue")
translate([+480/2-RightX0,0+4,High0+26])
rotate([90,0,180])
mirror([1,0,0])
import("aqua5.stl");
// right emotor
color("blue")
translate([+480/2-RightX0-68,0-55,High0+44])
rotate([90,-90,180])
emotor();

// x rod lm8u bearing low
color("blue")
translate([+480/2-RightX0-56,0+16,High0+30])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("blue")
translate([+480/2-RightX0-56+18,0+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("blue")
translate([+480/2-RightX0-56-18,0+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);



// ----- cyan ---------
if(ybed){
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
