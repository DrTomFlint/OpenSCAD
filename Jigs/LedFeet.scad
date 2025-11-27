//=================================================================================
// LedFeet.scad
//
// Feet for an LED strip light.
//
// Dr Tom Flint, 23 Nov 2025
//=================================================================================


F2=99;


//-----------------------------------------------------------------------------------
module LedFeet(){
  
wide=36;
thick=1.5;
gap=8;

hi=45;
ang=35;

  // staple attachment
  rotate([90,0,0])
  difference(){
    translate([0,-3,-0.5])
    difference(){
      translate([-(26-wide)/2,0,gap])
      cube([26,7*thick,10]);
      translate([-(24-wide)/2-4,4*thick,gap+thick+0.01])
      cube([24+4,7*thick,10-thick]);
      translate([(wide-10)/2,3*thick,gap+3.3])
      rotate([90,0,0])
      cylinder(r=2,h=10,center=true,$fn=33);
      translate([(wide-10)/2+10,3*thick,gap+3.3])
      rotate([90,0,0])
      cylinder(r=2,h=10,center=true,$fn=33);
    }
    translate([-2,-4*thick,gap-2])
    cube([34,4*thick,15]);
  }
    
  difference(){  
    translate([5,-8,0])
    cube([26,10,hi]); 

    // main topcut
    translate([5,-8,hi])
    rotate([0,ang,0])
    cube([45,20,hi]); 

    // cut for strip
    translate([5,-18,hi])
    rotate([0,ang,0])
    translate([12,5,-3])
    //~ #cube([13,26,hi]); 
    translate([13/2,26/2,0])
    linear_extrude(scale=[0.5,1],height=6)
    square([12.5,26],center=true);

    // cut extra tip off
    translate([5,-18,hi])
    rotate([0,ang,0])
    translate([-6,5,-12])
    cube([13,26,hi]); 
    
    //~ translate([3,0,21])
    //~ rotate([90,0,0])
    //~ #cylinder(r=12,h=30,center=true,$fn=F2);
    //~ translate([32,0,18])
    //~ rotate([90,0,0])
    //~ #cylinder(r=8,h=30,center=true,$fn=F2);
  }

  
}

//=================================================================================

LedFeet();

//=================================================================================
