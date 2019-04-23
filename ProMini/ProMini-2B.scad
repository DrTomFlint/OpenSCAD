
/*
// Base 1 plate
B1p=[ [0,0], [55,0], [55,70], [45,80],
[10,80], [0,70] ];
translate([0,0,0]) color("gray")
linear_extrude(height=1)
polygon(points=B1p);
*/
tol=0.25;
extra=4;

difference(){
    
union(){ // make the 3 ribs part of the base

// Base 2 plate
B1p=[ [0,0], [45,0], [45,65], [35,75],
[10,75], [0,65] ];
translate([0,0,0]) color("gray")
linear_extrude(height=2)
polygon(points=B1p);

// rib1 left
translate([0,0,0]) color("cyan")
linear_extrude(height=4)
square(size=[3,65]);
// rib1b left
translate([0,0,0]) color("cyan")
linear_extrude(height=9)
square(size=[3,10]);
// rig2 center
translate([20,0,0]) color("cyan")
linear_extrude(height=4)
square(size=[3,42]);
// rig2b center
translate([20,0,0]) color("cyan")
linear_extrude(height=9)
square(size=[3,10]);
//rib3 right
translate([42,0,0]) color("cyan")
linear_extrude(height=4)
square(size=[3,65]);
//rib3b right
translate([42,0,0]) color("cyan")
linear_extrude(height=9)
square(size=[3,10]);
//rib4 top
translate([10,72,0]) color("cyan")
linear_extrude(height=4)
square(size=[25,3]);
//rib5 top left
translate([0,62,0]) color("cyan")
linear_extrude(height=4)
square(size=[9,3]);
//rib6 top right
translate([36,62,0]) color("cyan")
linear_extrude(height=4)
square(size=[9,3]);

//rib7 base
translate([0,0,0]) color("pink")
linear_extrude(height=9)
square(size=[45,3]);

} // end of union


union(){
// Toggle Switch 1
translate([5,3,1]) color("red"){
    linear_extrude(height=7) 
    offset(r=tol)
     square(size=[13, 15]);
    
    translate([6.5,0,3.5]) rotate([90,0,0]) cylinder(r=3,h=10,$fn=16);
}

// Toggle Switch 2
translate([26,3,1]) color("red"){
    linear_extrude(height=7) 
    offset(r=tol)
     square(size=[13, 15]);
    
    translate([6.5,0,3.5]) rotate([90,0,0]) cylinder(r=3,h=10,$fn=16);
}

// Mic
translate([4.5,19.5,1]) color("green") {
    linear_extrude(height=1.7) 
    offset(r=tol)
     square(size=[14, 22]);
        
    linear_extrude(height=8) 
     offset(r=-3)
      square(size=[14, 22]);
 
}

// Xbee
translate([10,43,1]) color("orange") {
pxb=[ [0,0], [25,0], [25,22], [18,28], [7,28], [0,22] ];
    linear_extrude(height=8) 
    offset(r=tol)
     polygon(points=pxb);
}
}

}