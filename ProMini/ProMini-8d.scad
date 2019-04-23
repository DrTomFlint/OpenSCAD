tol=0.25;

baseHi=13;
baseR1=30;
baseR2=30;


// Base
difference(){
    // Base Boss
    translate([30,30,0]) cylinder(r1=baseR1,r2=baseR2,h=baseHi);
    
    // Main board slot
    translate([2.4,21.6,0]){ 
        linear_extrude(height=baseHi) offset(r=tol) square([55.2,16.8]);
        translate([2.5,16.8,0]) linear_extrude(height=baseHi) offset(r=tol) square([50,7]);
    }
    
    // Extra slot area for switches
    translate([5,0,3]) color("green") {
            linear_extrude(height=baseHi-3) square(size=[55.2-5, 60]);
     }

    // Clearance for the USB port
    translate([17.2,21.6,0]) color("orange")
        linear_extrude(height=baseHi) circle(r=10.3);

    // Clearance for the FTDI port
    translate([42.7,21.6,0]) color("orange")
        linear_extrude(height=baseHi) circle(r=10.3);

    // Clearance for the Battery cable
    translate([0,13,8]) color("orange")
        linear_extrude(height=baseHi) square(size=[9,9]);

}


// Bars across the bottom of the slot
intersection(){
    union(){
        translate([2,20,0]) color("green") {
                linear_extrude(height=3) square(size=[5, 30]);
         }
        translate([30-2.5,20,0]) color("green") {
                linear_extrude(height=3) square(size=[5, 30]);
         }
        translate([58-5,20,0]) color("green") {
                linear_extrude(height=3) square(size=[5, 30]);
         }
         
         // bar across the back edge near switches
        translate([0,38.4+7+tol,3]) color("green") {
                linear_extrude(height=3) square(size=[60, 3]);
         }
    }

    // trim off bars that stick out beyond the base
    translate([30,30,0]) cylinder(r1=baseR1,r2=baseR2,h=baseHi);
    
}

// add text
translate ([30,10,3]) color("red") 
    linear_extrude(height=1.5){
    text("8D", font = "Open Sans:style=Bold", size=4,halign="center",valign="center",spacing=1.1);
    }

translate ([30,51,3]) color("red") 
    rotate([0,0,180])
    linear_extrude(height=1.5){
    text("Boulder Brights", font = "Open Sans:style=Bold", size=3.5,halign="center",valign="center",spacing=1.1);
    }

