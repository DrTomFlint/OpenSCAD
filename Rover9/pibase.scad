// pibase.scad
// This is the back for the pi zero



module pibase(){
    
// base borrowed from pieye
difference(){
    color("yellow")
    linear_extrude(height=5)
    offset(r=2,$fn=80)    
    square(size=[30,65],center=true);

    translate([0,0,1.5])
    color("orange")
    linear_extrude(height=5)
    offset(r=0.5,$fn=16)    
    square(size=[30,65],center=true);

    translate([-8.5,-36,1.5])
    color("red")
    cube([17,5,5]);

    translate([-8.5,30,1.5])
    color("red")
    cube([17,5,5]);

    translate([-14,30,12])
    color("green")
    cube([28,5,5]);

    translate([0,0,-1])
    cylinder(r=9,h=5,$fn=6);
    translate([0,20,-1])
    cylinder(r=9,h=5,$fn=6);
    translate([0,-20,-1])
    cylinder(r=9,h=5,$fn=6);


}

// posts to support PCB
color("pink")
translate([-15+3.2,-32.0+3,1]){
    cylinder(r=2.5,h=3,$fn=16);
    cylinder(r=1,h=4,$fn=16);
}
color("pink")
translate([15-3.2,-32.0+3,1]){
    cylinder(r=2.5,h=3,$fn=16);
    cylinder(r=1,h=4,$fn=16);
}
translate([-14.75+3.2,32.25-3,1]){
    cylinder(r=2.5,h=3,$fn=16);
    cylinder(r=1,h=4,$fn=16);
}
translate([14.75-3.2,32.25-3,1]){
    cylinder(r=2.5,h=3,$fn=16);
    cylinder(r=1,h=4,$fn=16);
}

} // end module pibase

pibase();
