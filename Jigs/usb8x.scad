//=================================================================================
// usb8x.scad
//
// End brackets for the 8-port USB charger for the Globes.
//
// @TODO add a power switch!
//
// Dr Tom Flint, 13 Dec 2020
//=================================================================================

//-------------------------------------------------------
module usb8x(){
  
  tol1 = 0.2;   // space around the power supply
  tol2 = 0.15;  // space around the pcb

difference(){
  color("red")
  minkowski(){
    hull(){
      translate([0,81.3/2+5-2,40+1.6/2])
      cube([50.8+2,5,1.6+2],center=true);

      translate([0,81.3/2+5-2,30/2])
      cube([82+2,5,30+2],center=true);
    }
    sphere(r=2,$fn=89);
  }

  // power supply
  translate([0,0,30/2])
  minkowski(){
    cube([82+tol1-2,99+10,30+tol1-2],center=true);
    rotate([90,0,0])
    cylinder(r=1,h=99+10,$fn=44);
  }
  // pcb
  color("green")
  translate([0,0,40+1.6/2])
  cube([50.8+tol2,81.3+2+tol2,1.6+tol2],center=true);
  
  // holes for wiring
  for(i=[-2:2]){
  translate([12*i,50,35])
  rotate([90,0,0])
  cylinder(r=3.5,h=20,$fn=89);
}
}

//color("orange")

}

//============================================================================

usb8x();

//============================================================================


