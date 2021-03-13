//=================================================================================
// flextest2.scad
//
// Test gasket, soft foot, live hinge.
// Soft parts are NinjaFlex, stiff parts are PetG
//
// Dr Tom Flint, 13 Dec 2020
//=================================================================================

//-------------------------------------------------------
module test2a(){


// hinge sections
cube([10,5,1]);
translate([0,9,0])
cube([10,5,1]);

translate([0,12,1])
cube([10,2,1]);
translate([0,0,1])
cube([10,2,1]);

translate([0,-4,0])
cube([10,4,2]);


// soft foot
difference(){
  translate([0,14,0])
  cube([10,10,2]);

  translate([5,19,1])
  cylinder(r1=4.5,r2=3.0,h=2.5,$fn=88);

  // bolt hole
//  translate([5,19,-1])
//  cylinder(r1=1.5,r2=1.5,h=8,$fn=88);
  
}


}

//-------------------------------------------------------
module test2b(){


// hinge sections
difference(){
  union(){
    translate([0,5,0])
    cube([10,4,1]);
    translate([0,2,1])
    cube([10,10,1]);
  }

  translate([-1,7,2])
  rotate([0,90,0])
  //scale([1,2,1])
  cylinder(r=0.7,h=12,$fn=22);
  
}

// soft foot
difference(){
  translate([5,19,1])
  cylinder(r1=4.5,r2=3.0,h=2.5,$fn=88);

  // bolt hole
//  translate([5,19,0.99])
//  cylinder(r1=1.5,r2=3.5,h=8,$fn=88);
}


}

//=================================================================================

test2a();

//color("cyan")
//test2b();

//=================================================================================


