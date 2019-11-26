// Tests for surface heightmap emboss..

/*
translate([7,11,0.9])
rotate([0,0,63])
scale([0.04,0.04,0.005])
surface(file = "Flower1-128.png", center = true);
*/

translate([0,0,0.99])
scale([0.1,0.1,0.005])
surface(file = "Butterfly1-200-267.png", center = true);

translate([5.3,5,0.99])
rotate([0,0,13])
scale([0.06,0.06,0.003])
surface(file = "Flower1-128.png", center = true);


translate([0,0,0])
minkowski(){
cube([20,28,0.1],center=true);
sphere(1,$fn=100);
}

