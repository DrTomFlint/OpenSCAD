//==================================================================
// catMask1.scad

//--------------------------------------------------------------------
module cat1(){
difference(){
  translate([0,0,-30])
  rotate([-20,0,0])
  scale([1,1,1])
  import("cat_mask1.amf");


  color("cyan")
  translate([0,0,-50])
  cube([300,300,100],center=true);
  
  color("red")
  translate([0,-170,-50])
  rotate([25,0,0])
  cube([300,300,100],center=true);
  
  }

}

//--------------------------------------------------------------------
module cat2(){
difference(){
  translate([0,0,-30])
//  rotate([-20,0,0])
  scale([1,1,1])
  import("cat_mask1.amf");

/*
  color("cyan")
  translate([0,0,-50])
  cube([300,300,100],center=true);
  
  color("red")
  translate([0,-170,-50])
  rotate([25,0,0])
  cube([300,300,100],center=true);
  */
  
  }

}

//==================================================================

//cat1();
cat2();

//==================================================================

