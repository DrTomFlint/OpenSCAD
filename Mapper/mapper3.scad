// mapper3

r0=8;
x0=80-2*r0;
y0=96-2*r0;

xoff=0.5*x0+r0;
yoff=0.5*y0+r0;

r1=30;


  intersection(){
  translate([0,0,-5])
  scale([1,1,0.75])
  import("longs2.amf");

/*
  color("cyan")
  translate([xoff,yoff,0])
  linear_extrude(height=30)
  offset(r=r0,$fn=200)
  square([x0,y0],center=true);
*/

  color("cyan")
  translate([xoff,yoff,0])
  cylinder(r=r1,h=80,$fn=222);
  
  }

difference(){
  
  translate([xoff,yoff,-1])
  cylinder(r1=r1-1,r2=r1,h=1,$fn=222);
  

if(0){
  color("blue")
  translate([40,20,0.4])
  rotate([180,0,0])
  #linear_extrude(height=0.4,convexity=4)
  text("Longs Peak", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.0);

  color("blue")
  translate([40,30,0.4])
  rotate([180,0,0])
  #linear_extrude(height=0.4,convexity=4)
  text("Colorado", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.0);

  color("blue")
  translate([40,70,0.4])
  rotate([180,0,0])
  linear_extrude(height=0.4,convexity=4)
  text("Dr Tom Flint", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.0);

  color("blue")
  translate([40,80,0.4])
  rotate([180,0,0])
  linear_extrude(height=0.4,convexity=4)
  text("May 2022", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.0);
}

if(1){
  color("blue")
  translate([40,60,0.4-1])
  rotate([180,0,180])
  #linear_extrude(height=0.4,convexity=4)
  text("LONGS", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.2);

  color("blue")
  translate([40,47.5,0.4-1])
  rotate([180,0,180])
  #linear_extrude(height=0.4,convexity=4)
  text("PEAK", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.2);

  color("blue")
  translate([40,35,0.4-1])
  rotate([180,0,180])
  #linear_extrude(height=0.4,convexity=4)
  text("2022", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.2);

}


} 
