//---------------------------------------------------------------------
// rtd.scad
//
// Mount PT1000 RTDs and support the wires
//
// DrTomFlint 10 Oct 2023
//---------------------------------------------------------------------

F1=99;

// ---------------------------------------------------------
module rtd(tol=0){

tab=10;
  
  difference(){

    union(){
      // boss
      translate([-3,0,0])
      scale([1,1.8,1])
      rotate([0,90,0])
      rotate([0,0,30])
      cylinder(r=3.8,h=12+tab,center=true,$fn=6);
      // top rib
      translate([-3,0,3])
      cube([12,1,2],center=true);
      // wire capture
      translate([-6,0,1.9])
      scale([1,1.8,1])
      rotate([0,90,0])
      rotate([0,0,30])
      cylinder(r=2.7,h=6,center=true,$fn=6);
    }
    
    // trim off bottom half
    translate([0,0,-2])
    cube([40,20,4],center=true);

    // trim for tabs
    translate([tab/2+1.5,0,3])
    cube([tab/2+2,20,4],center=true);
    translate([-tab/2-7,0,3])
    cube([tab/2+2,20,4],center=true);
    
    translate([-2,0,0]){
      // cuts for the rtd body
      translate([-0.6,0,0.25])
      cube([3,2.8,0.51+0.2],center=true);
      translate([0.55+0.8,0,0.55])
      cube([1.6+2,2.8,1.3],center=true);

      // rising cut for rtd leads
      translate([2.4,1.2,1])
      scale([1.5,1,1])
      cylinder(r=0.7,h=4,center=true,$fn=F1);
      translate([2.4,-1.2,1])
      scale([1.5,1,1])
      cylinder(r=0.7,h=4,center=true,$fn=F1);
    }
    
    // cuts for wiring
    translate([-3,1.2,2.7])
    rotate([0,90,0])
    cylinder(r1=0.85,r2=0.65,h=14,center=true,$fn=F1);
    translate([-3,-1.2,2.7])
    rotate([0,90,0])
    cylinder(r1=0.85,r2=0.65,h=14,center=true,$fn=F1);

    // cuts for solder junction
    translate([1.2,1.9,3])
    cube([4.5,2.8,2.2],center=true);
    translate([1.2,-1.9,3])
    cube([4.5,2.8,2.2],center=true);
  }


}

//======================================================================

rtd();

//======================================================================


