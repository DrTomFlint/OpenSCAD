// bracket1
// this is the U-shaped camera holder

use <top1.scad>
use <cam1.scad>
use <servo1.scad>

module bracket1(){
difference(){
color("red")
hull(){
    translate([0,21,11])
    rotate([90,0,0])
    cylinder(r=10,h=4,$fn=40);

    translate([-52,21,11])
    rotate([90,0,0])
    cylinder(r=5,h=4,$fn=40);
}
top1cut();
}

difference(){
color("green")
hull(){
    translate([0,-17,11])
    rotate([90,0,0])
    cylinder(r=10,h=4,$fn=40);

    color("green")
    translate([-52,-17,11])
    rotate([90,0,0])
    cylinder(r=5,h=4,$fn=40);
}
top1cut();
}

difference(){
    color("orange")
    translate([-46,0,9])
    linear_extrude(height=4)
    offset(r=2,$fn=22)
    square([22,38],center=true);
    // cam cut
    translate([-46,0,13])
    rotate([0,180,90])
    cam1();
}

} //--------- end module bracket1 ----------

bracket1();

/*
translate([-46,0,13])
rotate([0,180,90])
cam1();

top1();

translate([-5.5,11,11-0.1])
rotate([90,0,0])
servo1();
*/



