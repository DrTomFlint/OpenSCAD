//======================================================================
// BatEar.scad
//
// Passive vocal monitor that clips onto your glasses
//
// DrTomFlint, 3 Jan 2025
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/hexcut.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>

// location of ear hole
x1=-30;
y1=10;
z1=-30;

// sidebar of the glasses
xside=80;
yside=1.5;
zside=3.2;

// cup dimensions
x2=20;
y2=0;
rin=2;
rout=25;
ycut=y1-5;

// riser dimensions
xrise=30;
zrise=20;
offrise=5.0;

thick=0.6;  
Version="v1";

F1=299;
F2=55;

//----------------------------------------------------------------------
module batear1(showGlass=0){

	if(showGlass==1){
		// glasses side bar
		cube([xside,yside,zside],center=true);
		// location of the ear hole
		translate([x1,y1,z1])
		rotate([90,0,0])
		cylinder(r=5,h=1,center=true);
	}

  // cup
  difference(){
    union(){
      // main cup
      hull(){
        translate([x1,y1-5,z1])
        sphere(r=rin,$fn=F1);

        translate([x2,y2,z1])
        rotate([0,90,0])
        cylinder(r=rout,h=0.1,center=true,$fn=F1);
      }
      // riser to glasses
      hull(){
        translate([offrise,-thick,-zrise/2])
        cube([xrise,2*thick+yside,zrise],center=true);
        translate([offrise,0,2*thick])
        rotate([0,90,0])
        cylinder(r=2*thick+yside/2,h=xrise,center=true,$fn=F1);
      }
      
    }
    // cut inner cup
    hull(){
      translate([x1+thick,y1-5,z1])
      sphere(r=rin-thick,$fn=F1);

      translate([x2+thick,y2,z1])
      rotate([0,90,0])
      cylinder(r=rout-1.5*thick,h=0.1,center=true,$fn=F1);
    }
    // cut off extra cup
    translate([0,100+ycut,0])
    cube([200,200,200],center=true);
    // cuts for riser
    hull(){
      translate([offrise,0.1,-zside-1])
      cube([xrise,yside+0.5,1],center=true);
      translate([offrise,0,2*thick])
      rotate([0,90,0])
      cylinder(r=yside/2+0.2,h=xrise+2,center=true,$fn=F1);
    }
    // cut for siderail insert
    translate([offrise,0.75,-zside])
    cube([xrise,yside+2,4],center=true);
    // cut for center spring
    translate([offrise,0.75,-zside+2])
    cube([xrise/3,yside+10,14],center=true);
  }
    
  // center spring
  translate([offrise,0.75-yside,-zside+0])
  rotate([-5,0,0])
  #cube([xrise/3-1,yside,12],center=true);
  translate([offrise,0.5-yside+1,-zside-4])
  cube([xrise/3-1,yside+1,4],center=true);

}

//----------------------------------------------------------------------
module batearR(showGlass=0){
  batear1(showGlass=showGlass);
  // text
  //~ translate([offrise/2,-yside,-3])
  //~ rotate([90,0,0])
  //~ linear_extrude(height=0.905)
  //~ text("BatEar", font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.0);
  translate([offrise/2-7,-yside,-10])
  rotate([90,0,0])
  linear_extrude(height=0.905)
  text(Version, font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.0);
}

//----------------------------------------------------------------------
module batearL(showGlass=0){
  mirror([1,0,0])
  batear1(showGlass=showGlass);
  
  // text
  //~ translate([-offrise/2,-yside,-3])
  //~ rotate([90,0,0])
  //~ linear_extrude(height=0.905)
  //~ text("BatEar", font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.0);
  translate([-offrise/2+7,-yside,-10])
  rotate([90,0,0])
  linear_extrude(height=0.905)
  text(Version, font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.0);
}

//======================================================================

//~ batear1(showGlass=1);
//~ batear1(showGlass=0);

batearR(showGlass=0);

//~ batearL(showGlass=0);

//======================================================================
