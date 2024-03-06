//=================================================================================
// RibbonJig.scad
// 
// Holder for a ribbon on the sewing machine for monogramming
//
// Dr Tom Flint, 17 Dec 2023
//=================================================================================


use <../Parts/rounder.scad>

thick = 3;

x0=87;      // length of the beam
y0=20;      // width of the beam

//~ y1=16;          // width of the ribbon
y1=24;          // width of the ribbon

//~ y2=50;      // width of the foot
y2=60;      // width of the foot
z2=15;      // height of foot
z3=6;       // height of the lip

//---------------------------------------------------------------------------------
module beam(){

  difference(){
    union(){
      translate([0,y0/2,thick/2])
      cube([x0,y0,thick],center=true);

      translate([x0/2-thick/2,y0/2,thick+z3/2])
      cube([thick,y0,z3],center=true);

      translate([-(x0/2-thick/2),y0/2,thick+z3/2])
      cube([thick,y0,z3],center=true);
    }
      
    translate([0,y0/2+0.25*y0,thick+z3/2])
    rotate([0,90,0])
    cylinder(r=1.7,h=x0+20,center=true,$fn=22);

    translate([0,y0/2-0.25*y0,thick+z3/2])
    rotate([0,90,0])
    cylinder(r=1.7,h=x0+20,center=true,$fn=22);

    // magnet cuts
    translate([(x0/2-thick/2-15),y0/2,1+1.01])
    cube([6.15,10.15,2.0],center=true);

    translate([-(x0/2-thick/2-15),y0/2,1+1.01])
    cube([6.15,10.15,2.0],center=true);

  }
    translate([0,y0/2,thick])
    linear_extrude(height=0.3,scale=1)
    #text("FLINT", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.2);

  
}
 
//---------------------------------------------------------------------------------
module foot(cut=1){

  difference(){
    // main foot
    translate([x0/2+thick/2,-5,-z2/2+thick+z3])
    cube([thick,y2,z2],center=true);

    // ribbon cut
    translate([x0/2+thick/2,-19,z2/2-2])
    cube([thick+2,y1,z2],center=true);

    if(cut==1){
      // extra clearance for back side
      translate([x0/2+thick/2,-10,z2/2])
      cube([thick+2,y1,z2],center=true);
    }
    
    // bolts
    translate([0,y0/2+0.25*y0,thick+z3/2])
    rotate([0,90,0])
    cylinder(r=1.7,h=x0+20,center=true,$fn=22);

    translate([0,y0/2-0.25*y0,thick+z3/2])
    rotate([0,90,0])
    cylinder(r=1.7,h=x0+20,center=true,$fn=22);

  }

}

//=================================================================================

beam();

//~ foot();

//~ translate([0,0,20])
//~ foot(cut=0);

//=================================================================================



 
  
