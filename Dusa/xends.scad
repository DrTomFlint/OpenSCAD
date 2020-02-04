// xends
// x motor attachments

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <frame.scad>
use <zaxis.scad>

// repeat params from dusa1.scad

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
xrodscrew=26;     

// Offset of zscrew
zscrew = -7;

// Height of bottom x motor
zmotor1=45;    

// Delta between x motors
zmotorD=19;    

// Offset x motors from center of towers
xmot0=-2;

//---------------------------------
// Computed values based on parameters
zmotor2=zmotor1+zmotorD;

x2=x1/2;
y2=y1/2;
F2=88;


//------------------------------------------------------
module xleft1(



){
  
difference(){
// boss
translate([x2-50,-13,High0+18])
minkowski() {
  difference(){
    cube([50,40,69]);    
    translate([-1,-1,-1])
    cube([29,22,51]);
}

  sphere(r=2,$fs=0.2);
}

// cut for left z rod plus clearance
translate([x2-30+zscrew+xrodscrew,0,15+42])
cylinder(r=5.2,h=350,$fn=F2);

// cut for left lm10u bearing lower plus clearance
translate([x2-30+zscrew+xrodscrew,0,High0+16])
cylinder(r=19.2/2+0.05,h=29,$fn=F2);

// cut for left lm10u bearing upper plus clearance
translate([x2-30+zscrew+xrodscrew,0,High0+60])
cylinder(r=19.2/2+0.05,h=29,$fn=F2);

// strain relief cut for M10 and bearings
translate([x2-30+zscrew+xrodscrew-0.5,-18,High0+16])
cube([1,15,80]);

// cut left znut
color("red")
translate([x2-30+zscrew,0,High0+90-1])
rotate([180,0,0])
znut(holes=0,tol=0.05);

// clearance for left znut
color("red")
translate([x2-30+zscrew,0,High0+90-1])
rotate([180,0,0])
cylinder(r=11.1,h=4,$fn=F2);

// cut left znut top clearance
color("red")
translate([x2-30+zscrew,0,High0+90-1])
rotate([180,0,0])
cylinder(r=10,h=4,$fn=F2);

// cut for znut mounting screws M3x20
translate([x2-30+zscrew,0,High0+90-1])
rotate([180,0,0]){
  translate([7.75,0,0])
  cylinder(r=1.5,h=20,$fn=F2);
  translate([-7.75,0,0])
  cylinder(r=1.5,h=20,$fn=F2);
}

// cut for M3x29 screw heads
color("pink")
translate([x2-30+zscrew,0,High0+90-21])
rotate([180,0,0]){
  translate([7.75,0,0])
  cylinder(r=4.5/2,h=3,$fn=F2);
  translate([-7.75,0,0])
  cylinder(r=4.5/2,h=3,$fn=F2);
}

// cut left z screw
translate([x2-30+zscrew,0,15])
rotate([0,0,180])
zmotor(tol=0.15);

// cut for upper x rod plus clearance
translate([-480/2,0+16,High0+zmotor1+34])
rotate([0,90,0])
cylinder(r=4+0.05,h=480,$fn=F2);

// check hole for upper x rod
translate([480/2-2.25,33,High0+zmotor1+34])
rotate([90,30,0])
cylinder(r=3,h=15,$fn=6);

// cut for lower x rod plus clearance
translate([-480/2,0+16,High0+30])
rotate([0,90,0])
cylinder(r=4+0.05,h=480,$fn=F2);

// check hole for lower x rod
translate([480/2-2.25,33,High0+30])
rotate([90,30,0])
cylinder(r=3,h=15,$fn=6);


// cut for left x motor
translate([480/2-30-xmot0,0+76,High0+zmotor1])
rotate([90,90,0])
xymotor(tol=0.15);

// cut for left x motor shaft
translate([480/2-30-xmot0,20,High0+zmotor1])
rotate([90,90,0])
cylinder(r=3,h=20,$fn=F2);

F3=22;

translate([-480/2-30-xmot0,65,High0+zmotor1])
rotate([90,0,0]){
    // x motor mounting holes,
    translate([15.5+x1,15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([-15.5+x1,15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([15.5+x1,-15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([-15.5+x1,-15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);

    // countersink for the heads
    translate([15.5+x1,15.5,41])
    cylinder(r=2.8,h=40,$fn=F3);
    translate([-15.5+x1,15.5,41])
    cylinder(r=2.8,h=40,$fn=F3);
    translate([15.5+x1,-15.5,41])
    cylinder(r=2.8,h=40,$fn=F3);
    translate([-15.5+x1,-15.5,41])
    cylinder(r=2.8,h=40,$fn=F3);
}


// main cut for belt, pulley, and idler
color("cyan")
translate([480/2-80,0+9.5,High0+37])
cube([90,9.5,37]);

// 
color("cyan")
translate([480/2-80,14.25,High0+39])
rotate([0,90,0])
scale([0.9,1,1])
cylinder(r=9.5/2,h=90,$fn=F2);

// clearance for pulley
translate([480/2-30-xmot0,9.5,High0+zmotor1])
rotate([-90,90,0])
cylinder(r=8,h=20,$fn=F2);

// idler attachment M3x20 screw
translate([480/2-30-xmot0,25,High0+zmotor2])
rotate([90,90,0])
cylinder(r=1.55,h=20,$fn=F2);
// M3x30 head
translate([480/2-30-xmot0,29,High0+zmotor2])
rotate([90,90,0])
cylinder(r=2.8,h=5,$fn=F2);
// M3 nut clearance
translate([480/2-30-xmot0,6,High0+zmotor2])
rotate([90,90,0])
cylinder(r=4,h=3.5,$fn=F2);


}// end diff


if(0){
// M3x20 screws for Z-nut
color("pink")
translate([x2-30+zscrew,0,High0+90-21])
rotate([180,0,0]){
  translate([7.75,0,0])
  cylinder(r=4.5/2,h=3,$fn=F2);
  translate([-7.75,0,0])
  cylinder(r=4.5/2,h=3,$fn=F2);
}
}


}

//=======================================================

 //xleft1();


// This is a printing support
translate([x2-30+zscrew+xrodscrew,0,High0+60-3])
cylinder(r=19.2/2-2,h=32,$fn=12);



if(0){
  // left x motor
  color("gray")
  translate([480/2-30-xmot0,0+76,High0+zmotor1])
  rotate([90,90,0])
  xymotor();
}
if(0){

  color("pink")
  translate([480/2-30-xmot0,0+24,High0+zmotor1])
  rotate([90,90,0])
  pulley();

  color("orange")
  translate([480/2-30-xmot0,0+24-5,High0+zmotor2])
  rotate([90,90,0])
  idler();
}

if(0){
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
}

if(0){
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
translate([-x2+30-zscrew,0,High0+90-1])
rotate([180,0,0])
znut();

//-------orange-----------------

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

}


//===============================================
