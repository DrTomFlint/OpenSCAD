// Rover1 assembly

use <../Parts/pi3.scad>
use <../Parts/servo1.scad>
use <../Parts/cambase1.scad>

use <pi3base.scad>
use <powerbase2.scad>
use <base1.scad>
use <top1.scad>
use <arm1.scad>
use <bracket2.scad>
use <shell1.scad>


/*
// ------- pi section ----
translate([10,0,-30]){
rotate([0,0,180]){
    translate([0,0,3.5])
    pi3();

    pi3base2();


}    
}

*/


//color("cyan")
//shell1();


//translate([0,0,-16.2+1])
//servo1();


// -------- lid section --------

// locking button
translate([10,44-0.75,4]){
    color("red")
    translate([0,1,0])
    rotate([-90,30,0])
    cylinder(r=3-0.1,h=1,$fn=6);

    translate([0,0,2])
    cube([10,2,11],center=true);
}

translate([10,-44+0.75,4]){
    color("green")
    translate([0,-2,0])
    rotate([-90,30,0])
    cylinder(r=3-0.1,h=1,$fn=6);

    translate([0,0,2])
    cube([10,2,11],center=true);
}


translate([-21,-32,9])
rotate([0,180,90]){
    powerbase2a();
//    powerplug2();
    powerbase2b();
}

translate([0,0,1])
base2();

translate([0,0,1])
difference(){
    union(){
        // plate fits inside of shell
        difference(){
            translate([10,0,11-5])
            linear_extrude(height=5)
            offset(r=1.8,$fn=40)
            square([56,85],center=true);

            translate([10,0,11-6])
            linear_extrude(height=6)
            offset(r=0.5,$fn=40)
            square([56,85],center=true);
        }

        // lip on top of shell
        translate([10,0,11-2])
        linear_extrude(height=2)
        offset(r=4,$fn=40)
        square([55,84],center=true);
    }

    translate([0,0,-16.2])
    servo1cut();

/*
    // cuts for the locking tabs
    translate([10,44,4]){
        translate([0,0,-1])
        color("pink")
        cube([10,3,11],center=true);
    }
    translate([10,-44,4]){
        translate([0,0,-1])
        color("pink")
        cube([10,3,11],center=true);
    }
*/
    translate([31,-46,5])
    rotate([-90,0,0])
    cylinder(r=4,h=20);

    // camera cable cut
    color("red")
    translate([5.25,0,0]){
        intersection(){
        difference(){
            cylinder(r=30,h=20,$fn=88);
            cylinder(r=26,h=20,$fn=88);
        }

        translate([-6,-50,0])
        cube([100,100,20]);
    }
    }
}



// ---turret section --
translate([5.25,0,11+2]){
    // base arm
    rotate([0,0,180])
    arm1();

    // servo
    translate([0,12,11-0.1])
    rotate([90,0,0])
    servo1();

    //
    top1();

    active1();
    passive1();
    plate1();
}




