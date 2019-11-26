// Mcam3b.scad
// This is the forks, rework for no 
// support
use <Mcam2a.scad>
use <Mcam2c.scad>




module fork1(){

difference(){
    
union(){

// left hook
translate([6,-5,0])
rotate([0,0,180])
    color("red")
   rotate_extrude(angle=90, $fn=90,convexity=10)
       translate([10, 0]) 
       offset(r=1,$fn=40)
       square([2,3]);

    // cross bar
    translate([6,-17,0])
    rotate([90,0,90])
    linear_extrude(height=13)
       offset(r=1,$fn=40)
       square([2,3]);

// right hook
translate([19,-5,0])
rotate([0,0,-90])
    color("cyan")
   rotate_extrude(angle=90, $fn=90,convexity=10)
       translate([10, 0]) 
       offset(r=1,$fn=40)
       square([2,3]);
 
 
// left block 
translate([-7,1,0])     
minkowski($fn=40) {
	cube([4, 7, 4.5]);
	sphere(1);
}

// right block
translate([28,1,0])     
minkowski($fn=40) {
	cube([4, 7, 4.5]);
	sphere(1);
}

    // left v bar
    translate([-6,0,0])
    rotate([90,0,0])
    linear_extrude(height=5)
       offset(r=1,$fn=40)
       square([2,3]);

    // right v bar
    translate([29,0,0])
    rotate([90,0,0])
    linear_extrude(height=5)
       offset(r=1,$fn=40)
       square([2,3]);
// post
translate([12.5,-18,1])
rotate([90,0,0])
cylinder(r=2,h=15,$fn=80);

translate([12.5,-15,1.5])
rotate([90,0,0])
cylinder(r=2.5,h=6,center=false,$fn=80);
} // end of union


shell();

} // end of difference

} // end module fork1()

fork1();

//shell();

//lid1();

