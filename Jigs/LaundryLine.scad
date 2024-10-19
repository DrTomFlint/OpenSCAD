//======================================================================
// LaundryLine.scad
//
// End caps for Laundry Line
//
// DrTomFlint 21 June 2024
//
//======================================================================

use <../Parts/rounder.scad>

layer = 0.3;
thick = 2.5;

din = 49;
dout = 59;
taper1 = 1;
taper2 = 1;

long = 25;

F1=200;
F2=33;

//----------------------------------------------------------------------
module EndCap(){

difference(){
  cylinder(r1=din/2-taper1,r2=din/2+taper1,h=long,$fn=F1);
  
  translate([0,0,long-2])  
  #cylinder(r1=din/2+taper1-thick,r2=din/2-2*taper1-thick,h=2,$fn=F1);

  cylinder(r1=din/2-taper1-thick,r2=din/2+taper1-thick,h=long-2,$fn=F1);
  for(i=[0:2]){
    rotate([0,0,120*i+30])
    hull(){
      translate([0,0,long-5])
      rotate([0,90,0])
      cylinder(r=2,h=dout,$fn=F2);
      translate([0,0,-5])
      rotate([0,90,0])
      cylinder(r=2,h=dout,$fn=F2);
    }
  }
}
translate([0,0,long])
cylinder(r=dout/2+taper2,h=1.5,$fn=F1);

if(0){
  translate([0,0,long+1.5])
  difference(){
    cylinder(r1=dout/2+taper2,r2=dout/2-taper2,h=thick-1.5,$fn=F1);
    translate([0,10,thick-1.5-0.6])
    linear_extrude(height=0.6)
    text("Flint", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
    translate([0,-10,thick-1.5-0.6])
    linear_extrude(height=0.6)
    text("2024", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
  }
}


  for(i=[0:2]){
    rotate([0,0,120*i+0])
      translate([0,11,0.75*long])      
      cube([2,24,long/2],center=true);
  }
}

//======================================================================

EndCap();

//======================================================================
