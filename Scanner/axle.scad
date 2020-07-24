// axle.scad
// scanner part

//--------------------------------------------------------------------
module axle(){

  // ewheel engage
  cylinder(r=7,$fn=6,h=11);
  // thru the bearing
  translate([0,0,11])
  cylinder(r=7.8/2,h=8,$fn=F2);
  // arm engage
  translate([0,0,11+8])
  cylinder(r1=3.6,r2=3.5,h=4.5,$fn=6);
  
  // Add a fancy button top
  difference(){
    translate([0,0,-3])
    cylinder(r1=10,r2=12,h=2,$fn=F2);
    translate([0,0,-3.1])
    linear_extrude(height=1,convexity=6)
    scale([3.5,3.5])
    penrose_tiling(n=2, w=0.2);
  }
  translate([0,0,-1])
  cylinder(r1=12,r2=12,h=1,$fn=F2);
  
  
}

  

//=================================

axle();

//========================================
