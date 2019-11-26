// Tests for surface heightmap emboss..

/* Pick a color below for STL export, or "ALL" to show all colors. */
current_color = "ALL";
//current_color = "black";
//current_color = "white";
//current_color = "grey";

//-------------------------------------------
/* Similar to the color function, but can be used for generating multi-color models for printing.
 * The global current_color variable indicates the color to print.
 */
module multicolor(color) {
    if (current_color != "ALL" && current_color != color) { 
        // ignore our children.
        // (I originally used "scale([0,0,0])" which also works but isn't needed.) 
    } else {
        color(color)
        children();
    }        
}
//============================

intersection(){
/*
    // cut for under        
    translate([-22,-30,-0.5])
    cube([44,60,1.5]);
*/

    // cut for base
    translate([-22,-30,1.5])
    cube([44,60,1]);


/*
    // cut for flower
    translate([-22,-30,2.49])
    cube([44,60,1.25]);
*/

/*
    // cut for fly
    translate([-22,-30,3.5])
    cube([44,60,1]);
*/


union(){
    
    
multicolor("grey"){
translate([0,0,2.5])
difference(){
    translate([0,0,0.95]);
    scale([0.2,0.2,0.02])
    surface(file = "Butterfly1-200-267.png", center = true);

    translate([0,0,-0.52])
    cube([80,80,1],center=true);
}
}

multicolor("white"){
translate([2*5.3,2*5,2.5])
rotate([0,0,13])
difference(){
    translate([0,0,0.8]);
    scale([0.12,0.12,0.01])
    surface(file = "Flower1-128.png", center = true);

    translate([0,0,-0.2])
    cube([80,80,0.1],center=true);
}
}


multicolor("cyan"){
translate([0,0,1])
minkowski(){
cube([42,58,0.05],center=true);
sphere(0.95,$fn=100);
}
}

}

}
