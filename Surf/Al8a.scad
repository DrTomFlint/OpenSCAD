// Al8a.scad
// Tests for surface heightmap emboss..

translate([0,0,1.5])
scale([0.3,0.3,0.02])
surface(file = "Flower1.png", center = true);

minkowski(){
cube([80,80,2],center=true);
sphere(1,$fn=100);
}
