// topshelf.scad
// all the stuff that attaches to the top shelf

use <../Parts/tslot.scad>
use <duet3.scad>

// Length front, back, top rail
x1=480;         

// Length side rails
y1=330;      

// Length of towers 
z1=380;       

// Length of side rails
y5=120;

x2=x1/2;
y2=y1/2;
yoff=-62;       // tower and top offset from center

//--------------------------------
module topshelf(tol=0){

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

}

//===============================

topshelf();

translate([x2-70,-80,z1+55])
rotate([0,-90,180]){
  duet3();
  duet3bracket();
}
//===============================
