//=================================================================================
// radiusProbe.scad
//
// Set of wrench-shape probes with various radius labelled
//
// Dr Tom Flint, 22 Oct 2021
//=================================================================================

use <../Parts/rounder.scad>

thick = 2.1;    // thickness of the handle bar
//length = 12;

//---------------------------------------------------------------------------------
module probe1(rad=3){

length = rad*5;

  // inner radius
  difference(){
    union(){
      cylinder(r=rad,h=thick,$fn=89,center=true);
      // handle bar
      color("red")
      translate([length*0.4,0,0])
      cube([length*0.75,rad*1.5,thick],center=true);
    }
    cylinder(r=rad*0.5,h=thick+2,$fn=89,center=true);

  // add size number
  color("green")
  translate([length*0.4,0,thick/2-0.3])
  rotate([0,0,90])
  linear_extrude(height=0.4,scale=1)
  text(str(rad), font = "Open Sans:style=Bold", size=rad,halign="center",valign="center",spacing=1.1);
  }
  
  // outer
  translate([length,0,0])
  difference(){
    translate([-rad/2,0,0])
    cylinder(r=rad*1.2,h=thick,$fn=89,center=true);
    rotate([0,0,-45])
    difference(){    
      cube([2*rad,2*rad,thick+2],center=true);
      translate([-rad,-rad,0])
      rounder(r=rad,h=thick+2,f=89);
    }
  }
  


}


//=================================================================================



for (i=[2:9]){
  translate([0,1.8*i*i,0])
  probe1(rad=i);
}

//=================================================================================
