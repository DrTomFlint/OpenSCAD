tol=0.25;
extra=4;


difference(){   // cut the board and components out of baseplate

union(){        // union baseplate and switch mounts    
    // Base 1 plate
    B1p=[ [0,0], [55,0], [55,70], [45,80],
    [10,80], [0,70] ];
    translate([0,0,0]) color("gray")
    linear_extrude(height=4.5)
    polygon(points=B1p);

    // Switch mounts
    translate ([2.5,0,0]) color("red") 
        linear_extrude(height=12) 
        square(size=[50, 2]);
        
    ps1=[ [0,0], [16,0], [16,12], [12,12] ];

    translate ([4.5,18,0]) color("red") 
    rotate([90,0,-90]) linear_extrude(height=2) polygon(points=ps1);
    translate ([28.5,18,0]) color("red") 
    rotate([90,0,-90]) linear_extrude(height=2) polygon(points=ps1);
    translate ([52.5,18,0]) color("red") 
    rotate([90,0,-90]) linear_extrude(height=2) polygon(points=ps1);
    
}

// Xbee
translate([26,48,1.5]) color("yellow") {
pxb=[ [0,0], [25,0], [25,22], [18,27.75], [7,27.75], [0,22] ];
    linear_extrude(height=8) 
    offset(r=tol)
     polygon(points=pxb);
}
translate([30,70,-2]) color("black") {
    linear_extrude(height=9) 
    offset(r=1, $fn=8) square(size=[5,12]);
}

// Mic
translate([20,50,2.2]) rotate([0,0,90]) color("green") {
        linear_extrude(height=6) 
        offset(r=tol) square(size=[22, 14]);
 }

// popouts for mic
translate([12.9,65.4,-2]) color("black") 
    cylinder(r=5.5,h=8,$fn=16);

// popout for xbee
translate([38.5,58,-2]) color("black") 
    cylinder(r=6,h=8,$fn=16);

// cut for photocell
translate([22.5,45,1.5]) color("black") {
    linear_extrude(height=8) 
    offset(r=1,$fn=8) square(size=[0.5,40]);
}
 
// Wire Pass-thru also lightweighting
translate([30,30,-2]) color("black") {
    linear_extrude(height=8) 
    offset(r=1,$fn=8) square(size=[19,14]);
}
translate([5,30,-2]) color("black") {
    linear_extrude(height=8) 
    offset(r=1, $fn=8) square(size=[19,14]);
}

// switch cutouts
translate([9,2,1.5]) color("blue"){
    union(){
        // switch body including solder lug clearance
        linear_extrude(height=12) 
        offset(r=tol)
         square(size=[13, 18]);
        
        translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.3,h=10,$fn=22);
    }
}
translate([33,2,1]) color("blue"){
    union(){
        // switch body including solder lug clearance
        linear_extrude(height=12) 
        offset(r=tol)
         square(size=[13, 18]);
        
        translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.3,h=10,$fn=22);
    }
}
// anti rotate slot for switches
translate([7,0,5]) color("pink"){
        linear_extrude(height=2.5) 
         square(size=[3.5, 1.5]);
}
translate([31.2,0,5]) color("pink"){
        linear_extrude(height=2.5) 
         square(size=[3.5, 1.5]);
}

} // end of diffence


// add text
translate ([12,76.5,4]) color("red") 
    linear_extrude(height=1.5){
    text("8B", font = "Open Sans:style=Bold", size=4,halign="left",valign="center",spacing=1.1);
    }

translate ([5,24.5,4]) color("red") 
    linear_extrude(height=1.5){
    text("Boulder Brights", font = "Open Sans:style=Bold", size=4,halign="left",valign="center",spacing=1.1);
    }


pt1=[ [0,0], [0.5,0.5], [0.5,0.75], [0,1], [-1.5,1], [-1.5,0] ];
// retainer tabs green
translate([15,72.3,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([5.5,49.8,4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=3) polygon(points=pt1);
}
translate([17.5,49.8,4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=3) polygon(points=pt1);
}
// retainer tabs yellow
translate([40,75.5,3.5]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([48,48.3,4.4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([25,48.3,4.4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}

/*
    // tab for photocell
    translate([23,76,4.5]) color("purple") 
    difference(){
        linear_extrude(height=4,scale=0.8) 
        offset(r=1, $fn=8) square(size=[8,2],center=true);
        translate([-1,-2,2]) linear_extrude(height=4) 
        square(size=[2,6]);
    }    

*/