//=================================================================================
// WingSwitch.scad
//
// Remote switch box for the Angel Wings
//
// Dr Tom Flint, 16 June 2023
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/switch3.scad>

x0 = 80;
y0 = 22;
z0 = 12;

dx = 30;
dz = 2;

r0 = 3;
thick = 2.4;    // wall thickness

//----------------------------------------------------------------------------------
module box1(switch=0){
  
  difference(){
    union(){
      minkowski(){
        cube([x0,y0,z0],center=true);
        sphere(r=r0,$fn=33);
      }
      translate([x0/2,0,-z0/2])
      scale([1.5,1,1])
      cylinder(r=10,h=thick,$fn=55);
      translate([-x0/2,0,-z0/2])
      scale([1.5,1,1])
      cylinder(r=10,h=thick,$fn=55);

      intersection(){
        translate([x0/2+thick,-10,-z0/2+thick])
        rotate([-90,0,0])
        rotate([0,0,-90])
        rounder(r=10,h=20,f=52);
        translate([x0/2,0,-z0/2])
        scale([1.5,1,1])
        cylinder(r=10,h=z0,$fn=55);
      }
      intersection(){
        translate([-x0/2-thick,-10,-z0/2+thick])
        rotate([-90,0,0])
        rotate([0,0,180])
        rounder(r=10,h=20,f=52);
        translate([-x0/2,0,-z0/2])
        scale([1.5,1,1])
        cylinder(r=10,h=z0,$fn=55);
      }
    }
    
    // main hollow
    translate([0,0,0])
    minkowski(){
      cube([x0,y0,z0],center=true);
      sphere(r=r0-thick,$fn=33);
    }
    
    // cut off bottom
    translate([0,0,-5-z0/2])
    cube([200,200,10],center=true);

    // holes in mounting tabs
    translate([x0/2+8,y0/5,-6])
    cylinder(r=1.7,h=2*z0,center=true,$fn=33);
    translate([x0/2+8,-y0/5,-6])
    cylinder(r=1.7,h=2*z0,center=true,$fn=33);

    translate([-x0/2-8,y0/5,-6])
    cylinder(r=1.7,h=2*z0,center=true,$fn=33);
    translate([-x0/2-8,-y0/5,-6])
    cylinder(r=1.7,h=2*z0,center=true,$fn=33);

    // cut for wiring
    //~ translate([0.175*x0,-y0/2,0])
    //~ rotate([-90,0,0])
    //~ cylinder(r=3,h=10,center=true,$fn=33);

    // cuts for switches
    translate([0,9,0])
    rotate([-90,0,0])
    cylinder(r=6.5/2,h=10,center=true,$fn=33);
    translate([dx,9,0])
    rotate([-90,0,0])
    cylinder(r=6.5/2,h=10,center=true,$fn=33);
    translate([-dx,9,0])
    rotate([-90,0,0])
    cylinder(r=6.5/2,h=10,center=true,$fn=33);

    // cuts for washer locks
    translate([-6,y0/2+thick,0])
    cube([1.2,2,2.2],center=true);    
    translate([dx-6,y0/2+thick,0])
    cube([1.2,3,2.2],center=true);    
    translate([-dx-6,y0/2+thick,0])
    cube([1.2,2,2.2],center=true);
    
    // 
    translate([0,0,z0/2+thick+0.3])
    rotate([0,0,0])
    rotate([0,0,180])
    linear_extrude(height=2,scale=1)
    text("FLINT   2023", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.2);

  }
  
  // add wall braces
  translate([0.25*x0-thick,0.5*y0+r0-thick,z0/2+thick])
  rotate([0,-90,0])
  rotate([0,0,180])
  bevel(x=z0+thick,y=0.7*y0,h=2*thick);
 
  translate([-0.16*x0,0.5*y0+r0-thick,z0/2+thick])
  rotate([0,-90,0])
  rotate([0,0,180])
  bevel(x=z0+thick,y=0.7*y0,h=2*thick);
  
  if(switch>0){
    translate([0,9,0])
    rotate([-90,0,0])
    rotate([0,0,90])
//    switch3(pos=0,nut=4.5,washer=3.5);
    switch3(pos=0,nut=0,washer=0);

    translate([dx,9,0])
    rotate([-90,0,0])
    rotate([0,0,90])
    switch3(pos=0,nut=4.5,washer=3.5);

    translate([-dx,9,0])
    rotate([-90,0,0])
    rotate([0,0,90])
    switch3(pos=0,nut=4.5,washer=3.5);

  }
}


//=================================================================================

// cutaway for designing
if(0){
  difference(){
    box1(switch=1);
    
    translate([-100,0,0])
    cube([200,200,60],center=true);
  }
}

// for printing
box1(switch=0);

//=================================================================================



  
