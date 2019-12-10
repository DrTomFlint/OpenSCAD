// TopBase part
use <arm1.scad>
use <servo1.scad>

//----------------------------
module top1(){
difference(){
    // boss
    color("cyan")
    linear_extrude(height=16.8,scale=0.9)
    circle(20,$fn=200);

    // arm embedded in the base
    rotate([0,0,180])
    arm1cut();

    // servo stacked on top of arm
    translate([0,12,11-0.1])
    rotate([90,0,0])
    servo1cut(tol=0.3);
    
    // cut on active side
    color("yellow")
    translate([-30,-25,3])
    linear_extrude(height=16)
    square([60,10]);

    // cut on active side
    color("pink")
    translate([-30,15,3])
    linear_extrude(height=16)
    square([60,10]);
    
    // cuts to drop in the servo
    color("blue")
    translate([-4.1,-21,10])
    linear_extrude(height=16)
    square([15.5,10]);
    
    // cut to drop in the servo wires
    color("green")
    translate([5,5.5,8])
    linear_extrude(height=16)
    square([16,3]);

    // clearance for the embedded arm
    color("pink")
    translate([-13,0,4])
    linear_extrude(height=8,scale=0.5)
    circle(3.5);
/*
    // underside circular cutout
    // can't print flat if used here
    // put a ridge on the topside of the base
    // instead.
    difference(){
        translate([0,0,-0.1])
        linear_extrude(height=1.5,scale=0.9)
        circle(18);
        
        translate([0,0,-0.1])
        linear_extrude(height=1.5,scale=1.1)
        circle(5.5);
    }
 */   
}
  
/*
// base indicator - remove before print
linear_extrude(height=0.1)
square([80,40],center=true);
*/

// The peg
color("orange")
translate([5.3,15,11])
rotate([-90,0,0])
cylinder(h=4,r1=3.5,r2=2.5,$fn=100);

color("yellow")
translate([5.3,15,11])
rotate([-90,0,0])
cylinder(h=0.4,r1=5.8,r2=5.6,$fn=40);

color("green")
translate([5.3,19,11])
rotate([-90,0,0])
cylinder(h=0.5,r1=2.5,r2=2.0,$fn=40);


} // ------- end module top1 ------------


top1();

/*
// where parts should fit:
// base arm
rotate([0,0,180])
arm1();

// servo
translate([0,12,11-0.1])
rotate([90,0,0])
servo1();
*/
