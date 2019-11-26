// ShipsBoatC
// Hanger for the fiberglass poles near the seat
// 
// Fiberglass 8 mm diameter

thick=10;

difference(){
    cylinder(h=thick,r=22.0,$fn=88);
    
    translate([0,0,-0.5])
    cylinder(h=thick+1,r=18.5,$fn=88);

    translate([-50,-110,-0.5])
    cube([100,100,thick+1]);

}

// right side loop
translate([40,8,0])
difference(){
    cylinder(h=thick,r=4.2+3.5,$fn=88);
    
    translate([0,0,-0.5])
    cylinder(h=thick+1,r=4.2,$fn=88);

    translate([0,-2,-0.5])
    rotate([0,0,55])
    cube([20,20,thick+1]);

}
// right side arm
translate([15,11,0])
rotate([0,0,-15])
cube([19,4,thick]);

translate([20,-9,0])
rotate([0,0,25])
cube([22,4,thick]);




mirror([1,0,0]){
// right side loop
translate([40,8,0])
difference(){
    cylinder(h=thick,r=4.2+3.5,$fn=88);
    
    translate([0,0,-0.5])
    cylinder(h=thick+1,r=4.2,$fn=88);

    translate([0,-2,-0.5])
    rotate([0,0,55])
    cube([20,20,thick+1]);

}
// right side arm
translate([15,11,0])
rotate([0,0,-15])
cube([19,4,thick]);

translate([20,-9,0])
rotate([0,0,25])
cube([22,4,thick]);

}