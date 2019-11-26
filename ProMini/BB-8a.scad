// BB-8a, chassis for snowglobes
// this mods bb-7a by cutting it into two parts
// so can print without support.

tol=0.25;
extra=4;

//------------------------------
module chassis1(){
    
difference(){   // cut the board and components out of 
    // the base plate #1
    union(){
        // Base 1 plate
//        B1p=[ [0,0], [54,0], [54,79], [48,85], [6,85], [0,79] ];
        B1p=[ [0,1], [1,0], [53,0], [54,1], [54,79], [48,85], [6,85], [0,79] ];
        translate([0,0,0]) color("gray")
        linear_extrude(height=4.5)
        polygon(points=B1p);
        
        // Bottom side outer rail
        translate ([0,0,-11.5]) color("red") 
        difference(convexity=100){
            linear_extrude(height=11.5,convexity=100) polygon(points=B1p);
            linear_extrude(height=15,convexity=100) offset(r=-2) polygon(points=B1p);
        }
        
        // Bottom side battery rail
        translate ([27,51.75,-4.5]) color("red") 
        difference(convexity=100){
            linear_extrude(height=4.6,convexity=100) offset(r=1.5) square(size=[37,60.5],center=true);
            linear_extrude(height=10,convexity=100,scale=0.9) square(size=[37,60.5],center=true);
            // cut for cable outlet
            translate([0,-27,0])
            linear_extrude(height=10) square(size=[26,12],center=true);
        }
        // mirror image to enclose battery
        translate ([27,51.75,-4]) color("cyan") 
        rotate([0,180,0])
        difference(){
            linear_extrude(height=4,convexity=100) offset(r=1.5) square(size=[37,60.5],center=true);
            linear_extrude(height=10,convexity=100,scale=0.9) square(size=[37,60.5],center=true);
            // cut for cable outlet
            translate([0,-27,0])
            linear_extrude(height=10,convexity=100) square(size=[26,12],center=true);
        }
        
        // ribs to support top end battery rail
        translate([49,55,-6.0]) color("pink")
        linear_extrude(height=6.0) square(size=[7,3],center=true);
        translate([49,77,-6.0]) color("pink")
        linear_extrude(height=6.0) square(size=[7,3],center=true);

        translate([5,55,-6.0]) color("pink")
        linear_extrude(height=6.0) square(size=[7,3],center=true);
        translate([5,77,-6.0]) color("pink")
        linear_extrude(height=6.0) square(size=[7,3],center=true);
        
        // Bottom side mic
        translate([37.75,2.0,-6]) rotate([0,0,90]) color("green") {
        difference(){
            linear_extrude(height=6) 
            offset(r=tol) square(size=[15, 22]);
            
            // hole for the mic 
            translate([7,14,0]) color("black") 
            cylinder(r=6,h=14,$fn=16,center=true);
            
            }
         }
        // Reinforce LED 4 pin connector
        translate([46,56,-2])
            linear_extrude(height=2) square(size=[6,16]);
    }
    
    // cut to form spring
    translate([45,30,-0.5]) color("pink")
    linear_extrude(height=0.5) square(size=[12,40],center=true);
    translate([9,30,-0.5]) color("pink")
    linear_extrude(height=0.5) square(size=[12,40],center=true);
    
    
    // Cutouts in the bottom outer rail to support fiber crossbar
        ps1=[ [0,0], [15,0], [14,4.5], [1,4.5] ];

        translate ([0,42,-8]) color("cyan") 
        rotate([-90,0,-90]) linear_extrude(height=2) polygon(points=ps1);
        translate ([52,42,-8]) color("cyan") 
        rotate([-90,0,-90]) linear_extrude(height=2) polygon(points=ps1);

        translate ([0,73,-8]) color("cyan") 
        rotate([-90,0,-90]) linear_extrude(height=2) polygon(points=ps1);
        translate ([52,73,-8]) color("cyan") 
        rotate([-90,0,-90]) linear_extrude(height=2) polygon(points=ps1);


// NEW holes at the top to help attach the two 
// parts using some glue and fibers
    color("cyan")
    translate([6,81,0]) 
    cylinder(h=20,r=1,center=true,$fn=20);
    color("cyan")
    translate([47.5,81,0]) 
    cylinder(h=20,r=1,center=true,$fn=20);
    color("cyan")
    translate([24.75,4,0]) 
    cylinder(h=20,r=1,center=true,$fn=20);


    
// Adafruit PowerBoost 1000c
translate([29.1,1,1.5]) color("blue"){
    difference(){
        linear_extrude(height=10) 
        offset(r=tol) square(size=[22.9, 36.3]);

        linear_extrude(height=1) 
        offset(r=-3) square(size=[22.9, 36.3]);
    }
    translate([11.45,26,0]) color("cyan") {
    cylinder(h=4,r=5,center=true,$fn=20);
    }
}

// notch for the USB charger cable
translate([35,0,3]) color("pink"){
    linear_extrude(height=10) 
        offset(r=tol) square(size=[12, 3]);
}

// Pro Mini
translate([2,1,1.5]) color("red"){
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
    translate([12,26,-2]) color("cyan") {
    cylinder(h=12,r=4,$fn=30,center=true);
    }
}


// 4 pin female to LED strings
translate([48,58,-2]) color("black") {
    linear_extrude(height=12) 
    offset(r=tol) square(size=[2.1,11.4]);
}

// TXB0104 Level Shifter
translate([33,54,1.5]) rotate([0,0,0]) color("green") {
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
translate([31,39,1.5]) rotate([0,0,90]) color("yellow") {
    difference(){
        linear_extrude(height=10) 
        offset(r=tol) square(size=[13.4, 23.5]);
            
        linear_extrude(height=1) 
        translate([3,0,0]) square(size=[7.4, 26]);
    } 
    translate([6.7,15,-2]) cylinder(h=12,r=5,$fn=20);
}


// Xbee
translate([7,55,1.5]) color("yellow") {
pxb=[ [0,0], [24.4,0], [24.4,21], [16.9,27.7], [7.5,27.7], [0,22] ];
    linear_extrude(height=10) 
    offset(r=tol) polygon(points=pxb);

    // alternative stowage for antenna
    translate([6,20,-2]) color("black") {
        linear_extrude(height=9) 
        offset(r=1, $fn=30) square(size=[30,2]);
    }    
    // popout
    translate([5,6,-2]) color("black") {
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
// Pogo Pins
translate([31.0,0,-3]) color("blue"){
       rotate([90,0,0]) {
        // pin holes
        cylinder(r1=1.0,r2=0.8,h=60,$fn=12,center=true);
        translate([4,0,0]) cylinder(r1=1.0,r2=0.8,h=60,$fn=12,center=true);

        // outer cutout
        translate([2,0,-4]) linear_extrude(height=4.1,scale=1.2) 
        offset(r=1,$fn=8) square(size=[6,2],center=true);
           
        // inner cutout   
        translate([-8,-5,-15]) linear_extrude(height=8) 
        square(size=[16,8]);
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


// Thru hole for wiring wide right
    translate([49.5,46,-6]) color("black") {
        linear_extrude(height=12) 
        offset(r=1,$fn=8) square(size=[3.25,11],center=true);
    }
// Thru hole for wiring lower left
    translate([2.75,41,-6]) color("black") {
        linear_extrude(height=12) 
        offset(r=1,$fn=8) square(size=[3.25,10]);
    }
// Thru hole for wiring upper left
    translate([2.75,58,-6]) color("black") {
        linear_extrude(height=12) 
        offset(r=1,$fn=8) square(size=[3.25,16]);
    }


// Hole for the mic        
translate([25,9.5,0]) color("black") 
cylinder(r=3,h=14,$fn=16,center=true);

    
} // end of diffence  =================================


// add text for Version
translate ([40,45,3.5]) color("red") 
    linear_extrude(height=1.5){
    text("8A", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }

    
// retainer tabs ----------------------------------
pt1=[ [0,0], [0.5,0.5], [0.5,0.75], [0,1], [-1.0,1], [-1.0,0] ];

// PS1000c blue
translate([29.1,6,4]) color("orange") {
    rotate([90,0,0]) linear_extrude(height=4) polygon(points=pt1);
}
translate([52,2,4]) color("orange") {
    rotate([90,0,180]) linear_extrude(height=4) polygon(points=pt1);
}
translate([40.5,37.25,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}

// Arduino Pro Mini red
translate([2,6,4]) color("orange") {
    rotate([90,0,0]) linear_extrude(height=4) polygon(points=pt1);
}
translate([17.2,34.8,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([9.2,34.8,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([20.5,2,4]) color("orange") {
    rotate([90,0,180]) linear_extrude(height=4) polygon(points=pt1);
}
    
// Level Shift green
translate([38,54,4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([42,72.5,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}

// Accel LIS3DH yellow
translate([31,43,4]) color("pink") {
    rotate([90,0,180]) linear_extrude(height=4) polygon(points=pt1);
}
translate([7.5,38.9,4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([11.5,52.6,4]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}


// Xbee
translate([21,82.75,3.5]) color("orange") {
    rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([7,55,4.4]) color("orange") {
    rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
}
translate([24,55,4.4]) color("orange") {
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

/*
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
*/

/*
// Piezo
translate([40,69,1.5]) color("orange") {
    linear_extrude(height=1.4+extra) 
    offset(r=tol)
     circle(r=7.2);
}
// Thru hole for piezo wires
    translate([36,69,-6]) color("black") {
        linear_extrude(height=12) 
        offset(r=1,$fn=30) square(size=[2,4],center=true);
    }
*/


/*
// Hole for the photosensor
translate([40,78,-8]) color("cyan") 
rotate([90,0,0]) cylinder(r=2.1,h=4,$fn=16,center=true);
*/
    
/*
// Led holes
translate([16,78,-8]) color("cyan") 
rotate([90,0,0]) cylinder(r=2.8,h=4,$fn=16,center=true);
translate([24,78,-8]) color("cyan") 
rotate([90,0,0]) cylinder(r=2.8,h=4,$fn=16,center=true);
translate([32,78,-8]) color("cyan") 
rotate([90,0,0]) cylinder(r=2.8,h=4,$fn=16,center=true);
*/

} // end of module chassis1()
//===========================================



//  cutting box, CHOOSE EITHER INTER OR DIFF
//intersection(){
difference(){
    
    chassis1();

    color("pink")
    translate([0,0,1])
    cube([80,100,20]);

}

//===========================================


