// zaxis

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <../Parts/switch.scad>
use <../Parts/rounder.scad>

// Center to motor screw
x1=-7; 

// Center to rod
x3=19;

// Label?
yoff3=6;

// sides2
F2=88;


//------------------------------
module zleft1(
x1=-10,
x3=15,
yoff3=6
){

F2=88;
F3=88;

z4=41;  // translate 38
z5=6;  // thick 10

difference(){
// boss
//~ minkowski(){         // @TODO this crashes OpenScad with manifold and fastXXX lib
union(){
    // over motor
    color("gray")
    translate([-6,-2,z4])
    linear_extrude(height=z5,convexity=10)
    square([44,48],center=true);

    // back corner
    color("pink")
    translate([20,-13,z4])
    linear_extrude(height=z5,convexity=10)
    square([16,24],center=true);

    // rounded corner
    color("green")
    translate([16,-2,z4])
    scale([1,2,1])
    cylinder(r=12,h=z5,$fn=F2);

    // collar around rod
    color("red")
    translate([x3,0,z4+z5])
    cylinder(r=7,h=2,$fn=F2);

    difference(){
        // vertical tab
        color("orange")
        translate([0,-22,z4])
        linear_extrude(height=21,convexity=10)
        square([56,8],center=true);

        // corner cutout for extruder body
        translate([x1-19,-10,62])
        rotate([90,0,0])
        cylinder(r=8,h=30,$fn=F2);
    }

    // fillet
    color("blue")
    translate([0,-16.0,z4+3])
    rotate([45,0,0])
    linear_extrude(height=6,convexity=10)
    square([56,6],center=true);

    // collar around screw
    translate([x1,0,z4+z5])
    cylinder(r=7,h=2,$fn=F2);
}
//~ sphere(r=2,$fs=0.2);
//~ }


// left tower
translate([0,-30-42.3/2-yoff3,0])
tslot1(type=3,len=100,tol=0.15);

// left z motor
color("red")
translate([x1,0,0])
rotate([0,0,180])
zmotor(tol=0.15);

// left z rod, add some tolerance
color("red")
translate([x3,0,42])
cylinder(r=5+0.05,h=350,$fn=F2);
    
    // mounting holes,
    translate([15.5+x1,15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([-15.5+x1,15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([15.5+x1,-15.5,30])
    cylinder(r=1.6,h=20,$fn=F3);
    translate([-15.5+x1,-15.5,30])
    cylinder(r=1.6,h=20,$fn=F3);

    // countersink for the heads
    translate([15.5+x1,15.5,46])
    cylinder(r=2.8,h=4,$fn=F3);
    translate([-15.5+x1,15.5,46])
    cylinder(r=2.8,h=4,$fn=F3);
    translate([15.5+x1,-15.5,46])
    cylinder(r=2.8,h=30,$fn=F3);
    translate([-15.5+x1,-15.5,46])
    cylinder(r=2.8,h=30,$fn=F3);


    // extra clearance for leadscrew
    translate([x1,0,z4-5])
    cylinder(r=5,h=20,$fn=F2);

    // tslot mounts
    translate([15,-42.3/2-5-yoff3,56])
    rotate([-90,0,0])
    cylinder(r=5.9/2,h=20,$fn=F2);

    translate([15,-42.3/2+0.5-yoff3+5,56])
    rotate([-90,0,0])
    cylinder(r=5,h=6,$fn=F2);

    translate([-15,-42.3/2-5-yoff3,56])
    rotate([-90,0,0])
    cylinder(r=5.9/2,h=20,$fn=F2);

    translate([-15,-42.3/2+0.5-yoff3+5,56])
    rotate([-90,0,0])
    cylinder(r=5,h=6,$fn=F2);
}    
}

//----------------------------------------------------------------
module zleft2a(
x1=-8,
x3=17,
yoff3=6,
endstop=1
){

F2=88;
F3=22;

// boss
difference(){
translate([0,0,342])
union(){
    // over rods
    color("cyan")
    translate([6,-9.5,53])
    cube([44,37,20],center=true);

    // end stop switch block
    color("orange")
    translate([6,-9.5,34])
    cube([26,37,24],center=true);
    translate([23,-14,34])
    cube([10,28,24],center=true);

    // collar around rod
    color("red")
    translate([x3,0,22])
    cylinder(r=9,h=24,$fn=F2);

    // collar around screw
    translate([x1,0,22])
    cylinder(r=9,h=24,$fn=F2);


}
    // corner cuts
    color("pink")
    translate([28,9,38+342])
    rotate([0,0,180])
    rounder(r=9,h=30,f=88);

    // corner cuts
    color("pink")
    translate([-16,9,38+342])
    rotate([0,0,-90])
    rounder(r=9,h=30,f=88);
    
    // left tower, note extra clearance tol=0.25
    translate([0,-30-42.3/2-yoff3,0])
    tslot1(type=3,len=380,tol=0.25);

    // top rail, no extra clearance tol=0.15
    translate([-30,-30-42.3/2-yoff3,380+15])
    rotate([0,90,0])
    tslot1(type=2,len=60,tol=0.15);

    // left top L front
    color("pink")
    translate([0,-42.3/2-yoff3,380+30])
    rotate([-90,90,0])
    lbrace(tol=0.15);
    // trim off leftover that is in the Tslot
    color("red")
    translate([-25,-42.3/2-yoff3-4,386])
    cube([25,6,20]);

    // left z rod, add some tolerance
    color("red")
    translate([x3,0,42])
    cylinder(r=5+0.1,h=350.15,$fn=F2);
    
    // extra clearance for leadscrew
    translate([x1,0,360])
    cylinder(r=5,h=30,$fn=F3);

    // M5 mount to top rail
    translate([5,-42.3/2-yoff3-4,380+15])
    rotate([-90,0,0])
    cylinder(r=5.9/2,h=12,$fn=F2);

    translate([5,-42.3/2+0.5-yoff3+6.5,380+15])
    rotate([-90,0,0])
    cylinder(r=5,h=60,$fn=F2);
  
if(endstop==1){  
    // cut for the end stop switch
    Tol1=0.15;
    translate([9,-42.3/2-yoff3+1,381])
    rotate([-90,0,90])
    translate([-Tol1/2,-Tol1/2,-Tol1/2])
    switch(ang1=0,tol=Tol1);
  
    // cuts for the end stop switch
    // allow insertion
    translate([-8,-42.3/2-yoff3-3.5,352])
    cube([10.5,25,30]);
    translate([-8,-42.3/2-yoff3+19,350])
    cube([10,6,20]);
    
    // cut for lever arm near fulcrum
    translate([2,-42.3/2-yoff3+3,352])
    cube([7,17,20]);
    // cut for lever arm near roller
    translate([-0.5,-42.3/2-yoff3+10,352])
    cube([11,15,18]);
    // cut for NC
    translate([-6,-42.3/2-yoff3+17,380])
    cube([16,3.5,7]);
    // cut for NO
    translate([-6,-42.3/2-yoff3+10,380])
    cube([16,3.5,7]);
    // cut for C
    translate([-6,-42.3/2-yoff3+1,380])
    cube([16,3.5,7]);
    // trim down the posts
    translate([2.4,-42.3/2-yoff3+4,374])
    cube([4,14,6]);

}  // end of if(endstop)

  // add a tunnel for the endstop wires
  translate([-12,yoff3-23,380])
  cylinder(r=1.8,h=33,$fn=22);
  translate([-12,yoff3-23,404])
  cylinder(r1=1.8,r2=2.8,h=1,$fn=22);
  translate([-12,yoff3-23,385])
  cylinder(r1=2.8,r2=1.8,h=1,$fn=22);
  
} // end of difference

// add a loop for the wires **************
difference(){
  hull(){
  translate([-9,yoff3-23,380])
  rotate([0,90,0])
  cylinder(r=3,h=3,$fn=22);
  translate([-9,yoff3-23,390])
  rotate([0,90,0])
  cylinder(r=3,h=3,$fn=22);
  }
  translate([-10,yoff3-23,380])
  rotate([0,90,0])
  cylinder(r=1.8,h=5,$fn=22);
}

// show where switch will fit, both angles for the lever arm
if(0){
  translate([9,-42.3/2-yoff3+1,381])
  rotate([-90,0,90]){
    color("green")
    switch(ang1=10);
    color("red")
    switch(ang1=0);
    }
}    
    
}

//---------------------------------
module zleft2(
x1=-8,
x3=17,
yoff3=6
){

F2=88;
F3=22;
    
    zleft2a(x1=x1,x3=x3,yoff3=yoff3);

    
}
//---------------------------------
module zright2(
x1=-8,
x3=17,
yoff3=6
){

F2=88;
F3=22;
    
    mirror([1,0,0])
    zleft2a(x1=x1,x3=x3,yoff3=yoff3);
    
}


//===============================


//mirror([1,0,0])
//zleft1(x1=x1,x3=x3,yoff3=yoff3);

//translate([70,0,0])
//zleft2(x1=x1,x3=x3,yoff3=yoff3);

zright2(x1=x1,x3=x3,yoff3=yoff3);

if(0){
// left tower
color("gray")
translate([0,-30-42.3/2-yoff3,0])
tslot1(type=3,len=380,tol=0.15);

// top rail
color("gray")
translate([-30,-30-42.3/2-yoff3,380+15])
rotate([0,90,0])
tslot1(type=2,len=60,tol=0.15);

// left top L front
color("pink")
translate([0,-42.3/2-yoff3,380+30])
rotate([-90,90,0])
lbrace();

/*
// left z motor
color("red")
translate([x1,0,0])
rotate([0,0,180])
zmotor(tol=0.15);
*/

// left z rod, add some tolerance
color("red")
translate([x3,0,42])
cylinder(r=5+0.1,h=350,$fn=F2);
}

//================================

