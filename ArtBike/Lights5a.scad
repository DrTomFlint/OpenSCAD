// Lights5a
// headblock for leds, fibers insert with ferrules Lights4b part
// This is the reduced material, easy-insert version
use <Lights5b.scad>

module Rx1(){
tol=0.20;
Off1 = 1.0;

difference(){
// Rx body
translate([-4,-8.35,-8]) color("cyan")
linear_extrude(height=15) square(size=[13,16.7]);

Ferrule3();

//===========
// lower cut for tape
translate([-1.85,-20,-6])
linear_extrude(height=6,scale=0.7) square(size=[0.5,40]);
// upper cut for tape    
translate([-1.85+0.1,0,0])
linear_extrude(height=8,scale=1.5) square(size=[0.2,40],center=true);

//-------
// cut for the chip head
color("red")
translate([-1.65,-2.5-tol/2-Off1,-2.5-tol/2])
linear_extrude(height=12) 
    square(size=[1.65+tol*2,5+tol*2]);

// cut to taper the chip insert
color("orange")
translate([-1.65/2+tol,-Off1+tol/2,+1.5])
linear_extrude(height=8,scale=2) 
    square(size=[1.65+tol*2,5+tol*2],center=true);


// cuts on the backside 
color("yellow")
translate([-1.7,10,-4])
rotate([0,0,180])
linear_extrude(height=16,scale=[1,2]) 
    square(size=[2.5,5]);

color("gray")
translate([-4, -10.5,-4])
linear_extrude(height=16,scale=[1,2]) 
    square(size=[2.25,4]);

// sidewall cuts
translate([-1.7,2.5,4])
linear_extrude(height=4,scale=[4.5,1])
square(size=[2,8]);
translate([-1.7,-9,4])
linear_extrude(height=4,scale=[4.5,1])
square(size=[2,8]);

// cut for the ferrule head
translate([3,0,-3]) color("pink")
linear_extrude(height=12) square(size=[6,12*0.866],center=true);

// cut for the ferrule neck
translate([7,0,0]) color("green")
linear_extrude(height=10,scale=1.2) square(size=[6,8.66],center=true);

// cut for extra clearance at the bottom of the well
translate([0,0,-4.5]) color("orange")
rotate([0,90,0]) 
cylinder(r=1.5,h=12,$fn=16);

/*
// thru hole where the fiber would sit
// allows running a wire out the port if there is 
// not a led installed there
translate([-4,0,0]) color("orange")
rotate([0,90,0]) 
cylinder(r=1.5,h=2.2,$fn=16);
*/

}  // end of difference

} // end of module


//=================
// Simpler block model, use for cutting lids
module Rx2(){
    
tol=0.20;
Off1 = 1.0;

// Rx body
translate([-4,-8.35,-8]) color("cyan")
linear_extrude(height=15) square(size=[13,16.7]);

Ferrule4();

} // end of module

//-------------------------------------------------------------------------
module Rx3(){
tol=0.20;
Off1 = 0;

translate([1.5,0,0]){
difference(){
// Rx body
translate([-4,-8.35,-8]) color("cyan")
linear_extrude(height=15) square(size=[5,16.7]);

// lower cut for tape
translate([-1.85,-20,-6])
linear_extrude(height=6,scale=0.7) square(size=[1,40]);

// upper cut for tape    
translate([-1.85+0.3,0,0])
linear_extrude(height=8,scale=1.5) square(size=[0.6,40],center=true);

// cut for the chip head
color("red")
translate([-1.65,-2.5-tol/2-Off1,-2.5-tol/2])
linear_extrude(height=12) 
    square(size=[1.65+tol*2+1,5+tol*2]);

// cut to taper the chip insert
color("orange")
translate([-1.65/2+1.5+tol,-Off1+tol/2,+1.5])
linear_extrude(height=8,scale=1.8) 
    square(size=[1.65+2+tol*2,5+tol*2],center=true);


// cuts on the backside 
color("yellow")
translate([-1.7,12,-4])
rotate([0,0,180])
linear_extrude(height=16,scale=[1,2]) 
    square(size=[2.5,5]);

color("gray")
translate([-4.01, -10.5,-4])
linear_extrude(height=16,scale=[1,2]) 
    square(size=[2.25,4]);

/*
// thru hole where the fiber would sit
// allows running a wire out the port if there is 
// not a led installed there
translate([-4,0,0]) color("orange")
rotate([0,90,0]) 
cylinder(r=1.5,h=2.2,$fn=16);
*/

}  // end of difference

}
} // end of module


//==================================

Rx3();
translate([0,16.7,0])
Rx3();

/*
translate([0,0,20])
Rx2();
*/


