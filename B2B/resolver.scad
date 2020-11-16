//-------------------------------------------------------------------------
// resolver.scad
// model for the Minebea 15VRX-1004-C17S resolver in two parts, resbody()
// and resrotor().
//------------------------------------------------------------------------------

module resrotor(tol=0){

rotate([0,90,0])  
difference(){
dx=3;  
  union(){
    translate([dx,0,0])
    cylinder(r=19.25/2-dx,h=7.05,$fn=99);
    translate([0,dx,0])
    cylinder(r=19.25/2-dx,h=7.05,$fn=99);
    translate([-dx,0,0])
    cylinder(r=19.25/2-dx,h=7.05,$fn=99);
    translate([0,-dx,0])
    cylinder(r=19.25/2-dx,h=7.05,$fn=99);
  }  

  translate([0,0,4])
  cube([3.95,15.05,9],center=true);
  translate([0,0,4])
  cube([15.05,3.95,9],center=true);
  
  translate([0,0,-1])
  cylinder(r=6,h=9,$fn=99);
}

}

//------------------------------------------------------------------------------
module resbody(tol=0){

rotate([0,0,180])
rotate([0,90,0]){
difference(){
  union(){
    // main body
    translate([0,0,3.25])
    cylinder(r=36.98/2,h=7,$fn=99);
    // bottom side lip
    cylinder(r=32.95/2,h=3.16,$fn=99);
    // top  side lip
    translate([0,0,3.25+7]){
      cylinder(r=32.90/2,h=0.6,$fn=99);
      cylinder(r=32.90/2-1,h=2.6,$fn=99);
    }
  }
  // locking keys  
  for(i=[0:4]){
    rotate([0,0,360/5*i-90/5])
    translate([0,36.98/2-1.45/2,6])
    cube([2.4,1.45,9],center=true);
  }
  // center bore
  translate([0,0,-1])
  cylinder(r=19.85/2,h=15,$fn=99);
}

// wiring block
translate([13,-22.25/2,8.5])
cube([16,22.25,5.7]);
translate([10.5,-22.25/2,8.5])
cube([8.5,22.25,8.5]);

// wires
for(i=[-3:2]){
  translate([26,1.6+3.2*i,10.5])
  rotate([0,90,0])
  cylinder(r=0.75,h=6, $fn=22);
}
}
}
//------------------------------------------------------------------------------


//resrotor();

resbody();


//------------------------------------------------------------------------------

