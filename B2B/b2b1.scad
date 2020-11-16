//--------------------------------------------------------------------------------
// B2B1.scad
// Back-to-back motor rig version 1
// Two Tek2310 motors, coupler, resolver, 30x60 T-slot
//--------------------------------------------------------------------------------


use <./tek2310.scad>
use <./resolver.scad>
use <../Parts/tslot.scad>


module b2b1(){
  
  translate([-150,0,-15])
  rotate([0,90,0])
  tslot1(type=2,len=300);
  
  color("red")
  translate([40,0,40])
  tek2310();

  translate([40,0,40])
  resbody();

  color("green")
  translate([-40,0,40])
  rotate([0,0,180])
  tek2310();
  
  translate([-40,0,40])
  rotate([0,0,180])
  resbody();
  
}

//--------------------------------------------------------------------------------

b2b1();

//--------------------------------------------------------------------------------
