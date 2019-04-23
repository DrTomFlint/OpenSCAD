// Lights4a
// headblock for leds, fibers insert with ferrules Lights4b part
use <Lights4b.scad>

module Rx1(){
tol=0.20;
Off1 = 1.0;



difference(){
// Rx body
translate([-4,-8.35,-8]) color("cyan")
linear_extrude(height=15) square(size=[13,16.7]);

Ferrule3();


//==========
// led tape and chip
translate([-1.85,-20,-6])
//linear_extrude(height=12) square(size=[0.2+tol,40]);
linear_extrude(height=16) square(size=[0.2+tol,40]);
translate([-1.65,-2.5-tol/2-Off1,-2.5-tol/2])
linear_extrude(height=5+tol) square(size=[1.65+tol,5+tol]);


//-------
// cut for the chip head
color("red")
translate([-1.65,-2.5-tol/2-Off1,-2.5-tol/2])
linear_extrude(height=12) 
    square(size=[1.65+tol*2,5+tol*2]);


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

// material reduction on sidewalls
// possible locking mechanism?
translate([3,-20,5.0]) color("gray") rotate([-90,-90,0]){
cylinder(r=3.0/0.866,h=40,$fn=6);
    translate([3,0,0])
    linear_extrude(height=40) square(6,center=true);
}


}  // end of difference

} // end of module

//==================================

Rx1();

/*

for(i=[0:0]){
    translate([0,16.7*i,0]) Rx1();
}
*/
//Ferrule1();


