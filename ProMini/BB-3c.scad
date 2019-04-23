// BB-3c
// This is the mount for LED strip

tol=0.25;
extra=4;

/*
// Bar
    translate ([0,25,-11.5]) color("pink") 
        linear_extrude(height=4.5) 
        square(size=[54, 15]);
*/




difference(){
// rotated poly    
    px1=[ [0,0], [12,0], [12,1], [13,1], [14,0], [14,-2], [-2,-2],
          [-2,0], [-1,1], [0,1] ];
    translate ([27,20,-3.5]) rotate([90,180/12,0]) color("pink") 
        rotate_extrude(angle=360,$fn=200)
            translate([-29,0,0]) rotate([0,0,90]) polygon(points=px1);
i=0;
N=12;
M=6;
translate([27,14,-3])
for(i=[0:1:N-1])
    rotate([0,360/N*i,0]) 
        translate([27,0,0]) 
        rotate([0,90,0]) 
        rotate([0,0,180/M])
        cylinder(r1=5.5,r2=5.5,h=10,center=true,$fn=M);
        


difference(){   // cut the board and components out of 
    // the base plate #1
    union(){
        // Base 1 plate
        B1p=[ [0,0], [54,0], [54,70], [44,80],
        [10,80], [0,70] ];
        translate([0,0,0]) color("gray")
        linear_extrude(height=4.5)
        polygon(points=B1p);

        // Switch mounts
        translate ([0,0,-11]) color("red") 
            linear_extrude(height=11) 
            square(size=[54, 2]);

        // Bottom side outer rail
        translate ([0,0,-11.5]) color("red") 
        difference(){
            linear_extrude(height=11.5,convexity=100) polygon(points=B1p);
            linear_extrude(height=12,convexity=100) offset(r=-2) polygon(points=B1p);
        }
        
        // Bottom side battery rail
        translate ([8.5,16,-5]) color("red") 
        difference(){
            linear_extrude(height=5,convexity=100) offset(r=1) square(size=[37,60.5]);
            linear_extrude(height=10,convexity=100) square(size=[37,60.5]);
        }
        // Reinforce LED 4 pin connector
        translate([2,52,-2])
            linear_extrude(height=2) square(size=[6,16]);


    }
    
    // Cutouts in the bottom outer rail to support fiber crossbar
        ps1=[ [0,0], [15,0], [14,4.5], [1,4.5] ];

        translate ([0,40,-8]) color("cyan") 
        rotate([-90,0,-90]) linear_extrude(height=2) polygon(points=ps1);
        translate ([52,40,-8]) color("cyan") 
        rotate([-90,0,-90]) linear_extrude(height=2) polygon(points=ps1);

        translate ([0,65,-8]) color("cyan") 
        rotate([-90,0,-90]) linear_extrude(height=2) polygon(points=ps1);
        translate ([52,65,-8]) color("cyan") 
        rotate([-90,0,-90]) linear_extrude(height=2) polygon(points=ps1);

// Thru hole for wiring left
    translate([4.75,45,-6]) color("black") {
        linear_extrude(height=12) 
        offset(r=1,$fn=8) square(size=[3.25,10],center=true);
    }
// Thru hole for wiring lower right
    translate([50,38,-6]) color("black") {
        linear_extrude(height=12) 
        offset(r=1,$fn=8) square(size=[1,10]);
    }
// Thru hole for wiring upper right
    translate([50.5,53,-6]) color("black") {
        linear_extrude(height=12) 
        offset(r=1,$fn=8) square(size=[0.5,16]);
    }


// Hole for the mic        
translate([28.9,9.5,0]) color("black") 
cylinder(r=3,h=14,$fn=16,center=true);

// Hole for the photosensor
translate([40,78,-8]) color("cyan") 
rotate([90,0,0]) cylinder(r=2.1,h=4,$fn=16,center=true);

// Led holes
translate([16,78,-8]) color("cyan") 
rotate([90,0,0]) cylinder(r=2.8,h=4,$fn=16,center=true);
translate([24,78,-8]) color("cyan") 
rotate([90,0,0]) cylinder(r=2.8,h=4,$fn=16,center=true);
translate([32,78,-8]) color("cyan") 
rotate([90,0,0]) cylinder(r=2.8,h=4,$fn=16,center=true);

// Grooves in the side walls
    pg1=[ [0,0], [2,2], [0,4] ];
    translate([-1,80,-2]) rotate([90,0,0]) color("black") 
    linear_extrude(height=80,convexity=20) polygon(points=pg1);

    translate([55,80,2]) rotate([90,180,0]) color("pink") 
    linear_extrude(height=80,convexity=20) polygon(points=pg1);

} // end of diffence  =================================


  }

/*
// add text for Version
translate ([16,43,3.5]) color("red") 
    linear_extrude(height=1.5){
    text("3C", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }

*/