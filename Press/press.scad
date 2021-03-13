//====================================================
// press.scad
// Drill press using T-slot
//
// Dr Tom Flint, 21 March 2021
//====================================================

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <../Parts/presstime.scad>


// vertical post
postHi=480;
footLong=240;
footSide=120;

railX=30;    // position of the rails
railY=35;
railZ=100;

sledZ=200;
sledHi=50;

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
    translate([0,30,-15])
    rotate([-90,0,0])      
    tslot1(type=1,len=footSide);

    translate([0,30,0])
    rotate([0,0,90])
    rotate([90,0,0])      
    tbrace();

    // left foot
    translate([0,-30-footSide,-15])
    rotate([-90,0,0])      
    tslot1(type=1,len=footSide);

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
        translate([15-1,-56/2,-6-6])
        cube([2,56,14+6]);
        
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
    translate([0,15,0])
    rotate([0,90,0])
    cylinder(r=2,h=60,$fn=22);
    translate([0,-15,0])
    rotate([0,90,0])
    cylinder(r=2,h=60,$fn=22);

    // clearance for bolt heads
    translate([20,15,0])
    rotate([0,90,0])
    cylinder(r=3.7,h=40,$fn=45);
    translate([20,-15,0])
    rotate([0,90,0])
    cylinder(r=3.7,h=40,$fn=45);

    // cut for the drive belt
    translate([34,0,0])
    scale([1,2,1])
    cylinder(r=4,h=100,$fn=45,center=true);
  }

}

//-----------------------------------------------------
module sled(tol=0.15){

tabHi=25;

difference(){
  union(){
    // sleeves around the LM10U bearings
    hull(){
      translate([railX,railY,0])
      cylinder(r=19/2+3,h=29,$fn=88);

      translate([railX,-railY,sledHi])
      cylinder(r=19/2+3,h=29,$fn=88);

      translate([railX,-railY,-sledHi])
      cylinder(r=19/2+3,h=29,$fn=88);
    }
    
    // bolt on tabs
    color("pink")
    hull(){
      translate([railX,railY+20,29/2])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi,$fn=88,center=true);

      translate([railX,railY,29/2])
      rotate([0,90,0])
      cylinder(r=10+6,h=tabHi,$fn=88,center=true);
    }

    color("pink")
    hull(){
      translate([railX,-railY-20,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi,$fn=88,center=true);
      
      translate([railX,-railY,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=tabHi,$fn=88,center=true);
    }

    color("pink")
    hull(){
      translate([railX,-railY-20,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi,$fn=88,center=true);
      
      translate([railX,-railY,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=tabHi,$fn=88,center=true);
    }
  }

  // cuts for the bolt mounts
  translate([railX,railY+20,29/2])
  rotate([0,90,0])
  cylinder(r=2,h=tabHi+2,$fn=88,center=true);

  translate([railX,-railY-20,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r=2,h=tabHi+2,$fn=88,center=true);

  translate([railX,-railY-20,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r=2,h=tabHi+2,$fn=88,center=true);
  

  // cut for the LM10Us
  translate([railX,railY,-1])
  cylinder(r=19/2+tol,h=29+2,$fn=88);

  translate([railX,-railY,sledHi-1])
  cylinder(r=19/2+tol,h=29+2,$fn=88);

  translate([railX,-railY,-sledHi-1])
  cylinder(r=19/2+tol,h=29+2,$fn=88);

  // extra cut for right LM10U
  translate([railX,railY,-19])
  cylinder(r=19/2+tol,h=29+2,$fn=88);

  // extra clearance for the rails
  translate([railX,railY,0])
  cylinder(r=5+1,h=330,$fn=66,center=true);
  translate([railX,-railY,0])
  cylinder(r=5+1,h=330,$fn=66,center=true);
}

  

}

//---------------------------------------------------
module pulley(){
  
  translate([0,5.75,36])
  rotate([90,0,0])
  presstime();
  
}

//---------------------------------------------------
module idler1(){
  color("blue")
  translate([26,4.5,75])
  rotate([90,0,0])
  idler();
  
}

//====================================================

idler1();

translate([0,0,postHi])
pulley();

stand1();

translate([0,0,railZ])
color("cyan")
railBlock();

translate([0,0,railZ+330])
rotate([180,0,0])
color("cyan")
railBlock();

// cutaway sled
if(0){
difference(){
  translate([0,0,sledZ])
  sled();

  translate([100+railX,0,sledZ])
  cube(200,center=true);
}
}

// full sled
if(0){
  translate([0,0,sledZ])
  sled();
}

if(1){
  // LM10U bearings
  translate([0,0,sledZ]){
    translate([railX,railY,0])
    color("red")
    cylinder(r=19/2,h=29,$fn=88);

    translate([railX,-railY,sledHi])
    color("green")
    cylinder(r=19/2,h=29,$fn=88);

    translate([railX,-railY,-sledHi])
    color("green")
    cylinder(r=19/2,h=29,$fn=88);
  }
}

//====================================================
