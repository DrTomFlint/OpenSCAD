//======================================================================
// Logo.scad
//
// AeroAmp logo for the calorimeter stand
//
// Tom Flint, 29 Aug 2022
//======================================================================


//----------------------------------------------------------------------
module logo1(){

  difference(){
    translate([0,0,0])
    linear_extrude(height=2.4,scale=1)
    offset(r=5)
    square([150-10,40-10],center=true);

    translate([0,0,1.2])
    linear_extrude(height=1.3,scale=1)
    offset(r=2)
    square([150-10,40-10],center=true);
  }
  
  translate([0,-1,1.2])
  linear_extrude(height=1.2,scale=1)
  text("AeroAmp", font = "Open Sans:style=Bold", size=16,halign="center",valign="center",spacing=1.1);

}

//----------------------------------------------------------------------
module logo2(){

x0=130;
y0=40;

  difference(){
    translate([0,0,0])
    linear_extrude(height=2.4,scale=1)
    offset(r=5)
    square([x0,y0],center=true);

    translate([0,0,1.2])
    linear_extrude(height=1.3,scale=1)
    offset(r=2)
    square([x0,y0],center=true);
  }
  
  translate([0,-1,1.2])
  linear_extrude(height=1.2,scale=1)
  text("11941", font = "Open Sans:style=Bold", size=22,halign="center",valign="center",spacing=1.3);

}

//======================================================================

//logo1();
logo2();

//======================================================================
