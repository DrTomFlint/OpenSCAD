// BikeLights5f
// 1st print was 4f, this is the update that splits in half
// 
use <Lights5a.scad>
use <Lights5b.scad>

module Corner1(){
//--------------------------------------------
difference(){
//  Connectors form outer wall, all around loop
union(){
color("red"){
for(i=[0:1]){
    translate([35,-10+16.7*i,8]) {
        Rx1();
    }
}
}

color("yellow"){
for(i=[2:3]){
    translate([-16.7*1.5+16.7*i,-20,8]) rotate([0,0,-90]){
        Rx1();
    }
}
}

// reinforce the corner joins
color("gray")
translate([32,-17,0])
linear_extrude(height=15){
    intersection(){
        circle(12,center=true);
        translate([0,-12,0]) square(12);
    }
}
color("green")
translate([21,-18,0])
linear_extrude(height=15){
    difference(){
       square(11);
       translate([-2,14,0]) circle(12,center=true);
    }
}

}  // end of union

// cut out the corner joins
color("blue")
translate([31.2,-16.2,0])
linear_extrude(height=15){
    offset(r=1,$fn=6)
    square(size=[3,3],center=true);
}

// vertical bolt hole
translate([37,-22,0])
cylinder(r=3,h=30,$fn=22);


} // end of difference

} // end of module Corner1

//--------------------------------------------
// This is a cutting tool, so add ferrules and extend 
// the bolt holes top side only.
module Corner2(){

difference(){
//  Connectors form outer wall, all around loop
union(){
color("red"){
for(i=[0:1]){
    translate([35,-10+16.7*i,8]) {
        Rx2();
    }
}
}

color("yellow"){
for(i=[2:3]){
    translate([-16.7*1.5+16.7*i,-20,8]) rotate([0,0,-90]){
        Rx2();
    }
}
}

// reinforce the corner joins
color("gray")
translate([32,-17,0])
linear_extrude(height=15){
    intersection(){
        circle(12,center=true);
        translate([0,-12,0]) square(12);
    }
}
color("green")
translate([21,-18,0])
linear_extrude(height=15){
    difference(){
       square(11);
       translate([-2,14,0]) circle(12,center=true);
    }
}

}  // end of union


} // end of difference

// vertical bolt hole
translate([37,-22,0])
cylinder(r=3,h=30,$fn=22);

} // end of module Corner2

//=========================
// The box walls
module Walls1(){
Corner1();
//translate([15,6.7+16.7/2-16.7*5,0]) rotate([0,0,90]) Corner1();


translate([30+5,6.7+16.7,8]) Rx1();
translate([30+5,6.7+16.7*2,8]) Rx1();
translate([30+5,6.7+16.7*3,8]) Rx1();
translate([15,6.7+16.7/2+16.7*3,0]) rotate([0,0,90]) Corner1();


translate([0,80.15,0])
rotate([0,0,180]){
    Corner1();
    translate([30+5,6.7+16.7,8]) Rx1();
    translate([30+5,6.7+16.7*2,8]) Rx1();
    translate([30+5,6.7+16.7*3,8]) Rx1();
    translate([15,6.7+16.7/2+16.7*3,0]) rotate([0,0,90])
    Corner1();
}
}


//=========================
// The box walls with Ferrule4()
module Walls2(){
Corner2();
//translate([15,6.7+16.7/2-16.7*5,0]) rotate([0,0,90]) Corner1();


translate([30+5,6.7+16.7,8]) Rx2();
translate([30+5,6.7+16.7*2,8]) Rx2();
translate([30+5,6.7+16.7*3,8]) Rx2();
translate([15,6.7+16.7/2+16.7*3,0]) rotate([0,0,90]) Corner2();


translate([0,80.15,0])
rotate([0,0,180]){
    Corner2();
    translate([30+5,6.7+16.7,8]) Rx2();
    translate([30+5,6.7+16.7*2,8]) Rx2();
    translate([30+5,6.7+16.7*3,8]) Rx2();
    translate([15,6.7+16.7/2+16.7*3,0]) rotate([0,0,90])
    Corner2();
}
}

//==============================
//  BUILD:
//==============================

//Corner1();

Walls1();


//translate([0,0,40])
//Walls2();




    
// chassis type 7a
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









