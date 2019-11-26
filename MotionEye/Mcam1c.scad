// Mcam1c.scad
// This is the front plate
use <Mcam1a.scad>

difference(){
union(){
    // main boss
    translate([0,0,-1])
    color("yellow")
    linear_extrude(height=7)
    offset(r=3,$fn=16)    
    square(size=[25,24]);

    // camera bump boss
    translate([12.5,12,6])
    color("green")
    linear_extrude(height=6,scale=0.70)
    offset(r=3,$fn=16)
    square([25,24],center=true);

}
    // main boss cutout
    translate([0,0,-2])
    color("orange")
    linear_extrude(height=7)
    offset(r=2,$fn=16)    
    square(size=[25,24]);

    // side cuts for articulation
    translate([27,-4,-3])
    color("green")
    cube([5,14,10]);

    translate([-7,-4,-3])
    color("green")
    cube([5,14,10]);

    // bottom cut for cable
    translate([-5,-4,-1])
    color("green")
    cube([35,4,6]);

    // hollow out the camera bump
    translate([12.5,12,4.5])
    color("green")
    linear_extrude(height=6,scale=0.70)
    offset(r=3,$fn=16)
    square([15,19],center=true);

    // hole for the lens
    translate([12.5,9.5,10])
    color("cyan")
//   linear_extrude(height=2.1,scale=1.2)
//    offset(r=3,$fn=16)
//    square([4,4],center=true);
    cylinder(r1=4.1,r2=5.1,h=2.1,$fn=22);
}

    // tab near cable
    translate([1,-3,3])
    color("pink")
    cube([23,1,2]);

    // tab topside
    translate([0,25.5,-1])
    color("cyan")
    cube([25,0.5,1]);

    // tab left
    translate([-2.0,10,-1])
    color("cyan")
    cube([0.5,10,1]);

    // tab right
    translate([26.5,10,-1])
    color("cyan")
    cube([0.5,10,1]);





//shell();


