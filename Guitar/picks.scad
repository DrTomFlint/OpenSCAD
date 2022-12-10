//=================================================================================
// picks.scad
//
//
// Dr Tom Flint, 3 Dec 2022
//=================================================================================

use <../Parts/rounder.scad>

//-----------------------------------------------------------------------------------
module thumb1(){

$fn=200;

thick = 1.2;
long = 27;
Rsmall = 3;
Rbig = 9;
hi = 15;
//mirror([0,1,0])
difference(convexity = 6){
    linear_extrude(height=hi,scale=1.06){
        translate([-20,-6,0]){
        square([long,thick]);

        translate([long,Rsmall+thick])
        difference(convexity = 6){
            circle(r=Rsmall+thick);
            circle(r=Rsmall);
            translate([-Rsmall,Rsmall])
            square([2*Rsmall,4*Rsmall],center=true);

            translate([thick,Rsmall])
            rotate(-45)
            square([2*Rsmall,2*Rsmall],center=true);
        }

        color("cyan")
        translate([0.777*long,Rsmall+thick])
        difference(convexity = 6){
            circle(r=Rbig+thick);
            circle(r=Rbig);
            rotate(6)
            translate([0,-1.5*Rbig-1.4*thick])
            square([3*Rbig,3*Rbig],center=true);

        }
    }
    }
    
        translate([-20,-6,0]){
    // thumb end round offs
    translate([0.25*long,0.9*thick,hi])
    rotate([0,90,0])
    rounder(r=hi/2,h=6*thick,f=89);

    translate([0.5*long,1.1*thick,0])
    rotate([0,-90,0])
    rounder(r=hi/2,h=4*thick,f=89);

    // pick end round offs
    translate([-1.5,-2,hi])
    rotate([-90,0,0])
    scale([1.25,1,1])
    rounder(r=0.7*hi,h=4*thick,f=130);

    translate([-1.5,2,0])
    rotate([90,0,0])
    scale([1.25,1,1])
    rounder(r=0.7*hi,h=4*thick,f=130);
    
    // top cut
    translate([24,18,hi+3])
    rotate([0,10,0])
    rotate([90,0,0])
    scale([3,1,1])
    cylinder(r=6,h=20);

    }
}

}
//-----------------------------------------------------------------------------------
module thumb2(){

$fn=200;

thick = 1.2;
long = 27;
Rsmall = 3;
Rbig = 9;
hi = 15;
//mirror([0,1,0])
difference(convexity = 16){
    linear_extrude(height=hi,scale=1.07){
        translate([-20,-6,0]){
        square([long,thick]);

        translate([long,Rsmall+thick])
        difference(convexity = 6){
            circle(r=Rsmall+thick);
            circle(r=Rsmall);
            translate([-Rsmall,Rsmall])
            square([2*Rsmall,4*Rsmall],center=true);

            translate([thick,Rsmall])
            rotate(-45)
            square([2*Rsmall,2*Rsmall],center=true);
        }

        color("cyan")
        translate([0.777*long,Rsmall+thick])
        difference(convexity = 6){
            scale([1,0.8])
            circle(r=Rbig+thick);
            scale([1,0.8])
            circle(r=Rbig);
            rotate(6)
            translate([0,-1.5*Rbig-1.4*thick])
            square([3*Rbig,3*Rbig],center=true);

        }
    }
    }
    
        translate([-20,-6,0]){
    // thumb end round offs
    translate([0.25*long,0.9*thick,hi])
    rotate([0,90,0])
    rounder(r=hi/2,h=6*thick,f=89);

    translate([0.5*long,1.1*thick,0])
    rotate([0,-90,0])
    rounder(r=hi/2,h=4*thick,f=89);

    // pick end round offs
    translate([-1.5,-2,hi])
    rotate([-90,0,0])
    scale([1.25,1,1])
    rounder(r=0.7*hi,h=4*thick,f=130);

    translate([-1.5,2,0])
    rotate([90,0,0])
    scale([1.25,1,1])
    rounder(r=0.7*hi,h=4*thick,f=130);
    
    // top cut
    translate([24,18,hi+3])
    rotate([0,10,0])
    rotate([90,0,0])
    scale([3,1,1])
    cylinder(r=6,h=20);

    }
}

}

//===================================================================================


thumb2();

//===================================================================================
