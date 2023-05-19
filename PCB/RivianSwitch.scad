//=================================================================================
// RivianSwitch.scad
//
// T-slot mount for power switch, Rivian Ascent boards
//
// Dr Tom Flint, 9 March 2023
//=================================================================================


use <../Parts/tslot.scad>
use <../Parts/rounder.scad>

//---------------------------------------------------------------------------------
module riv(){
  
  difference(){
    // vertical post
    translate([15+1.5,0,0])
    cube([4,24,30],center=true);
    
    // cut for t-slot
    translate([0,30,0])
    rotate([90,0,0])
    tslot1(type=1,len=60,tol=0.2);
    
    // cut for M4x12 bolt, 6 mm thread space
    translate([13,7,0])
    rotate([0,90,0])
    cylinder(r=2.0,h=6,$fn=22);

    translate([15,-20,-16])
    rotate([30,0,0])
    cube([20,40,40],center=true);

    translate([13,12,15])
    rotate([0,90,0])
    rotate([0,0,-90])
    rounder(r=8,h=7,f=88);
    
  }
  
  difference(){
    // switch plate
    translate([15+7,-5,15-2])
    cube([12,14,4],center=true);
    
    // cut for switch post
    translate([15+8,-5,15-5])
    cylinder(r=6.5/2,h=6,$fn=22);

    translate([15+13,7-5,15-5])
    rotate([0,0,180])
    rounder(r=3,h=6,f=44);

    translate([15+13,-7-5,15-5])
    rotate([0,0,90])
    rounder(r=3,h=6,f=44);
  }
  
}

//=================================================================================

if(0){
  translate([0,30,0])
  rotate([90,0,0])
  tslot1(type=1,len=60,tol=0.2);
}

riv();


//=================================================================================
