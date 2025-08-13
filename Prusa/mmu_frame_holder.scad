//======================================================================
// mmu_frame_holder.scad
//
// frame() is the original setup for Prusa Mk3
// frame2() is the setup with Core One
//
// DrTomFlint 28 July 2024, updated 12 Aug 2025
//
//======================================================================


thick=10;
wide=7;

x1=45.5;  // first bar
x2=5;   // left foot
x3=10;  // right foot

F1=99;
F2=33;

//----------------------------------------------------------------------
module frame(){

  // first bar
  cube([x1,wide,thick],center=true);
  
  // left foot
  translate([-x1/2,-4.5,0])  
  cube([x2,16,thick],center=true);
  translate([-x1/2+2.5,-4.5-7.2,0])  
  cylinder(r=1,h=thick,$fn=6,center=true);

  // right foot
  translate([x1/2,-4.5,0])  
  cube([x2,16,thick],center=true);
  translate([x1/2-2.5,-4.5-8,0])  
  rotate([0,0,5])
  cube([10,5,thick],center=true);

  // mmu bar
  rotate([0,0,8])
  difference(){
    translate([x1/2+3.5,-18+100/2,0])  
    cube([wide,100,thick],center=true);
    
    // bore
    translate([x1/2,10,0])  
    rotate([0,90,0])
    cylinder(r=1.7,h=3*thick,$fn=22,center=true);
    // countersink
    translate([x1/2,10,0])  
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  
    // bore
    translate([x1/2,10+63.5,0])  
    rotate([0,90,0])
    cylinder(r=1.7,h=3*thick,$fn=22,center=true);
    // countersink
    translate([x1/2,10+63.5,0])  
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  }

  // brace bar
  hull(){
    translate([-x1/2+2,0,0])  
    cube([5,5,thick],center=true);
    
    rotate([0,0,8])
    translate([x1/2+3.5,50,0]) cube([5,5,thick],center=true);
  }
  
}

//----------------------------------------------------------------------
module frame2(){

  // first bar
  translate([9.5,-3,0])  
  rotate([0,0,-45])
  difference(){
    cube([x1,wide,thick],center=true);
    // bore
    translate([7,10,0])  
    rotate([0,0,90])
    rotate([0,90,0])
    cylinder(r=1.7,h=6*thick,$fn=22,center=true);
    // countersink
    translate([7,3,0])  
    rotate([0,0,90])
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  }
  
  // mmu bar
  difference(){
    translate([x1/2+3.5,-22+110/2,0])  
    cube([wide,110,thick],center=true);
    
    // bore
    translate([x1/2,10,0])  
    rotate([0,90,0])
    cylinder(r=1.7,h=3*thick,$fn=22,center=true);
    // countersink
    translate([x1/2,10,0])  
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  
    // bore
    translate([x1/2,10+63.5,0])  
    rotate([0,90,0])
    cylinder(r=1.7,h=3*thick,$fn=22,center=true);
    // countersink
    translate([x1/2,10+63.5,0])  
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  }

  // brace bar
  hull(){
    translate([-5,10,0])  
    rotate([0,0,45])
    cube([5,5,thick],center=true);
    
    rotate([0,0,0])
    translate([x1/2+3.5,50,0]) 
    cube([5,5,thick],center=true);
  }
  
}


//======================================================================

//~ frame();
frame2();

//~ color("red")
//~ translate([0,-7,0])
//~ cube([40,6.5,10],center=true);

//======================================================================
