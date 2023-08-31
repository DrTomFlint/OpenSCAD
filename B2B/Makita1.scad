//---------------------------------------------------------------------
// Makita1.scad
//
// Dock for a Makita 18v LXT battery pack
//
// DrTomFlint 30 Aug 2023
//---------------------------------------------------------------------

use <../Parts/rounder.scad>

F1=44;
F2=6;
thick=2.1;
z0=22;

//---------------------------------------------------------------------
module makita1()
{
  difference(){
    // boss
    translate([-1.5,0,z0/2])
    cube([87,63.7+2*thick,z0],center=true);
    // upper cut  
    translate([13,0,9/2+6])
    cube([76,63.7,9],center=true);
    // lower cut
    translate([3,0,6/2+0])
    cube([90,54.2,6.1],center=true);
    // back air vent cut
    translate([-1,0,6/2+0])
    cube([90,27,6.1],center=true);    
    // front cuts
    translate([35,0,9.25])
    rotate([90,0,0])
    cylinder(r=7,h=90,center=true,$fn=F1);
    translate([42,0,8.75])
    cube([15,90,15],center=true);    
    translate([34.5,0,0])
    rotate([0,90-68,0])
    cube([20,90,20],center=true);    
    // latching cut
    hull(){
      translate([34.5,0,5/2+15])
      cube([2.5,34,5],center=true);    
      translate([34.5-15,0,-5/2+15])
      cube([2.5,34,5],center=true);    
    }
    // front air vent cut
    translate([25,0,20])
    cube([15,20,20],center=true);    

    // cut for blades
    translate([-2,39/2,30/2+6])
    cube([30,1.2,30],center=true);    
    translate([-2,-39/2,30/2+6])
    cube([30,1.2,30],center=true);    
    
    // side rounders
    translate([-50,(63.7+2*thick)/2,0])
    rotate([0,90,0])
    rotate([0,0,180])
    rounder(r=5,h=100,f=F1);
    translate([-50,-(63.7+2*thick)/2,0])
    rotate([0,90,0])
    rotate([0,0,90])
    rounder(r=5,h=100,f=F1);

    // front rounders
    translate([42,(63.7+2*thick)/2,0])
    rotate([0,0,180])
    rounder(r=8,h=30,f=F1);
    translate([42,-(63.7+2*thick)/2,0])
    rotate([0,0,90])
    rounder(r=8,h=30,f=F1);
    
    // labels
    translate([-30,0,z0-0.6])
    rotate([0,0,90])
    linear_extrude(height=1.2,scale=1)
    text("AeroAmp", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
    translate([-20,0,z0-0.6])
    rotate([0,0,90])
    linear_extrude(height=1.2,scale=1)
    text("V2.0", font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.1);
    
    // cut for the +/- signs
    translate([0,-12,z0-0.6])
    cylinder(r=5,h=1.2,$fn=22)  ;
    translate([0,12,z0-0.6])
    cylinder(r=5,h=1.2,$fn=22)  ;
  }

  // polarity
  translate([0.5,12,z0-0.6])
  rotate([0,0,90])
  linear_extrude(height=0.6,scale=1)
  text("+", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.0);
  
  translate([1.75,-12,z0-0.6])
  rotate([0,0,90])
  linear_extrude(height=0.6,scale=1)
  text("-", font = "Open Sans:style=Bold", size=12,halign="center",valign="center",spacing=1.0);

if(0){  
  // blades
  translate([-2,39/2,30/2+6])
  cube([30,1,30],center=true);    
  translate([-2,-39/2,30/2+6])
  cube([30,1,30],center=true);    
}
  difference(){
    union(){
      // blade bases
      hull(){
        translate([18,39/2,15-2.2])
        cylinder(r=2,h=2.2,$fn=F2);
        translate([-20,39/2,15-2.2])
        cylinder(r=2,h=2.2,$fn=F2);
      }
      // blade bases
      hull(){
        translate([18,-39/2,15-2.2])
        cylinder(r=2,h=2.2,$fn=F2);
        translate([-20,-39/2,15-2.2])
        cylinder(r=2,h=2.2,$fn=F2);
      }
      // blades back block
      translate([-21,0,15/2+6])
      cube([12,43.5,15],center=true);    
    }
    // cut for blades
    translate([-2,39/2,30/2+6])
    cube([30,1.2,30],center=true);    
    translate([-2,-39/2,30/2+6])
    cube([30,1.2,30],center=true);    
  }
    
  
  
}

//=====================================================================
if(0){
  difference(){
    makita1();
    translate([0,-50,0])
    cube([100,100,100],center=true);    
  }
}
  
makita1();

//=====================================================================
