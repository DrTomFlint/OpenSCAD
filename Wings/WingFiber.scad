//=================================================================================
// WingFiber.scad
//
// Adapt 1 mm sideglow optic fibers to LED string
//
// Dr Tom Flint, 28 May 2023
//=================================================================================

use <../Parts/rounder.scad>

//-------------------------------------------------------------------------
// dense strip leds
module strip2(){

x0=6.92;    // spacing of leds along tape
y0=12;      // width of tape
z0=0.5;     // thickness of tape

    // tape
    translate([0,0,z0/2])
    cube([x0,y0,z0],center=true);
    
    // led
    translate([0,0,z0+1.44/2])
    cube([5,5,1.44],center=true);
    
    // solder bumps
    translate([0,3,z0+0.5])
    cube([1,1,1],center=true);
    translate([0,-3,z0+0.5])
    cube([1,1,1],center=true);
    translate([2,3,z0+0.5])
    cube([1,1,1],center=true);
    translate([2,-3,z0+0.5])
    cube([1,1,1],center=true);
    translate([-2,3,z0+0.5])
    cube([1,1,1],center=true);
    translate([-2,-3,z0+0.5])
    cube([1,1,1],center=true);
    
}

//-------------------------------------------------------------------------
// dense strip leds
module ledbox2(){

x0=6.92;    // spacing of leds along tape
y0=12;      // width of tape
z0=0.5;     // thickness of tape
tol=0.15;

  difference(){    
    union(){
      // box
      translate([0,0,3/2])
      cube([x0,y0+2,3],center=true);
      
      // extension above light
      translate([0,0,3])
      linear_extrude(height=8,scale=[1,0.4]) 
      square(size=[x0,14],center=true);
    }
    
    // tape
    translate([0,0,z0/2])
    cube([x0+tol,y0+tol,z0+tol],center=true);
    
    // led
    translate([0,0,z0+tol+1.44/2])
    cube([5+tol,5+tol,1.44+tol],center=true);
    
    // solder bumps
    translate([0,3,z0+0.5])
    cube([5+tol,1+tol,1+tol],center=true);
    translate([0,-3,z0+0.5])
    cube([5+tol,1+tol,1+tol],center=true);
    
    // cut for 4 fibers
    translate([1.2,0,1.5])
    linear_extrude(height=10,scale=1.2) 
    offset(r=1,$fn=22)
    square(size=[0.8,0.8],center=true);

  }
}

//-------------------------------------------------------------------------
// 4 fibers in shrink wrap
module bundle2(tol=0){

x0=6.92;    // spacing of leds along tape
y0=12;      // width of tape
z0=0.5;     // thickness of tape
    
    // fibers
    translate([1.2,0,1.5])
    linear_extrude(height=50,scale=1) 
    offset(r=1+tol,$fn=22)
    square(size=[0.8,0.8],center=true);

}

//-------------------------------------------------------------------------
// L brackets to secure the base
module ledback2(){

x0=6.92;    // spacing of leds along tape
y0=12;      // width of tape
z0=0.5;     // thickness of tape
tol=0.15;

  difference(){    
    translate([0,0,8/2-2])
    cube([x0,y0+6,8],center=true);
    
    union(){
      // box
      translate([0,0,3/2])
      cube([x0,y0+2+tol,3+tol],center=true);
      
      // extension above light
      translate([0,0,3])
      linear_extrude(height=8,scale=[1,0.4]) 
      square(size=[x0+tol,14+tol],center=true);
    }    
  }
  // attachment L
  difference(){
    translate([0,7+1,-7])
    cube([x0,2,10],center=true);
    translate([0,7+1/2,-8])
    rotate([90,0,0])
    cylinder(r=1.2,h=10,center=true,$fn=22);
  }
  
  translate([-x0/2,6+1,-2])
  rotate([0,90,0])
  rotate([0,0,-90])
  rounder(r=3,h=x0,f=44);
}

//-------------------------------------------------------------------------
// secure the fibers
module block2(){

x0=6.92;    // spacing of leds along tape
y0=12;      // width of tape
z0=0.5;     // thickness of tape
tol=0.15;
  
  // main block
  difference(){    
    translate([-x0/2,-5,13])
    cube([16.5*x0,14,16]);
    
    // fibers
    for(i=[0:15]){
      translate([i*6.92,0,0])
      bundle2(tol=0.3);
    }
  }  

  translate([3*x0,7,-4])
  cube([2*x0,2,20]);
  translate([3*x0,4,-4])
  cube([2*x0,4,4]);

  translate([10*x0,7,-4])
  cube([2*x0,2,20]);
  translate([10*x0,4,-4])
  cube([2*x0,4,4]);

}

//-------------------------------------------------------------------------
// secure the fibers
module blocka(){

x0=6.92;    // spacing of leds along tape
  difference(){
    block2();
    translate([-x0,0,0])
    cube([20*x0,20,40]);
  }
}

//-------------------------------------------------------------------------
// secure the fibers
module blockb(){

x0=6.92;    // spacing of leds along tape
  intersection(){
    block2();
    translate([-x0,-1,-20])
    cube([20*x0,20,60]);
  }
}

//=================================================================================

if(0){
difference(){
  union(){

      for(i=[0:4]){
        translate([i*6.92,0,0])
        strip2();
      }
      for(i=[0:3]){
        translate([i*6.92,0,0])
        ledbox2();
      }
    }
  translate([-50,0,0])
  cube([100,100,100],center=true);
}
}

// first ledbox has a cutout for solder and wires
if(0){
  difference(){
    ledbox2();
    translate([-3,0,1.25])
    cube([2,12,3],center=true);
  }
  // 15 additional boxes
  for(i=[1:15]){
    translate([i*6.92,0,0])
    ledbox2();
  }
}

// block to secure the fibers
if(0){
  block2();
}

// bundles of optic fiber
if(0){
  for(i=[0:15]){
    translate([i*6.92,0,0])
    bundle2();
  }
}

// clips to secure the block
if(0){
  for(i=[0:2]){
    translate([i*50,0,0])
    ledback2();
  }
}

//blocka();
blockb();


//=================================================================================

