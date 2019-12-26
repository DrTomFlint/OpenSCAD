// bracket2
// second try at the camera bracket

use <top1.scad>
use <arm1.scad>

use <../Parts/servo1.scad>
use <../Parts/cam1.scad>
use <../Parts/cambase1.scad>
use <../Parts/camlid1.scad>

//--------------------------
module active1(tol=0.1){    
// active side
color("red")
difference(){
    hull(){
        translate([5,-15.5,11])
        rotate([90,0,0])
        cylinder(h=4.7,r1=7.5,r2=7.0,$fn=44);

        translate([-30,-15.5,11])
        rotate([90,0,0])
        cylinder(h=4.7,r1=3.5,r2=3.0,$fn=44);
    }

    // arm
    translate([5,-15.5,11])
    rotate([90,180,0])
    arm1cut();

    // dovetail
    color("pink")
    translate([-34,-21,11-3/2])
    cube([20,6,3]);

}

} //------------
module active1cut(tol=0.1){    
// active side
color("red")
difference(){
    hull(){
        translate([5,-15.5,11])
        rotate([90,0,0])
        cylinder(h=4.7+tol*3,r1=7.5+tol/2,r2=7.0+tol/2,$fn=44);

        translate([-30,-15.5,11])
        rotate([90,0,0])
        cylinder(h=4.7+tol*3,r1=3.5+tol/2,r2=3.0+tol/2,$fn=44);
    }

    // dovetail
    color("pink")
    translate([-34,-21,11-3/2+tol])
    cube([20,6+tol,3-tol]);

}

} //------------

module passive1(tol=0.1){
// passive side
color("cyan")
difference(){
    hull(){
        translate([5,15.5,11])
        rotate([-90,0,0])
        cylinder(h=4.7+tol*3,r1=7.5,r2=7.0,$fn=44);

        translate([-30,15.5,11])
        rotate([-90,0,0])
        cylinder(h=4.7+tol*3,r1=3.5,r2=3.0,$fn=44);
    }

    // peg+tol from top1

    color("orange")
    translate([5.3,15,11])
    rotate([-90,0,0])
    cylinder(h=6+tol,r1=3.5+tol/2,r2=2.5+tol/2,$fn=100);

    color("yellow")
    translate([5.3,15,11])
    rotate([-90,0,0])
    cylinder(h=0.4,r1=5.8,r2=5.6,$fn=40);

    color("green")
    translate([5.3,19,11])
    rotate([-90,0,0])
    cylinder(h=0.5+tol,r1=2.6+tol,r2=2.0+tol,$fn=100);

    // dovetails
    color("orange")
    translate([-34,15,11-3/2])
    cube([20,6,3]);

}

} //-------------------

module passive1cut(tol=0.1){
// passive side
color("green")
difference(){
    hull(){
        translate([5,15.5+tol*3,11])
        rotate([-90,0,0])
        cylinder(h=4.7+tol*3,r1=7.5+tol/2,r2=7.0+tol/2,$fn=44);

        translate([-30,15.5+tol*3,11])
        rotate([-90,0,0])
        cylinder(h=4.7+tol*3,r1=3.5+tol/2,r2=3.0+tol/2,$fn=44);
    }

    // dovetails
    color("orange")
    translate([-34,15,11-3/2+tol])
    cube([20,6+tol,3-tol]);

}

} //-------------------

/*
// dovetails
color("orange")
translate([-34,15,11-3/2])
cube([20,6,3]);


color("pink")
translate([-34,-21,11-3/2])
cube([20,6,3]);
*/

module plate1(tol=0.1){


difference(){
    // plate
    color("yellow")
    translate([-46,-18,11-4/2+0.65])
    linear_extrude(height=4)
    offset(r=4,$fn=44)
    square([28,36]);

    active1cut();
    passive1cut();
    
    // circular cuts
    translate([-45,17,8])
    cylinder(h=10,r=2.5,$fn=22);
    translate([-45,-17,8])
    cylinder(h=10,r=2.5,$fn=22);

    translate([-37,17,8])
    cylinder(h=10,r=2.5,$fn=22);
    translate([-37,-17,8])
    cylinder(h=10,r=2.5,$fn=22);
    
    // clearance for the top
    translate([0,0,0])
    cylinder(h=20,r=20,$fn=88);
    
    // cut for the camera
    translate([-34,0,14.0])
    rotate([0,180,90])
    cam1cut(tol=0.4);
}
} //---- end module plate1 ----

module plate2(tol=0.1){


difference(){
    // plate
    color("yellow")
    translate([-31,-18,11-4/2+0.65-2])
    linear_extrude(height=4)
    offset(r=4,$fn=44)
    square([13,36]);

    active1cut();
    passive1cut();

    // cut for cambase and camlid
    translate([-34,0,12])
    cube([44,28,10],center=true);

    
}

translate([-28-2,12.5,13.5-2]){
rotate([0,180,90]){
    cambase2();
//    camlid1();
}}

} //---- end module plate2 ----


//plate1();

plate2();

/*
    // camera
    translate([-34,0,14])
    rotate([0,180,90])
    cam1();
*/

/*
difference(){
    active1cut();
    active1();
}    
difference(){
    passive1cut();
    passive1();
}    
*/

/*
active1();
//passive1();

// top 
top1();

// servo
translate([0,12,11-0.1])
rotate([90,0,0])
servo1();
*/

