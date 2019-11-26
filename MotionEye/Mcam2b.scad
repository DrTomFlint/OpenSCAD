// Mcam1b.scad
// This is the forks
use <Mcam2a.scad>
use <Mcam2c.scad>

difference(){
union(){
// left side of bracket
hull(){
    color("red")
    translate([-6,4,2.5])
    rotate([0,90,0])
    cylinder(r1=3,r2=3.5,h=4,$fn=80);

    color("pink")
    translate([-4,-12,2.5])
    sphere(2,$fa=5, $fs=0.1);
}

hull(){
    color("pink")
    translate([-4,-12,2.5])
    sphere(2,$fa=5, $fs=0.1);

    color("blue")
    translate([12.5,-14,2.5])
    sphere(3,$fa=5, $fs=0.1);
}

// mirror as right side
translate([25,0,0])
mirror([1,0,0]){
hull(){
    color("red")
    translate([-6,4,2.5])
    rotate([0,90,0])
    cylinder(r1=3,r2=3.5,h=4,$fn=80);

    color("pink")
    translate([-4,-12,2.5])
    sphere(2,$fa=5, $fs=0.1);
}

hull(){
    color("pink")
    translate([-4,-12,2.5])
    sphere(2,$fa=5, $fs=0.1);

    color("blue")
    translate([12.5,-14,2.5])
    sphere(3,$fa=5, $fs=0.1);
}
}
    // the vertical pole
    translate([12.5,-14,2.5]){
        rotate([0,0,0]){
        color("red")
        rotate([90,0,0])
        cylinder(r=2,h=15,$fn=80);

        translate([0,-15,0])
        rotate([90,0,0])
        color("green")
        cylinder(r1=2,r2=1,h=2,$fn=80);

        color("cyan")
        rotate([90,0,0])
        cylinder(r1=3.0,r2=2,h=5,$fn=80);
        }
    }
}

shell();

} // end of difference


//shell();

//lid1();

