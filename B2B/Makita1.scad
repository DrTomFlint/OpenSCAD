//---------------------------------------------------------------------
// Makita1.scad
//
// Dock for a Makita 18v LXT battery pack
//
// DrTomFlint 30 Aug 2023
//---------------------------------------------------------------------

F1=44;
F2=6;

//---------------------------------------------------------------------
module makita1()
{
  difference(){
    // boss
    translate([0,0,25/2])
    cube([90,80,25],center=true);
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
    translate([38,0,9.25])
    rotate([90,0,0])
    cylinder(r=7,h=90,center=true,$fn=F1);
    translate([45,0,8.75])
    cube([15,90,15],center=true);    
    translate([37.5,0,0])
    rotate([0,90-68,0])
    cube([20,90,20],center=true);    
    // latching cut
    hull(){
      translate([37.5,0,5/2+15])
      cube([2.5,34,5],center=true);    
      translate([37.5-15,0,-5/2+15])
      cube([2.5,34,5],center=true);    
    }
    // front air vent cut
    translate([20,0,20])
    cube([15,20,20],center=true);    

    // cut for blades
    translate([-2,39/2,30/2+6])
    cube([30,1.2,30],center=true);    
    translate([-2,-39/2,30/2+6])
    cube([30,1.2,30],center=true);    
  }

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
        translate([18,39/2,12.5])
        cylinder(r=2,h=2.2,$fn=F2);
        translate([-20,39/2,12.5])
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
      translate([-21,0,18/2+6])
      cube([12,43.5,18],center=true);    
    }
    // cut for blades
    translate([-2,39/2,30/2+6])
    cube([30,1.2,30],center=true);    
    translate([-2,-39/2,30/2+6])
    cube([30,1.2,30],center=true);    
  }
    
  
  
}

//=====================================================================

makita1();

//=====================================================================
