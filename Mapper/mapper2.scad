// mapper2

/*
difference(){

  intersection(){
  import("test1solid.amf");

  linear_extrude(height=20)
  offset(r=4,$fn=200)
  square([70,70],center=true);
  }
*/
  color("blue")
  translate([0,-30,0.4])
  rotate([180,0,0])
  linear_extrude(height=0.4,convexity=4)
  text("Colorado", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.0);

  color("blue")
  translate([0,20,0.4])
  rotate([180,0,0])
  linear_extrude(height=0.4,convexity=4)
  text("Dr Tom Flint", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.0);

  color("blue")
  translate([0,30,0.4])
  rotate([180,0,0])
  linear_extrude(height=0.4,convexity=4)
  text("Feb 2020", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.0);

//} 
