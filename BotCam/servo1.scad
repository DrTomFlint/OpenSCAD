// Pan Tilt PiCamera for the Bots project

//-------------------------------------
module servo1 (){
// Servo body
hull(){
  linear_extrude(height=0.01)
  square([22.8,12.5],center=true);

  translate([0,0,22.8])
  linear_extrude(height=0.01)
  square([22.4,11.9],center=true);
}
// Tabs
difference(){
    translate([0,0,16.2])
    linear_extrude(height=2.45)
    square([32.45,12.0],center=true);
     
    translate([14,0,16])
    cylinder(h=3,r=1.25,$fn=22);
    translate([-14,0,16])
    cylinder(h=3,r=1.25,$fn=22);
}
// Collar
translate([5.25,0,22.8])
cylinder(h=4.5,r=6,$fn=40);
hull(){
    translate([-1.6,0,22.8])
    cylinder(h=4.5,r=2.5,$fn=40);
    translate([2,0,22.8])
    cylinder(h=4.5,r=2.5,$fn=40);
}
// Shaft
color("red")
translate([5.25,0,0])
cylinder(h=30.3,r=2.3,$fn=40);

// Wires
color("red")
translate([10,1.3,4.75])
rotate([0,90,0])
cylinder(h=6,r=1.3/2,$fn=22);
color("orange")
translate([10,0,4.75])
rotate([0,90,0])
cylinder(h=6,r=1.3/2,$fn=22);
color("brown")
translate([6,-1.3,4.75])
rotate([0,90,0])
cylinder(h=10,r=1.3/2,$fn=22);

} // --------- end module servo1 -------

// servo1cut provides extra tolerance
module servo1cut (tol=0.1){
    
// Servo body
hull(){
  linear_extrude(height=0.01)
  square([22.8+tol,12.5+tol],center=true);

  translate([0,0,22.8])
  linear_extrude(height=0.01)
  square([22.4+tol,11.9+tol],center=true);
}
// Tabs
difference(){
    translate([0,0,16.2])
    linear_extrude(height=2.45)
    square([32.45+tol,12.0+tol],center=true);
  
// don't make posts when cutting    
//    translate([14,0,16])
//    cylinder(h=3,r=1.25-tol/2,$fn=22);
//    translate([-14,0,16])
//    cylinder(h=3,r=1.25-tol/2,$fn=22);
}
// Collar
translate([5.25,0,22.8])
cylinder(h=4.5,r=6+tol/2,$fn=40);
hull(){
    translate([-1.6,0,22.8])
    cylinder(h=4.5,r=2.5+tol/2,$fn=40);
    translate([2,0,22.8])
    cylinder(h=4.5,r=2.5+tol/2,$fn=40);
}
// Shaft
color("red")
translate([5.25,0,0])
cylinder(h=30.3,r=2.3+tol/2,$fn=40);

// Wires
hull(){
    color("red")
    translate([10,1.3,4.75])
    rotate([0,90,0])
    cylinder(h=6,r=1.3/2+tol/2,$fn=22);
    color("brown")
    translate([6,-1.3,4.75])
    rotate([0,90,0])
    cylinder(h=10,r=1.3/2+tol/2,$fn=22);
}
} // --------- end module servo1cut -------

servo1();

translate([0,30,0])
servo1cut();
