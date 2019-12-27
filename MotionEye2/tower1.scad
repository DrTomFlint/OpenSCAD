// tower
// cam, servo, tilt-axis


use <../Parts/servo1.scad>
use <../Parts/cambase1.scad>
use <../Parts/cam1.scad>
use <../Parts/arm1.scad>

use <lid2.scad>


L=25;
pts=[ [L,-2*L], [L,2*L], 
    [-1.2*L,0.7*L], [-1.2*L,-0.7*L] ];
   

//--------------------------
module tower1(){    
difference(){
    // main boss
    union(){
        color("cyan")
        cylinder(r1=24,r2=20,h=67,$fn=88);

        color("yellow")
        translate([0,0,-6])
        cylinder(r1=24,r2=24,h=6,$fn=88);
        
        // pan tab 
        translate([0,25,-3])
        cylinder(r=3,h=4,$fn=22);
    }
    // hole in the pan tab
    translate([0,25,-4])
    cylinder(r=0.8,h=8,$fn=22);
    
    // main vertical cut
    translate([0,0,43])
    cube([33,60,60],center=true);

    // cutout in base for servo
    translate([11,-4,8])
    rotate([-90,0,90])
    servo1cut();

    // cut for servo wires
    translate([2.5,6,4])
    cube([7,20,20]);

    // center hole for pan
    translate([0,0,-7])
    cylinder(r=6,h=9,$fn=88);
    translate([0,0,-6.01])
    cylinder(r1=7,r2=6,h=1.02,$fn=88);
    
    // cut for arm 
    translate([-22,0,33])
    cube([6,60,74],center=true);

    // cut for not arm side
    translate([22,0,33])
    cube([6,60,74],center=true);
    
    // cut to install servo
    hull(){
        translate([-20,0,21])
        rotate([0,90,0])
        color("orange")
        cylinder(r=3,h=10,$fn=44);

        translate([-20,0,10])
        rotate([0,90,0])
        color("orange")
        cylinder(r=8,h=10,$fn=44);
    }
    
    // cut to balance servo install
    hull(){
        translate([10,0,21])
        rotate([0,90,0])
        color("orange")
        cylinder(r=3,h=10,$fn=44);

        translate([10,0,10])
        rotate([0,90,0])
        color("orange")
        cylinder(r=8,h=10,$fn=44);
    }
    
    // cut for tilt wheels
    translate([-12.5,10,30])
    rotate([90,0,0]){

    translate([-4,9,10])
    rotate([180,0,0])
    rotate([0,90,0]){
        disk3cut();
        hull(){
            translate([0,-12,-4])
            cylinder(r=2,h=5,$fn=44);
            translate([0,0,-4])
            cylinder(r=7,h=5,$fn=44);
        }
    }

    translate([29,9,10])
    rotate([0,0,0])
    rotate([0,-90,0]){
        disk3cut();
        hull(){
            translate([0,12,-4])
            cylinder(r=2,h=5,$fn=44);
            translate([0,0,-4])
            cylinder(r=7,h=5,$fn=44);
        }
    }
    
}
}


}

//--------------------
module tophat1(){

    translate([0,0,2])
    difference(){
        translate([0,0,59])
        color("orange")
        cylinder(r=24,h=8,$fn=44);
    
        translate([0,0,62-0.01])
        color("orange")
        cylinder(r=6,h=5.02,$fn=44);

        translate([0,0,66])
        color("orange")
        cylinder(r1=6,r2=7,h=1,$fn=44);

        translate([0,30,55])
        rotate([90,0,0])
        scale([1,0.6,1])
        cylinder(r=16,h=60,$fn=44);

        tower1();
    }
    
}

//---------------------------
module base1(){
   
    // tower base
    difference(){

        hull(){
//        union(){
       rotate([0,0,-90])
       translate([0,0,-8])
       linear_extrude(height=4)
       offset(r=5,$fn=44)
       polygon(points=pts); 

        // support for pan servo
        translate([-38,18,-8])
        rotate([0,0,60])
        linear_extrude(height=4)
        circle(r=18);
        }
 
        translate([0,0,-6.2])
        cylinder(r1=24.2,r2=24.4,h=3,$fn=88);
        
        hood1(tol=0.15);
        translate([-27,41,0])
        rotate([0,0,60])
        strap1(tol=0.15);

        // camera cable
        color("blue")
        hull(){
            translate([16,30,-9])
            cylinder(r=1,h=10,$fn=88);

            translate([-16,30,-9])
            cylinder(r=1,h=10,$fn=88);
        }    
    }
    
    // axel
    translate([0,0,-6])
    cylinder(r1=6-0.2,r2=6-0.4,h=1.5,$fn=88);

}

//---------------------------
module top1(){

    // tower top lid
    difference(){

    union(){
       rotate([0,0,-90])
       translate([0,0,68])
       linear_extrude(height=4)
       offset(r=5,$fn=44)
       polygon(points=pts); 
    
        // support for pan servo
        translate([-44,-5,68])
        rotate([0,0,60])
        linear_extrude(height=4)
        offset(r=2)
        square([36,8]);

        }
    
        translate([0,0,68-0.01])
        cylinder(r1=24.2,r2=24.4,h=3.02,$fn=88);
        
        hood1(tol=0.15);
        translate([-27,41,0])
        rotate([0,0,60])
        strap1(tol=0.15);
    }
    
    // axel
       translate([0,0,68])
    cylinder(r1=6-0.4,r2=6-0.2,h=3,$fn=88);

}


//------------------------
module hood1(tol=0.0){
   
    translate([0,0,2])
    rotate([0,0,-90])
    difference(){
       translate([0,0,-8])
       linear_extrude(height=75+tol)
       offset(r=4+tol,$fn=44)
       polygon(points=pts); 

       translate([0,0,-8-1])
       linear_extrude(height=80+2)
       offset(r=3-tol,$fn=44)
       polygon(points=pts); 

       translate([20,-49,-8-1])
       linear_extrude(height=80+2)
        square([10,98]);

    translate([-24,-27,-4])    
    rotate([0,90,60])
    scale([1.4,1,1])
    cylinder(r=10,h=20,$fn=44);
    
    }

}

//---------------------------
module strap1(tol=0.0){

difference(){
union(){
color("red")
translate([-43,-9,-6])
    linear_extrude(height=75+tol)
    square([28+tol,2+tol]);

color("green")
translate([-47,-11+4,16])
    linear_extrude(height=22)
    offset(r=2,$fn=22)
    square([40-4,14-4]);

color("orange")
translate([-46,-7,-6])
    linear_extrude(height=75,scale=0.6)
    offset(r=2,$fn=22)
    square([4,10]);
}

translate([-28,0,36])
rotate([180,0,0]){
    servo1cut();
}

    // cut for servo wiring
    color("pink")
    translate([-20,-4,28])
    linear_extrude(height=6)
    square([12,10]);

}
    

}

//===========================

translate([-27,41,0])
rotate([0,0,60])
strap1();

base1();

//top1();

color("cyan")
hood1();

// pan servo
if(1){
translate([-40,15,36])
rotate([180,0,60]){
    color("blue")
    servo1();
    translate([5.25,0,27.5])
    rotate([0,0,0])
    color("orange")
    arm1();
}
}

tophat1();

tower1();

// servo in the base of tower
if(1){
translate([11,-4,8])
rotate([-90,0,90]){
    servo1();
    translate([5.25,0,27.5])
    rotate([0,0,0])
    color("green")
    arm2();
}    
}

// upper servo horn arm
if(1){
translate([11,-5.25,39])
rotate([-90,0,90]){
    translate([5.25,0,27.5])
    rotate([0,0,0])
    color("green")
    arm2();
}    
}

 
// this is the camhead:
if(1){
translate([-12.5,10,30])
rotate([90,0,0]){
    cambase2();
    lid2();
    
    if(0){
        translate([12.5,12,4])
        cam1();
        translate([12.5,12,4])
        knob1();
    }
    
    translate([-4,9,10])
    rotate([180,0,0])
    rotate([0,90,0])
    disk3();

    translate([29,9,10])
    rotate([0,0,0])
    rotate([0,-90,0])
    disk3();
}
}

