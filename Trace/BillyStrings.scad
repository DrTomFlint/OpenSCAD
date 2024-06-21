//======================================================================
// BillyStrings.scad
//
// Adjusted size in slicer to 80%
//
// DrTomFlint 20 June 2024
//
//======================================================================

use <../Parts/rounder.scad>

layer = 0.3;
thick = 5*layer;
line = 0.8;

r1 = 10;      // center dot
r2 = 3;       // petal radius
s2 = 3;     // petal scale from circle
N = 17;       // number of petals
seed = 125;
delta = 0.7;

//~ s3 = rands(s2-delta,s2+delta,N,seed);


F1 = 100;  

//----------------------------------------------------------------------
module DaisyBlackPetal(sx=2.5){

  translate([0,r1+line*sx+r2*sx,0])
  scale([1,sx,1])
  difference(){
    cylinder(r=r2+line,h=thick,center=true,$fn=F1);
    cylinder(r=r2,h=thick+1,center=true,$fn=F1);
  }
  echo(sx);
  
}

//----------------------------------------------------------------------
module DaisyRedPetal(sx=2.5){

  translate([0,r1+line*sx+r2*sx,0])
  scale([1,sx,1])
  cylinder(r=r2,h=thick,center=true,$fn=F1);
  
  echo(sx);
  
}
//----------------------------------------------------------------------
module DaisyBlack(sd=125){
  
  // randoms from the given seed
  s3 = rands(s2-delta,s2+delta,N,sd);

  // center dot
  difference(){
    cylinder(r=r1+line,h=thick,center=true,$fn=F1);
    cylinder(r=r1,h=thick+1,center=true,$fn=F1);
  }
  
  // 33
  translate([0,0,-thick/2])
  linear_extrude(height=thick)
  text("33", font = "Open Sans:style=Bold", size=r1*0.8,halign="center",valign="center",spacing=1.2);
  
  // petals
  for(i=[0:N-1]){
    rotate([0,0,i*360/N])
    DaisyBlackPetal(sx=s3[i]);
  }
  
  // hanger loop
  translate ([0,1+r1+2*line*s3[0]+2*r2*s3[0],0])
  difference(){
    cylinder(r=2.5,h=thick,center=true,$fn=F1);
    cylinder(r=2-line,h=thick+1,center=true,$fn=F1);
  }
    
}

//----------------------------------------------------------------------
module DaisyRed(sd=125){
  
  // randoms from the given seed
  s3 = rands(s2-delta,s2+delta,N,sd);
  // petals
  for(i=[0:N-1]){
    rotate([0,0,i*360/N])
    DaisyRedPetal(sx=s3[i]);
  }
    
}
//----------------------------------------------------------------------
module DaisyYellow(){
  
  difference(){
    cylinder(r=r1,h=thick,center=true,$fn=F1);
    translate([0,0,-thick/2])
    linear_extrude(height=thick)
    text("33", font = "Open Sans:style=Bold", size=r1*0.8,halign="center",valign="center",spacing=1.2);
  }
    
}
//======================================================================

//~ color("gray")
//~ DaisyBlack();

//~ color("red")
//~ DaisyRed();

//~ color("yellow")
//~ DaisyYellow();

//~ DaisyBlackPetal();

// number to print
M=6;
// seeds for each
s4=[133,131,127,128,121,130];

// black
if(1){
  for(k=[0:2]){
    translate([70*k,0,0])
    color("gray")
    DaisyBlack(sd=s4[k]);
  }
  for(k=[0:2]){
    translate([70*k,-75,0])
    color("gray")
    DaisyBlack(sd=s4[k+3]);
  }
}

// red
if(0){
  for(k=[0:2]){
    translate([70*k,0,0])
    color("red")
    DaisyRed(sd=s4[k]);
  }
  for(k=[0:2]){
    translate([70*k,-75,0])
    color("red")
    DaisyRed(sd=s4[k+3]);
  }
}

// yellow
if(0){
  for(k=[0:2]){
    translate([70*k,0,0])
    color("yellow")
    DaisyYellow();
  }
  for(k=[0:2]){
    translate([70*k,-75,0])
    color("yellow")
    DaisyYellow();
  }
}



//======================================================================


