//=================================================================================
// bathfan.scad
//
// Dr Tom Flint, 6 Dec 2020
//=================================================================================

use <../Parts/fan.scad>
use <../Parts/rounder.scad>
use <../Fractals/Lsystem.scad>


// fan and radiator
t1=4.25;   // thickness box intake side
t2=17.7;   // thickness of circular section
t3=4.0;    // thickness box outlet side
t4=t1+t2+t3;


//-------------------------------------------------------
module bathfan1(){

      // top post
      difference(){
        union(){
          translate([-t1-t2+0.15,-1,120-12])
          cube([t2-0.25,13,13]);
          translate([0,-1,120-12])
          cube([6,13,13]);
          translate([-t4-6,-1,120-12])
          cube([6,13,13]);
          translate([-t4-6,-1,120])
          cube([t4+12,13,6]);
          translate([-t4-6,-1-4,120-12])
          cube([t4+12,4,18]);
        }
        // Corner screws
        translate([8,7,120-7])
        rotate([0,-90,0])
        cylinder(r=1.8,h=t4+16,$fn=22);
        translate([8,12,120+6])
        rotate([0,-90,0])
        rotate([0,0,180])
        rounder(r=5,h=t4+16,$fn=22);
      }


      // bottom post
      difference(){
        union(){
          translate([-t1-t2+0.15,-1,-1])
          cube([t2-0.25,13,13]);
          translate([0,-1,-1])
          cube([6,13,13]);
          translate([-t4-6,-1,-1])
          cube([6,13,13]);
          translate([-t4-6,-1,-6])
          cube([t4+12,13,6]);
          translate([-t4-6,-1-4,-6])
          cube([t4+12,4,18]);
        }
        // Corner screws
        translate([8,7,7])
        rotate([0,-90,0])
        cylinder(r=1.8,h=t4+16,$fn=22);
        translate([8,12,-6])
        rotate([0,-90,0])
        rotate([0,0,-90])
        rounder(r=5,h=t4+16,$fn=22);
      }
      
      // vertical post on intake side (away from spider)
      translate([-10,-5,-6])
      cube([16,5,120+8]);
      
      // interlock for material change
      for(i=[1:4])
      translate([-t4-6,-1-4-1.2,120-14+i*4])
      cube([t4+12,1.2,2]);

      for(i=[1:4])
      translate([-t4-6,-1-4-1.2,-8+i*4])
      cube([t4+12,1.2,2]);

      for(i=[0:2])
      translate([-8+i*5,-6.2,10])
      cube([2,2,100]);

    // try a soft gasket / lip
    translate([53,-6,60])
    cube([2,3,116],center=true);  
    translate([45,-6,60])
    cube([2,3,128],center=true);  

}

//-------------------------------------------------------
module bathfan2(){

  difference(){
    union(){
      translate([-t4-6,-1-4-4,120-12])
      cube([t4+12,4,18]);

      translate([-10,-5-4,-6])
      cube([16,5,120+12]);

      translate([-t4-6,-1-4-4,-6])
      cube([t4+12,4,18]);

      translate([6,-5-4,-6])
      cube([50,3,120+12]);
    }
    bathfan1();

    translate([10,-6,-6-1])
    scale([1.5,1,1])
    cylinder(r=2,h=120+12+2,$fn=44);

    translate([40,-6,-6-1])
    scale([1.5,1,1])
    cylinder(r=2,h=120+12+2,$fn=44);
    
    translate([49,-4,2])
    rotate([90,0,0])
    cylinder(r=1.6,h=6,$fn=44);

    translate([56,-4,-6])
    rotate([90,0,0])
    rotate([0,0,90])
    rounder(r=10,h=6,f=44);
    
    translate([49,-4,120-2])
    rotate([90,0,0])
    cylinder(r=1.6,h=6,$fn=44);

    translate([56,-4,120+6])
    rotate([90,0,0])
    rotate([0,0,180])
    rounder(r=10,h=6,f=44);
    
    translate([49,-4,60])
    rotate([90,0,0])
    cylinder(r=1.6,h=6,$fn=44);


    difference(){
      translate([25,-10,60])
      cube([20,12,114],center=true);  

      translate([25,-2,60])
      rotate([90,0,0])
      rotate([0,0,18])
      linear_extrude(height=12,convexity=10)
//      scale([5,5])
      scale([6,6])
      penrose_tiling(n=5, w=0.2);
    }
      // recess the penrose tile
      translate([25,-4,60])
      cube([20,6,114],center=true);  
  
    // try a soft gasket / lip
    translate([53,-6,60])
    cube([2,3,116],center=true);  
    translate([45,-6,60])
    cube([2,3,128],center=true);  
    
  }
}

//============================================================




if(0){
  color("gray")
  fan();
}

intersection(){
  
if(0){
  color("cyan")
  bathfan1();
}

if(1){
  bathfan2();
}
color("cyan")
translate([-10,-21,13])
cube([25,20,20]);
}



//============================================================
