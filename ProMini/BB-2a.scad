tol=0.25;
extra=4;


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
        translate ([8.5,18,-5]) color("red") 
        difference(){
            linear_extrude(height=5,convexity=100) offset(r=1) square(size=[37,59.5]);
            linear_extrude(height=10,convexity=100) square(size=[37,59.5]);
        }
        // Bottom side mic
        translate([37.75,2.0,-6]) rotate([0,0,90]) color("green") {
        difference(){
            linear_extrude(height=6) 
            offset(r=tol) square(size=[15, 22]);

            translate([7,7,0]) color("black") 
            cylinder(r=6,h=14,$fn=16,center=true);

            }
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
    
// Adafruit PowerBoost 1000c
translate([2,1,1.5]) color("blue"){
    difference(){
        linear_extrude(height=10) 
        offset(r=tol) square(size=[22.9, 36.3]);

        linear_extrude(height=1) 
        offset(r=-3) square(size=[22.9, 36.3]);
    }
    translate([11.45,24,0]) color("cyan") {
    cylinder(h=4,r=5,center=true,$fn=20);
    }
}

// notch for the USB charger cable
translate([7,0,3]) color("pink"){
    linear_extrude(height=10) 
        offset(r=tol) square(size=[12, 3]);
}

// notch for the battery cable
translate([25,10,-8]) color("pink"){
    linear_extrude(height=8) 
        offset(r=tol) square(size=[6, 10]);
}
translate([13,12.5,-8]) color("pink"){
    linear_extrude(height=8) 
        offset(r=tol) square(size=[16, 3]);
}

// Pro Mini
translate([33.1,1,1.5]) color("red"){
    difference(){
        linear_extrude(height=10) 
        offset(r=tol) square(size=[18.4, 33.7]);

        difference(){
        linear_extrude(height=1.5) 
        offset(r=-3) square(size=[18.4, 33.7]);

        linear_extrude(height=1.5) 
        translate([2.8,7,0]) square(size=[6,20]);
        }

    }
    translate([9,22,-2]) color("cyan") {
    cylinder(h=12,r=4,$fn=30,center=true);
    }
}

// 4 pin female to LED strings
translate([3.5,54,-2]) color("black") {
    linear_extrude(height=12) 
    offset(r=tol) square(size=[2.6,11.4]);
}

// TXB0104 Level Shifter
translate([9,48,1.5]) rotate([0,0,0]) color("green") {
    difference(){
        linear_extrude(height=1.7+extra) 
        offset(r=tol) square(size=[13.4, 18.4]);
            
        linear_extrude(height=1) 
        translate([3,0,0]) square(size=[7.4, 22]);
    }
    translate([6.7,11,-2]) color("cyan") {
    cylinder(h=12,r=5,$fn=20,center=true);
    }
}

// LIS3DH
//translate([51.5,36,1.5]) rotate([0,0,90]) color("yellow") {
translate([49.5,36,1.5]) rotate([0,0,90]) color("yellow") {
    difference(){
        linear_extrude(height=10) 
        offset(r=tol) square(size=[13.4, 23.5]);
            
        linear_extrude(height=1) 
        translate([3,0,0]) square(size=[7.4, 26]);
    } 
    translate([6.7,15,-2]) cylinder(h=12,r=5,$fn=20);
}


// Xbee
translate([26,51,1.5]) color("yellow") {
pxb=[ [0,0], [24.4,0], [24.4,21], [16.9,27.7], [7.5,27.7], [0,22] ];
    linear_extrude(height=10) 
    offset(r=tol) polygon(points=pxb);

    // antenna cutout 
    translate([5,19,-2]) color("black") {
        linear_extrude(height=9) 
        offset(r=1, $fn=30) square(size=[4,12]);
    }    
    
    // alternative stowage for antenna
    translate([-10,19,-2]) color("black") {
        linear_extrude(height=9) 
        offset(r=1, $fn=30) square(size=[14,3]);
    }    
    translate([-26,19,0]) color("black") {
        linear_extrude(height=9) 
        offset(r=1, $fn=30) square(size=[16,3]);
    }    
    // popout
    translate([4,4,-2]) color("black") {
        linear_extrude(height=9) 
        offset(r=1, $fn=30) square(size=[14,9]);
    }    
    

}

// Switch 1
translate([2,1.6,-11]) color("blue"){
    union(){
        // switch body including solder lug clearance
        linear_extrude(height=12) 
        offset(r=tol)
         square(size=[13, 15]);
        
        translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.3,h=10,$fn=30);
    }
}
// Switch 2
translate([54-15,1.6,-11]) color("blue"){
    union(){
        // switch body including solder lug clearance
        linear_extrude(height=12) 
        offset(r=tol)
         square(size=[13, 15]);
        
        translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.3,h=10,$fn=30);
    }
}

// anti rotate slot for switches
translate([13,0,-7]) color("blue"){
        linear_extrude(height=2.5) 
         square(size=[3.5, 1.0]);
}
translate([50,0,-7]) color("pink"){
        linear_extrude(height=2.5) 
         square(size=[3.5, 1.0]);
}

/*
// Piezo
translate([14,69,1.5]) color("orange") {
    linear_extrude(height=1.4+extra) 
    offset(r=tol)
     circle(r=7.2);
}
// Thru hole for piezo wires
    translate([6,69,-6]) color("black") {
        linear_extrude(height=12) 
        offset(r=1,$fn=30) square(size=[2,4],center=true);
    }
*/

// Thru hole for wiring left
    translate([4.75,45,-6]) color("black") {
        linear_extrude(height=12) 
        offset(r=1,$fn=8) square(size=[3.25,10],center=true);
    }
// Thru hole for wiring right
    translate([50,38,-6]) color("black") {
        linear_extrude(height=12) 
        offset(r=1,$fn=8) square(size=[1,10]);
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
    translate([-1,80,-7]) rotate([90,0,0]) color("black") 
    linear_extrude(height=80,convexity=20) polygon(points=pg1);

    translate([55,80,2]) rotate([90,180,0]) color("pink") 
    linear_extrude(height=80,convexity=20) polygon(points=pg1);
    translate([55,80,-3]) rotate([90,180,0]) color("pink") 
    linear_extrude(height=80,convexity=20) polygon(points=pg1);
    

/*
// add text for Brights
translate ([0.3,65,-2]) rotate([90,0,-90]) color("red") 
    linear_extrude(height=0.5){
    text("Boulder Brights", font = "Open Sans:style=Bold", size=5,halign="left",valign="center",spacing=1.1);
    }
*/
} // end of diffence  =================================

// add text for Version
translate ([16,43,3.5]) color("red") 
    linear_extrude(height=1.5){
    text("2A", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }

    
// retainer tabs ----------------------------------
pt1=[ [0,0], [0.5,0.5], [0.5,0.75], [0,1], [-1.0,1], [-1.0,0] ];

// PS1000c blue
translate([2,5,4]) color("orange") {
    rotate([90,0,0]) linear_extrude(height=4) polygon(points=pt1);
}
translate([25,1,4]) color("orange") {
    rotate([90,0,180]) linear_extrude(height=4) polygon(points=pt1);
}
translate([15,37.25,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}

// Arduino Pro Mini red
translate([33,5,4]) color("orange") {
    rotate([90,0,0]) linear_extrude(height=4) polygon(points=pt1);
}
translate([44.5,34.8,4.4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([51.6,1,4]) color("orange") {
    rotate([90,0,180]) linear_extrude(height=4) polygon(points=pt1);
}
    
// Level Shift green
translate([14,48,4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([18,66.25,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}

// Accel LIS3DH yellow
translate([25.75,45,4]) color("pink") {
    rotate([90,0,0]) linear_extrude(height=4) polygon(points=pt1);
}
translate([46,35.9,4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([50,49.6,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}

// Xbee
translate([40,78.75,3.5]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([48,51,4.4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([25,51,4.4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}

    
/*
// retainer tabs piezo
translate([12.0,61.5,4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([15.5,76.6,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
*/

// retainer tabs for mic
translate([22,2.25,-8]) color("pink") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([23.5,16.95,-8]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([16.8,17,-8]) color("cyan") {
    linear_extrude(height=9) square(size=[8,1]);
}






