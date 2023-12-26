//======================================================================
// hatchLamps.scad
//
// T connector to hold 2 LED emmitters and mount them on the hatchback
// of the Subaru.  Should be better to route a set of 8 wires using a 
// 10 conductor ribbon cable than routing 3 mm sideglow optic cables 
// across the hatch opening.
//
// DrTomFlint 16 November 2023
//======================================================================

use <../Parts/rounder.scad>

//----------------------------------------------------------------------
module Lamps(fiber=10,wires=5,tol=0){

$fn=99;

  translate([0,0,-9.5-tol])
  cylinder(r1=13.85/2+tol,r2=15.60/2+tol,h=9.5+tol);

  cylinder(r1=12.74/2+tol,r2=10.50/2+tol,h=12.5);

  translate([0,0,12.5])
  cylinder(r1=6.6/2+tol,r2=5.80/2+tol,h=2+tol);
  
  if(fiber>0){
    translate([0,0,12.5])    
    cylinder(r=1.6+tol,h=fiber);
  }
  if(wires>0){
    translate([7.5/2,1,-wires-9.5])    
    cylinder(r=0.9,h=wires);
    translate([7.5/2,-1,-wires-9.5])    
    cylinder(r=0.9,h=wires);
    translate([-7.5/2,1,-wires-9.5])    
    cylinder(r=0.9,h=wires);
    translate([-7.5/2,-1,-wires-9.5])    
    cylinder(r=0.9,h=wires);
  }
}

//----------------------------------------------------------------------
module hatchLamps(tab=0){

x1=18;

x2=36;
y2=23;
z2=10;

x3=12;
y3=15;

  difference(){
    // boss
    union(){
      hull(){
        translate([0,0,-z2+1])    
        cube([2*x1+x2,y2,1],center=true);
        
        translate([(2*x1+x2)/2-1,0,0.5])    
        rotate([0,90,0])
        rotate([0,0,30])
        cylinder(r=y2/2,h=1,$fn=6);

        translate([-(2*x1+x2)/2,0,0.5])    
        rotate([0,90,0])
        rotate([0,0,30])
        cylinder(r=y2/2,h=1,$fn=6);
      }
      // wire guard
      translate([0,10,-5+0.25])    
      cube([18,14,9.5],center=true);

      // wire guard
      translate([0,10,1])    
      cube([18,14,2],center=true);
    }
    
    // cuts for lamps
    translate([x1,0,0])    
    rotate([0,90,0])
    Lamps(tol=0.3);
    translate([-x1,0,0])    
    rotate([0,-90,0])
    Lamps(tol=0.3);
    
    // cut2 for wiring
    rotate([0,90,0])
    rotate([0,0,30])
    cylinder(r=7,h=x1+1,center=true,$fn=6);
    translate([0,8,-3])    
    cube([14,20,6.1],center=true);
    
    // bolt holes in the corners
    translate([(2*x1+x2)/2-3,8,0])    
    cylinder(r=1.7,h=30,center=true,$fn=33);
    translate([-(2*x1+x2)/2+3,8,0])    
    cylinder(r=1.7,h=30,center=true,$fn=33);

    translate([(2*x1+x2)/2-3,-8,0])    
    cylinder(r=1.7,h=30,center=true,$fn=33);
    translate([-(2*x1+x2)/2+3,-8,0])    
    cylinder(r=1.7,h=30,center=true,$fn=33);

    // round off corners
    translate([(2*x1+x2)/2,y2/2,-15])    
    rotate([0,0,180])
    rounder(r=3,h=30,f=99);
    translate([(2*x1+x2)/2,-y2/2,-15])    
    rotate([0,0,90])
    rounder(r=3,h=30,f=99);
    translate([-(2*x1+x2)/2,y2/2,-15])    
    rotate([0,0,-90])
    rounder(r=3,h=30,f=99);
    translate([-(2*x1+x2)/2,-y2/2,-15])    
    rotate([0,0,0])
    rounder(r=3,h=30,f=99);

    translate([0,0,9.8])
    linear_extrude(height=0.7,scale=1)
    text("- VINGILOT -", font = "Open Sans:style=Bold", size=6.5,halign="center",valign="center",spacing=1.2);

  }
  
  // base tabs
  if(tab==1){
    translate([(2*x1+x2)/2,0,-z2])    
    cube([x3,y2+y3,1],center=true);
    translate([-(2*x1+x2)/2,0,-z2])    
    cube([x3,y2+y3,1],center=true);
  }
  
}

//----------------------------------------------------------------------
module top(){
  difference(){
    hatchLamps();
    translate([0,0,-50])    
    cube([100,100,100],center=true);
  }  
}

//----------------------------------------------------------------------
module bot(){
  intersection(){
    hatchLamps();
    translate([0,0,-50])    
    cube([100,100,100],center=true);
  }  
}

//======================================================================

//Lamps();

//~ top();
//~ bot();

// cutaway view
if(1){
  //~ difference(){
    union(){
      translate([0,35,0])    
      rotate([180,0,0])
      top();

      bot();
    //~ }
    //~ translate([-66,0,0])    
    //~ cube([100,100,100],center=true);
  }
}
  
//======================================================================
