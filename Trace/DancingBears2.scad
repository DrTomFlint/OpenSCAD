//======================================================================
// DancingBears.scad
//
//
// DrTomFlint 7 Dec 2023
//======================================================================

use <./DancingBear1.scad>
use <./DancingBear2.scad>
use <./DancingBear3.scad>
use <./DancingBear4.scad>
use <./DancingBear5.scad>
use <./DancingMask1.scad>
use <./DancingMask2.scad>
use <./DancingMask3.scad>
use <./DancingMask4.scad>
use <./DancingMask5.scad>
use <./DancingBib1.scad>
use <./DancingBib2.scad>
use <./DancingBib3.scad>
use <./DancingBib4.scad>
use <./DancingBib5.scad>
use <./DancingShadow1.scad>
use <./DancingShadow2.scad>
use <./DancingShadow3.scad>
use <./DancingShadow4.scad>
use <./DancingShadow5.scad>

mag=42;
thick=1.2;

fx=42;
fy=38;

//----------------------------------------------------------------------
module bear(num=1){

  difference(){
    if(num==1){
      scale([mag,mag,thick])  
      DancingBear1();
    }
    if(num==2){
      scale([mag,mag,thick])  
      DancingBear2();
    }
    if(num==3){
      scale([mag,mag,thick])  
      DancingBear3();
    }
    if(num==4){
      scale([mag,mag,thick])  
      DancingBear4();
    }
    if(num==5){
      scale([mag,mag,thick])  
      DancingBear5();
    }
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
  }
  
}

//----------------------------------------------------------------------
module field(lip=6,num=1){
  
  difference(){
    // main cut for bear
    translate([0,0,-lip/2+thick])
    hull(){
      translate([0,fy/2,-lip/2])
      rotate([0,0,3])
      rotate([0,90,0])
      cylinder(r=lip,h=fx,center=true,$fn=99);
      translate([0,-fy/2,-lip/2])
      rotate([0,0,-3])
      rotate([0,90,0])
      cylinder(r=lip,h=fx,center=true,$fn=99);
    }
    translate([0,0,-lip/2+thick])
    hull(){
      translate([0,fy/2,-lip/2])
      rotate([0,0,3])
      rotate([0,90,0])
      cylinder(r=lip-thick,h=fx+1,center=true,$fn=22);
      translate([0,-fy/2,-lip/2])
      rotate([0,0,-3])
      rotate([0,90,0])
      cylinder(r=lip-thick,h=fx+1,center=true,$fn=22);
    }
    translate([0,0,-lip/2+thick])
    translate([0,0,-20-3])
    cube([fx+20,fy+20,40],center=true);
    
    if(num==1){
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingBear1();
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingMask1();
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingBib1();
    }
    if(num==2){
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingBear2();
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingMask2();
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingBib2();
    }
    if(num==3){
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingBear3();
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingMask3();
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingBib3();
    }
    if(num==4){
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingBear4();
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingMask4();
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingBib4();
    }
    if(num==5){
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingBear5();
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingMask5();
      translate([0,0,-0.1])
      scale([mag,mag,thick+1])  
      DancingBib5();
    }
          
    // sew-down holes    
    translate([17,fy/2+4,-2])
    rotate([90,0,0])
    cylinder(r=1,h=5*thick,center=true,$fn=22);
    translate([17,-fy/2-4,-2])
    rotate([90,0,0])
    cylinder(r=1,h=5*thick,center=true,$fn=22);
    translate([-17,fy/2+4,-2])
    rotate([90,0,0])
    cylinder(r=1,h=5*thick,center=true,$fn=22);
    translate([-17,-fy/2-4,-2])
    rotate([90,0,0])
    cylinder(r=1,h=5*thick,center=true,$fn=22);
  }

  //~ // cover up the registration marks
  intersection(){
    union(){
      translate([mag/2-3,mag/2-3,thick/2])
      cube([4.5,6,thick],center=true);
      translate([-mag/2+3,mag/2-2,thick/2])
      cube([4.5,6,thick],center=true);
      translate([mag/2-3,-mag/2+3,thick/2])
      cube([4.5,6,thick],center=true);
      translate([-mag/2+3,-mag/2+2,thick/2])
      cube([4.5,6,thick],center=true);
    }
    translate([0,0,-lip/2+thick])
    hull(){
      translate([0,fy/2,-lip/2])
      rotate([0,0,3])
      rotate([0,90,0])
      cylinder(r=lip,h=fx,center=true,$fn=99);
      translate([0,-fy/2,-lip/2])
      rotate([0,0,-3])
      rotate([0,90,0])
      cylinder(r=lip,h=fx,center=true,$fn=99);
    }
  }
}

//----------------------------------------------------------------------
module body(num=1){
  difference(){
    if(num==1){
      scale([mag,mag,thick])  
      DancingMask1();
    }
    if(num==2){
      scale([mag,mag,thick])  
      DancingMask2();
    }
    if(num==3){
      scale([mag,mag,thick])  
      DancingMask3();
    }
    if(num==4){
      scale([mag,mag,thick])  
      DancingMask4();
    }
    if(num==5){
      scale([mag,mag,thick])  
      DancingMask5();
    }
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    bear(num=num);
  }
}

//----------------------------------------------------------------------
module bib(num=1){
  difference(){
    if(num==1){
      scale([mag,mag,thick])  
      DancingBib1();
    }
    if(num==2){
      scale([mag,mag,thick])  
      DancingBib2();
    }
    if(num==3){
      scale([mag,mag,thick])  
      DancingBib3();
    }
    if(num==4){
      scale([mag,mag,thick])  
      DancingBib4();
    }
    if(num==5){
      scale([mag,mag,thick])  
      DancingBib5();
    }
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    bear1(num=num);
  }
}


//----------------------------------------------------------------------
module tab(wide=10){
  
  translate([0,4,0])
  difference(){
    translate([0,0,-4])
    linear_extrude(height=4.0,scale=[1,1.2])
    square([wide, 18.0],center=true);
    
    translate([0,0,-4.05])
    linear_extrude(height=4.1,scale=[1,1.1])
    square([wide+2, 14.0],center=true);
  }
}

//----------------------------------------------------------------------
module back(num=1,lip=6){

translate([0,0,-lip]){
  difference(){
    if(num==1){
      scale([mag,mag,lip])  
      DancingShadow1();
    }
    if(num==2){
      scale([mag,mag,lip])  
      DancingShadow2();
    }
    if(num==3){
      scale([mag,mag,lip])  
      DancingShadow3();
    }
    if(num==4){
      scale([mag,mag,lip])  
      DancingShadow4();
    }
    if(num==5){
      scale([mag,mag,lip])  
      DancingShadow5();
    }
    // cut away registration marks
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=lip+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=lip+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=lip+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=lip+2);
    
    // cut for bare led tape
    translate([0,4,0])
    cube([100,12.2,1],center=true);

    // adjascent leds stick up from tape
    translate([16.5,4,0])
    cube([7,7,4],center=true);
    translate([-16.5,4,0])
    cube([7,7,4],center=true);

    // cut sewing holes
    translate([0,4+6,3])
    rotate([0,90,0])
    cylinder(r=0.6,h=100,center=true,$fn=22);
    translate([0,4-6,3])
    rotate([0,90,0])
    cylinder(r=0.6,h=100,center=true,$fn=22);
  }
}
}

//======================================================================


for(i=[2:4]){
  translate([(i-1)*45,0,0]){
    //~ field(num=i);
    //~ bear(num=i);
    //~ body(num=i);
    bib(num=i);
    //~ tab();
    //~ back(num=i);
  }
}


//======================================================================

