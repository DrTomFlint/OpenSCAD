// frame
// frame for the PrusaDusa

use <../Parts/tslot.scad>
use <../Parts/acin.scad>



//-----------------------------------------------------------------
// Customizer Values:
// These must be at the top of the main file, cannot contain any
// computations, and should have a comment above to provide text

// Tower offset from center 
yoff=-50; 

// Length front, back, top rail 
x1=480;         

// Length side rails
y1=330;      

// Length of towers
z1=380;       

//--------------------------------------
module frame(
yoff=-62,       // tower and top offset from center
x1=480,         // length front, back, top rails
y1=330,         // length side rails
z1=380,          // height of towers
zcam=150        // height of camera posts
){
    
x2=x1/2;    // 240
y2=y1/2;    // 165
    //---------- rails ----------------
    
    // front rail
    translate([-x2,y2+15,15])
    rotate([90,0,90])
    tslot1(type=2,len=x1);

    // back rail
    translate([-x2,-y2-15,15])
    rotate([90,0,90])
    tslot1(type=2,len=x1);

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
    
    //--------- triangle corners in base ------------
    
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

    //--------- triangle corners top beam ----------  

    // Removed two triangle corners for extruder clearance
    
/*
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
*/
    
   //------------- triangle corners back of towers -------------
   
    // left tower corner 1
    color("gray")
    translate([x2-45,yoff-30,15])
    rotate([90,0,-90])
    tbrace();
    
    // left tower corner 2
    color("gray")
    translate([x2-15,yoff-30,15])
    rotate([90,0,-90])
    tbrace();
    
    // right tower corner 1
    color("gray")
    translate([-x2+45,yoff-30,15])
    rotate([90,0,-90])
    tbrace();

    // right tower corner 2
    color("gray")
    translate([-x2+15,yoff-30,15])
    rotate([90,0,-90])
    tbrace();
    
    // ----------- L braces in the base ----------------
/*
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
    
*/    
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
    
    // ------------ L braces top rail --------------
    // left top L front
    color("gray")
    translate([x2-30,yoff+30,z1+45])
    rotate([-90,90,0])
    lbrace();
    
    // left top L rear
    color("gray")
    translate([x2-30,yoff-30,z1+45])
    rotate([90,180,0])
    lbrace();
    
    // right top L front
    color("gray")
    translate([-x2+30,yoff+30,z1+45])
    rotate([-90,0,0])
    lbrace();
    
    
    // right top L rear
    color("gray")
    translate([-x2+30,yoff-30,z1+45])
    rotate([90,90,0])
    lbrace();
    
    //------------ shelf -----------------
    
    // left side rail
    translate([x2-15,yoff-30,15+z1+15])
    rotate([0,90,-90])
    tslot1(type=1,len=120);
    
    // left side rail
    translate([-x2+15,yoff-30,15+z1+15])
    rotate([0,90,-90])
    tslot1(type=1,len=120);
    
    // back rail
    translate([-x2,yoff-165,15+z1+15])
    rotate([0,90,0])
    tslot1(type=1,len=x1);

    //---------- triangle corners shelf ---------------

    // left shelf corner
    color("red")
    translate([x2-15,yoff-30,z1+15])
    rotate([-90,0,-90])
    tbrace();

    // right shelf corner
    color("green")
    translate([-x2+15,yoff-30,z1+15])
    rotate([-90,0,-90])
    tbrace();
    
    //---------- L braces shelf ------------------

    // tower to shelf left
    color("gray")
    translate([x2,yoff,z1+45])
    rotate([-90,0,-90])
    lbrace();
    
    // tower to shelf right
    color("gray")
    translate([-x2,yoff,z1+45])
    rotate([90,90,-90])
    lbrace();
    
    // left side rail to back rail
    color("gray")
    translate([x2,yoff-180,z1+15])
    rotate([0,180,0])
    lbrace();
    
    // right side rail to back rail
    color("gray")
    translate([-x2,yoff-180,z1+15])
    rotate([0,180,-90])
    lbrace();
    
    // power supply
    color("silver")
    translate([x2-45+20,yoff-30,90])
    rotate([0,0,180])
    ps();
    
    // ac box
    translate([x2,-y2-15,0]){
    color("green")
    acbox();
    color("gray")
    translate([-55,20,36])
    acin();
    }
}
//------------------------------------
module ps(){
  
translate([-45,0,0]){
  // body
  cube([90,45,225]);
  // tabs
  translate([15/2,0,225])
  cube([75,1,14]);
  translate([15/2,0,-14])
  cube([75,1,14]);
}
// power cords
translate([-25,45/2,225])
cylinder(r=4.5,h=12,$fn=22);
translate([0,45/2,-12])
cylinder(r=4.5,h=12,$fn=22);
  
} 

 
//====================================

frame(yoff=yoff,x1=x1,y1=y1,z1=z1);
//cylinder(r=10,h=180);

//ps();
 
//=====================================
