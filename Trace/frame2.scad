// Tests for surface heightmap emboss..

use <bfly6.scad>
use <flower1.scad>

//============================

/*
    
color("grey"){
    translate([17,22,1.8])
    rotate([0,0,-70])
    scale([45,45,1.6])
    bfly6();
}
*/

/*
color("white"){
    translate([32,42,1.8])
    rotate([0,0,40])
    scale([12,12,0.8])
    flower1();
}

*/


intersection(){
    color("cyan"){
        difference(){
            minkowski(){
                cube([42,58,1]);
                sphere(1,$fn=100);
            }
            translate([21,55,-2])
            cylinder(r=0.6,h=10,$fn=22);
        }
    }
    


    // cut for under        
    translate([-1,-1,-1])
    cube([44,60,1.5]);
/*

   // cut for base
    translate([-1,-1,0.5])
    cube([44,60,1.5]);
*/

}

