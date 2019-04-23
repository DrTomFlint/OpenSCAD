tol=0.25;

difference(){   // cut the board and components out of 
    // the base plate #1

union(){    

// Base 1 plate
difference(){
    B1p=[ [0,0], [55,0], [55,70], [45,80],
    [10,80], [0,70] ];
    translate([0,0,0]) color("gray")
    linear_extrude(height=8)
    polygon(points=B1p);

    // cutout an offset
    translate([0,0,-1]) color("blue"){
        difference(){
            linear_extrude(height=12)
            offset(r=-2) polygon(points=B1p);
        }
    }
}

// left
translate([0,0,0]) color("gray")
difference(){
    linear_extrude(height=8)
    square([9,30]);

    linear_extrude(height=10)
    offset(r=-2) square([9,30]);
}

// right
translate([46,0,0]) color("gray")
difference(){
    linear_extrude(height=8)
    square([9,30]);

    linear_extrude(height=10)
    offset(r=-2) square([9,30]);
}

// top
pt1=[ [0,0], [20,0], [20,4], [10,14], [0,14] ];
translate([35,66,0]) color("gray")
difference(){
    linear_extrude(height=8)
    polygon(points=pt1);

    linear_extrude(height=10)
    offset(r=-2) polygon(points=pt1);
}


} // end base union


// add text
translate ([25,1,3.5]) color("red") 
    rotate([90,0,0])
    linear_extrude(height=1){
    text("7C", font = "Open Sans:style=Bold", size=4,halign="left",valign="center",spacing=1.1);
    }

// side grooves
    pg1=[ [0,0], [1,1], [0,2] ];
    translate([0,0,5]) color("orange")
    rotate([90,180,180]) linear_extrude(height=80) polygon(points=pg1);

    translate([55,0,3]) color("orange")
    rotate([90,0,180]) linear_extrude(height=80) polygon(points=pg1);
    
} // end of diffence

