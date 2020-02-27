// xcarriage
// x motor attachments

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <frame.scad>
use <zaxis.scad>
use <xends2.scad>

// repeat params from dusa1.scad

// Height of x rods, 62-304
High0=150;        

// Left extruder position, 150+
LeftX0=150; 

// Right extruder position, 82+
RightX0=82+50;

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
// main block for the x carriages extruder mounts
// this should contain only parts common to both left and right
// carriages
module xmain1(

){

  difference(){
  union(){
    // leg to extruder
    color("orange")
    translate([+480/2-LeftX0+36,-11,High0+31])
    cube([10,22,18]);

    // leg to extruder
    color("pink")
    translate([+480/2-LeftX0+36+53,-11,High0+31])
    cube([10,22,18]);

    // leg to extruder
    color("red")
    translate([+480/2-LeftX0+36,-11,High0+85])
    cube([14,22,11]);

    // leg to extruder
    color("green")
    translate([+480/2-LeftX0+36+49,-11,High0+85])
    cube([14,22,11]);

    // top block
    color("cyan")
    translate([+480/2-LeftX0+36,8,High0+72-50])
    cube([63,18,74]);
  }

    // extruder mounting, M4x12,14,16,18 in stock
    translate([+480/2-LeftX0+41.1,-25,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);
    translate([+480/2-LeftX0+41.1+53,-25,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);
    translate([+480/2-LeftX0+41.1,-25,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);
    translate([+480/2-LeftX0+41.1+53,-25,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);
  
    // countersink, M4 heads are 4.2 high, 7 diam
    translate([+480/2-LeftX0+41.1,0,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=4,h=30,$fn=44);
    translate([+480/2-LeftX0+41.1+53,0,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=4,h=30,$fn=44);
    translate([+480/2-LeftX0+41.1,0,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=4,h=30,$fn=44);
    translate([+480/2-LeftX0+41.1+53,0,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=4,h=30,$fn=44);
  

    // Four cuts to make lips that extruder sits on
    color("red")
    translate([+480/2-LeftX0+35,-12,High0+32])
    cube([12,2,18]);
    color("red")
    translate([+480/2-LeftX0+35+53,-12,High0+32])
    cube([12,2,18]);
    color("orange")
    translate([+480/2-LeftX0+35,-12,High0+84])
    cube([16,2,11]);
    color("orange")
    translate([+480/2-LeftX0+35+49,-12,High0+84])
    cube([16,2,11]);
  
    // cut for belts
    color("green")
    translate([+480/2-LeftX0+31,10,High0+72-35])
    cube([73,10,35]);

    // belt attach access 
    color("green")
    translate([+480/2-LeftX0+47,10,High0+72-35])
    cube([40,30,35]);


} // end diff

  

}



//==============================================

xmain1();

if(1){
// left extruder
color("gray")
translate([+480/2-LeftX0,0+4,High0+26+10])
rotate([90,0,180])
import("aqua5.stl");
}

if(0){
// left emotor
color("orange")
translate([+480/2-LeftX0+67,0-55-2.5,High0+44+10])
rotate([90,-90,180])
emotor();
}

// x rod lm8u bearing low
color("gray")
translate([+480/2-LeftX0+79,0+16,High0+30])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-LeftX0+80+12.1,0+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-LeftX0+80-12.1,0+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);


// main frame
if(0){
frame(yoff=ytower,x1=x1,y1=y1,z1=z1);
}


//translate([0,0,High0-150])
//xleft1();

// left x motor
if(0){
color("gray")
translate([480/2-30-xmot0,0+76,High0+zmotor1])
rotate([90,90,0])
xymotor();
}

color("pink")
translate([480/2-30-xmot0,0+24,High0+zmotor1])
rotate([90,90,0])
pulley();

color("yellow")
translate([480/2-30-xmot0,0+24-5,High0+zmotor2-1.5])
rotate([90,90,0])
idler();

//translate([0,0,High0-150])
//xright1();


// right x motor
if(0){
color("blue")
translate([-480/2+30+xmot0,0+76,High0+zmotor2])
rotate([90,90,0])
xymotor();
}

// right x motor pulley
color("orange")
translate([-480/2+30+xmot0,0+24,High0+zmotor2])
rotate([90,90,0])
pulley();

color("orange")
translate([-480/2+30+xmot0,0+24-5,High0+zmotor1+1.5])
rotate([90,90,0])
idler();



// belt upper right
color("blue")
difference(){
    hull(){ // outer
        // pulley
        translate([-480/2+30+xmot0,0+17-5,High0+zmotor2])
        rotate([-90,-90,0])
        cylinder(r=11.3/2,h=6,$fn=F2);

        // idler
        translate([480/2-30-xmot0,0+17-5,High0+zmotor2-1.5])
        rotate([-90,-90,0])
        cylinder(r=14.8/2,h=6,$fn=F2);
    }
    hull(){  // inner
        // pulley
        translate([-480/2+30+xmot0,0+17-1-5,High0+zmotor2])
        rotate([-90,-90,0])
        cylinder(r=11.3/2-1.4,h=8,$fn=F2);

        // idler
        translate([480/2-30-xmot0,0+17-1-5,High0+zmotor2-1.5])
        rotate([-90,-90,0])
        cylinder(r=14.8/2-1.4,h=8,$fn=F2);
    }
}

// belt lower left
color("gray")
difference(){
    hull(){  // outer
        // right x idler
        translate([-480/2+30+xmot0,0+17-5,High0+zmotor1+1.5])
        rotate([-90,-90,0])
        cylinder(r=14.8/2,h=6,$fn=F2);

        // left x pulley
        translate([+480/2-30-xmot0,0+17-5,High0+zmotor1])
        rotate([-90,-90,0])
        cylinder(r=11.3/2,h=6,$fn=F2);
    }
    hull(){
        // right x idler
        translate([-480/2+30+xmot0,0+17-1-5,High0+zmotor1+1.5])
        rotate([-90,-90,0])
        cylinder(r=14.8/2-1.4,h=8,$fn=F2);

        // left x pulley
        translate([+480/2-30-xmot0,0+17-1-5,High0+zmotor1])
        rotate([-90,-90,0])
        cylinder(r=11.3/2-1.4,h=8,$fn=F2);
    }
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
}


if(0){
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
}


//===============================================


