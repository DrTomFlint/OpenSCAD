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
// xcarriages
// type 1 is left, type 2 is right
module xmain1(
X0=150,
type=1
){

  difference(){
    
  // Boss  
  union(){

    // vertical block
    color("cyan")
    translate([+480/2-X0+35,4.5,High0+31.5])
    cube([65,12,65]);
        
    // surround upper rail and lm8us
    translate([+480/2-X0+100,16,High0+zmotor1+34])
    rotate([-90,0,90])
    cylinder(r=15/2+3,h=65,$fn=F2);
    
    // surround lower rail and lm8us
    if(type==1){
      translate([+480/2-X0+90,0+16,High0+30])
      rotate([-90,0,90])
      cylinder(r=15/2+4,h=24,$fn=F2);
    }
    if(type==2){
      translate([+480/2-X0+69,0+16,High0+30])
      rotate([-90,0,90])
      cylinder(r=15/2+4,h=24,$fn=F2);
    }

 
  } // end Boss union

    // trim front vertical block
    translate([+480/2-X0+34,17,High0+zmotor1+45])
    rotate([45,0,0])
    cube([67,20,20]);

    // trim corners
    translate([+480/2-X0+91,0,High0+zmotor1+55])
    rotate([0,45,0])
    cube([20,60,20]);
    translate([+480/2-X0+16,0,High0+zmotor1+55])
    rotate([0,45,0])
    cube([20,60,20]);
    translate([+480/2-X0+16,0,High0+25])
    rotate([0,45,0])
    cube([20,60,20]);
    translate([+480/2-X0+91,0,High0+25])
    rotate([0,45,0])
    cube([20,60,20]);

    // cut for thumbscrew
    if(type==1){
      translate([+480/2-X0+105,-3,High0+zmotor1+32])
      rotate([-90,0,90])
      cylinder(r=15/2+2,h=22,$fn=F2);
    }
    if(type==2){
      translate([+480/2-X0+50,-3,High0+zmotor1+32])
      rotate([-90,0,90])
      cylinder(r=15/2+2,h=22,$fn=F2);
    }

    // increase clearance near hot end
    if(type==1){
      translate([+480/2-X0+46,3,High0+18])
      cube([22,10,16]);
    }
    if(type==2){
      translate([+480/2-X0+67,3,High0+18])
      cube([22,10,16]);
    }

    // extruder motor shaft clearance
    translate([+480/2-X0+41.1+53/2,-25,High0+54])
    rotate([-90,0,0])
    cylinder(r=4,h=50,$fn=44);

    // extruder mounting, M4x30 
    translate([+480/2-X0+41.1,-25,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=2,h=50,$fn=44);
    translate([+480/2-X0+41.1+53,-25,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);
    translate([+480/2-X0+41.1,-25,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);
    translate([+480/2-X0+41.1+53,-25,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=2,h=60,$fn=44);

    // countersink for regular M4x30 
    translate([+480/2-X0+41.1,11,High0+89.9])
    rotate([-90,0,0])
    cylinder(r1=4,r2=4,h=20,$fn=44);    
    
    translate([+480/2-X0+41.1+53,11,High0+89.9])
    rotate([-90,0,0])
    cylinder(r1=4,r2=4,h=20,$fn=44);
    
    // countersink for special M4x30 flat head screws
    // head is 8mm tapering at 45 degrees to 4mm
    translate([+480/2-X0+41.1,11,High0+89.9-53])
    rotate([90,0,0])
    cylinder(r1=4,r2=2,h=2.1,$fn=44);
    
    translate([+480/2-X0+41.1+53,11,High0+89.9-53])
    rotate([90,0,0])
    cylinder(r1=4,r2=2,h=2.1,$fn=44);
  
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
    translate([+480/2-X0+31,11,High0+36])
    cube([73,16,38]);
    
    // slot for movable part of belt attach
    if(type==1){
      translate([+480/2-X0+57,14.5,High0+74])
      rotate([0,180,90])
      belt3();
    }

} // end diff

    if(type==1){
      // belt attach solid
      difference(){
        translate([+480/2-X0+81,14.5,High0+74])
        rotate([0,180,90])
        belt1();  
        
        // cut for the lm8u
        translate([+480/2-X0+80+22,0+16,High0+30])
        rotate([-90,0,90])
        cylinder(r=15/2+0.1,h=68,$fn=F2);
        
      }

    /*
      difference(){
      // belt attach movable
        translate([+480/2-X0+57,14.5,High0+74])
        rotate([0,180,90])
        belt2();  
      // cut for lm8u clearance
        translate([+480/2-X0+70,0+16,High0+30])
        rotate([-90,0,90])
        cylinder(r=15/2+0.1,h=10,$fn=F2);
      }
    */
    }
  

}

//---------------------------------------
// fixed part
module belt1(){
difference(){
    // base block
    translate([-5,-9,25]) cube([12,22,14]);

    // belt entry 
    translate([-7.5,-10,34.9]) rotate([0,45,0]) cube([3,32,3]);
    
    // belt slot
    translate([-8.5,-16,34.2]) cube([11.5,32,0.75]);
    translate([-8.5,-16,35.4]) rotate([0,5,0]) cube([11.5,32,0.2]);
    translate([-8.5,-16,33.6]) rotate([0,-5,0]) cube([11.5,32,0.2]);
    
    // belt teeth
    for (_step =[-16:2:16]){
      translate([-8.5,_step+0.5,33]) cube([11.5,1,1.5]);
    }

    // nut clearance
    translate([-6,-10,24]) 
    cube([9,6,8]);

    // screw hole
    translate([-1,16,28]) 
    rotate([90,0,0])
    cylinder(r=1.6,h=30,$fn=22);

  }
}

//---------------------------------------
// movable part
module belt2(){
difference(){
  union(){
    // base block
    translate([-5,-9,29]) cube([10,21,8]);
    // extra for the screw
    translate([-5,-9,25]) cube([8,18,10]);
  }

    // belt entry 
    translate([-7.5,-10,34.9]) rotate([0,45,0]) cube([3,32,3]);
    
    // belt slot
    translate([-8.5,-16,34.2]) cube([11.5,32,0.75]);
    translate([-8.5,-16,35.4]) rotate([0,5,0]) cube([11.5,32,0.2]);
    translate([-8.5,-16,33.6]) rotate([0,-5,0]) cube([11.5,32,0.2]);
    
    // belt teeth
    for (_step =[-16:2:16]){
      translate([-8.5,_step+0.5,33]) cube([11.5,1,1.5]);
    }
    
    // screw head clearance M3x?
    translate([-1,16,28]) 
    rotate([90,0,0])
    cylinder(r=3,h=8,$fn=22);

    // screw hole
    translate([-1,16,28]) 
    rotate([90,0,0])
    cylinder(r=1.6,h=30,$fn=22);
    
  }
  
}
//---------------------------------------
// movable part slot cutter
module belt3(){
    // base block
    translate([-5,-12,29-0.2]) cube([10,26,8.4]);

}


//==============================================

// left extruder belt slider
if(1){
X5=LeftX0;
difference(){
// belt attach movable
  translate([+480/2-X5+57,14.5,High0+74])
  rotate([0,180,90])
  belt2();  
// cut for lm8u clearance
  translate([+480/2-X5+70,0+16,High0+30])
  rotate([-90,0,90])
  cylinder(r=15/2+0.1,h=10,$fn=F2);
}
}

// test tension screw
  color("orange")
  translate([+480/2-LeftX0+88,15.5,High0+46])
  rotate([-90,0,90])
  cylinder(r=1.5,h=40,$fn=22);


xmain1(X0=LeftX0,type=1);
//xmain1(X0=RightX0+135,type=2);

// standoffs are no longer part of the carriage
if(0){ // left side
  X3=LeftX0;
    // four legs to attach extruder
    color("pink")
    translate([+480/2-X3+41.1,-11.4,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=5.5,h=15.9,$fn=44);        
    translate([+480/2-X3+41.1+53,-11.4,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=5.5,h=15.9,$fn=44);
    translate([+480/2-X3+41.1,-11.4,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=5.5,h=15.9,$fn=44);
    translate([+480/2-X3+41.1+53,-11.4,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=5.5,h=15.9,$fn=44);
}
if(0){  // right side
  X4=RightX0+135;
    // four legs to attach extruder
    color("pink")
    translate([+480/2-X4+41.1,-11.4,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=5.5,h=15.9,$fn=44);        
    translate([+480/2-X4+41.1+53,-11.4,High0+89.9])
    rotate([-90,0,0])
    cylinder(r=5.5,h=15.9,$fn=44);
    translate([+480/2-X4+41.1,-11.4,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=5.5,h=15.9,$fn=44);
    translate([+480/2-X4+41.1+53,-11.4,High0+89.9-53])
    rotate([-90,0,0])
    cylinder(r=5.5,h=15.9,$fn=44);
}

if(0){
// left extruder
color("gray")
translate([+480/2-LeftX0,2,High0+26+10])
rotate([90,0,180])
import("aqua5.stl");
}

if(0){
// left emotor
color("orange")
translate([+480/2-LeftX0+67,-59.5,High0+44+10])
rotate([90,-90,180])
emotor();
}

if(1){  // left side bearings
// x rod lm8u bearing low
color("gray")
translate([+480/2-LeftX0+90,0+16,High0+30])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-LeftX0+80+20,0+16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-LeftX0+80-21,0+16,High0+zmotor1+34])
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

if(0){
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
color("gray")
translate([+480/2-RightX0,2,High0+26+10])
rotate([90,0,180])
mirror([1,0,0])
import("aqua5.stl");
}
if(0){
// right emotor
color("gray")
//translate([+480/2-LeftX0+67,-59.5,High0+44+10])
translate([+480/2-RightX0-68,-59.5,High0+44+10])
rotate([90,-90,180])
emotor();
}


if(0){  // right side bearings
// x rod lm8u bearing low
color("gray")
translate([+480/2-RightX0-66,16,High0+30])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-RightX0-56+21,16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);

// x rod lm8u bearing hi 
color("gray")
translate([+480/2-RightX0-56-20,16,High0+zmotor1+34])
rotate([-90,0,90])
cylinder(r=15/2,h=24,$fn=F2);
}


//===============================================

