//====================================================
// press.scad
// Drill press using T-slot
//
// Dr Tom Flint, 21 March 2021
//====================================================

use <../Parts/tslot.scad>
use <../Parts/motors.scad>


// vertical post
postHi=480;
footLong=240;
footSide=120;

railX=45;    // position of the rails
railY=30;
railZ=100;

//----------------------------------------------------
module stand1(){

    
    // post
    tslot1(type=2,len=postHi);
    
    translate([-15,15,0])
    rotate([0,0,180])
    rotate([90,0,0])      
    tbrace();

    translate([-15,-15,0])
    rotate([0,0,180])
    rotate([90,0,0])      
    tbrace();
  
    // front foot
    translate([-15-60,0,-15])
    rotate([0,90,0])
    tslot1(type=2,len=footLong);

    // right foot
    color("green")
    translate([0,30,-15])
    rotate([-90,0,0])      
    tslot1(type=1,len=footSide);

    color("green")
    translate([0,30,0])
    rotate([0,0,90])
    rotate([90,0,0])      
    tbrace();

    // left foot
    color("red")
    translate([0,-30-footSide,-15])
    rotate([-90,0,0])      
    tslot1(type=1,len=footSide);

    color("red")
    translate([0,-30,0])
    rotate([0,0,-90])
    rotate([90,0,0])      
    tbrace();

    // rail
    translate([railX,railY,railZ])
    cylinder(r=5,h=330,$fn=66);
    translate([railX,-railY,railZ])
    cylinder(r=5,h=330,$fn=66);

}

//----------------------------------------------------
module railBlock(tol=0.2){

  difference(){
    minkowski(){
      hull(){
        translate([railX,railY,-6])
        cylinder(r=11,h=14,$fn=88);
        translate([railX,-railY,-6])
        cylinder(r=11,h=14,$fn=88);
        translate([15-1,-56/2,-22])
        cube([2,56,30]);
        
      }
      sphere(r=1,$fn=88);
    }
    // rails
    translate([railX,railY,0])
    cylinder(r=5+tol,h=30,$fn=66);
    translate([railX,-railY,0])
    cylinder(r=5+tol,h=30,$fn=66);
    
    // thru hole strain relief for rails
    translate([railX-5,railY+1,-40])
    cylinder(r=1.5,h=80,$fn=66);
    translate([railX-5,-railY-1,-40])
    cylinder(r=1.5,h=80,$fn=66);

    // post
    translate([0,0,-40])
    tslot1(type=2,len=120);
    
    // M4 bolts to the post
    translate([0,15,-12])
    rotate([0,90,0])
    cylinder(r=2,h=60,$fn=22);
    translate([0,-15,-12])
    rotate([0,90,0])
    cylinder(r=2,h=60,$fn=22);

    // clearance for bolt heads
    translate([20,15,-12])
    rotate([0,90,0])
    cylinder(r=3.7,h=40,$fn=45);
    translate([20,-15,-12])
    rotate([0,90,0])
    cylinder(r=3.7,h=40,$fn=45);

  }

}
//====================================================

stand1();
translate([0,0,railZ])
color("cyan")
railBlock();


translate([0,0,railZ+330])
rotate([180,0,0])
railBlock();




//====================================================
