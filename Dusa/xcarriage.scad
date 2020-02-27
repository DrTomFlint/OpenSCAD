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
X0=150
){

  difference(){
    
  // Boss  
  union(){

    // four legs to attach extruder
    translate([+480/2-X0+41.1,-9.4,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=5.5,h=26.4,$fn=44);    
    translate([+480/2-X0+41.1+53,-9.4,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=5.5,h=26.4,$fn=44);
    translate([+480/2-X0+41.1,-9.4,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=5.5,h=26.4,$fn=44);
    translate([+480/2-X0+41.1+53,-9.4,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=5.5,h=26.4,$fn=44);

    // vertical block
    color("cyan")
    translate([+480/2-X0+35,7,High0+72-46])
    cube([65,10,70]);
        
    // surround upper rail and lm8us
    translate([+480/2-X0+100,16,High0+zmotor1+34])
    rotate([-90,0,90])
    cylinder(r=15/2+2,h=65,$fn=F2);
    
    // surround lower rail and lm8us
    translate([+480/2-X0+100,0+16,High0+30])
    rotate([-90,0,90])
    cylinder(r=15/2+2,h=65,$fn=F2);
        
  } // end Boss union

    // trim vertical block
    translate([+480/2-X0+34,18,High0+zmotor1+44])
    rotate([45,0,0])
    cube([67,20,20]);

    // extruder mounting, M4x12,14,16,18 in stock
    translate([+480/2-X0+41.1,-25,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);
    translate([+480/2-X0+41.1+53,-25,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);
    translate([+480/2-X0+41.1,-25,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);
    translate([+480/2-X0+41.1+53,-25,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);
  
    // countersink, M4 heads are 4.2 high, 7 diam
    translate([+480/2-X0+41.1,0,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=4,h=30,$fn=44);
    translate([+480/2-X0+41.1+53,0,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=4,h=30,$fn=44);
    translate([+480/2-X0+41.1,0,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=4,h=30,$fn=44);
    translate([+480/2-X0+41.1+53,0,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=4,h=30,$fn=44);
  
    // cut for upper rail and lm8us
    translate([+480/2-X0+80+22,0+16,High0+zmotor1+34])
    rotate([-90,0,90])
    cylinder(r=15/2+0.1,h=68,$fn=F2);
    
    // cut for lower rail and lm8us
    translate([+480/2-X0+80+22,0+16,High0+30])
    rotate([-90,0,90])
    cylinder(r=15/2+0.1,h=68,$fn=F2);
      
    // cut for belts
    color("green")
    translate([+480/2-X0+31,11,High0+72-35])
//    cube([73,9,35]);
    cube([73,15,35]);

} // end diff

  

}

//--------------------------------------------
module xcarL(
X1=150
){
  
xmain1(X0=X1);

}

//==============================================

//xmain1(X0=LeftX0);
xcarL();

  color("orange")
  translate([+480/2-LeftX0+41.1,11,High0+89.9-53])
  rotate([-90,0,0])
  cylinder(r=3.5,h=4.2,$fn=44);


if(0){
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

if(0){
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
}

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

// left pulley and idler
if(0){
color("pink")
translate([480/2-30-xmot0,0+24,High0+zmotor1])
rotate([90,90,0])
pulley();

color("yellow")
translate([480/2-30-xmot0,0+24-5,High0+zmotor2-1.5])
rotate([90,90,0])
idler();
}

//translate([0,0,High0-150])
//xright1();


// right x motor
if(0){
color("blue")
translate([-480/2+30+xmot0,0+76,High0+zmotor2])
rotate([90,90,0])
xymotor();
}

if(0){
// right x motor pulley
color("orange")
translate([-480/2+30+xmot0,0+24,High0+zmotor2])
rotate([90,90,0])
pulley();

color("orange")
translate([-480/2+30+xmot0,0+24-5,High0+zmotor1+1.5])
rotate([90,90,0])
idler();
}

if(1){
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
}
if(1){
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


