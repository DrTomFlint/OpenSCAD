//=================================================================================
// Tek2310.scad
// Model for Teknic Motor PN M-2310P-LN-04K with encoder mounted
// precision tech pn 755-0021425
// This is the motor TI includes in the B2B test rig
//
// Dr Tom Flint, 16 Nov 2020
//=================================================================================

use <../Parts/rounder.scad>

module tek2310(
tol=0
){

// mounting flange
r0=3;
x1=59.37;
x2=x1/2;
difference(){
  translate([2.4,0,0])
  cube([4.8+tol,x1+tol,x1+tol],center=true);

  // round off corners
  translate([-1,-x2,-x2])
  rotate([0,90,0])
  rotate([0,0,90])
  rounder(r=r0,h=6,f=22);

  translate([-1,-x2,x2])
  rotate([0,90,0])
  rotate([0,0,0])
  rounder(r=r0,h=6,f=22);

  translate([-1,x2,x2])
  rotate([0,90,0])
  rotate([0,0,-90])
  rounder(r=r0,h=6,f=22);

  translate([-1,x2,-x2])
  rotate([0,90,0])
  rotate([0,0,180])
  rounder(r=r0,h=6,f=22);
  
  // cut bolt holes
  for(i=[0:3]){
    rotate([45+90*i,0,0])
    translate([-1,33.34,0])
    rotate([0,90,0])
    cylinder(r=5.2/2,h=7,$fn=22);
  }
}

// motor body
translate([4.8,0,0])
rotate([0,90,0])
rotate([0,0,22.5])
cylinder(r=31.5+tol,h=71.2-4.8+tol,$fn=8);

// circular lip
translate([-1.9,0,0])
rotate([0,90,0])
difference(){
  cylinder(r=(38.1+tol)/2,h=2.0+tol,$fn=120);
  cylinder(r=(15.5-tol)/2,h=5,center=true,$fn=120);
}


difference(){
  // shaft
  translate([-1.9-18.6,0,0])
  rotate([0,90,0])
  cylinder(r=(9.5+tol)/2,h=1.9+18.6,$fn=88);

  // keyway
  translate([-16,0,9.5/2-1.5])
  hull(){
    cylinder(r=2.9/2,h=2,$fn=22);
    translate([9.5,0,0])
    cylinder(r=2.9/2,h=2,$fn=22);
  }
}

}
//===================================================

tek2310();

//====================================================

