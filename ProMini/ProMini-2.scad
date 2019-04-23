
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

//union(){ // make the 3 ribs part of the base

difference(){   // cut the board and components out of 
    // the base plate #1
    
// Base 1 plate
B1p=[ [0,0], [55,0], [55,70], [45,80],
[10,80], [0,70] ];
translate([0,0,0]) color("gray")
linear_extrude(height=4)
polygon(points=B1p);

//union(){
// Pro Mini
translate([32,1,1]) color("red"){
    difference(){
        linear_extrude(height=0.86+extra) 
        offset(r=tol) square(size=[18.4, 33.7]);

        difference(){
        linear_extrude(height=1) 
        offset(r=-4) square(size=[18.4, 33.7]);

        linear_extrude(height=1) 
        translate([3.5,7,0]) square(size=[6,20]);
        }

    }
}

// Adafruit PowerBoost 1000c
translate([4,1,1]) color("blue"){
    difference(){
        linear_extrude(height=1.7+extra) 
        offset(r=tol) square(size=[22.9, 36.8]);

        linear_extrude(height=1) 
        offset(r=-4) square(size=[22.9, 36.8]);
    }
}
// notch for the USB charger cable
translate([9,0,1]) color("pink"){
    linear_extrude(height=1.7+extra) 
        offset(r=tol) square(size=[12, 2]);
}

// TXB0104 Level Shifter
translate([10,40,1]) color("green") {
    difference(){
        linear_extrude(height=1.7+extra) 
        offset(r=tol) square(size=[13.4, 18.4]);
            
        linear_extrude(height=1) 
        offset(r=-4) square(size=[13.4, 18.4]);
    }
}

// LIS3DH
translate([34,38,1]) color("yellow") {
    linear_extrude(height=1.7+extra) 
    offset(r=tol)
     square(size=[13.4, 23.5]);
        
    linear_extrude(height=3.3) 
     offset(r=-3)
      square(size=[13.4, 23.5]);
 
}

// Piezo
translate([17,68,1]) color("orange") {
    linear_extrude(height=1.4+extra) 
    offset(r=tol)
     circle(r=7);
}

// Led holes
translate([35,75,-2]) color("red") {
cylinder(h=8,r=2.5,$fn=12);
}
translate([42,70,-2]) color("yellow") {
cylinder(h=8,r=2.5,$fn=12);
}
translate([49,65,-2]) color("green") {
cylinder(h=8,r=2.5,$fn=12);
}

//} // end of union

} // end of diffence

/* don't need the ribs
// rib1
translate([0,0,0]) color("cyan")
linear_extrude(height=6)
square(size=[3,70]);
// rig2
translate([28,0,0]) color("cyan")
linear_extrude(height=6)
square(size=[3,80]);
//rib3
translate([52,0,0]) color("cyan")
linear_extrude(height=6)
square(size=[3,70]);
*/
