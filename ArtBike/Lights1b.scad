// Lights1b
// Ferrules for 3 mm fiber optic sideglows

tol=0;

rotate([0,90,0])
difference(){
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
color("cyan")
cylinder(r1=1.6,r2=1.7, h=50,$fn=22);
}

