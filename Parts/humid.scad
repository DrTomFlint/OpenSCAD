//=================================================================================
// humid.scad
//
// humidity and temp sensor box and mounts
//
// Dr Tom Flint, 27 Jan 2023
//
//=================================================================================

use <../Parts/rounder.scad>

//---------------------------------------------------------------------------------
module sensor(tol=0){

rotate([90,0,0]){
  
  // base box
  translate([0,0,-13.5/2])
  cube([44.65+tol,25.8+tol,13.5+tol],center=true);
  
  // bezel
  linear_extrude(height=2,scale=0.95)
  square([44.65+3+tol,25.8+3+tol],center=true);

  // tabs
  color("cyan")
  translate([44.65/2+0,0,-0.75*13.5+1])
  rotate([0,10,0])
  cube([2.4,5.6,13.5/2],center=true);
  
  // tabs
  color("cyan")
  translate([44.65/2+0,0,-0.25*13.5])
  rotate([0,-10,0])
  cube([2.4,5.6,13.5/2],center=true);

  // tabs
  color("green")
  translate([-44.65/2+0,0,-0.75*13.5+1])
  rotate([0,-10,0])
  cube([2.4,5.6,13.5/2],center=true);
  
  // tabs
  color("green")
  translate([-44.65/2+0,0,-0.25*13.5])
  rotate([0,10,0])
  cube([2.4,5.6,13.5/2],center=true);

}
}


//---------------------------------------------------------------------------------
module shelf(){

wide=54;

  // base box
  translate([0,-2.5,-15])
  cube([wide,5.5,2.1],center=true);

  // foot below
  difference(){
    translate([0,-5,-19+0.05])
    cube([wide,2.1,10],center=true);
    hull(){
      translate([-15,-5,-24])
      rotate([90,0,0])
      cylinder(r=7,h=10,center=true,$fn=88);
      translate([15,-5,-24])
      rotate([90,0,0])
      cylinder(r=7,h=10,center=true,$fn=88);
    }
  }

  // collar around sensor
  difference(){
    translate([0,4,-3])
    rotate([-20,0,0])
    cube([wide,2.1,28],center=true);

  translate([0,4,0.5])
  rotate([-20,0,0])
  sensor(tol=0.2);
}


}

//=================================================================================

if(1){
  color("cyan")
  translate([0,4,0.5])
  rotate([-20,0,0])
  sensor();
}

shelf();


//=================================================================================
