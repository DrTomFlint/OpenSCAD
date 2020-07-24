// wheels.scad
// scanner part

use <../Slewing/slew11.scad>

//-------------------------------------------------------------------
module ewheel(){

//Nspokes=7;

  // outer rim is GT2 pulley
  time3();

  difference(){
    union(){
      // hub for shaft
      translate([0,0,3])
      cylinder(r=12,h=6,$fn=F2);
      // fancy disk
      intersection(){
        translate([0,0,0])
        linear_extrude(height=6,convexity=10)
        scale([14,14])
        penrose_tiling(n=3, w=0.2);
        
        cylinder(r=60,h=20,center=true);
      }
    }
    // cut for the axle
    cylinder(r=7,$fn=6,h=20);  
  }
}
//-------------------------------------------------------------------
module gwheel(){

  // Smaller slew joint, edit params in slew11.scad
  // 160 tooth is 101.35 mm OD 
  rotate([180,0,0])
  slew11();

}

//-------------------------------------------------------------------
module fwheel(){


  // outer rim
  translate([0,0,3])
  difference(){
    cylinder(r=34,h=6,$fn=F2);
    cylinder(r=32,h=20,$fn=F2,center=true);
  }

  difference(){
    union(){
      // hub for shaft
      translate([0,0,3])
      cylinder(r=12,h=6,$fn=F2);
      // fancy disk
      intersection(){
        translate([0,0,4])
        linear_extrude(height=3,convexity=10)
        scale([12,12])
        penrose_tiling(n=2, w=0.2);
        
        cylinder(r=76,h=20,center=true);
      }
    }
    // cut for the axle
    cylinder(r=7,$fn=6,h=20);  
  }
}

//==============================================

gwheel();

//======================================================
