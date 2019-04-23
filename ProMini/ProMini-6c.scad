tol=0.25;
extra=4;


difference(){   // cut the board and components out of 
    // the base plate #1
    
// Base 1 plate
B1p=[ [0,0], [55,0], [55,70], [45,80],
[10,80], [0,70] ];
translate([0,0,0]) color("gray")
linear_extrude(height=8)
polygon(points=B1p);

// cutout an offset
translate([0,0,-1]) color("blue"){
    difference(){
        linear_extrude(height=12)
        offset(r=-3) polygon(points=B1p);
    }
}

// add text
translate ([25,1,3.5]) color("red") 
    rotate([90,0,0])
    linear_extrude(height=1){
    text("6C", font = "Open Sans:style=Bold", size=4,halign="left",valign="center",spacing=1.1);
    }

// side grooves
    pg1=[ [0,0], [2,2], [0,4] ];
    translate([0,0,6]) color("orange")
    rotate([90,180,180]) linear_extrude(height=80) polygon(points=pg1);

    translate([55,0,2]) color("orange")
    rotate([90,0,180]) linear_extrude(height=80) polygon(points=pg1);
    
} // end of diffence

// left
translate([0,0,0]) color("gray")
difference(){
    linear_extrude(height=8)
    square([9,30]);

    linear_extrude(height=8)
    offset(r=-3) square([9,30]);
}

// right
translate([46.1,0,0]) color("gray")
difference(){
    linear_extrude(height=8)
    square([9,30]);

    linear_extrude(height=8)
    offset(r=-3) square([9,30]);
}

// top
pt1=[ [0,0], [20,0], [20,4], [10,14], [0,14] ];
translate([35,66,0]) color("gray")
difference(){
    linear_extrude(height=8)
    polygon(points=pt1);

    linear_extrude(height=8)
    offset(r=-3) polygon(points=pt1);
}


