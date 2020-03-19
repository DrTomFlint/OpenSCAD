// dusa2
// This copy of dusa1 made 14 Feb 2020 for animation tests

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <../Parts/switch.scad>
use <frame.scad>
use <zaxis.scad>
use <xends2.scad>
use <yaxis.scad>
use <y-belt-holder.scad>

//======================================
// Customizer Values:
// These must be at the top of the main file, cannot contain any
// computations, and should have a comment above to provide text

// Height of x rods, +47, +304
High0=200;        

// Left extruder position, +151, +398
LeftX0=151; 

// Right extruder position, +82, +329
RightX0=329;

// Bed position, +107 -107
Bed0=107;

// Show frame
frameOn=0;

// Show top z brackets
tops=1;  

// Show xz
xzOn=0;

// Show extruders
extruders=0;

// Show ybed 
ybed=1;    

// Length front, back, top rail
x1=480;         

// Length side rails
y1=330;      

// Length of towers 
z1=380;       

// Center to Tower 
ytower=-50; 

// Center to z-axis
ytoz=7.2;

// Tower to Z-axis, >0
ybracket=6;            

// Height of z rods
zoff2=43;   

// Distance zrod to zscrew
xrodscrew=26;     

// Offset of zscrew
zscrew = -7;

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
function ease(t) = (
    t < .5
        ? 2 * pow(t, 2)
        : -1 + (4 - 2 * t) * t
);

//------------------------------
// Computed values based on parameters
zmotor2=zmotor1+zmotorD;

x2=x1/2;
y2=y1/2;
F2=88;

//================================================

// zoom in
//$vpt = [-0.63, -70, 155];
//$vpr = [71, 0, 203];
//$vpd = 10000-(ease($t)*8000);

// spin around once in place, ending at angle 180
//$vpt = [-0.63, -70, 155];
//$vpr = [71, 0, 203-383*ease($t)];
//$vpd = 2000;

// move z from 150 to 300, comment out High0 in params to use this
//$vpt = [-0.63, -70, 155];
//$vpr = [71, 0, 180];
//$vpd = 2000;
//High0=150+150*ease($t);

// move z from 300 to 65 comment out High0 in params to use this
//$vpt = [-0.63, -70, 155];
//$vpr = [71, 0, 180];
//$vpd = 2000;
//High0=300-235*ease($t);

// move z from 65 to 150 comment out High0 in params to use this
//$vpt = [-0.63, -70, 155];
//$vpr = [71, 0, 180];
//$vpd = 2000;
//High0=65+85*ease($t);

// move left extruder from 151 to 398 comment out LeftX0 in params to use this
//$vpt = [-0.63, -70, 155];
//$vpr = [71, 0, 180];
//$vpd = 2000;
//LeftX0=151+247*ease($t);

// move left extruder from 398 to 151 comment out LeftX0 in params to use this
//$vpt = [-0.63, -70, 155];
//$vpr = [71, 0, 180];
//$vpd = 2000;
//LeftX0=398-247*ease($t);

// move left extruder from 329 to 82 comment out RightX0 in params to use this
//$vpt = [-0.63, -70, 155];
//$vpr = [71, 0, 180];
//$vpd = 2000;
//RightX0=329-246*ease($t);

// move left extruder from 82 to 329comment out RightX0 in params to use this
//$vpt = [-0.63, -70, 155];
//$vpr = [71, 0, 180];
//$vpd = 2000;
//RightX0=82+246*ease($t);

// 95, -119
// move bed from 0 to 95 comment out Bed0 in params to use this
//$vpt = [-0.63, -70, 155];
//$vpr = [71, 0, 180];
//$vpd = 2000;
//Bed0=0+95*ease($t);

// move bed from 95 to -119 comment out Bed0 in params to use this
//$vpt = [-0.63, -70, 155];
//$vpr = [71, 0, 180];
//$vpd = 2000;
//Bed0=95-214*ease($t);

// move bed from -119 to 0 comment out Bed0 in params to use this
//$vpt = [-0.63, -70, 155];
//$vpr = [71, 0, 180];
//$vpd = 2000;
//Bed0=-119+119*ease($t);

// rotate to show bottom side, angleX +71 to +180
//$vpt = [-0.63, -70, 155];
//$vpr = [71+109*ease($t), 0, 180];
//$vpd = 2000;

// screw out
//$vpt = [-0.63, -70, 155];
//$vpr = [180, 0, 180-5*360*ease($t)];
//$vpd = 2000+18000*ease($t);

//=================================================

// main frame
if(frameOn==1){
frame(yoff=ytower,x1=x1,y1=y1,z1=z1);
}

if(xzOn){
        
translate([0,ytoz,High0-150])
xleft1();

translate([0,ytoz,High0-150])
xright1();

//----------- red-----------
// left z motor
color("red")
translate([x2-30+zscrew,ytoz,15])
rotate([0,0,180])
zmotor();

// left z rod
color("red")
translate([x2-30+zscrew+xrodscrew,ytoz,15+42])
cylinder(r=5,h=350,$fn=F2);

// left lm10u bearing lower
color("red")
translate([x2-30+zscrew+xrodscrew,ytoz,High0+20])
cylinder(r=19.2/2,h=29,$fn=F2);

// left lm10u bearing upper
color("red")
translate([x2-30+zscrew+xrodscrew,ytoz,High0+60])
cylinder(r=19.2/2,h=29,$fn=F2);

// left znut
color("red")
translate([x2-30+zscrew,ytoz,High0+90-1])
rotate([180,0,0])
znut();

// left z-motor bracket lower
color("pink")
translate([x2-30,ytoz,15])
zleft1(yoff3=ybracket,x1=zscrew,x3=xrodscrew+zscrew);

if(tops==1){
// left z bracket upper
color("pink")
translate([x2-30,ytoz,15])
zleft2(yoff3=ybracket,x1=zscrew,x3=xrodscrew+zscrew);
}

// ----- green ---------
// right z motor
color("green")
translate([-x2+30-zscrew,ytoz,15])
zmotor();

// right z rod
color("green")
translate([-x2+30-zscrew-xrodscrew,ytoz,15+42])
cylinder(r=5,h=350,$fn=F2);

// right  lm10u bearing lower
color("green")
translate([-x2+30-zscrew-xrodscrew,ytoz,High0+20])
cylinder(r=19.2/2,h=29,$fn=F2);

// right  lm10u bearing upper
color("green")
translate([-x2+30-zscrew-xrodscrew,ytoz,High0+60])
cylinder(r=19.2/2,h=29,$fn=F2);

// right znut
color("green")
translate([-x2+30-zscrew,ytoz,High0+90-1])
rotate([180,ytoz,0])
znut();

// right z-motor bracket 
color("pink")
translate([-x2+30,ytoz,15])
mirror([1,0,0])
zleft1(yoff3=ybracket,x1=zscrew,x3=xrodscrew+zscrew);


// right z bracket upper
if(tops==1){
    color("pink")
    translate([-x2+30,ytoz,15])
    //mirror([1,0,0])
    zright2(yoff3=ybracket,x1=zscrew,x3=xrodscrew+zscrew);
}

//-------orange-----------------

// upper x rod
color("orange")
translate([-480/2,ytoz+16,High0+zmotor1+34])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);

// lower x rod
color("orange")
translate([-480/2,ytoz+16,High0+30])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);

// right x motor
color("blue")
translate([-480/2+30+xmot0,ytoz+76,High0+zmotor2])
rotate([90,90,0])
xymotor();

// right x motor pulley
color("orange")
translate([-480/2+30+xmot0,ytoz+24,High0+zmotor2])
rotate([90,90,0])
pulley();

// idler
color("orange")
translate([-480/2+30+xmot0,ytoz+24-5,High0+zmotor1+1.5])
rotate([90,90,0])
idler();

// belt upper right
color("blue")
difference(){
    hull(){ // outer
        // pulley
        translate([-480/2+30+xmot0,ytoz+17-5,High0+zmotor2])
        rotate([-90,-90,0])
        cylinder(r=11.3/2,h=6,$fn=F2);

        // idler
        translate([480/2-30-xmot0,ytoz+17-5,High0+zmotor2-1.5])
        rotate([-90,-90,0])
        cylinder(r=14.8/2,h=6,$fn=F2);
    }
    hull(){  // inner
        // pulley
        translate([-480/2+30+xmot0,ytoz+17-1-5,High0+zmotor2])
        rotate([-90,-90,0])
        cylinder(r=11.3/2-1.4,h=8,$fn=F2);

        // idler
        translate([480/2-30-xmot0,ytoz+17-1-5,High0+zmotor2-1.5])
        rotate([-90,-90,0])
        cylinder(r=14.8/2-1.4,h=8,$fn=F2);
    }
}

// left x motor
color("gray")
translate([480/2-30-xmot0,ytoz+76,High0+zmotor1])
rotate([90,90,0])
xymotor();

color("orange")
translate([480/2-30-xmot0,ytoz+24,High0+zmotor1])
rotate([90,90,0])
pulley();

color("orange")
translate([480/2-30-xmot0,ytoz+24-5,High0+zmotor2-1.5])
rotate([90,90,0])
idler();

// belt
color("gray")
difference(){
    hull(){  // outer
        // right x idler
        translate([-480/2+30+xmot0,ytoz+17-5,High0+zmotor1+1.5])
        rotate([-90,-90,0])
        cylinder(r=14.8/2,h=6,$fn=F2);

        // left x pulley
        translate([+480/2-30-xmot0,ytoz+17-5,High0+zmotor1])
        rotate([-90,-90,0])
        cylinder(r=11.3/2,h=6,$fn=F2);
    }
    hull(){
        // right x idler
        translate([-480/2+30+xmot0,ytoz+17-1-5,High0+zmotor1+1.5])
        rotate([-90,-90,0])
        cylinder(r=14.8/2-1.4,h=8,$fn=F2);

        // left x pulley
        translate([+480/2-30-xmot0,ytoz+17-1-5,High0+zmotor1])
        rotate([-90,-90,0])
        cylinder(r=11.3/2-1.4,h=8,$fn=F2);
    }
}


} // end of if xzOn

//------------------ extruders -------------------------

if(extruders){
// left extruder
color("gray")
translate([+480/2-LeftX0,ytoz+4,High0+26])
rotate([90,0,180])
import("aqua5.stl");
// left emotor
color("gray")
translate([+480/2-LeftX0+67,ytoz-55,High0+44])
rotate([90,-90,180])
emotor();
// Add a screw head for clearance check
color("pink")
translate([+480/2-LeftX0+95,ytoz-22.5,High0+80])
rotate([90,-90,180])
cylinder(r=6.8/2,h=4);


// x rod lm8u bearing low
color("gray")
translate([+480/2-LeftX0+79,ytoz+16,High0+30])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-LeftX0+80+18,ytoz+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-LeftX0+80-18,ytoz+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// right extruder
color("blue")
translate([+480/2-RightX0,ytoz+4,High0+26])
rotate([90,0,180])
mirror([1,0,0])
import("aqua5.stl");
// right emotor
color("blue")
translate([+480/2-RightX0-68,ytoz-55,High0+44])
rotate([90,-90,180])
emotor();

// x rod lm8u bearing low
color("blue")
translate([+480/2-RightX0-56,ytoz+16,High0+30])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("blue")
translate([+480/2-RightX0-56+18,ytoz+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("blue")
translate([+480/2-RightX0-56-18,ytoz+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

} // end extruders

// ---------------- Y Bed ------------------
if(ybed){
// Y motor
color("cyan")
translate([47.3+16.0,-y2+42.3/2,zoff2-20])
rotate([-90,0,90])
xymotor();

// Y pulley
color("orange")
translate([9.5,-y2+42.3/2,zoff2-20])
rotate([-90,0,90])
pulley();

// Y motor bracket
translate([3,0,0])
ymotorbracket();

// Y endstop switch
if(1){
color("red")
translate([-26,-y2+50,zoff2-5])
rotate([0,0,-90])
switch(ang1=0);

color("cyan")
translate([-26,-y2+50,zoff2-5])
rotate([0,0,-90])
switch(ang1=16);
}

// Y switch bracket
color("pink")
translate([0,0,0])
rotate([0,0,-0])
yswitchbracket();

// y axis idler
if(0){
zaxle1=26.5;
yidlebracket(zaxle=zaxle1);

color("orange")
translate([-4.5,330/2-11,zaxle1])
rotate([0,90,0])
idler();
}

// belt holder
translate([0,Bed0,-4.2])
y_belt_holder();


// Belt
if(0){
color("gray")
difference(){
hull(){
        translate([0,-y2+42.3/2,zoff2-20])
        rotate([-90,0,90])
        cylinder(r=11/2,h=6,$fn=22,center=true);

        translate([-1.25,330/2-11,zaxle1])
        rotate([0,90,0])
        cylinder(r=14/2,h=6,$fn=22,center=true);
}
hull(){
        translate([0,-y2+42.3/2,zoff2-20])
        rotate([-90,0,90])
        cylinder(r=9/2,h=7,$fn=22,center=true);

        translate([-1.25,330/2-11,zaxle1])
        rotate([0,90,0])
        cylinder(r=12/2,h=7,$fn=22,center=true);
}
}
}


//------------------- Y rods and supports -----------------
if(1){
// left Y rod
color("cyan")
translate([170/2,-330/2,zoff2])
rotate([-90,0,0])
cylinder(r=4,h=330,$fn=F2);

// left rear
ybar1();

// right rear
translate([-170,0,0])
ybar1();

// left front
translate([170,0,0])
rotate([0,0,180])
ybar1();

// right front
rotate([0,0,180])
ybar1();

// right Y rod
color("cyan")
translate([-170/2,-330/2,zoff2])
rotate([-90,0,0])
cylinder(r=4,h=330,$fn=F2);

// y rod lm8u bearing left
color("cyan")
translate([170/2,Bed0,zoff2])
rotate([-90,0,0])
cylinder(r=15/2,h=24,$fn=F2,center=true);

// y rod lm8u bearing right front
color("cyan")
translate([-170/2,70/2+Bed0,zoff2])
rotate([-90,0,0])
cylinder(r=15/2,h=24,$fn=F2,center=true);

// y rod lm8u bearing right rear
color("cyan")
translate([-170/2,-70/2+Bed0,zoff2])
rotate([-90,0,0])
cylinder(r=15/2,h=24,$fn=F2,center=true);
}

if(0){
// spider
color("cyan")
translate([0,Bed0,zoff2+8.4])
cube([227,222,6.2],center=true);

// hotbed
color("cyan")
translate([0,Bed0,zoff2+8.4+10.25])
cube([254,245,3.15],center=true);
}

}

//========================================
