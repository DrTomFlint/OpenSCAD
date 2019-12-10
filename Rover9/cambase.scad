// cambase.scad
// This is the back for the camera



module cambase(){
   
// base borrowed from pieye
difference(){
    color("yellow")
    linear_extrude(height=5)
    offset(r=2,$fn=80)    
    square(size=[30,28],center=true);

    translate([0,-2,1])
    color("orange")
    linear_extrude(height=5)
    offset(r=0.1,$fn=16)    
    square(size=[25,24+4],center=true);

    translate([-8.5,-15,2])
    color("green")
    cube([17,5,5]);
    
    translate([0,0,-1])
    cylinder(r=7,h=5,$fn=6);

}

// posts to support PCB
translate([-10.5,9.5-12,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}
translate([-10.5,22-12,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}
translate([23.0-12.5,9.5-12,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}
translate([23.0-12.5,22-12,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}

} // --------- end module cambase ------------

cambase();
