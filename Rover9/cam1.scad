// cam1
// models for the picamera v2.1

//----------------------------
module cam1(){
difference(){
    linear_extrude(height=1.1)
    offset(r=1,$fn=22)
    square([23,22],center=true);

    translate([10.5,9.8,0])
    cylinder(r=1,h=3,$fn=22);

    translate([-10.5,9.8,0])
    cylinder(r=1,h=3,$fn=22);

    translate([10.5,9.8-12.5,0])
    cylinder(r=1,h=3,$fn=22);

    translate([-10.5,9.8-12.5,0])
    cylinder(r=1,h=3,$fn=22);
}

// lens and box
translate([0,-2.7,0]){
    linear_extrude(height=5)
    square([9.5,9.5],center=true);
    cylinder(r=7.25/2,h=6.75,$fn=22);
    cylinder(r=6/2,h=6.75+0.6,$fn=22);
}

// cable off lens box
color("red")
translate([0,5.5,1.25])
cube([12,8.5,2.5],center=true);

// main cable
color("green")
translate([0,-12+3.5,-1.5])
cube([21,7,3],center=true);

// ribbon if needed
color("orange")
translate([0,-14,-1])
linear_extrude(height=0.4)
square([16.4,50],center=true);

// component clearance on backside
color("red")
translate([0,0,-1.5])
difference(){
    linear_extrude(height=1.5)
    offset(r=1,$fn=22)
    square([23-0.5,22-0.5],center=true);

    translate([10.5,9.8,0])
    cylinder(r=2.5,h=1.5,$fn=22);

    translate([-10.5,9.8,0])
    cylinder(r=2.5,h=1.5,$fn=22);

    translate([10.5,9.8-12.5,0])
    cylinder(r=2.5,h=1.5,$fn=22);

    translate([-10.5,9.8-12.5,0])
    cylinder(r=2.5,h=1.5,$fn=22);
}
} //---------- end module cam1 ----------

module cam1cut(tol=0.1){
difference(){
    linear_extrude(height=1.1+tol)
    offset(r=1,$fn=22)
    square([23+tol,22+tol],center=true);

    translate([10.5,9.8,0])
    cylinder(r=1-tol,h=3,$fn=22);

    translate([-10.5,9.8,0])
    cylinder(r=1-tol,h=3,$fn=22);

    translate([10.5,9.8-12.5,0])
    cylinder(r=1-tol,h=3,$fn=22);

    translate([-10.5,9.8-12.5,0])
    cylinder(r=1-tol,h=3,$fn=22);
}

// lens and box
translate([0,-2.7,0]){
    linear_extrude(height=5+tol)
    square([9.5+tol,9.5+tol],center=true);
    cylinder(r=7.25/2+tol/2,h=6.75+tol,$fn=22);
    cylinder(r=6/2+tol/2,h=6.75+0.6+tol,$fn=22);
}

// cable off lens box
translate([0,5.5,1.25])
cube([12+tol,8.5+tol,2.5+tol],center=true);

// main cable
color("green")
translate([0,-12+3.5,-1.5])
cube([21+tol,7+tol,3+tol],center=true);

// ribbon if needed
color("orange")
translate([0,-14,-1])
linear_extrude(height=0.4+tol)
square([16.4+tol,10+tol],center=true);

// component clearance on backside
color("red")
translate([0,0,-1.5-tol])
difference(){
    linear_extrude(height=1.5+tol)
    offset(r=1,$fn=22)
    square([23-0.5+tol,22-0.5+tol],center=true);

    translate([10.5,9.8,0])
    cylinder(r=2.5,h=1.5+tol,$fn=22);

    translate([-10.5,9.8,0])
    cylinder(r=2.5,h=1.5+tol,$fn=22);

    translate([10.5,9.8-12.5,0])
    cylinder(r=2.5,h=1.5+tol,$fn=22);

    translate([-10.5,9.8-12.5,0])
    cylinder(r=2.5,h=1.5+tol,$fn=22);
}
} //---------- end module cam1cut ----------

/*
difference(){
    cam1cut();
cam1();
}
*/
cam1();

//translate([35,0,0])
//cam1cut();

