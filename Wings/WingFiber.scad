//=================================================================================
// WingFiber.scad
//
// Adapt 1 mm sideglow optic fibers to LED string
//
// Dr Tom Flint, 28 May 2023
//=================================================================================

use <LedStripLights5a.scad>
use <LedStripLights5b.scad>


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


//=================================================================================

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

if(1){
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

