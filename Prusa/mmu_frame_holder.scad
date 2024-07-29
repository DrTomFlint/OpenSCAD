//======================================================================
// mmu_frame_holder.scad
//
//
// DrTomFlint 28 July 2024
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


//======================================================================

frame();

//~ color("red")
//~ translate([0,-7,0])
//~ cube([40,6.5,10],center=true);

//======================================================================
