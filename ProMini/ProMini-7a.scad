tol=0.25;
extra=4;


difference(){   // cut the board and components out of 
    // the base plate #1
    
// Base 1 plate
B1p=[ [0,0], [55,0], [55,70], [45,80],
[10,80], [0,70] ];
translate([0,0,0]) color("gray")
linear_extrude(height=4.5)
polygon(points=B1p);

//union(){
// Pro Mini
translate([32,1,1.5]) color("red"){
    difference(){
        linear_extrude(height=0.86+extra) 
        offset(r=tol) square(size=[18.4, 33.7]);

        difference(){
        linear_extrude(height=1.5) 
        offset(r=-3) square(size=[18.4, 33.7]);

        linear_extrude(height=1.5) 
        translate([2.8,7,0]) square(size=[6,20]);
        }

    }
}

// Adafruit PowerBoost 1000c
translate([4,1,1.5]) color("blue"){
    difference(){
        linear_extrude(height=1.7+extra) 
        offset(r=tol) square(size=[22.9, 36.3]);

        linear_extrude(height=1) 
        offset(r=-3) square(size=[22.9, 36.3]);
    }
}
// notch for the USB charger cable
translate([9,0,1.5]) color("pink"){
    linear_extrude(height=1.7+extra) 
        offset(r=tol) square(size=[12, 2]);
}

// TXB0104 Level Shifter
translate([13,40,1.5]) color("green") {
    difference(){
        linear_extrude(height=1.7+extra) 
        offset(r=tol) square(size=[13.4, 18.4]);
            
        linear_extrude(height=1) 
        translate([3,0,0]) square(size=[7.4, 22]);
    }
}

// LIS3DH
translate([32,37,1.5]) color("yellow") {
    difference(){
        linear_extrude(height=1.7+extra) 
        offset(r=tol) square(size=[13.4, 23.5]);
            
        linear_extrude(height=1) 
        translate([3,0,0]) square(size=[7.4, 26]);
    } 
}

// Piezo
translate([20,68,1.5]) color("orange") {
    linear_extrude(height=1.4+extra) 
    offset(r=tol)
     circle(r=7.2);
}

// Led holes
translate([50,70,-2]) color("red") {
cylinder(h=8,r=2.7,$fn=12);
}
translate([50,63.5,-2]) color("yellow") {
cylinder(h=8,r=2.7,$fn=12);
}
translate([50,57,-2]) color("green") {
cylinder(h=8,r=2.7,$fn=12);
}

// Wire Pass-thru also lightweighting
translate([48,37.5,-2]) color("black") {
    linear_extrude(height=12) 
    offset(r=1,$fn=8) square(size=[1.5,14]);
}
translate([5,41,-2]) color("black") {
    linear_extrude(height=12) 
    offset(r=1, $fn=8) square(size=[4.5,27]);
}
translate([33,64,-2]) color("black") {
    linear_extrude(height=12) 
    offset(r=1,$fn=8) square(size=[12,10]);
}
translate([23,66,-2]) color("black") {
    linear_extrude(height=12) 
    offset(r=1,$fn=8) square(size=[4,4]);
}

// Popouts for the boards
translate([16,27,-2]) color("cyan") {
cylinder(h=12,r=7,$fn=20);
}
translate([41.5,24,-2]) color("cyan") {
cylinder(h=12,r=7,$fn=20);
}
translate([39,50,-2]) color("cyan") {
cylinder(h=12,r=6,$fn=20);
}
translate([19.5,50,-2]) color("cyan") {
cylinder(h=12,r=6,$fn=20);
}

} // end of diffence

// add text
translate ([24.5,77,3.5]) color("red") 
    linear_extrude(height=1.5){
    text("7A", font = "Open Sans:style=Bold", size=4,halign="left",valign="center",spacing=1.1);
    }



pt1=[ [0,0], [0.5,0.5], [0.5,0.75], [0,1], [-1.5,1], [-1.5,0] ];
// retainer tabs blue
translate([4,5,4]) color("orange") {
    rotate([90,0,0]) linear_extrude(height=4) polygon(points=pt1);
}
translate([27,1,4]) color("orange") {
    rotate([90,0,180]) linear_extrude(height=4) polygon(points=pt1);
}
translate([17,37.25,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
    
// retainer tabs green
translate([17.5,40,4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([21.5,58.5,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}

// retainer tabs yellow
translate([37,37,4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([40.5,60.25,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}

// retainer tabs red
translate([31.75,5,4]) color("orange") {
    rotate([90,0,0]) linear_extrude(height=4) polygon(points=pt1);
}
translate([50.7,1,4]) color("orange") {
    rotate([90,0,180]) linear_extrude(height=4) polygon(points=pt1);
}
translate([43,34.5,4.4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
    

// retainer tabs piezo
translate([17.5,61.5,4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([21.5,74.7,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}



