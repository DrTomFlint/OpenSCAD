//======================================================================
// BootStrapBox.scad
//
// DrTomFlint 5 July 2023
//======================================================================

s0=20;    // one side of box
r0=3;     // rounding of box
t0=1.2;   // height of text, DOES NOT WORK RIGHT

//----------------------------------------------------------------------
module BsBox(){

difference(){
  minkowski(){
    cube([s0-r0,s0-r0,s0-r0],center=true);
    sphere(r=r0,$fn=200);    // $fn resolution
    
  }
  
  BsText();
}

}

//----------------------------------------------------------------------
module JediBox(){

difference(){
  minkowski(){
    cube([s0-r0,s0-r0,s0-r0],center=true);
    sphere(r=r0,$fn=200);    // $fn resolution
    
  }
  
  JediText();
}

}


//----------------------------------------------------------------------
module Text(){

    linear_extrude(height=t0,scale=1)
    scale([1.2,2.2])
    text("BS", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

}

//----------------------------------------------------------------------
module TextJe(){

    linear_extrude(height=t0,scale=1)
    scale([1.2,2.2])
    text("JE", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

}

//----------------------------------------------------------------------
module TextDi(){

    linear_extrude(height=t0,scale=1)
    scale([1.2,2.2])
    text("DI", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

}


//----------------------------------------------------------------------
module BsText(){

    // top
    translate([0,0,s0/2+0.3])
    Text();
  
    // bottom
    rotate([180,0,0])
    translate([0,0,s0/2+0.3])
    rotate([0,0,180])
    Text();

    // front
    rotate([90,0,0])
    translate([0,0,s0/2+0.3])
    rotate([0,0,90])
    Text();
  
    // back
    rotate([-90,0,0])
    translate([0,0,s0/2+0.3])
    rotate([0,0,-90])
    Text();

    // right
    rotate([0,90,0])
    translate([0,0,s0/2+0.3])
    rotate([0,0,90])
    Text();

    // left
    rotate([0,-90,0])
    translate([0,0,s0/2+0.3])
    rotate([0,0,-90])
    Text();
  
}

//----------------------------------------------------------------------
module JediText(){

    // top
    translate([0,0,s0/2+0.3])
    TextJe();
  
    // bottom
    rotate([180,0,0])
    translate([0,0,s0/2+0.3])
    rotate([0,0,180])
    Text();

    // front
    rotate([90,0,0])
    translate([0,0,s0/2+0.3])
    rotate([0,0,90])
    Text();
  
    // back
    rotate([-90,0,0])
    translate([0,0,s0/2+0.3])
    rotate([0,0,-90])
    Text();

    // right
    rotate([0,90,0])
    translate([0,0,s0/2+0.3])
    rotate([0,0,00])
    TextDi();

    // left
    rotate([0,-90,0])
    translate([0,0,s0/2+0.3])
    rotate([0,0,-90])
    Text();
  
}

//======================================================================

//BsBox();

JediBox();
//JediText();

//color("red")
//BsText();


//======================================================================
