// BikeLights2c
// 
use <Lights2a.scad>

for(i=[0:5]){
    translate([0,16.7*i,0]) Rx1();
}

// area for 7a chassis
B1p=[ [0,1], [1,0], [53,0], [54,1], [54,79], [48,85], [6,85], [0,79] ];
translate([0,0,40]) color("gray")
linear_extrude(height=16)
polygon(points=B1p);
