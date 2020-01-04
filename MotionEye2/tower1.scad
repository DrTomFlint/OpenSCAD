// tower
// cam, servo, tilt-axis


use <../Parts/servo1.scad>
use <../Parts/cambase1.scad>
use <../Parts/cam1.scad>
use <../Parts/arm1.scad>
use <../Parts/bearings1.scad>

use <lid2.scad>


//-----------------------------
module towerside(tol=0.0){

r1=11;
h1=48;
h2=39;
r2=4;
r3=4;
c1=3.6;
    
pts2=[ [0,c1], [r1,c1], [r1,h2], [r2,h1], [0,h1],
    [-r3,h1], [-r1,h2], [-r1,c1] ];
    
    difference(){
    
        union(){
        linear_extrude(height=2.1+tol)
        offset(r=2+tol,$fn=22)
        polygon(points=pts2);
        
        translate([-13.3,-2+c1,0])
        rotate([0,-40,0])
        linear_extrude(height=7+tol,scale=0.6)
        //offset(r=1+tol,$fn=22)
        square([3+tol,28+tol-c1]);

        translate([13,-2+c1,0])
        rotate([0,60,0])
        mirror([1,0,0])
        linear_extrude(height=5+tol,scale=0.5)
        //offset(r=1+tol,$fn=22)
        square([2.5+tol,28+tol-c1]);
        
        // round off the tops
        translate([0,38,0])
        cylinder(r=13,h=2.1+tol,$fn=200);
    }

    // cut to install servo
    translate([0,10,0])
    hull(){
        translate([0,13,-1])
        color("orange")
        cylinder(r=5,h=10,$fn=44);

        translate([0,0,-1])
        color("orange")
        cylinder(r=9.5,h=10,$fn=44);

        translate([0,-14,-1])
        color("orange")
        cylinder(r=9.5,h=10,$fn=44);
    }
    

    // cuts for disk3
    translate([0,39,2])
    rotate([0,0,0]){
        disk3(tol=0.15);
            translate([0,0,-4])
            cylinder(r=5,h=5,$fn=44);
    }    
    
   // material reduction cuts
    translate([8,30,-1])
    cylinder(r=2,h=10,$fn=40);
    translate([-8,30,-1])
    cylinder(r=2,h=10,$fn=40);
    
}
}
//--------------------------
module tower1(){    
difference(){
    // main boss
    union(){
        color("cyan")
        cylinder(r1=26,r2=26,h=13,$fn=300);

        color("yellow")
        translate([0,0,-17.5])
        cylinder(r1=26,r2=26,h=17.5,$fn=300);
        
    }
    // bottom bevel on yellow boss
    color("green")
    translate([0,0,-18.5])
    difference(){
    cylinder(r1=27,r2=27,h=3,$fn=300);
    cylinder(r1=24,r2=27,h=3,$fn=300);
    }
    // bevel on linear cut
    translate([27,0,-18.5])
    rotate([0,45,0])
        cube([10,60,10],center=true);
    
    // side panel cut
    translate([16.6+4.2,0,0])
    rotate([90,0,-90])
    towerside(tol=0.25);
   
    // side panel cut
    translate([-16.6-4.2,0,0])
    rotate([90,0,90])
    mirror([1,0,0])
    towerside(tol=0.25);
        
    // cut for tilt servo = upper
    translate([7.5,-5.25,8])
    rotate([-90,0,90])
    servo1cut();

    // cut for servo wires
    translate([-4,6,-7])
    cube([9,20,30]);
    
    // cut for pan servo = lower    
    translate([-7,-5.25,-4.4])
    rotate([90,0,90])
    color("blue")
    servo1cut();
    
    // clearances to install lower servo
    translate([-8,-16.8,0])
    cube([24,23,40]);
    translate([8.5,-22,0])
    cube([3.5,34,40]);
    hull(){
        translate([16,0,-2])
        rotate([0,90,0])
        cylinder(r=10,h=10,$fn=144);
        translate([16,0,8])
        rotate([0,90,0])
        cylinder(r=10,h=10);
    }
    
    // center hole for pan bearing    
    translate([0,0,-19])
    cylinder(r=11+0.15,h=9,$fn=88);
    
    translate([0,0,-18])
    cylinder(r1=12,r2=11,h=1.01,$fn=88);
        
    translate([0,0,-11])
    cylinder(r1=11-0.25,r2=6,h=5,$fn=88);

    // cut for tilt arm 
    translate([-25,0,28])
    cube([6,60,74],center=true);

    // cut for pan wheel
    translate([25,0,20])
    cube([6,60,74],center=true);
    
    // cut to install servo
    hull(){
        translate([-23,0,21])
        rotate([0,90,0])
        color("orange")
        cylinder(r=3,h=12,$fn=144);

        translate([-23,0,10])
        rotate([0,90,0])
        color("orange")
        cylinder(r=9.5,h=12,$fn=144);
    }
    
    // cut to balance servo install
    hull(){
        translate([9,0,21])
        rotate([0,90,0])
        color("orange")
        cylinder(r=3,h=14,$fn=144);

        translate([9,0,10])
        rotate([0,90,0])
        color("orange")
        cylinder(r=9.5,h=14,$fn=144);
    }
    
    // cut extra material near back
    translate([0,25,-15])
    color("orange")
    cylinder(r1=12,r2=15,h=30,$fn=144);
    
    // cut extra material near front
    translate([0,-25,-15])
    color("orange")
    scale([1.4,1,1])
    cylinder(r1=4,r2=6,h=30,$fn=144);

}


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

//------------------------------
module deck1(){


Nrib=6;

difference(){
union(){
    // main deck
    translate([0,0,-20])
    cylinder(r1=30,r2=29.5,h=2,$fn=200);

    // axle for bearing
    color("red")
    translate([0,0,-18]){
    cylinder(r1=8.1/2,r2=8.2/2,h=6,$fn=22);    
    cylinder(r1=12.4/2,r2=
        12.4/2,h=0.6,$fn=22);    
    }    
    translate([0,0,-12])
    cylinder(r1=8.2/2,r2=7.2/2,h=1,$fn=22);    
}
    // six holes
    for(i=[0:Nrib-1]){
        rotate([0,0,360/Nrib*i+180/Nrib])
        color("pink")
        translate([0,17,-20-0.01])
        cylinder(r1=5,r2=5.5,h=2.02,$fn=44);
    }

    // center hole
    translate([0,0,-25])
    cylinder(r=1.5,h=30,$fn=22);    

    // strain relief slot
    translate([0,0,-6])
    cube([1,20,20],center=true);
}

// raised ribs to help tower slide
for(i=[0:Nrib-1]){
    rotate([0,0,360/Nrib*i])
    color("pink")
translate([0,19,-18])
linear_extrude(height=0.3)
offset(r=0.5)
square([0.4,4],center=true);

}

}

//---------------------------
module tire1(){

F1=200;
    
    difference(){
        translate([0,0,2.3])
        color("pink")
        difference(){
            // boss
            union(){
                cylinder(r1=23.6/2+1.5,r2=23.6/2+2.5,h=1,$fn=F1);
                translate([0,0,1])
                cylinder(r=23.6/2+2.5,h=4,$fn=F1);
                translate([0,0,5])
                cylinder(r1=23.6/2+2.5,r2=23.6/2+1.5,h=1,$fn=F1);
            }
            
            // center hole
            translate([0,0,-1])
            cylinder(r=11,h=9,$fn=44);
            
            translate([0,0,2.2])
            cylinder(r1=23.6/2,r2=11,h=1,$fn=44);
            translate([0,0,4.5])
            cylinder(r1=23.6/2,r2=11,h=1,$fn=44);
        }

        // cut for the wheel
        color("orange")
        disk1(tol=0.1,holes=0);

        // cut for hubcaps
        translate([0,0,2.4])
        disk1(tol=0.1,holes=0);
    }
    
}
    
//===========================


//tire1();

if(0){
// new side panels
translate([40,0,0])

color("green")
mirror([1,0,0])
towerside();
    
towerside();
}

deck1();

if(0){
// pan bearing    
translate([0,0,-17.5])
balls1();
}

// pan servo
if(0){
    translate([-7,-5.25,-4.4])
    rotate([90,0,90]){
    color("blue")
    servo1();
    if(1){
        translate([5.25,0,27.5])
        color("orange")
        disk1();

        // add a tire on the wheel
        translate([5.25,0,27.5])
        tire1();
    }
}
}

//tower1();

if(0){
// side panel
color("orange")
translate([16.6+4.2,0,0])
rotate([90,0,-90])
towerside();
}
if(0){
// side panel
color("cyan")
translate([-16.6-4,0,0])
rotate([90,0,90])
mirror([1,0,0])
towerside();
}

// tilt servo = upper
if(0){
translate([7.5,-5.25,8])
rotate([-90,0,90]){
    servo1();
    if(1){
    translate([5.25,0,27.5])
    rotate([0,0,90])
    color("green")
    arm2();
    translate([5.25,0,27.5])
    rotate([0,0,0])
    color("green")
    arm2();
    }
}    
}

// upper servo horn arm
if(0){
translate([7.5,-5.25,39])
rotate([-90,0,90]){
    translate([5.25,0,27.5])
    rotate([0,0,0])
    color("green")
    arm2();
    translate([5.25,0,27.5])
    rotate([0,0,90])
    color("green")
    arm2();
}    
}

 
// camhead
if(0){
translate([-12.5,10,30])
rotate([90,0,0]){
    cambase3();
    lid2();
    
    if(0){
        translate([12.5,12,4])
        cam1();
        translate([12.5,12,4])
        knob1();
    }
    
    translate([-6,9,10])
    rotate([180,0,0])
    rotate([0,90,0])
    disk3();

    translate([31,9,10])
    rotate([0,0,0])
    rotate([0,-90,0])
    disk3();
}
}

