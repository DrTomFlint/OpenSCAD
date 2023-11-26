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

    // boss
    translate([-3,0,0])
    scale([1,1.5,1])
    rotate([0,90,0])
    rotate([0,0,30])
    cylinder(r=4.8+tol,h=12+tab+tol,center=true,$fn=6);
          
    // trim off bottom half
    translate([0,0,-5])
    cube([40,20,10],center=true);

    // trim for tabs
    translate([tab/2+1.5,0,3])
    cube([tab/2+2-tol,20-tol,4-tol],center=true);
    translate([-tab/2-7,0,3])
    cube([tab/2+2-tol,20-tol,4-tol],center=true);
    
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

    hull(){
      translate([-3,-1.2,2.7])
      rotate([0,90,0])
      cylinder(r1=0.85,r2=0.65,h=14,center=true,$fn=F1);
      translate([-3,-2.6,2.7])
      rotate([0,90,0])
      cylinder(r1=0.85,r2=0.65,h=14,center=true,$fn=F1);
    }
    
    // cuts for solder junction
    translate([1.2,1.9,3.3])
    cube([4.5,2.8,2.8],center=true);
    translate([1.2,-1.9,3.3])
    cube([4.5,2.8,2.8],center=true);
  }


}

//----------------------------------------------------------------------
module rtdBlock1(){

thick=4.3;

  difference(){
    translate([-3,0,0])
    linear_extrude(height=thick,scale=[0.3,0.65])
    square([13,25],center=true);

    translate([0,0,1])
    cube([24,7,8],center=true);
    
    rtd(tol=0.2);
  }

}

//----------------------------------------------------------------------
module rtdBlock2(){

thick=6;

  difference(){
    translate([-3,0,0])
    linear_extrude(height=thick,scale=[0.2,0.7])
    square([15,26],center=true);
    
    //~ translate([0,0,1.2])
    //~ cube([24,15,6],center=true);
    translate([-3,0,0])
    linear_extrude(height=4.2,scale=[1,1.7])
    square([15,8.5],center=true);
    
    translate([-3,0,4.2])
    linear_extrude(height=thick,scale=[1,0.4])
    square([15,14.5],center=true);
  }

}

//----------------------------------------------------------------------
module rtdTest(){
  
//~ rtd();
translate([-2.5,0,0])
rtdBlock1();

//~ translate([0,26,4.2])
//~ rotate([180,0,0])
//~ rtd();

translate([-1.5,26,0])
rtdBlock2();

translate([-10,-14,-0.8])
cube([13,54,0.8]);

translate([-12,-14,-5])
cube([2.1,54,5]);

}  

//======================================================================

//~ rtd();
//~ rtdBlock1();

//~ translate([0,0,4.2])
//~ rotate([180,0,0])
//~ rtd();

//~ rtdBlock2();

rtdTest();

//======================================================================


