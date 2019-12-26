// tower
// cam, servo, tilt-axis


use <../Parts/servo1.scad>
use <../Parts/cambase1.scad>
use <../Parts/cam1.scad>
use <../Parts/arm1.scad>

use <lid2.scad>

//--------------------------
module tower1(){    
difference(){
    // main boss
    union(){
        color("cyan")
        cylinder(r1=24,r2=20,h=67,$fn=88);

        color("yellow")
        translate([0,0,-6])
        cylinder(r1=24,r2=24,h=6,$fn=88);
    }
    
    // main vertical cut
    translate([0,0,43])
    cube([33,60,60],center=true);

    // cutout in base for servo
    translate([11,-4,8])
    rotate([-90,0,90])
    servo1cut();

    // cut for servo wires
    translate([2.5,6,4])
    cube([7,20,20]);

    // center hole for pan
    translate([0,0,-7])
    cylinder(r=6,h=9,$fn=88);
    translate([0,0,-6.01])
    cylinder(r1=7,r2=6,h=1.02,$fn=88);
    
    // cut for arm 
    translate([-22,0,33])
    color("pink")
    cube([6,60,74],center=true);

    // cut for not arm side
    translate([22,0,33])
    color("pink")
    cube([6,60,74],center=true);
    
    // cut to install servo
    hull(){
        translate([-20,0,21])
        rotate([0,90,0])
        color("orange")
        cylinder(r=3,h=10,$fn=44);

        translate([-20,0,10])
        rotate([0,90,0])
        color("orange")
        cylinder(r=8,h=10,$fn=44);
    }
    
    // cut to balance servo install
    hull(){
        translate([10,0,21])
        rotate([0,90,0])
        color("orange")
        cylinder(r=3,h=10,$fn=44);

        translate([10,0,10])
        rotate([0,90,0])
        color("orange")
        cylinder(r=8,h=10,$fn=44);
    }
    
    // cut for tilt wheels
    translate([-12.5,10,30])
    rotate([90,0,0]){

    translate([-4,9,10])
    rotate([180,0,0])
    rotate([0,90,0]){
        disk3cut();
        hull(){
            translate([0,-12,-4])
            cylinder(r=2,h=5,$fn=44);
            translate([0,0,-4])
            cylinder(r=7,h=5,$fn=44);
        }
    }

    translate([29,9,10])
    rotate([0,0,0])
    rotate([0,-90,0]){
        disk3cut();
        hull(){
            translate([0,12,-4])
            cylinder(r=2,h=5,$fn=44);
            translate([0,0,-4])
            cylinder(r=7,h=5,$fn=44);
        }
    }
    
}
}


}

//--------------------
module tophat1(){

    translate([0,0,2])
    difference(){
        translate([0,0,61])
        color("orange")
        cylinder(r=24,h=4,$fn=44);
    
        translate([0,0,61-0.01])
        color("orange")
        cylinder(r=6,h=5.02,$fn=44);

        translate([0,0,64])
        color("orange")
        cylinder(r1=6,r2=7,h=1,$fn=44);

        tower1();
    }
}


//===========================

tophat1();

tower1();

// servo in the base of tower
if(0){
translate([11,-4,8])
rotate([-90,0,90]){
    servo1();
    translate([5.25,0,27.5])
    rotate([0,0,0])
    color("green")
    arm1();
}    
}

// upper servo horn arm
if(0){
translate([11,-5.25,39])
rotate([-90,0,90]){
    translate([5.25,0,27.5])
    rotate([0,0,0])
    color("green")
    arm1();
}    
}

 
// this is the camhead:
if(0){
translate([-12.5,10,30])
rotate([90,0,0]){
    cambase2();
    lid2();
    
    if(0){
        translate([12.5,12,4])
        cam1();
        translate([12.5,12,4])
        knob1();
    }
    
    translate([-4,9,10])
    rotate([180,0,0])
    rotate([0,90,0])
    disk3();

    translate([29,9,10])
    rotate([0,0,0])
    rotate([0,-90,0])
    disk3();
}
}

