// pilid.scad
// This is the lid for the pi zero

use <pibase.scad>

module pilid(){
tol=0.2;
    
hi=11.0;    
// base borrowed from pieye
difference(){
    color("yellow")
    linear_extrude(height=hi)
    offset(r=2,$fn=80)    
    square(size=[30+4,65+4],center=true);

    translate([0,0,2])
    color("orange")
    linear_extrude(height=hi)
    offset(r=0.5,$fn=16)    
    square(size=[30+4,65+4],center=true);

    translate([-12,-38,2])
    color("red")
    cube([24,5,hi]);
    
    translate([-17.5,32,2])
    color("green")
    cube([35,5,hi]);

    translate([16,12,-2])
    color("blue")
    cube([5,17,hi+6]);

    translate([16,-29,-2])
    color("pink")
    cube([5,26,hi+6]);

    translate([-20,5.5,1])
    color("green")
    cube([5,50,hi+1]);
    
    // vent holes
    translate([0,0,-1])
    cylinder(r=10,h=25,$fn=6);
    translate([0,22,-1])
    cylinder(r=10,h=25,$fn=6);
    translate([0,-22,-1])
    cylinder(r=10,h=25,$fn=6);
}

// posts to support PCB
translate([-15+3,-32.0+3,0]){
    cylinder(r1=3,r2=2.5,h=hi-5,$fn=16);
    //cylinder(r=1,h=4,$fn=16);
}
translate([-15+3,32.0-3,0]){
    cylinder(r1=3,r2=2.5,h=hi-5,$fn=16);
    //cylinder(r=0.8,h=4,$fn=16);
}
translate([15-3,-32.0+3,0]){
    cylinder(r1=3,r2=2.5,h=hi-5,$fn=16);
    //cylinder(r=0.8,h=4,$fn=16);
}
translate([15-3,32.0-3,0]){
    cylinder(r1=3,r2=2.5,h=hi-5,$fn=16);
    //cylinder(r=0.8,h=4,$fn=16);
}

} // end module lid2

pilid();

/*
color("cyan")
translate([0,0,11.0])
rotate([0,180,0])
pibase();
*/

