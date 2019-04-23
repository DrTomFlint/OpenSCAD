// BikeLights2c
// 
use <Lights2a.scad>

//Rx1();

// -----------------------------------------
module Lid1(){
translate([27.5,-16.7/2-4.5,15])
linear_extrude(height=2)
square(size=[16-0.25,109.5]);

difference(){
    translate([14+2*14,-16.7/2-4.5,8])
    linear_extrude(height=9)
    square(size=[2,109.5]);

    for(j=[0:5]){
    translate([14+2*14,16.7*j,8]) rotate([0,90,0])
    cylinder(r1=6,r2=8,h=4);
    }

}

}
module Corner1(){
//--------------------------------------------
difference(){
//  Connectors form outer wall, all around loop
union(){
color("red"){
for(i=[0:3]){
    translate([35,-10+16.7*i,9+14]) Rx1();
}
}
color("green"){
for(i=[0:3]){
    translate([35,-10+16.7*i,7+0]) rotate([180,0,0]) Rx1();
}
}

/*
color("orange"){
for(i=[0:6]){
    translate([-35,-10+16.7*i,9+14]) rotate([0,0,180]) Rx2();
}
}
color("pink"){
for(i=[0:6]){
    translate([-35,-10+16.7*i,7+0]) rotate([180,0,180]) Rx2();
}
}

color("cyan"){
for(i=[0:3]){
    translate([-16.7*1.5+16.7*i,100,9+14]) rotate([0,0,90]) Rx2();
}
}
color("cyan"){
for(i=[0:3]){
    translate([-16.7*1.5+16.7*i,100,7+0]) rotate([180,0,90]) Rx2();
}
}
*/
color("yellow"){
for(i=[2:3]){
    translate([-16.7*1.5+16.7*i,-20,9+14]) rotate([0,0,-90]) Rx1();
}
}
color("yellow"){
for(i=[2:3]){
    translate([-16.7*1.5+16.7*i,-20,7+0]) rotate([180,0,-90]) Rx1();
}
}


// reinforce the corner joins
color("gray")
translate([32,-17,0])
linear_extrude(height=30){
    intersection(){
        circle(12,center=true);
        translate([0,-12,0]) square(12);
    }
}


}  // end of union

// cut out the corner joins
color("blue")
translate([32.25,-17.25,0])
linear_extrude(height=13){
    square(size=[2.75,2.75],center=true);
}
color("green")
translate([32.25,-17.25,17])
linear_extrude(height=13){
    square(size=[2.75,2.75],center=true);
}

// vertical bolt hole
translate([38,-22,0])
cylinder(r=3,h=30,$fn=22);

// horizontal holes thru bolt hole
color("pink"){
    translate([38,-16,3])
    rotate([90,0,0]) cylinder(r=2,h=5,$fn=22);
    translate([31,-23,3])
    rotate([90,0,90]) cylinder(r=2,h=5,$fn=22);

    translate([38,-16,27])
    rotate([90,0,0]) cylinder(r=2,h=5,$fn=22);
    translate([31,-23,27])
    rotate([90,0,90]) cylinder(r=2,h=5,$fn=22);
}


} // end of difference


// reinforce the corner joins
color("blue")
translate([31.0,-16.0,0])
linear_extrude(height=30){
    circle(2,center=true,$fn=22);
}

} // end of module Corner1

difference(){
    Corner1();
    // pass through for the wiring
    color("pink")
    translate([31.5,-2,0])
    linear_extrude(height=12){
        square(size=[4,8],center=true);
    }
    color("pink")
    translate([31.5,-2,30-12])
    linear_extrude(height=12){
        square(size=[4,8],center=true);
    }
}
// no cuts in remaining 3 corners
translate([0,0,30]) rotate([0,180,0]) Corner1();
translate([0,13.4+4*16.7,30]) rotate([180,0,0]) Corner1();
translate([0,13.4+4*16.7,0]) rotate([180,180,0]) Corner1();
    



//------------------------------------
// chassis
translate([-27,8,0]) rotate([0,0,0])
union(){
// 7a chassis
B1p=[ [0,1], [1,0], [53,0], [54,1], [54,79], [48,85], [6,85], [0,79] ];
translate([0,0,0]) color("gray")
linear_extrude(height=16)
polygon(points=B1p);
// wiring rises above chassis
linear_extrude(height=26)
offset(r=-2) polygon(points=B1p);

// Switch 1
translate([2,1.6,0]) color("blue"){
    union(){
        // switch body including solder lug clearance
        linear_extrude(height=12) 
        offset(r=tol)
         square(size=[13, 15]);
        
        translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.3,h=10,$fn=30);
    }
}
// Switch 2
translate([54-15,1.6,0]) color("blue"){
    union(){
        // switch body including solder lug clearance
        linear_extrude(height=12) 
        offset(r=tol)
         square(size=[13, 15]);
        
        translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.3,h=10,$fn=30);
    }
}
}









