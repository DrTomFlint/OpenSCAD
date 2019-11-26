// Test the junction

use <Mbox2a.scad>

color("green")
translate([-44,76,0])    
post1();

px1=[ [0,0], [8,0], [0,8] ];
translate([-44,76,0+1])    {
    difference(){
        linear_extrude(height=2)
        offset(r=4)
        square([10,10]);    
        
        translate([3,5,-1])
        cylinder(r=3,h=4,$fn=22);
    }    
    translate([9,-3,2])
    rotate([90,0,180])
    linear_extrude(height=4)
    polygon(points=px1);
    translate([9,9,2])
    rotate([90,0,180])
    linear_extrude(height=4)
    polygon(points=px1);
}
