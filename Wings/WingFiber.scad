//=================================================================================
// WingFiber.scad
//
// Adapt 1 mm sideglow optic fibers to LED string
//
// Dr Tom Flint, 28 May 2023
//=================================================================================

use <LedStripLights5a.scad>
use <LedStripLights5b.scad>
use <../Parts/rounder.scad>


//----------------------------------------------------------------------------------
module seven(){
  
  difference(){
    union(){
      linear_extrude(height=2.4)
      offset(r=1,$fn=22)
      square([5,5],center=true);
      
      intersection(){
        translate([-3.8,0,0.4-0.5])
        cube([1,8,5],center=true);

        tol=0.2;
        rotate([0,-90,0])
        translate([-1.65/2+1.25,0,+1.5+0.2])
        linear_extrude(height=8,scale=1.8) 
        square(size=[1.65+2+tol*2,5+tol*2],center=true);
      }
    }
    
    translate([0,1,-0.2])
    cylinder(r1=3.7/2,r2=3.8/2,h=3,$fn=22);
    translate([0,1,1.5])
    cylinder(r1=3.7/2,r2=4.2/2,h=1,$fn=22);

  }
}

//----------------------------------------------------------------------------------
module four(){
  
  difference(){
    union(){
      linear_extrude(height=2.4)
      offset(r=1,$fn=22)
      square([5,5],center=true);
      
      intersection(){
        translate([-3.8,0,0.4-0.5])
        cube([1,8,5],center=true);

        tol=0.2;
        rotate([0,-90,0])
        translate([-1.65/2+1.25,0,+1.5+0.2])
        linear_extrude(height=8,scale=1.8) 
        square(size=[1.65+2+tol*2,5+tol*2],center=true);
      }
    }
        
    translate([-0.5,1,0])
    linear_extrude(height=2.6,scale=1.2) 
    offset(r=1,$fn=22)
    square(size=[0.8,0.8],center=true);

  }
}


//---------------------------------------------------------------------------------
module ledbox(){
Rx3();
difference(){
  translate([4,0,-3])
  cube([4,10,10],center=true);

  translate([2.5,0,0])
  rotate([0,90,0])
  linear_extrude(height=2.6)
  offset(r=1.2,$fn=22)
  square([5,5],center=true);
    
  translate([5,0,0])
  cube([9,6,6],center=true);
  
  
}
}
//---------------------------------------------------------------------------------
module ledboxB(){
Rx3();
difference(){
  translate([4,0.5,-3])
  cube([6,11,10],center=true);

  translate([2.5-1,0.5,0])
  rotate([0,90,0])
  linear_extrude(height=4.6)
  offset(r=1.2,$fn=22)
  square([5,6],center=true);
    
  translate([5,0,0])
  cube([9,6,6],center=true);
  
  translate([7,0.5,0])
  cube([3,6,6],center=true);
  
  
}
}
//----------------------------------------------------------------------------------
module fourB(){
  
  difference(){
    union(){
      translate([0,0.5,0])
      linear_extrude(height=3.4)
      offset(r=1,$fn=22)
      square([5,6],center=true);
      
      intersection(){
        translate([-3.8,0,0.4+0.25])
        cube([1,8,5.5],center=true);

        tol=0.2;
        rotate([0,-90,0])
        translate([-1.65/2+1.25,0,+1.5+0.2])
        linear_extrude(height=8,scale=1.8) 
        square(size=[1.65+3+tol*2,5+tol*2],center=true);
      }
    }
        
    translate([-0.5,1.5,0])
    linear_extrude(height=3.6,scale=1.2) 
    offset(r=1,$fn=22)
    square(size=[0.8,0.8],center=true);

  }
}

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
// dense strip leds
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

if(0){
  difference(){
    ledbox2();
    translate([-3,0,1.25])
    cube([2,12,3],center=true);
  }
  for(i=[1:15]){
    translate([i*6.92,0,0])
    ledbox2();
  }
}

  for(i=[0:0]){
    translate([4*i*6.92,0,0])
    ledback2();
  }

if(0){
  translate([2.5,0,0])
  rotate([0,90,0])
  seven();
}

translate([0,0,-15]){
if(0){
  translate([2.5,0,0])
  rotate([0,90,0])
  four();
}

if(0){
  ledbox();
  translate([0,16.7,0])
  ledbox();
}  
}

if(0){
  translate([2.5,0,0])
  rotate([0,90,0])
  fourB();
}

if(0){
  ledboxB();
  translate([0,16.7,0])
  ledboxB();
}  

if(0){
  for(i=[0:8]){
    rotate([0,0,i*22.5])
    translate([42,0,0])
    ledbox();
  }
  for(i=[0:7]){
    rotate([0,0,i*22.5+22.5/2])
    translate([44.2,0,-0.5])
    cube([2,2,15],center=true);
  }
}  



//=================================================================================

