// Lights1a
// headblock for leds, fibers insert with ferrules Lights1b part

module Rx1(){
tol=0.20;
Off1 = 1.15;

difference(){
// Rx body
translate([-4,-8.35,-8]) color("cyan")
linear_extrude(height=15) square(size=[13,16.7]);


rotate([0,90,0])
//difference(){
union(){
//------------
// First jacket
translate([0,0,16]) color("green")
cylinder(r1=4+tol,r2=2+tol,h=20,$fn=22);

//------------
// Narrow part
translate([0,0,6]) color("pink")
cylinder(r1=3+tol,r2=3+tol,h=3,$fn=22);
/*
//------------
// wide part
translate([0,0,9]) color("red")
cylinder(r1=5+tol,r2=5+tol,h=3,$fn=12);
translate([0,0,12]) color("red")
cylinder(r1=4+tol,r2=4+tol,h=2,$fn=12);
translate([0,0,14]) color("red")
cylinder(r1=5+tol,r2=5+tol,h=3,$fn=12);
*/
//-------------
//  head
translate([0,0,0]) color("orange")
cylinder(r1=5+tol,r2=5+tol,h=6,$fn=22);

}

//-------
// Fiber
//color("cyan")
//cylinder(r1=1.6,r2=1.7, h=50,$fn=22);
//}

//==========
// led tape and chip
translate([-1.85,-20,-6])
//linear_extrude(height=12) square(size=[0.2+tol,40]);
linear_extrude(height=16) square(size=[0.2+tol,40]);
translate([-1.65,-2.5-tol/2-Off1,-2.5-tol/2])
linear_extrude(height=5+tol) square(size=[1.65+tol,5+tol]);

//-------
// cut for the ferrule head
translate([1.85+tol,0,0]) color("cyan")
linear_extrude(height=10) square(size=[1.85+6,10],center=true);

// cut for the ferrule neck
translate([7,0,0]) color("cyan")
linear_extrude(height=10,scale=1.3) square(size=[6,5.0],center=true);

/*
// cuts to create spring action on led
translate([-3,-3-Off1,-6]) color("pink")
linear_extrude(height=14) square(size=[3,0.5],center=true);
translate([-3,3-Off1,-6]) color("pink")
linear_extrude(height=14) square(size=[3,0.5],center=true);
translate([-4,-Off1,-6]) color("pink")
linear_extrude(height=14,scale=[3,1]) square(size=[1,6],center=true);

// cuts to create spring action on ferrule
translate([7,-5.5,1]) color("pink") rotate([-15,0,0])
linear_extrude(height=8) square(size=[4,0.5],center=true);
translate([7,5.5,1]) color("pink") rotate([15,0,0])
linear_extrude(height=8) square(size=[4,0.5],center=true);
*/

// material reduction on sidewalls
// possible locking mechanism?
translate([3,-20,4]) color("green") rotate([-90,-90,0]){
cylinder(r=3.0,h=40,$fn=40);
    translate([3,0,0])
    linear_extrude(height=40) square(6,center=true);
}
}

}


for(i=[0:0]){
    translate([0,16.7*i,0]) Rx1();
}


//-------------------- simplified model for cutouts
module Rx2(){
tol=0.20;
Off1 = 1.25;

difference(){
// Rx body
translate([-4,-8.35,-8]) color("cyan")
linear_extrude(height=15) square(size=[13,16.7]);


rotate([0,90,0])
//difference(){
union(){
//------------
// Narrow part
translate([0,0,6]) color("pink")
cylinder(r1=3+tol,r2=3+tol,h=3,$fn=22);
//-------------
//  head
translate([0,0,0]) color("orange")
cylinder(r1=5+tol,r2=5+tol,h=6,$fn=22);

}

// led tape and chip
translate([-1.85,-20,-6])
//linear_extrude(height=12) square(size=[0.2+tol,40]);
linear_extrude(height=16) square(size=[0.2+tol,40]);
translate([-1.65,-2.5-tol/2-Off1,-2.5-tol/2])
linear_extrude(height=5+tol) square(size=[1.65+tol,5+tol]);

//-------
// cut for the ferrule head
translate([1.85+tol,0,0]) color("cyan")
linear_extrude(height=10) square(size=[1.85+6,10],center=true);

// cut for the ferrule neck
translate([7,0,0]) color("cyan")
linear_extrude(height=10) square(size=[6,5.5],center=true);

}

}

/*
translate([20,20,0])
Rx2();
*/


