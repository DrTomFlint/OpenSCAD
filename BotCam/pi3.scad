// pi3
// this does not show all the components
// leave 2mm below and 3mm above the pcb


//-----------------
module pi3(){

// baseplate
difference(){
    linear_extrude(height=1.45)
    offset(r=1,$fn=40)
    square([56-2,85-2],center=true);

    translate([0,-10,0]){
        translate([24.5,29,-1])
        cylinder(r=2.6/2,h=3,$fn=22);
        translate([24.5,-29,-1])
        cylinder(r=2.6/2,h=3,$fn=22);
        translate([-24.5,29,-1])
        cylinder(r=2.6/2,h=3,$fn=22);
        translate([-24.5,-29,-1])
        cylinder(r=2.6/2,h=3,$fn=22);
    }
}

// usb 1
translate([-28+2,42.5-15,1.45])
cube([15,17,16]);

// usb 2
translate([-28+2+18,42.5-15,1.45])
cube([15,17,16]);

// ethernet
translate([-28+2+35,42.5-19,1.45])
cube([16,21,13.5]);

// gpio
translate([-28+1,-35.5,1.45])
cube([5,51,9.5]);

// display
translate([-22.5/2,-42.5+2,1.45])
cube([22.5,2.5,6]);

// camera
color("red")
translate([28-22.5-0.5,0,1.45])
cube([22.5,2.5,6]);

// audio
translate([28-12-0.5,5.5,1.45])
cube([15,7,6.5]);

// hdmi
translate([28-10-0.5,-19,1.45])
cube([12,15,6.5]);

// usb power in
translate([28-4.7-0.5,-37,1.45])
cube([5.7,8,3]);

// sd card
color("orange")
translate([-11/2,-42.5-3.5,-1.8])
cube([11,17,1.8]);


}//==================================

pi3();
