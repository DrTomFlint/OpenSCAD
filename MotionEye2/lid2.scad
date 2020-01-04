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

//--------------------------
module upperboss(){
hull($fn=200){
    // bottom plate
    translate([25/2,24/2,10])
    color("red")
    linear_extrude(height=0.1,scale=1.0)
    offset(r=4,$fn=80)    
    square(size=[25,24],center=true);

    // upper plate
    difference(){
        // square part
        translate([25/2,24/2,13+7.5])
        color("green")
        linear_extrude(height=0.1,scale=1.0)
        offset(r=4,$fn=80)    
        square(size=[25,24],center=true);

        translate([-50,8,-1])
        color("pink")
        linear_extrude(height=50,scale=1.0)
        square([100,100]);
    }
        // rounded part
        union(){
    intersection(){
        translate([25/2,24/2-4,13+7.5])
        color("orange")
        linear_extrude(height=0.1,scale=1.0)
        circle(r=25/2+3);

        translate([-50,8,-1])
        color("pink")
        linear_extrude(height=50,scale=1.0)
        square([100,100]);
    }
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
    linear_extrude(height=11)
    offset(r=4,$fn=80)    
    square(size=[25,24]);

    upperboss();
}

    // roll off bottom edges near knob
    translate([0,6,-2.5])
    difference(){
        translate([-10,-20,13])
        rotate([0,0,0])
        cube([40,20,20]);

        translate([-10,0,13])
        rotate([0,90,0])
        cylinder(r=10,h=44,$fn=88);
    }

    // side cuts for disk3
    translate([-6,9,10]){
    rotate([180,0,0])
    rotate([0,90,0])
    disk3(tol=0.15);
    
    // center holes for screw in disk3    
    translate([0,0,0])
    rotate([0,90,0])
    cylinder(r=1.1,h=35,$fn=18);
    }

    // side cuts for disk3
    translate([31,9,10])
    rotate([0,0,0])
    rotate([0,-90,0])
    disk3(tol=0.15);

    // eye cuts for material reduction
    translate([2,22,0])
    cylinder(r1=4,r2=1.0,h=22,$fn=22);
    translate([23,22,0])
    cylinder(r1=4,r2=1.0,h=22,$fn=22);

    // cut for knob access and insert
    hull(){
        translate([25/2,-8,12.2-0.5])
        cylinder(r=11.2,h=7.0);
        translate([25/2,9,12.2-0.5])
        cylinder(r=11.4,h=7.0);
    }

    // cut for knob center clearance    
    translate([12.5,9.0,9])
    cylinder(r1=9.5,r2=9.5,h=13,$fn=160);

    // cut for knob root
    translate([12.5-4,-5,10.5])
    cube([8,8,4]);
    //cylinder(r=4,h=4);
    
    // bevel cut on the top
    hull(){
        translate([12.5,9.0,18.5])
        cylinder(r1=8.5,r2=12,h=3,$fn=160);
        translate([12.5,-6,18.5])
        cylinder(r1=10,r2=12,h=3,$fn=160);
    }
    // exact knob cut
    translate([12.5,12,4-0.5])
    knob1cut(tol=0.25);

    // main boss cutout
    translate([0,0,-2])
    color("orange")
    linear_extrude(height=7)
    offset(r=2,$fn=16)    
    square(size=[25,24]);


    // bottom cut for cable
    translate([-2,-6,-2])
    color("green")
    cube([29,6,7]);

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
translate([4.25-4,-2.5,4.5])
rotate([0,90,0])
scale([1,2]){
  difference(){
    union(){
        sphere(r=1.0,$fa=5, $fs=0.1);
        translate([0,0,16.5+8])
        sphere(r=1.0,$fa=5, $fs=0.1);
        cylinder(r=1.0,h=16.5+8,$fn=80);
    }
        translate([-5,0,-5])    
        cube([10,10,50]);
    }
}

    // tab near cable
    translate([-1,-3,3.5])
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

//cambase3();


lid2();

if(0){
// Disk 
color("pink")
translate([-6.0,9,10])
rotate([180,0,0])
rotate([0,90,0])
disk3();
}

if(0){
color("cyan")
translate([31,9,10])
rotate([0,0,0])
rotate([0,-90,0])
disk3();
}

if(0){
translate([12.5,12,4])
cam1();
}

if(0){
translate([12.5,12,4])
knob1();
}

