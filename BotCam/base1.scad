// Base part
use <servo1.scad>
use <arm1.scad>

//----------------------------
module base1(){
difference(){
    // boss
    translate([10,0,0])
    linear_extrude(height=11)
    offset(r=3,$fn=22)
    square([60-6,40-6],center=true);

    // servocut
    translate([0,0,-16.2])
    servo1cut();
}
} //-------- end module base1 -------------
module base2(){
difference(){
    // boss
    translate([0,0,0])
    linear_extrude(height=11)
    offset(r=2,$fn=22)
    square([40-6,20-6],center=true);

    // servocut
    translate([0,0,-16.2])
    servo1cut();
}
} //-------- end module base1 -------------

color("cyan")
//base1();


// show how servo would fit
translate([0,0,-16.2])
servo1();

//
color("pink")
base2();

