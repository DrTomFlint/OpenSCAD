// Base part
use <servo1.scad>
use <singleArm.scad>

//----------------------------
module base1(){
difference(){
    // boss
    translate([20,0,0])
    linear_extrude(height=11)
    square([80,40],center=true);

    // servocut
    translate([0,0,-16.2])
    servo1cut();
}
} //-------- end module base1 -------------

color("cyan")
base1();

// show how servo would fit
translate([0,0,-16.2])
servo1();
