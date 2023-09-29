//---------------------------------------------------------------------
// Makita1.scad
//
// Dock for a Makita 18v LXT battery pack
//
// @TODO figure out how to retain the 1mm copper contacts
// Is a tight fit good enough?
//
// DrTomFlint 30 Aug 2023
//---------------------------------------------------------------------

use <../Parts/rounder.scad>

F1=44;
F2=6;
thick=2.1;
z0=22;
tab=1;

//---------------------------------------------------------------------
module makita1(tab=1,side=0)
{
  difference(){
    union(){
      // boss
      translate([-1.5,0,z0/2])
      cube([87,78,z0],center=true);
      // mate on sides
      translate([-1.5,78/2-2.5,24])
      cube([87,5,6],center=true);
      translate([-1.5,-78/2+2.5,24])
      cube([87,5,6],center=true);
      // top rail needs support
      hull(){
        translate([87/2-1.5-2.5,0,24])
        cube([5,78,6],center=true);
        translate([87/2-1.5-2.5-6,0,24-3])
        cube([5,78,3],center=true);
      }
      if(tab==1){
        // add a lip
        translate([-1.5,78/2-3.75,28])
        cube([63,2.5,2],center=true);
        translate([-1.5,-(78/2-3.75),28])
        cube([63,2.5,2],center=true);
        translate([87/2-5.25,0,28])
        cube([2.5,64,2],center=true);
      }
    }

    if(tab==2){
      // subtract a lip
      translate([-1.5,78/2-3.75,28-2])
      cube([73,3,2.5],center=true);
      translate([-1.5,-(78/2-3.75),28-2])
      cube([73,3,2.5],center=true);
      translate([87/2-5.25,0,28-2])
      cube([3,65,2.5],center=true);
    }
    
    // upper cut  
    translate([13,0,9/2+6])
    cube([76,63.7,9],center=true);
    
    // lower cut
    translate([3,0,6/2+0])
    cube([90,54.2,6.1],center=true);
    
    // back air vent cut
    translate([-45,0,6/2+0])
    cube([10,27,6.1],center=true);    

    // wiring pass-through
    translate([-45,0,6/2+22])
    cube([24,90,6.1],center=true);    
    
    // front cuts
    translate([37,0,9.25])
    rotate([90,0,0])
    cylinder(r=7,h=90,center=true,$fn=F1);
    translate([44,0,8.75])
    cube([15,90,15],center=true);    
    translate([36.2,0,0])
    rotate([0,24,0])
    cube([20,90,20],center=true);  
      
    // trim rails
    translate([24,0,9/2])
    cube([10,63.7,10],center=true);

    // latching cut
    hull(){
      translate([38.0,0,5/2+15])
      cube([2.5,34,5],center=true);    
      translate([38.0-8,0,-5/2+15])
      cube([2.5,34,5],center=true);    
    }
    // front air vent cut
    translate([22,0,17])
    cube([10,20,6],center=true);    
    translate([22,0,18.5])
    scale([3,1,1])
    rotate([90,0,0])
    cylinder(r=2.5,h=90,center=true,$fn=F1);

    // cut for blades
    translate([-4.5,39/2,30/2+6])
    cube([35,1.2,30],center=true);    
    translate([-4.5,-39/2,30/2+6])
    cube([35,1.2,30],center=true);    
    // sense blade
    translate([-2-9,-39/2+7,30/2+6])
    cube([22,1.2,30],center=true);    
    
    // side rounders
    if(side==1){
      translate([-50,78/2,0])
      rotate([0,90,0])
      rotate([0,0,180])
      rounder(r=5,h=100,f=F1);
    }
    if(side==2){
      translate([-50,-78/2,0])
      rotate([0,90,0])
      rotate([0,0,90])
      rounder(r=5,h=100,f=F1);
    }
    
    // front rounders
    translate([42,78/2,0])
    rotate([0,0,180])
    rounder(r=8,h=30,f=F1);
    translate([42,-78/2,0])
    rotate([0,0,90])
    rounder(r=8,h=30,f=F1);
    
    // back rounders
    //~ translate([-45,78/2,0])
    //~ rotate([0,0,-90])
    //~ rounder(r=8,h=30,f=F1);
    //~ translate([-45,-78/2,0])
    //~ rotate([0,0,0])
    //~ rounder(r=8,h=30,f=F1);
    
    // labels
    if(tab==2){
      translate([41,0,22.5])
      rotate([0,90,0])
      rotate([0,0,-90])
      linear_extrude(height=1.2,scale=1)
      text("AeroAmp", font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.2);
    }
    if(tab==1){
      translate([41,0,22.5])
      rotate([0,90,0])
      rotate([0,0,90])
      linear_extrude(height=1.2,scale=1)
      text("v3.0", font = "Open Sans:style=Bold", size=4,halign="center",valign="center",spacing=1.2);
    }
    
    // cut for the +/- signs
    translate([-6,-26,z0-0.6])
    cylinder(r=5,h=1.2,$fn=22)  ;
    translate([-6,26,z0-0.6])
    cylinder(r=5,h=1.2,$fn=22)  ;
  }

  // polarity
  translate([0.5-6,26,z0-0.6])
  rotate([0,0,90])
  linear_extrude(height=0.6,scale=1)
  text("+", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.0);
  
  translate([1.75-6,-26,z0-0.6])
  rotate([0,0,90])
  linear_extrude(height=0.6,scale=1)
  text("-", font = "Open Sans:style=Bold", size=12,halign="center",valign="center",spacing=1.0);

  difference(){
    union(){
      // blade bases
      hull(){
        translate([14,39/2,15-2.2])
        cylinder(r=2,h=2.2,$fn=F2);
        translate([-20,39/2,15-2.2])
        cylinder(r=2,h=2.2,$fn=F2);
      }
      // blade bases
      hull(){
        translate([14,-39/2,15-2.2])
        cylinder(r=2,h=2.2,$fn=F2);
        translate([-20,-39/2,15-2.2])
        cylinder(r=2,h=2.2,$fn=F2);
      }
      // blades back block
      translate([-21,0,15/2+6])
      cube([12,43.5,15],center=true);    
    }
    // cut for blades
    blades(tol=0.2);
  }
    
  if(tab==1){
    difference(){
      union(){
        hull(){
          translate([-15.5,39/2-2,10+22])
          cube([14,3,1],center=true);
          translate([-15.5-4,39/2-2,10+11.5])
          cube([22,3,1],center=true);
        }
        hull(){
          translate([-15.5,-39/2+2,10+22])
          cube([14,3,1],center=true);
          translate([-15.5-4,-39/2+2,10+11.5])
          cube([22,3,1],center=true);
        }
        hull(){
          translate([-4.5,-39/2+7-2,10+22])
          cube([10,3,1],center=true);
          translate([-4.5-3,-39/2+7-2,10+11.5])
          cube([16,3,1],center=true);
        }
      }

      translate([-15.5,39/2,10+17])
      rotate([90,0,0])
      cylinder(r=1.7,h=13,center=true, $fn=22);
      translate([-15.5,-39/2,10+17])
      rotate([90,0,0])
      cylinder(r=1.7,h=13,center=true, $fn=22);
      translate([-4.5,-39/2+7,10+17])
      rotate([90,0,0])
      cylinder(r=1.7,h=13,center=true, $fn=22);
    }    
    
  }
  
  if(tab==2){
    difference(){
      union(){
        hull(){
          translate([6,39/2-2,10+22])
          cube([14,3,1],center=true);
          translate([6-4,39/2-2,10+11.5])
          cube([22,3,1],center=true);
        }
        hull(){
          translate([6,-39/2+2,10+22])
          cube([14,3,1],center=true);
          translate([6-4,-39/2+2,10+11.5])
          cube([22,3,1],center=true);
        }
        hull(){
          translate([-15.5,-39/2+7-2,10+22])
          cube([14,3,1],center=true);
          translate([-15.5-4,-39/2+7-2,10+11.5])
          cube([22,3,1],center=true);
        }
      }

      translate([6,39/2,10+17])
      rotate([90,0,0])
      cylinder(r=1.7,h=13,center=true, $fn=22);
      translate([6,-39/2,10+17])
      rotate([90,0,0])
      cylinder(r=1.7,h=13,center=true, $fn=22);
      translate([-15.5,-39/2+7,10+17])
      rotate([90,0,0])
      cylinder(r=1.7,h=13,center=true, $fn=22);
    }    
  }
  
}
//----------------------------------------------------------------------
module blades(tol=0.0,tab=1,wires=1){

difference(){
  union(){
    //  power blades
    translate([-4.5,39/2,26/2+6-0.1])
    cube([35+tol,1+tol,26],center=true);    
    translate([-4.5,-39/2,26/2+6-0.1])
    cube([35+tol,1.2,26],center=true);    
    // sense blade
    translate([-2-9,-39/2+7,26/2+6-0.1])
    cube([22+tol,1+tol,26],center=true);    
  }
  if(tab==1){
    translate([6,39/2,10+22])
    cube([30,6,20],center=true);    
    translate([6,-39/2,10+22])
    cube([30,6,20],center=true);    
    translate([-24,-39/2+7,10+22])
    cube([30,6,20],center=true);    
    translate([-15.5,0,10+17])
    rotate([90,0,0])
    cylinder(r=1.7,h=60,center=true, $fn=22);
    translate([-4.5,0,10+17])
    rotate([90,0,0])
    cylinder(r=1.7,h=60,center=true, $fn=22);
  }
  if(tab==2){
    translate([-15,39/2,10+22])
    cube([30,6,20],center=true);    
    translate([-15,-39/2,10+22])
    cube([30,6,20],center=true);    
    translate([5,-39/2+7,10+22])
    cube([30,6,20],center=true);    
    translate([6,0,10+17])
    rotate([90,0,0])
    cylinder(r=1.7,h=60,center=true, $fn=22);
    translate([-15.5,0,10+17])
    rotate([90,0,0])
    cylinder(r=1.7,h=60,center=true, $fn=22);
  }
}

if(wires==1){
  if(tab==1){
    translate([-30,39/2+2+2.5/2,10+18])
    rotate([0,90,0])
    cylinder(r=2.5,h=40,center=true, $fn=22);
    translate([-30,-39/2-2-2.5/2,10+18])
    rotate([0,90,0])
    cylinder(r=2.5,h=40,center=true, $fn=22);
    translate([-30+5,-39/2+2+2.5/2+7,10+18])
    rotate([0,90,0])
    cylinder(r=2.5,h=50,center=true, $fn=22);
  }
  if(tab==2){
    translate([20,39/2+2+2.5/2,10+18])
    rotate([0,90,0])
    cylinder(r=2.5,h=40,center=true, $fn=22);
    translate([20,-39/2-2-2.5/2,10+18])
    rotate([0,90,0])
    cylinder(r=2.5,h=40,center=true, $fn=22);
    translate([8,-39/2+2+2.5/2+7,10+18])
    rotate([0,90,0])
    cylinder(r=2.5,h=64,center=true, $fn=22);
  }
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

//dz=32.5;
dz=27.0+0.1;

show2=1;
wires=0;
  
translate([0,0,-dz])
makita1(tab=1);

if(show2==1){
  color("cyan")
  translate([0,0,dz])
  rotate([180,0,0])
  makita1(tab=2);
}

if(1){
  translate([0,0,-dz])
  blades(tab=1,wires=wires);
  if(show2==1){
    color("cyan")
    translate([0,0,dz])
    rotate([180,0,0])
    blades(tab=2,wires=wires);
  }
}

//=====================================================================
