//============================================================================================
// DancingBears.scad
//
// Update the globe chassis for the Dancing Bears Baldric
// Remove accelerometer, mic, level shifter.
//
// BB-8a, chassis for snowglobes
// this mods bb-7a by cutting it into two parts
// so can print without support.
//
// DrTomFlint, 19 April 2024
//=============================================================================================

tol=0.25;
extra=4;

//------------------------------
module chassis1(){
    
difference(){   // cut the board and components out of 
    // the base plate #1
    union(){
        // Base 1 plate
        B1p=[ [0,1], [1,0], [53,0], [54,1], [54,79], [48,85], [6,85], [0,79] ];
        translate([0,0,0]) color("gray")
        linear_extrude(height=4.5)
        polygon(points=B1p);
        
        // Bottom side outer rail
        translate ([0,0,-11.5]) color("red") 
        difference(){
            linear_extrude(height=11.5,convexity=100) polygon(points=B1p);
            linear_extrude(height=15,convexity=100) offset(r=-2) polygon(points=B1p);
        }
        
        // Bottom side battery rail
        translate ([27,51.75,-4.5]) color("red") 
        difference(){
            linear_extrude(height=4.6,convexity=100) offset(r=1.0) square(size=[38,60.5],center=true);
            #linear_extrude(height=10,convexity=100,scale=0.9) square(size=[38,60.5],center=true);
            // cut for cable outlet
            translate([0,-27,0])
            linear_extrude(height=10) square(size=[26,12],center=true);
        }
        // mirror image to enclose battery
        translate ([27,51.75,-4]) color("cyan") 
        rotate([0,180,0])
        difference(){
            linear_extrude(height=4,convexity=100) offset(r=1.0) square(size=[38,60.5],center=true);
            linear_extrude(height=10,convexity=100,scale=0.9) square(size=[38,60.5],center=true);
            // cut for cable outlet
            translate([0,-27,0])
            linear_extrude(height=10,convexity=100) square(size=[26,12],center=true);
        }
        
        // ribs to support top end battery rail
        translate([49,55,-6.0]) color("pink")
        linear_extrude(height=6.0) square(size=[6,3],center=true);
        translate([49,77,-6.0]) color("pink")
        linear_extrude(height=6.0) square(size=[6,3],center=true);

        translate([5,55,-6.0]) color("pink")
        linear_extrude(height=6.0) square(size=[6,3],center=true);
        translate([5,77,-6.0]) color("pink")
        linear_extrude(height=6.0) square(size=[6,3],center=true);
        
    } // end of boss union
    
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

// anti rotate slot for switches
translate([13,0,-7]) color("blue"){
        linear_extrude(height=2.5) 
         square(size=[3.5, 1.0]);
}
translate([50,0,-7]) color("pink"){
        linear_extrude(height=2.5) 
         square(size=[3.5, 1.0]);
}

// Thru hole for wiring lower right
    translate([49.5,46,-6]) color("black") {
        linear_extrude(height=12) 
        offset(r=1,$fn=8) square(size=[3.25,11],center=true);
    }
// Thru hole for wiring upper right
    translate([49.5,64,-6]) color("black") {
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

} // end of diffence  =================================

// add text for Version
  translate ([40,47.5,3.5]) color("red") 
  linear_extrude(height=1.5)
  text("V1", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
  translate ([20,50,3.5]) color("red") 
  linear_extrude(height=1.5)
  text("Dancing", font = "Open Sans:style=Bold", size=4,halign="center",valign="center",spacing=1.1);
  translate ([22,45,3.5]) color("red") 
  linear_extrude(height=1.5)
  text("Bears", font = "Open Sans:style=Bold", size=4,halign="center",valign="center",spacing=1.1);

    
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
//~ translate([38,54,4]) color("orange") {
    //~ rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
//~ }
//~ translate([42,72.5,4]) color("orange") {
    //~ rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
//~ }

// Accel LIS3DH yellow
//~ translate([31,43,4]) color("pink") {
    //~ rotate([90,0,180]) linear_extrude(height=4) polygon(points=pt1);
//~ }
//~ translate([7.5,38.9,4]) color("orange") {
    //~ rotate([90,0,90]) linear_extrude(height=4) polygon(points=pt1);
//~ }
//~ translate([11.5,52.6,4]) color("orange") {
    //~ rotate([90,0,-90]) linear_extrude(height=4) polygon(points=pt1);
//~ }


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

    
} // end of module chassis1()

//===========================================

//~ chassis1();


//  cutting box, CHOOSE EITHER INTER OR DIFF
// TODO check the clearance between the 2 parts
// leaves enough material in the right places
// probably look at slicer to be sure

// bottom side
if(1){
difference(){
    
    chassis1();

    color("pink")
    translate([-4,-4,1-0.2])
    cube([80,100,20]);

}
}


//translate([0,0,40])
// top side
if(0){
intersection(){
    
    chassis1();

    color("pink")
    translate([-4,-4,1])
    cube([80,100,20]);

}
}
//===========================================


