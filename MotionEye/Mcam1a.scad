// Mcam1a.scad
// This is the back for the camera



module shell(){
    
// main shell
difference(){
    color("yellow")
    linear_extrude(height=5)
    offset(r=2,$fn=16)    
    square(size=[25,24]);

    translate([0,0,1])
    color("orange")
    linear_extrude(height=5)
    offset(r=0.1,$fn=16)    
    square(size=[25,24]);

    translate([4,-3,1])
    color("green")
    cube([17,5,5]);

}

// posts to support PCB
translate([2.0,9.5,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}
translate([2.0,22,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}
translate([23.0,9.5,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}
translate([23.0,22,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}

// pivots on sides to mount
translate([-5,4,2.5])
color("pink")
rotate([0,90,0])
cylinder(r1=2,r2=2.25,h=3,$fn=12);

translate([30,4,2.5])
color("pink")
rotate([0,-90,0])
cylinder(r1=2,r2=2.25,h=3,$fn=12);


} // end module shell

shell();