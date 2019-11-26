// Al8a.scad
// Tests for surface heightmap emboss..

translate([0,0,0.9])
scale([0.3,0.3,0.02])
surface(file = "Flower1-128.png", center = true);

minkowski(){
cube([40,40,0.1],center=true);
sphere(1,$fn=100);
}
