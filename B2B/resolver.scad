//=================================================================================
// resolver.scad
// model for the Minebea 15VRX-1004-C17S resolver in two parts, resbody()
// and resrotor().
//
// Dr Tom Flint, 16 Nov 2020, for Rivian.com
//=================================================================================

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
    cylinder(r=(36.98+tol)/2,h=7+tol,$fn=99);
    // bottom side lip
    cylinder(r=(32.95+tol)/2,h=3.16+tol,$fn=99);
    // top  side lip
    translate([0,0,3.25+7]){
      cylinder(r=(32.90+tol)/2,h=0.6+tol,$fn=99);
      cylinder(r=(32.90+tol)/2-1,h=2.6+tol,$fn=99);
    }
  }
  // locking keys  
  for(i=[0:4]){
    rotate([0,0,360/5*i-90/5])
    translate([0,36.98/2-1.3/2,6])
    cube([2.4-tol,1.45,9],center=true);
  }
  // center bore
  translate([0,0,-1])
  cylinder(r=(19.85-tol)/2,h=15,$fn=99);
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
module resadapt(tol=0){

difference(){
  // body
  rotate([0,90,0]){
    union(){
      translate([0,0,0])
      linear_extrude(scale=[0.90,0.95],height=7)
        square([3.75,14.9],center=true);

      translate([0,0,0])
      linear_extrude(scale=[0.95,0.90],height=7)
        square([14.9,3.75],center=true);
      
      cylinder(r=6,h=7,$fn=99);
      
      translate([0,0,-3.0])
      cylinder(r=19/2,h=3.0,$fn=99);
    }
  }

  // bore hole
  translate([14,0,0])
  difference(){
    // shaft
    translate([-1.9-18.6,0,0])
    rotate([0,90,0])
    cylinder(r=9.5/2+0.15,h=1.9+18.6,$fn=88);

    // keyway
    translate([-16,0,9.5/2-0.75])
    hull(){
      cylinder(r=2.9/2-0.1,h=1,$fn=22);
      translate([9.5,0,0])
      cylinder(r=2.9/2-0.1,h=1,$fn=22);
    }
  }
  
  // cut to make it install
  translate([3,0,-7])
  cube([13,0.8,6],center=true);

  rotate([120,0,0])
  translate([3,0,-4])
  cube([13,0.8,6],center=true);

  rotate([-120,0,0])
  translate([3,0,-4])
  cube([13,0.8,6],center=true);

  // trim off excess inner key
  translate([-6,0,0])
  rotate([0,90,0])
  cylinder(r=9.5/2+0.15,h=6,$fn=88);
  
  // make the 45 slope for printing
  translate([-0.1,0,0])
  rotate([0,90,0])
  cylinder(r1=9.5/2,r2=9.5/2-2,h=2,$fn=88);

}
}

//=================================================================================

translate([-10,0,0]){

color("red")
resadapt();

//color("cyan")
//resrotor();
}

//resbody();


//=================================================================================

