// brassTest.scad
// test for M3 brass heat-set inserts

difference(){
cube([10,26,7],center=true);

translate([0,8,0]){
cylinder(r=2.4,h=3.5+5,$fn=22);
cylinder(r=1.9,h=3.5+5,center=true,$fn=22);
}

// THIS IS THE GOOD ONE !
cylinder(r=2.3,h=3.5+5,$fn=22);
cylinder(r=1.8,h=3.5+5,center=true,$fn=22);

translate([0,-8,0]){
cylinder(r=2.2,h=3.5+5,$fn=22);
cylinder(r=1.7,h=3.5+5,center=true,$fn=22);
}

translate([5,-18,0])
rotate([0,0,45])
cube([10,10,10],center=true);

}

