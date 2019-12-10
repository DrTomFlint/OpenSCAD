// guards
//


// cable guards
module guards(){
    
    tol6=0.0;

    color("pink")
    translate([0,-45+tol6,5-tol6])
    rotate([52,0,0])
    cube([40,6+tol6*2,1.5+tol6*2],center=true);

    color("yellow")
    translate([0,-45+tol6,5-tol6])
    rotate([52,0,0])
    cube([23,14+tol6*2,1.5+tol6*2],center=true);

/*
    color("red")
    translate([0,-51.5+tol6,-10-tol6])
    rotate([83,0,0])
    cube([40,8+tol6*2,1.5+tol6*2],center=true);


    color("cyan")
    translate([0,-51.5+tol6,-10-tol6])
    rotate([83,0,0])
    cube([23,12+tol6*2,1.5+tol6*2],center=true);
*/

} //----------------------

guards();



