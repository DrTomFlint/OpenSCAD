// Lights1a
// headblock for leds, fibers insert with ferrules Lights1b part

tol=0.20;

difference(){
// Rx body
translate([-4,-8.35,-7]) color("cyan")
linear_extrude(height=14) square(size=[13,16.7]);


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

//------------
// wide part
translate([0,0,9]) color("red")
cylinder(r1=5+tol,r2=5+tol,h=3,$fn=12);
translate([0,0,12]) color("red")
cylinder(r1=4+tol,r2=4+tol,h=2,$fn=12);
translate([0,0,14]) color("red")
cylinder(r1=5+tol,r2=5+tol,h=3,$fn=12);

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
translate([-1.65,-2.5-tol/2,-2.5-tol/2])
linear_extrude(height=5+tol) square(size=[1.65,5+tol]);

//-------
// extend cuts out the topside
translate([1.85+tol,0,0]) color("cyan")
linear_extrude(height=10) square(size=[1.85+6,10],center=true);

translate([7,0,0]) color("cyan")
linear_extrude(height=10) square(size=[6,6],center=true);

}
