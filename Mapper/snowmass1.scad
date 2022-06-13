// mapper3

r0=8;
x0=80-2*r0;
y0=60-2*r0;

xoff=0.5*x0+r0;
yoff=0.5*y0+r0;

difference(){

  intersection(){
  scale([1,1,0.75])
  import("snowmass3.amf");

  color("cyan")
  translate([xoff,yoff,0])
  linear_extrude(height=30)
  offset(r=r0,$fn=200)
  square([x0,y0],center=true);
  }

  color("blue")
  translate([40,50,0.3])
  rotate([180,0,180])
  linear_extrude(height=0.4,convexity=4)
  text("Snowmass", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);

  color("blue")
  translate([40,38,0.3])
  rotate([180,0,180])
  linear_extrude(height=0.4,convexity=4)
  text("Colorado", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);

  color("blue")
  translate([40,20,0.3])
  rotate([180,0,180])
  linear_extrude(height=0.4,convexity=4)
  text("Tom Flint", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

  color("blue")
  translate([40,8,0.3])
  rotate([180,0,180])
  linear_extrude(height=0.4,convexity=4)
  text("May 2022", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);


} 
