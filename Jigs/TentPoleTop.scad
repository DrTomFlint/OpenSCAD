//---------------------------------------------------------------------
// TentPoleTop.scad
//
// Protect the tarp from the sharp tops of the tent poles
//
// DrTomFlint 16 Aug 2023
//---------------------------------------------------------------------

thick=1.6;

F2 = 99;

//---------------------------------------------------------------------
module TentPoleTop()
{


  // main barrel
  difference(){
    union(){
      cylinder(r=5.3+thick,h=40,$fn=F2);
      translate([0,0,40-5])
      cylinder(r1=5.3,r2=10,h=5,$fn=F2);
      translate([0,0,40])
      cylinder(r1=20,r2=20-thick,h=thick,$fn=F2);
    }
    translate([0,0,-thick])
    cylinder(r=5,h=40,$fn=F2);
    translate([0,0,40-6])
    cylinder(r=2,h=12,$fn=F2);
  }
  // internal ribs
  for(i=[0:8]){
    rotate([0,0,i*360/9])
    translate([5.6,0,0])
    rotate([0,-0.5,0])
    cylinder(r=0.5,h=40,$fn=22);
  }
    
}

//=====================================================================

TentPoleTop();

//=====================================================================
