//======================================================================
// mmu_tube_fix.scad
//
//
// DrTomFlint 28 July 2024
//
//======================================================================


thick=1.2;
wide=12;
high=10;

F1=99;
F2=33;

//----------------------------------------------------------------------
module fix(){

  difference(){
    union(){    
      cylinder(r=wide,h=thick,$fn=F2);
      translate([0,0,thick])
      cylinder(r1=7/2+2,r2=7/2,h=2,$fn=F2);
      cylinder(r=7/2,h=high,$fn=F2);
    }
    cylinder(r=2.1,h=3*high,center=true,$fn=F2);
  }
  
}

//======================================================================

fix();


//======================================================================

