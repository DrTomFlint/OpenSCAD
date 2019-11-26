// Tests for surface heightmap emboss..

use <bfly4.scad>
use <flower1.scad>

//============================

intersection(){


    // cut for ALL
//    translate([-22,-30,-4])
//    cube([44,60,12]);

    // cut for under        
    translate([-22,-30,-0.5])
    cube([44,60,0.55]);


/*
    // cut for base
    translate([-22,-30,0.05])
    cube([44,60,1.05]);
*/

/*
    // cut for flower
    translate([-22,-30,1.1])
    cube([44,60,0.8]);
*/


/*
    // cut for fly
    translate([-22,-30,1.9])
    cube([44,60,2]);
*/


union(){
    
    
color("grey"){
    translate([-5,-6,1])
    rotate([0,0,-70])
    scale([45,45,1.6])
    bfly4();
}


color("white"){
    translate([10,10,1])
    rotate([0,0,40])
    scale([12,12,0.8])
    flower1();
}



color("cyan"){
translate([0,0,0])
minkowski(){
cube([42,58,0.5],center=true);
sphere(0.5,$fn=100);
}
}

}

}
