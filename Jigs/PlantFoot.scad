//=================================================================================
// PlantFoot.scad
//
// Brace for left side plant shelf
//
// Dr Tom Flint, 25 Nov 2025
//=================================================================================


F2=299;
thick=1.5;
athick=4;

//-----------------------------------------------------------------------------------
module PlantFoot(){
  


  difference(){
    union(){
      // surround the post
      cylinder(r=33/2+thick,h=15,$fn=F2);
      translate([0,0,15])
      cylinder(r1=33/2+thick,r2=25/2+thick,h=50,$fn=F2);
      // arm top
      hull(){
        translate([0,0,15+50-athick])
        cylinder(r=33/2+athick,h=athick,$fn=F2);
        translate([0,-150,15+50-athick])
        cylinder(r=2*athick,h=athick,$fn=F2);
      }
      // top fillet
      translate([0,0,15+50-10-2*thick])
      cylinder(r1=25/2+thick,r2=41/2,h=10,$fn=F2);
      
      // arm lower
      hull(){
        translate([0,0,5])
        rotate([68,0,0])
        cylinder(r=athick/2,h=160,$fn=F2);
        cylinder(r=athick,h=65,$fn=F2);
      }
    }
    // center bore for post
    cylinder(r=33/2,h=15+0.1,$fn=F2);
    translate([0,0,15])
    cylinder(r1=33/2,r2=25/2,h=50+0.1,$fn=F2);    
    
    // slice off extra on top
    translate([0,0,75])
    cube([100,500,20],center=true);
  }
    
}

//=================================================================================

PlantFoot();

//=================================================================================
