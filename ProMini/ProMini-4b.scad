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
    translate ([0,0,0]) color("red") 
        linear_extrude(height=12) 
        square(size=[55, 3]);
        
    ps1=[ [0,0], [16,0], [16,12], [12,12] ];

    translate ([4,19,0]) color("red") 
    rotate([90,0,-90]) linear_extrude(height=4.5) polygon(points=ps1);
    translate ([29,19,0]) color("red") 
    rotate([90,0,-90]) linear_extrude(height=4.5) polygon(points=ps1);
    translate ([55,19,0]) color("red") 
    rotate([90,0,-90]) linear_extrude(height=4.5) polygon(points=ps1);
    
    // tab for photocell
    translate([44,74,4.5]) color("purple") 
    difference(){
        linear_extrude(height=4,scale=0.8) 
        offset(r=1, $fn=8) square(size=[8,2],center=true);
        translate([-1,-2,2]) linear_extrude(height=4) 
        square(size=[2,6]);
    }    
}
    
// Xbee
translate([15,49,1.5]) color("yellow") {
pxb=[ [0,0], [25,0], [25,22], [18,28], [7,28], [0,22] ];
    linear_extrude(height=8) 
    offset(r=tol)
     polygon(points=pxb);
}
translate([21.5,70,-2]) color("black") {
    linear_extrude(height=6) 
    offset(r=1, $fn=8) square(size=[5,12]);
}

// Mic
translate([16.5,31,1.5]) color("green") {
    difference(){
        linear_extrude(height=6) 
        offset(r=tol)
         square(size=[22, 14]);
            
        linear_extrude(height=1) 
         offset(r=-3)
          square(size=[22, 14]);
    } 
}

// Wire Pass-thru also lightweighting
translate([46,32,-2]) color("black") {
    linear_extrude(height=8) 
    offset(r=1,$fn=8) square(size=[4.5,36]);
}
translate([5,32,-2]) color("black") {
    linear_extrude(height=8) 
    offset(r=1, $fn=8) square(size=[4.5,36]);
}

// popouts for boards
translate([25,38,-2]) color("black") 
    cylinder(r=3,h=8,$fn=16);
translate([25,58,-2]) color("black") 
    cylinder(r=6,h=8,$fn=16);
    
// switch cutouts
translate([8,3,1.5]) color("blue"){
    union(){
        // switch body including solder lug clearance
        linear_extrude(height=12) 
        offset(r=tol)
         square(size=[13, 18]);
        
        translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.2,h=10,$fn=22);
    }
}
translate([34,3,1]) color("blue"){
    union(){
        // switch body including solder lug clearance
        linear_extrude(height=12) 
        offset(r=tol)
         square(size=[13, 18]);
        
        translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.2,h=10,$fn=22);
    }
}



} // end of diffence

// add text
translate ([8,75,4]) color("red") 
    linear_extrude(height=1.5){
    text("4b", font = "Open Sans:style=Bold", size=4,halign="left",valign="center",spacing=1.1);
    }

translate ([5,25,4]) color("red") 
    linear_extrude(height=1.5){
    text("Boulder Brights", font = "Open Sans:style=Bold", size=4,halign="left",valign="center",spacing=1.1);
    }


pt1=[ [0,0], [0.5,0.5], [0.5,0.75], [0,1], [-1.5,1], [-1.5,0] ];
// retainer tabs green
translate([30,45.3,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([26,30.7,4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
// retainer tabs yellow
translate([32,77.3,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([26,49,4.4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}


