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
    cylinder(r=23/cos(30),h=65,center=true,$fn=6);
    
    // shaft entry
    translate([-41+1+8.5,0,0])
    rotate([0,90,0])
    cylinder(r=12,h=2.1,center=true,$fn=99);
    
    // shaft entry
    translate([41-0.9-8.5,0,0])
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
  cube([65,23/cos(30),2],center=true);
  
  // top connector
  translate([0,0,28])
  rotate([0,0,0])
  cylinder(r=4.8,h=17,$fn=99);
  
}

//-------------------------------------------------------------------------------
module torqueFoot(){

yoff=5.5; // for head clearance
yoff2=10.9;
yoff3=0;

  difference(){
    union(){
      // pillar
      color("red")
      translate([0,0,15.6/2+26])
      cube([65,25,15.6],center=true);
    
      // feet to extrusion
      color("cyan")
      difference(){
        translate([0,0,6/2+26+15.6-6])
        cube([65+28,50,6],center=true);
        translate([93/2,50/2,26])
        rotate([0,0,180])
        rounder(r=6,h=20,f=99);
        translate([-93/2,50/2,26])
        rotate([0,0,-90])
        rounder(r=6,h=20,f=99);
        translate([-93/2,-50/2,26])
        rotate([0,0,0])
        rounder(r=6,h=20,f=99);
        translate([93/2,-50/2,26])
        rotate([0,0,90])
        rounder(r=6,h=20,f=99);

        // M4x12 bolts to the AL extrusion base
        translate([39,15,30])
        cylinder(r=2,h=33,$fn=99,center=true);
        translate([39,-15,30])
        cylinder(r=2,h=33,$fn=99,center=true);
        translate([-39,15,30])
        cylinder(r=2,h=33,$fn=99,center=true);
        translate([-39,-15,30])
        cylinder(r=2,h=33,$fn=99,center=true);
      }
    }
    
    // bolt holes M4x12 to the sensor
    translate([35/2,0,26])
    cylinder(r=2,h=33,$fn=99,center=true);

    translate([35/2,0,26+6])
    cylinder(r=4,h=9.6,$fn=99);

    translate([-35/2,0,26])
    cylinder(r=2,h=33,$fn=99, center=true);

    translate([-35/2,0,26+6])
    cylinder(r=4,h=9.6,$fn=99);

    // material reduction cuts
    hull(){
      translate([20,25,26])
      cylinder(r=12.5,h=40,$fn=99,center=true);
      translate([-20,25,26])
      cylinder(r=12.5,h=40,$fn=99,center=true);
    }
    hull(){
      translate([20,-25,26])
      cylinder(r=12.5,h=40,$fn=99,center=true);
      translate([-20,-25,26])
      cylinder(r=12.5,h=40,$fn=99,center=true);
    }
    translate([-48,0,26])
    cylinder(r=10,h=40,$fn=99,center=true);
    translate([48,0,26])
    cylinder(r=10,h=40,$fn=99,center=true);
    translate([0,0,26])
    cylinder(r=8,h=40,$fn=99,center=true);

  }
  
}

//=================================================================================

//rotate([60,0,0])
//torqueMeter();

torqueFoot();


//=================================================================================
 
