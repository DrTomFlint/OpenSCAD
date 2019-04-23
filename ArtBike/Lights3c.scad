// BikeLights2c
// 
use <Lights2a.scad>

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
// -----------------------------------------
difference(){
// bookshelf 
union(){
    translate([26,-13,-2]) color("orange"){
    difference(){
    linear_extrude(height=2)
    square(size=[18,110]);

    for(k=[0:5]){
        translate([9,15+16*k,-6])
        linear_extrude(height=14)
        rotate([0,0,30])
        circle(r=6,$fn=6);
    }
}
}

translate([26,-13,-2]) color("pink"){

translate([13,0,0])
linear_extrude(height=17)
square(size=[3,5]);

translate([13,105,0])
linear_extrude(height=17)
square(size=[3,5]);

translate([0,0,0])
difference(){
    linear_extrude(height=22)
    square(size=[2,110]);
    
    translate([0,0,0])
    linear_extrude(height=16)
    square(size=[6,4]);
    
    translate([0,106,0])
    linear_extrude(height=16)
    square(size=[6,4]);

    for(k=[0:5]){
        translate([0,15+16*k,10])
        rotate([0,90,0])
        linear_extrude(height=4)
        rotate([0,0,30])
        circle(r=7,$fn=6);
    }
}
}

translate([12,-13,17]) color("orange"){
    difference(){
    linear_extrude(height=2)
    square(size=[18,110]);

    for(k=[0:5]){
        translate([9,15+16*k,-6])
        linear_extrude(height=14)
        rotate([0,0,30])
        circle(r=6,$fn=6);
    }
}
}

translate([12,-13,17]) color("pink"){
translate([13,0,0])
linear_extrude(height=17)
square(size=[3,5]);
translate([13,105,0])
linear_extrude(height=17)
square(size=[3,5]);

difference(){
    linear_extrude(height=22)
    square(size=[2,110]);
    
    translate([0,0,0])
    linear_extrude(height=16)
    square(size=[6,4]);
    
    translate([0,106,0])
    linear_extrude(height=16)
    square(size=[6,4]);
    for(k=[0:5]){
        translate([0,15+16*k,10])
        rotate([0,90,0])
        linear_extrude(height=4)
        rotate([0,0,30])
        circle(r=7,$fn=6);
    }
}
}
translate([-2,-13,36]) color("orange"){
    difference(){
    linear_extrude(height=2)
    square(size=[18,110]);

    for(k=[0:5]){
        translate([9,15+16*k,-6])
        linear_extrude(height=14)
        rotate([0,0,30])
        circle(r=6,$fn=6);
    }
}
}

translate([-2,-13,36]) color("pink"){
translate([13,0,0])
linear_extrude(height=17)
square(size=[3,5]);
translate([13,105,0])
linear_extrude(height=17)
square(size=[3,5]);

difference(){
    linear_extrude(height=21)
    square(size=[2,110]);
    
    translate([0,0,0])
    linear_extrude(height=16)
    square(size=[6,4]);
    
    translate([0,106,0])
    linear_extrude(height=16)
    square(size=[6,4]);
    for(k=[0:5]){
        translate([0,15+16*k,10])
        rotate([0,90,0])
        linear_extrude(height=4)
        rotate([0,0,30])
        circle(r=7,$fn=6);
    }
}
}

// topside
translate([-33,-13,55]) color("orange")
difference(){
    linear_extrude(height=2)
    square(size=[35,110]);    
    linear_extrude(height=2)
    offset(r=-6)
    square(size=[35,110]);
}
translate([-33,-13,-2]) color("pink")
difference(){
    linear_extrude(height=59)
    square(size=[2,110]);
    translate([0,6,6])
    linear_extrude(height=59-12)
    square(size=[2,110-12]);
}
translate([-33,-15,-4]) color("blue")
difference(){
    linear_extrude(height=2)
    square(size=[78,114]);
    translate([6,8,0])
    linear_extrude(height=2)
    square(size=[50,98]);
}


//----- sidewalls
p3=[ [-33,-2], [45,-2], [45,18], [16,57], 
[-33,57] ];
p4=[ [-27,0], [26,0], [26,17], [12,17], [12,36], [-2,36], [-2,54], [-27,54] ];

translate([0,-13,-0.1])
rotate([90,0,0]) color("green")
difference(){
    linear_extrude(height=2) 
    polygon(points=p3);

    linear_extrude(height=2) 
    polygon(points=p4);
}

translate([0,-13+112,-0.1])
rotate([90,0,0]) color("green")

difference(){
    linear_extrude(height=2) 
    polygon(points=p3);

    linear_extrude(height=2) 
    polygon(points=p4);
}

}


//--------------------------------------------
// Three rows of connectors
for(i=[0:5]){
    translate([5,16.7*i,46]) Rx2();
}
for(i=[0:5]){
    translate([5+14,16.7*i,27]) Rx2();
}
for(i=[0:5]){
    translate([5+2*14,16.7*i,8]) Rx2();
}

Lid1();
translate([-14,0,19]) Lid1();
translate([-14*2,0,19*2]) Lid1();

}

/*

translate([-2,8,0]) rotate([0,-90,0])
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

*/







