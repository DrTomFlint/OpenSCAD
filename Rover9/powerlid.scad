// powerlid

//---------------
module powerlid(){
tol=0.2;
translate([25,25,0]){
difference(){
    color("yellow")
    linear_extrude(height=11)
    offset(r=2,$fn=80)    
    square(size=[18,42],center=true);

    translate([0,0,-0.01])
    color("orange")
    linear_extrude(height=9.4+0.6)
    offset(r=2,$fn=80)    
    square(size=[14+tol*2,38+tol*2],center=true);


    translate([-13.5,-24,-1])
    color("red")
    cube([6,48,11]);

    // plug at bottom
    translate([-3,-25,-1])
    color("blue")
    cube([14,4,13]);

    // vent holes
    translate([2.5,16,-1])
    color("red")
    cylinder(r=3,h=20,$fn=22);
    translate([2.5,7,-1])
    color("pink")
    cylinder(r=3,h=20,$fn=22);

}

}
}
//---------------

powerlid();


