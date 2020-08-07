// arm2scad
// scanner part

use <../Parts/cam1.scad>
use <../Parts/cambase1.scad>

//-----------------------------------------------------------
module arm2(){
    
ra=88;
F2=88;

  difference(){
    union(){
      // main loop
      difference(){
        // boss
        cylinder(r=ra,h=20,$fn=F2, center=true);
        
        // cut to make a loop
        cylinder(r=ra-3,h=22,$fn=F2, center=true);
        
        // remove the front edge
        translate([0,-130,0])
        cube([200,200,40],center=true);
      }

      // reinforce left
      color("cyan")
      translate([-ra-10,0,0])  
      rotate([0,90,0])
      cylinder(r=28-0.25,h=14,$fn=F2);
      
      // reinforce right
      translate([ra+1.5,0,0])  
      rotate([0,-90,0])
      cylinder(r=12,h=3.5,$fn=F2);
      
    } // end union  

    // cut for the left axle  
    translate([-ra-10.5,0,0])  
    rotate([0,90,0])
    cylinder(r=21,h=16,$fn=88);
    
    // cut for the left bolts to slew13
    for(i=[0,90,180,270]){
      rotate([i+40,0,0])
      translate([-ra-2,24,0])  
      rotate([0,90,0])
      cylinder(r=1.7,h=50,$fn=88,center=true);
    }
    
    // cut for the right axle  
    translate([ra,0,0])  
    rotate([0,90,0])
    cylinder(r=3.6,h=10,$fn=6,center=true);

  }
}
  
//-------------------------------------------------------------------------
module Rx3(){
tol=0.20;
Off1 = 0;

translate([1.5,0,0]){

difference(){
  union(){
    // Rx body
    translate([-4,-8.35,-8]) color("cyan")
    linear_extrude(height=15) square(size=[5,16.7+1]);
/*
    // bottom fillet to make printable
    translate([-3,0,-8])
       difference(){ 
      rotate([0,45,0])
      cube([5,16.7+1,5],center=true);
        
      translate([-3,0,0])
      cube([6,18+1,6],center=true);
    }
*/    
}  


// lower cut for tape
translate([-1.85,-20,-6])
linear_extrude(height=6,scale=0.7) square(size=[1,40]);


// upper cut for tape    
translate([-1.85+0.3,0,-1])
linear_extrude(height=8.5,scale=1.5) square(size=[0.6,40],center=true);


// cut for the chip head
color("red")
translate([-1.65,-2.5-tol/2-Off1,-2.5-tol/2])
linear_extrude(height=12) 
    square(size=[1.65+tol*2+1,5+tol*2]);


// cut to taper the chip insert
color("orange")
translate([-1.65/2+1.5+tol,-Off1+tol/2,+1.5])
linear_extrude(height=8,scale=1.8) 
    square(size=[1.65+2+tol*2,5+tol*2],center=true);


// cuts on the backside 
color("yellow")
translate([-1.7,12,-4])
rotate([0,0,180])
linear_extrude(height=16,scale=[1,2]) 
    square(size=[2.5,5]);

color("gray")
translate([-4.01, -10.5,-4])
linear_extrude(height=16,scale=[1,2]) 
    square(size=[2.25,4]);



/*
// thru hole where the fiber would sit
// allows running a wire out the port if there is 
// not a led installed there
translate([-4,0,0]) color("orange")
rotate([0,90,0]) 
cylinder(r=1.5,h=2.2,$fn=16);
*/

}  // end of difference

}
} // end of module

  
//-----------------------------------------------------------
module arm3(){
    
ra=88;
F2=88;
F1=222;

  difference(){
    union(){
      // main loop
      difference(){
        // boss
        sphere(r=ra,$fn=F1);
        
        // cut to make a shell
        sphere(r=ra-1.5,$fn=F1);
        
        // remove the top
        translate([0,0,40+10])
        rotate([15,0,0])
        cube([200,200,80],center=true);
        
        // remove the bottom
//        translate([0,0,-40-15])
//        rotate([0,0,0])
//        cube([200,200,80],center=true);
        
        // remove the front edge
        translate([0,-127,0])
        cube([200,200,40],center=true);
      }

      difference(){
        // reinforce left
        color("cyan")
        translate([-ra-10,0,0])  
        rotate([0,90,0])
        cylinder(r=28-0.25,h=14,$fn=F2);
      
        // cut for the left axle  
        translate([-ra-10.5,0,0])  
        rotate([0,90,0])
        cylinder(r=21,h=16,$fn=88);      
      }
      
      // reinforce right
      translate([ra+1.5,0,0])  
      rotate([0,-90,0])
      cylinder(r=12,h=3.5,$fn=F2);

      // camera mount
      if(1){
        translate([3,85,0])
        rotate([0,0,-90])
        rotate([0,90,0])
        translate([-12.5,-12,0])
        cambase2();
      }
      
      // led strip
      if(0){
      rotate([15,0,0])
      for(i=[-9:9]){
        rotate([0,0,11.30*i])
        translate([0,84,0])
        rotate([0,0,-90])
        Rx3();
      }
    }

    } // end union  

    
    // cut for the left bolts to slew13
    for(i=[0,90,180,270]){
      rotate([i+70,0,0])
      translate([-ra-2,24,0])  
      rotate([0,90,0])
      cylinder(r=1.7,h=50,$fn=88,center=true);
    }
    
    // cut for the right axle  
    translate([ra,0,0])  
    rotate([0,90,0])
    cylinder(r=3.6,h=10,$fn=6,center=true);
    
    // cut for the camera cable
    translate([-89,12,-17/2])
    rotate([0,0,70])
    cube([45,1.5,17]);

    // cut for the camera cable
    translate([-40,87,-17/2])
    rotate([0,0,-10])
    cube([45,1,17]);

    // remove the bottom
    translate([0,0,-40-14])
    rotate([0,0,0])
    cube([200,200,80],center=true);
  }
}
  
//=========================================

/*
      rotate([15,0,0])
      for(i=[0:1]){
        rotate([0,0,11.35*i])
        translate([0,84,0])
        rotate([0,0,-90])
        Rx3();
      }
*/

arm3();

if(0){
  translate([3,85,0])
  rotate([0,0,-90])
  rotate([0,90,0])
  translate([0,0,4])
  cam1();
}

//==============================================
