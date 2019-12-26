// lid2
// a picam lid that retains a focus knob

use <../Parts/cambase1.scad>
use <../Parts/camlid1.scad>
use <../Parts/cam1.scad>
use <../Parts/arm1.scad>

//--------------------------------
module knob1(){
translate([0,-2.75,15])
rotate([0,180,0]){
    color("cyan")
    difference(){
        cylinder(r=22.75/2,h=7.1,$fn=88);
        translate([0,0,-1])
        cylinder(r=18.9/2,h=9,$fn=88);
    }

    difference(){
        union(){
            cylinder(r1=22.75/2,r2=1,h=8,$fn=88);
            color("pink")
            translate([0,0,6.0])
            cylinder(r=7.0/2,h=2.3,$fn=44);
        }

        translate([0,0,-0.01])
        cylinder(r1=18.9/2,r2=1,h=7.1,$fn=88);
        
        cylinder(r=4.7/2,h=10,$fn=44);
    }
}
}
//-----------------------------------
module knob1cut(tol=0.1){
translate([0,-2.75,15])
rotate([0,180,0]){
    color("cyan")
    difference(){
        cylinder(r=22.75/2+tol,h=7.1+tol,$fn=160);
        translate([0,0,-1])
        cylinder(r=18.9/2-tol,h=9,$fn=88);
    }

    difference(){
        union(){
            cylinder(r1=22.75/2,r2=1,h=8,$fn=88);
            color("pink")
            translate([0,0,6.0])
            cylinder(r=7.0/2+tol,h=2.3,$fn=44);
        }

        translate([0,0,-0.01])
        cylinder(r1=18.9/2,r2=1,h=7.1,$fn=88);
        
        cylinder(r=4.7/2,h=10,$fn=44);
    }
}
}
//--------------------------------
module lid2(){
    
difference(){
union(){
    // main boss
    translate([0,0,-1])
    color("yellow")
    linear_extrude(height=11+3)
    offset(r=3,$fn=80)    
    square(size=[25,24]);

    translate([25/2,24/2,10+3])
    color("red")
    linear_extrude(height=11-3,scale=0.8)
    offset(r=3,$fn=80)    
    square(size=[25,24],center=true);

}

    // side cuts for disk3
    translate([-4,9,10])
    rotate([180,0,0])
    rotate([0,90,0])
    disk3cut();

    translate([29,9,10])
    rotate([0,0,0])
    rotate([0,-90,0])
    disk3cut();

    // cuts to make dial access
    translate([3,21,0])
    cylinder(r1=4,r2=1.5,h=22,$fn=22);
    translate([22,21,0])
    cylinder(r1=4,r2=1.5,h=22,$fn=22);

    // cuts to make dial access
    translate([25/2,-8,25])
    scale([1,1,0.7])
    sphere(r=20,$fn=120);

    // cut for knob    
    translate([12.5,9.0,9])
    cylinder(r1=22/2,r2=22.5/2,h=13,$fn=160);
    //
    translate([12.5,12,4])
    knob1cut(tol=0.25);

    // main boss cutout
    translate([0,0,-2])
    color("orange")
    linear_extrude(height=7)
    offset(r=2,$fn=16)    
    square(size=[25,24]);


    // bottom cut for cable
    translate([-5,-6,-2])
    color("green")
    cube([35,6,7]);

    // hollow out the camera bump
    translate([12.5,12,4.5])
    color("green")
    linear_extrude(height=5.5,scale=0.70)
    offset(r=3,$fn=16)
    square([15,19],center=true);

    // hole for the lens
    translate([12.5,9.5,9])
    color("cyan")
    cylinder(r1=3.5,r2=6.0,h=2.1,$fn=80);
}

// support for ribbon cable
translate([4.25,-2.5,4.5])
rotate([0,90,0])
scale([1,2]){
  difference(){
    union(){
        sphere(r=1.5,$fa=5, $fs=0.1);
        translate([0,0,16.5])
        sphere(r=1.5,$fa=5, $fs=0.1);
        cylinder(r=1.5,h=16.5,$fn=80);
    }
        translate([-5,0,-5])    
        cube([10,10,50]);
    }
}

    // tab near cable
    translate([-1,-3,3])
    color("pink")
    cube([27,1,2]);

    // tab topside
    translate([0,25.5,-1])
    color("cyan")
    cube([25,0.5,1]);

    // tab left
    translate([-2.0,20,-1])
    color("cyan")
    cube([0.5,4,1]);

    // tab right
    translate([26.5,20,-1])
    color("cyan")
    cube([0.5,4,1]);

}  // end of module 

//===========================
//cambase1();/
//cambase2();

//camlid1();
lid2();

if(1){
translate([-4,9,10])
rotate([180,0,0])
rotate([0,90,0])
disk3();
}

if(0){
translate([29,9,10])
rotate([0,0,0])
rotate([0,-90,0])
disk3();
}

//translate([12.5,12,4])
//cam1();


//translate([12.5,12,4])
//knob1();


