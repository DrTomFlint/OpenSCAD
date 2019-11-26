// Tests for surface heightmap emboss..

use <bfly6.scad>
use <flower1.scad>

//============================
    
    // Flower
    if(0){
    color("white"){
        translate([32,42,0.8])
        rotate([0,0,40])
        scale([12,12,0.8])
        flower1();
    }
    }

    // Butterfly in 2 layers
    if(1){
    intersection(){

    color("grey"){
        translate([17,22,0.8])
        rotate([0,0,-70])
        scale([45,45,1.6])
        bfly6();
    }

    // cut for base
    if(0){    
    translate([0,0,0.8])
    cube([44,60,0.7]);
    }
    
    // cut for top
    if(1){
    translate([0,0,1.5])
    cube([44,60,1]);
    }
    
    }
    }   // end butterfly    

// base in 2 layers
if(0){
intersection(){
        difference(){
            minkowski(){
                cube([42,58,0.5]);
                sphere(0.5,$fn=100);
            }
    union(){
    color("white"){
        translate([32,42,0.8])
        rotate([0,0,40])
        scale([12,12,0.8])
        flower1();
        }

    color("grey"){
        translate([17,22,0.8])
        rotate([0,0,-70])
        scale([45,45,1.6])
        bfly6();
        }

    }
}    


    // cut for under        
    if(1){
    translate([-0.5,-0.5,0])
    cube([44,60,0.5]);
    }


   // cut for base
    if(0){
    translate([-1,-1,0.5])
    cube([44,60,1]);
    }

}
}