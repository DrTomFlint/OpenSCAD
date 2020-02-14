// yaxis.scad
// models for the y-axis parts

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <frame.scad>
use <y-belt-holder.scad>


// Show the y-bed
ybed=0;

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

//--------------------------------------
module ybar1(
){
  
difference(){
  // Boss
  color("orange")
  translate([170/2,-330/2+5,zoff2-13])
//  cube([25,12,26],center=true);
  
  minkowski(){
  cube([25-4,12-4,26-4],center=true);
  sphere(r=2,$fn=22);
}
  
  // left Y rod, note offset -1 y to go thru the part and +0.1 tol
  color("cyan")
  translate([170/2,-330/2-1,zoff2])
  rotate([-90,0,0])
  cylinder(r=4+0.1,h=20,$fn=F2);

  // cone the ends
  color("cyan")
  translate([170/2,-330/2,zoff2])
  rotate([-90,0,0])
  cylinder(r1=5,r2=4+0.1,h=1,$fn=F2);

  color("cyan")
  translate([170/2,-330/2+10,zoff2])
  rotate([-90,0,0])
  cylinder(r2=5,r1=4+0.1,h=1,$fn=F2);

  // back rail
  translate([-x2,-y2-15,15])
  rotate([90,0,90])
  tslot1(type=2,len=x1);


  // cut for t-slot attach, want about 5 mm of plastic
  translate([170/2,-330/2-5,30])
    rotate([-90,0,0])
    cylinder(r=5.9/2,h=20,$fn=F2);
  // countersink
  translate([170/2,-330/2+5,30])
    rotate([-90,0,0])
    cylinder(r=5,h=6.1,$fn=F2);

  // cuts for zipties
  translate([170/2+8,-330/2+5,30])
  rotate([0,-5,0])
  cube([2,3,30],center=true);
  translate([170/2-8,-330/2+5,30])
  rotate([0,5,0])
  cube([2,3,30],center=true);

}  // end diff

    
}  


//--------------------------------------
module ymotorbracket(
){
  
difference(){
  // Boss
  minkowski(){
  union(){
    color("pink")
    translate([8.5,-330/2+21,23])
//    cube([9,43,43],center=true);
    cube([9-2,43-2,43-2],center=true);
    
    color("green")
    translate([0.5,-330/2+5,18.5])
//    cube([25,12,52],center=true);
    cube([25-2,12-2,52-2],center=true);
  }
  sphere(r=1,$fn=22);
}
  // back rail
  translate([-x2,-y2-15,15])
  rotate([90,0,90])
  tslot1(type=2,len=x1);

  // Y motor
  color("cyan")
  translate([47.3+13.0,-y2+42.3/2,zoff2-20])
  rotate([-90,0,90])
  xymotor(tol=0.15);
  
  // pulley clearance
  color("cyan")
  translate([20,-y2+42.3/2,zoff2-20])
  rotate([-90,0,90])
  cylinder(r=8,h=50,$fn=F2);
  
  
F3=22;
  translate([47.3+13.0,-y2+42.3/2,zoff2-20])
  rotate([-90,0,90]){
    // motor mounting holes,
    translate([15.5,15.5,40])
    cylinder(r=1.6,h=20,$fn=F3);
    translate([-15.5,15.5,40])
    cylinder(r=1.6,h=20,$fn=F3);
    translate([15.5,-15.5,40])
    cylinder(r=1.6,h=20,$fn=F3);
    translate([-15.5,-15.5,40])
    cylinder(r=1.6,h=20,$fn=F3);

    // countersink for the heads
    translate([15.5,15.5,52.5])
    cylinder(r=2.8,h=4,$fn=F3);
    translate([-15.5,15.5,52.5])
    cylinder(r=2.8,h=30,$fn=F3);
    translate([15.5,-15.5,52.5])
    cylinder(r=2.8,h=4,$fn=F3);
    translate([-15.5,-15.5,52.5])
    cylinder(r=2.8,h=30,$fn=F3);
  }


  // upper cut for t-slot attach, want about 5 mm of plastic
  translate([-4,-330/2-5,30])
    rotate([-90,0,0])
    cylinder(r=5.9/2,h=20,$fn=F2);
  // countersink
  translate([-4,-330/2+5,30])
    rotate([-90,0,0])
    cylinder(r=5,h=6.1,$fn=F2);
    
  // lower cut for t-slot attach, want about 5 mm of plastic
  translate([-4,-330/2-5,0])
    rotate([-90,0,0])
    cylinder(r=5.9/2,h=20,$fn=F2);
  // countersink
  translate([-4,-330/2+5,0])
    rotate([-90,0,0])
    cylinder(r=5,h=6.1,$fn=F2);


  // cut so the grub screw on the pulley can be set
  translate([4,-330/2+21,23])
  rotate([-90,0,0])
  scale([1,1.33,1])
  cylinder(r=6,h=30,$fn=88);
}  // end diff

    
}  


//==========================================


//ybar1();

if(0){
// support for printing ybar1:
  translate([170/2,-330/2+5,30])
    rotate([-90,0,0])
    cylinder(r=4.5,h=6.0,$fn=12);
}

//ymotorbracket();

if(1){
// support for printing ymotorbracket:
  color("pink")
  translate([13,-330/2+21,23.0])
    rotate([-90,0,90])
    cylinder(r=10,h=2.0,$fn=12);
}

//frame();


// ----- cyan ---------
if(0){
// Y motor
color("cyan")
translate([47.3+13.0,-y2+42.3/2,zoff2-20])
rotate([-90,0,90])
xymotor();
}
if(0){
color("orange")
translate([9.5,-y2+42.3/2,zoff2-20])
rotate([-90,0,90])
pulley();
}

if(ybed){

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



//=========================================
