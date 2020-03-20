// rounder.scad
// cutting tool for rounding off corners with a cylinder

//---------------------
module rounder(
r=10,   // radius
h=10,   // height
f=22,    // $fn
extra=0.01  // extra size for the cube
){

difference(){
  translate([-extra,-extra,-extra])
  cube([r+extra,r+extra,h+2*extra]);
  translate([r,r,-1])
  cylinder(r=r,h=h+2,$fn=f);
}

}

//========================

rounder();

//========================
