// dusatest1.scad
// a series of test prints for calibrating the Prusa Dusa

difference(){
cylinder(r=7,h=5,$fn=400);
translate([0,0,-1])
cylinder(r=7-0.8,h=7,$fn=400);
}

