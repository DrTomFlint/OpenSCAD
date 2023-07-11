//======================================================================
// BootStrapBox.scad
//
// DrTomFlint 5 July 2023
//======================================================================

s0=24;    // one side of box
r0=3;     // rounding of box
t0=2.1;   // height of text
tsize=7;  // size of text

//t0=1.2;   // height of text

//----------------------------------------------------------------------
module BsBox(){

difference(){
  minkowski(){
    cube([s0-2*r0,s0-2*r0,s0-2*r0],center=true);
    sphere(r=r0,$fn=200);    // $fn resolution
    
  }
  
  BsText();
}

}

//----------------------------------------------------------------------
module JediBox(){

difference(){
  minkowski(){
    cube([s0-2*r0,s0-2*r0,s0-2*r0],center=true);
    sphere(r=r0,$fn=200);    // $fn resolution
    
  }
  
  JediText();
}

}


//----------------------------------------------------------------------
module Text(){

    linear_extrude(height=t0)
    scale([1.2,2.2])
    text("BS", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.1);

}

//----------------------------------------------------------------------
module TextJe(){

    linear_extrude(height=t0,scale=1)
    scale([1.2,2.2])
    text("JE", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.1);

}

//----------------------------------------------------------------------
module TextDi(){

    linear_extrude(height=t0,scale=1)
    scale([1.2,2.2])
    text("DI", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.1);

}


//----------------------------------------------------------------------
module BsText(){

    // top
    translate([0,0,s0/2-t0])
    Text();
  
    // bottom
    rotate([180,0,0])
    translate([0,0,s0/2-t0])
    rotate([0,0,180])
    Text();

    // front
    rotate([90,0,0])
    translate([0,0,s0/2-t0])
    rotate([0,0,90])
    Text();
  
    // back
    rotate([-90,0,0])
    translate([0,0,s0/2-t0])
    rotate([0,0,-90])
    Text();

    // right
    rotate([0,90,0])
    translate([0,0,s0/2-t0])
    rotate([0,0,90])
    Text();

    // left
    rotate([0,-90,0])
    translate([0,0,s0/2-t0])
    rotate([0,0,-90])
    Text();
  
}

//----------------------------------------------------------------------
module JediText(){

    // top
    translate([0,0,s0/2-t0])
    TextJe();
  
    // bottom
    rotate([180,0,0])
    translate([0,0,s0/2-t0])
    rotate([0,0,180])
    Text();

    // front
    rotate([90,0,0])
    translate([0,0,s0/2-t0])
    rotate([0,0,90])
    Text();
  
    // back
    rotate([-90,0,0])
    translate([0,0,s0/2-t0])
    rotate([0,0,-90])
    Text();

    // right
    rotate([0,90,0])
    translate([0,0,s0/2-t0])
    rotate([0,0,00])
    TextDi();

    // left
    rotate([0,-90,0])
    translate([0,0,s0/2-t0])
    rotate([0,0,-90])
    Text();
  
}

//======================================================================


//JediBox();
//JediText();

if(0){
  difference(){
    union(){
      BsBox();
      color("red")
      BsText();
    }
    translate([50,0,0])
    cube([100,100,100],center=true);
  }
}

BsBox();
//color("red")
//BsText();



//======================================================================
