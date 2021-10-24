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
  translate([length*1.2,0,0])
  difference(){
    translate([-rad,0,0])
    cylinder(r=rad*1.5,h=thick,$fn=89,center=true);
    rotate([0,0,-45])
    difference(){    
      cube([3*rad,3*rad,thick+2],center=true);
      translate([-1.5*rad,-1.5*rad,-thick])
      rounder(r=rad,h=thick+2,f=89);
    }
  }
  


}


//---------------------------------------------------------------------------------
module probe2(rad=3){

length = 30;

  // outer
  
  translate([rad,0,0])
  difference(){
    hull(){
      translate([-rad,0,0])
      cylinder(r=rad*1.5,h=thick,$fn=89,center=true);
      translate([-35,0,0])
      cube([10,6,thick],center=true);
    }

    rotate([0,0,-45])
    difference(){    
      cube([3*rad,3*rad,thick+2],center=true);
      translate([-1.5*rad,-1.5*rad,-thick])
      rounder(r=rad,h=thick+2,f=89);
    }

    // add size number
    color("green")
    translate([-20-rad/2,0,thick/2-0.3])
    rotate([0,0,-90])
    linear_extrude(height=0.4,scale=1)
    text(str(rad), font = "Open Sans:style=Bold", size=4,halign="center",valign="center",spacing=1.1);
  }
  
  // handles
  difference(){
    union(){
      translate([-length,0,0])
      cube([length,6,thick],center=true);

      translate([-1.5*length,0,0])
      cylinder(r=4,h=thick,$fn=89,center=true);
    }
    
    translate([-1.5*length,0,0])
    cylinder(r=2,h=thick+2,$fn=89,center=true);

    // add size number
    color("green")
    translate([-20-rad/2+rad,0,thick/2-0.3])
    rotate([0,0,-90])
    linear_extrude(height=0.4,scale=1)
    text(str(rad), font = "Open Sans:style=Bold", size=4,halign="center",valign="center",spacing=1.1);
  }
}

//---------------------------------------------------------------------------------
module probe3(rad=3){

length = 20;

  // inner  
  difference(){
    hull(){
      translate([0,0,0])
      cylinder(r=rad,h=thick,$fn=89,center=true);
      translate([-10,0,0])
      cube([10,6,thick],center=true);
    }
    // add size number
    color("green")
    translate([-8,0,thick/2-0.3])
    rotate([0,0,-90])
    linear_extrude(height=0.4,scale=1)
    text(str(rad), font = "Open Sans:style=Bold", size=4,halign="center",valign="center",spacing=1.1);

    cylinder(r=rad/2-1,h=thick+2,$fn=89,center=true);
  }
  
  // handles
  difference(){
    union(){
      translate([-length,0,0])
      cube([length,6,thick],center=true);

      translate([-1.5*length,0,0])
      cylinder(r=4,h=thick,$fn=89,center=true);
    }
    translate([-1.5*length,0,0])
    cylinder(r=2,h=thick+2,$fn=89,center=true);

  }
}

//=================================================================================

/*

for (i=[1:7]){

  translate([0,1.8*i*i+4*i,0])
  probe2(rad=i);

  translate([40,1.8*i*i+4*i,0])
  probe3(rad=i);

}


translate([0,0,-thick/2]){
// add some connectors to help adhesion
color("red")
translate([-40,0,0])
cube([0.8,118,0.3]);

color("red")
translate([-8,0,0])
cube([0.8,118,0.3]);

color("red")
translate([15,0,0])
cube([0.8,118,0.3]);

color("red")
translate([35,0,0])
cube([0.8,118,0.3]);

}




translate([110,-140,0])
for (i=[8:12]){

  translate([0,1.8*i*i+4*i,0])
  probe2(rad=i);

  translate([40,1.8*i*i+4*i,0])
  probe3(rad=i);

}
translate([0,0,-thick/2]){
color("red")
translate([70,0,0])
cube([0.8,170,0.3]);

color("red")
translate([100,0,0])
cube([0.8,170,0.3]);

color("red")
translate([125,0,0])
cube([0.8,170,0.3]);

}

*/

probe3(rad=1);
translate([0,20,0])
probe3(rad=2);
translate([15,50,0])
probe2(rad=6);

color("red")
translate([-10,0,-thick/2])
cube([0.8,60,0.3]);

color("red")
translate([-25,0,-thick/2])
cube([0.8,60,0.3]);




//=================================================================================
