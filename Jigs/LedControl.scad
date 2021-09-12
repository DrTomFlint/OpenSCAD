//=================================================================================
// LedControl.scad
// Surround for the LED string controller on the porch
//
// Dr Tom Flint, 13 June 2021
//=================================================================================


use <../Parts/rounder.scad>

t1=0.15;  // tolerance between box and controller
t2=3.2;   // thickness box walls

//---------------------------------------------------------------------------------
module LedControl(){

difference(){
  
  union(){
  // main box
  cube([84.6+t2,51.7+t2,6.7+t2],center=true);

  // corner reinforces
  translate([87/2,53/2,0])
  cylinder(r=3,h=6.7+t2,$fn=89,center=true);
  translate([87/2,-53/2,0])
  cylinder(r=3,h=6.7+t2,$fn=89,center=true);
  translate([-87/2,53/2,0])
  cylinder(r=3,h=6.7+t2,$fn=89,center=true);
  translate([-87/2,-53/2,0])
  cylinder(r=3,h=6.7+t2,$fn=89,center=true);
  }
  // cut for the controller
  cube([84.6+t1,51.7+t1,6.7+t1],center=true);
 
  // cut for front buttons
  translate([0,0,0])
  cube([84.6-22,51.7-8,10],center=true);  

  // cut for battery access
  translate([-46,0,-2])
  scale([0.6,1,1])
  cylinder(r=15,h=10,center=true,$fn=89);
   
  // corner holes
  translate([87/2,53/2,0])
  cylinder(r=1,h=6.7+t2+2,$fn=89,center=true);
  translate([87/2,-53/2,0])
  cylinder(r=1,h=6.7+t2+2,$fn=89,center=true);
  translate([-87/2,53/2,0])
  cylinder(r=1,h=6.7+t2+2,$fn=89,center=true);
  translate([-87/2,-53/2,0])
  cylinder(r=1,h=6.7+t2+2,$fn=89,center=true);

  // cut for emitter lamp
  translate([41,0,0])
  rotate([0,90,0])
  cylinder(r1=3,r2=5,h=4,$fn=45);
}




if(0){
  color("red")
  translate([-36,18,4.5])
  rotate([0,0,-90])
  linear_extrude(height=1,scale=1)
  text("*", font = "Open Sans:style=Bold", size=5.5,halign="center",valign="center",spacing=1.1);
}

}
  
//=================================================================================

t3=0.25;

if(1){
difference(){
  LedControl();

  union(){
    translate([0,0,-10])
    cube([200,200,20],center=true);
    translate([0,0,-0.3])
    cube([84.6+t2/2+t3,51.7+t2/2+t3,2+t3],center=true);
  }

}
}

if(0){
intersection(){
  LedControl();

  union(){
    translate([0,0,-10])
    cube([200,200,20],center=true);
    translate([0,0,-0.3])
    cube([84.6+t2/2,51.7+t2/2,2],center=true);
  }

}
}


//=================================================================================
 
