// headband.scad
// Scale a 100 mm radius sphere to model a head.
// Make it hollow, thickness ~ 1 mm.
// Slice out a headband with a zlow and zhigh cut mark.

//-----------------------------------------------------------
module headband(
gain=1.1,
thick=1.0,
zlow=50,
zhi=60,
r0=100,
tol=0
){
F1=150;

// set base of loop to z=0
translate([0,0,-zlow])

difference(){
  scale([1,0.85,1.25])
  sphere(r=r0*gain+thick,$fn=F1);
  scale([1,0.85,1.25])
  sphere(r=r0*gain,$fn=F1);
 
  // lower cut  
  translate([0,0,-2*r0+zlow])
  cube([3*r0,3*r0,4*r0],center=true);

  // upper cut  
  translate([0,0,2*r0+zhi])
  cube([3*r0,3*r0,4*r0],center=true);

}

}
//===================================================

headband(zlow=62,zhi=68,thick=1.5,gain=1.105);

//====================================================
