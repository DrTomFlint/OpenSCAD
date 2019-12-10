// camlid
// lid that covers the camera part
module camlid(){
    tol=0.2;
    
difference(){
union(){
    // main boss
    translate([0,0,0])
    color("yellow")
    linear_extrude(height=6)
    offset(r=2,$fn=80)    
    square(size=[34,32],center=true);

    // camera bump boss
    translate([0,0,6])
    color("green")
//    linear_extrude(height=5,scale=0.70)
    linear_extrude(height=5,scale=1)
    offset(r=2,$fn=80)
    square([34,32],center=true);

}
    // main boss cutout
    translate([-tol,-tol,-2])
    color("orange")
    linear_extrude(height=7)
    offset(r=2,$fn=16)    
    square(size=[30+tol*2,28+tol*2],center=true);

    // bottom cut for cable
    translate([-17-tol,-28,-1])
    color("green")
    cube([34+tol*2,16,10]);

    // cut for power lid
    translate([14,-22,-1])
    color("pink")
    cube([6,20.5,11]);

    // hollow out the camera bump
    translate([0,-2.8,4.5])
    color("green")
    linear_extrude(height=5.5,scale=0.70)
    offset(r=3,$fn=16)
    square([15,19],center=true);

    // hole for the lens
    translate([0,-2.8,9])
    color("cyan")
    cylinder(r1=3.5,r2=6.0,h=2.1,$fn=80);
}


}  // end of module 

camlid();





