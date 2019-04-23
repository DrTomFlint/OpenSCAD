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
translate([26,-13,-2]) color("orange")
linear_extrude(height=4)
square(size=[18,110]);

translate([26,-13,-2]) color("pink"){
translate([13,0,0])
linear_extrude(height=17)
square(size=[3,5]);
translate([13,105,0])
linear_extrude(height=17)
square(size=[3,5]);
difference(){
    linear_extrude(height=22)
    square(size=[4,110]);
    
    translate([0,0,0])
    linear_extrude(height=16)
    square(size=[6,4]);
    
    translate([0,106,0])
    linear_extrude(height=16)
    square(size=[6,4]);
}
}

translate([12,-13,16]) color("orange")
linear_extrude(height=4)
square(size=[18,110]);

translate([12,-13,17]) color("pink"){
translate([13,0,0])
linear_extrude(height=17)
square(size=[3,5]);
translate([13,105,0])
linear_extrude(height=17)
square(size=[3,5]);

difference(){
    linear_extrude(height=22)
    square(size=[4,110]);
    
    translate([0,0,0])
    linear_extrude(height=16)
    square(size=[6,4]);
    
    translate([0,106,0])
    linear_extrude(height=16)
    square(size=[6,4]);
}
}
translate([-2,-13,34]) color("orange")
linear_extrude(height=4)
square(size=[18,110]);

translate([-2,-13,36]) color("pink"){
translate([13,0,0])
linear_extrude(height=17)
square(size=[3,5]);
translate([13,105,0])
linear_extrude(height=17)
square(size=[3,5]);

difference(){
    linear_extrude(height=22)
    square(size=[4,110]);
    
    translate([0,0,0])
    linear_extrude(height=16)
    square(size=[6,4]);
    
    translate([0,106,0])
    linear_extrude(height=16)
    square(size=[6,4]);
}
}
translate([-33,-13,54]) color("orange")
linear_extrude(height=4)
square(size=[35,110]);

translate([-33,-13,-2]) color("pink")
linear_extrude(height=60)
square(size=[4,110]);

translate([-33,-17,-6]) color("blue")
linear_extrude(height=4)
square(size=[78,118]);



//----- sidewalls
p3=[ [-33,-2], [45,-2], [45,18], [16,58], 
[-33,58] ];
p4=[ [-29,-1], [26,-1], [26,16], [12,16], [12,34], [-2,34], [-2,54], [-29,54] ];

translate([0,-13,-0.1])
rotate([90,0,0]) color("green")
difference(){
    linear_extrude(height=4) 
    polygon(points=p3);

    linear_extrude(height=4) 
    polygon(points=p4);
}

translate([0,-13+114,-0.1])
rotate([90,0,0]) color("green")

difference(){
    linear_extrude(height=4) 
    polygon(points=p3);

    linear_extrude(height=10,center=true) 
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









