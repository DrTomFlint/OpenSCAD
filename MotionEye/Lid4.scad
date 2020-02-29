// Lid4.scad
// This is the front plate
use <Base4.scad>

module lid1(){
    
difference(){
union(){
    // main boss
    translate([0,0,-1])
    color("yellow")
    linear_extrude(height=7)
    offset(r=3,$fn=80)    
    square(size=[25,24]);

    // camera bump boss
    translate([12.5,12,6])
    color("green")
    linear_extrude(height=5,scale=0.70)
    offset(r=3,$fn=80)
    square([25,24],center=true);

}
    // main boss cutout
    translate([0,0,-2])
    color("orange")
    linear_extrude(height=7)
    offset(r=2,$fn=16)    
    square(size=[25,24]);

    // side cuts for articulation
    translate([26.9,-7.5,-2])
    color("pink")
    //rotate([-80,0,0])
    cube([6.1,27,21]);

    translate([-8,-7.5,-2])
    color("green")
    //rotate([-80,0,0])
    cube([6.1,27,21]);

    // bottom cut for cable
    translate([-5,-6,-2])
    color("green")
    cube([35,6,7]);

    // hollow out the camera bump
    translate([12.5,12,4.5])
    color("green")
    linear_extrude(height=5.5,scale=0.70)
    offset(r=3,$fn=16)
    square([15,19],center=true);

    // hole for the lens
    translate([12.5,9.75,9])
    color("cyan")
    cylinder(r1=3.5,r2=6.0,h=2.1,$fn=80);
}

// support for ribbon cable
translate([4.25,-2.5,4.5])
rotate([0,90,0])
scale([1,2]){
  difference(){
    union(){
        sphere(r=1.5,$fa=5, $fs=0.1);
        translate([0,0,16.5])
        sphere(r=1.5,$fa=5, $fs=0.1);
        cylinder(r=1.5,h=16.5,$fn=80);
    }
        translate([-5,0,-5])    
        cube([10,10,50]);
    }
}

    // tab near cable
    translate([-1,-3,3])
    color("pink")
    cube([27,1,2]);

    // tab topside
    translate([0,25.5,-1])
    color("cyan")
    cube([25,0.5,1]);

    // tab left
    translate([-2.0,20,-1])
    color("cyan")
    cube([0.5,4,1]);

    // tab right
    translate([26.5,20,-1])
    color("cyan")
    cube([0.5,4,1]);

}  // end of module 

lid1();



// shell();


