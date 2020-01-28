// frame
// frame for the PrusaDusa

use <../Parts/tslot.scad>

//--------------------------------------
module frame(
yoff=-62,       // tower and top offset from center
x1=480,         // length front, back, top rails
y1=330,         // length side rails
z1=380          // height of towers
){
    
x2=x1/2;    // 240
y2=y1/2;    // 165
    
    // front rail
    translate([-x2,y2+15,0])
    rotate([0,90,0])
    tslot1(type=1,len=x1);

    // back rail
    translate([-x2,-y2-15,0])
    rotate([0,90,0])
    tslot1(type=1,len=x1);

    // left rail
    translate([x2-30,-y2,0])
    rotate([0,90,90])
    tslot1(type=2,len=y1);

    // right rail
    translate([-x2+30,-y2,0])
    rotate([0,90,90])
    tslot1(type=2,len=y1);

    // left tower
    translate([x2-30,yoff,15])
    rotate([0,0,0])
    tslot1(type=3,len=z1);

    // right tower
    translate([-x2+30,yoff,15])
    rotate([0,0,0])
    tslot1(type=3,len=z1);

    // top rail
    translate([-x2,yoff,15+z1+15])
    rotate([0,90,0])
    tslot1(type=2,len=x1);
    
    // right front corner
    color("green")
    translate([-x2+60,y2,0])
    rotate([0,0,-90])
    tbrace();
    
    // left front corner
    color("red")
    translate([x2-60,y2,0])
    rotate([0,0,-180])
    tbrace();
    
    // right rear corner
    color("gray")
    translate([-x2+60,-y2,0])
    rotate([0,0,0])
    tbrace();
    
    // left rear corner
    color("gray")
    translate([x2-60,-y2,0])
    rotate([0,0,-270])
    tbrace();
    
    // left top corner 1
    color("gray")
    translate([x2-60,yoff+15,z1+15])
    rotate([90,180,0])
    tbrace();
    
    // left top corner 2
    color("gray")
    translate([x2-60,yoff-15,z1+15])
    rotate([90,180,0])
    tbrace();
    
    // right top corner 1
    color("gray")
    translate([-x2+60,yoff+15,z1+15])
    rotate([90,90,0])
    tbrace();
    
    // right top corner 2
    color("gray")
    translate([-x2+60,yoff-15,z1+15])
    rotate([90,90,0])
    tbrace();
    
    // left tower corner 
    color("gray")
    translate([x2-45,yoff-30,15])
    rotate([90,0,-90])
    tbrace();
    
    // right tower corner 
    color("gray")
    translate([-x2+45,yoff-30,15])
    rotate([90,0,-90])
    tbrace();
    
    // left front L top
    color("gray")
    translate([x2,y2+30,15])
    rotate([0,0,-180])
    lbrace();
    
    // right front L top
    color("gray")
    translate([-x2,y2+30,15])
    rotate([0,0,-90])
    lbrace();
    
    // left front L bottom
    color("gray")
    translate([-x2,y2+30,-15])
    rotate([180,0,0])
    lbrace();
    
    // left front L bottom
    color("gray")
    translate([x2,y2+30,-15])
    rotate([180,0,-90])
    lbrace();
    
    // left rear L top
    color("gray")
    translate([x2,-y2-30,15])
    rotate([0,0,90])
    lbrace();
    
    // right rear L top
    color("gray")
    translate([-x2,-y2-30,15])
    rotate([0,0,0])
    lbrace();
    
    // left rear L bottom
    color("gray")
    translate([-x2,-y2-30,-15])
    rotate([180,0,90])
    lbrace();
    
    // left rear L bottom
    color("gray")
    translate([x2,-y2-30,-15])
    rotate([180,0,-180])
    lbrace();
    
    // left top L front
    color("gray")
    translate([x2-30,yoff+30,z1+45])
    rotate([-90,90,0])
    lbrace();
    
    // left top L rear
    color("gray")
    translate([x2,yoff-30,z1+45])
    rotate([90,180,0])
    lbrace();
    
    // right top L front
    color("gray")
    translate([-x2+30,yoff+30,z1+45])
    rotate([-90,0,0])
    lbrace();
    
    // right top L rear
    color("gray")
    translate([-x2,yoff-30,z1+45])
    rotate([90,90,0])
    lbrace();
    



}

//====================================

frame();
 
//=====================================
