//=================================================================================
// torqueMeter.scad
//
// Interface T8 torque meter, 0.5 Nm, 10k rpm
//
// Dr Tom Flint, 11 Nov 2021
//=================================================================================


use <../Parts/rounder.scad>

//---------------------------------------------------------------------
module torqueMeter(){
  
  // main shaft
  rotate([0,90,0])
  cylinder(r=4.0,h=100,center=true,$fn=99);
 
  // main housing
  difference(){
    translate([0,0,4])
    rotate([0,90,0])
    rotate([0,0,30])
    cylinder(r=23/cos(30),h=82,center=true,$fn=6);
    
    // shaft entry
    translate([-41+1,0,0])
    rotate([0,90,0])
    cylinder(r=12,h=2.1,center=true,$fn=99);
    
    // shaft entry
    translate([41-0.9,0,0])
    rotate([0,90,0])
    cylinder(r=12,h=2.1,center=true,$fn=99);
    
    // bolt holes
    translate([35/2,23/cos(30)-13*cos(60),4+13*cos(30)])
    rotate([120,0,0])
    cylinder(r=2,h=2.1,$fn=99);

    translate([-35/2,23/cos(30)-13*cos(60),4+13*cos(30)])
    rotate([120,0,0])
    cylinder(r=2,h=2.1,$fn=99);
  }
  
  // top plate
  color("green")
  translate([0,0,28])
  cube([82,23/cos(30),2],center=true);
  
  // top connector
  translate([0,0,28])
  rotate([0,0,0])
  cylinder(r=4.8,h=17,$fn=99);
  
}

//=================================================================================


torqueMeter();


//=================================================================================
 
