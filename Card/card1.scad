//======================================================================
// card.scad
//
// Business card
//
// DrTomFlint 25 March 2023
//
//======================================================================

use <../Parts/rounder.scad>
use <../Fractals/Lsystem.scad>

thick=0.45;
thin=0.3;
vspace=14;
tsize=6;
tspace=1.1;
x0=70;
y0=40;
r0=4;
lip=1.5;

//----------------------------------------------------------------------
module text1(){

    // 
    translate([0,vspace,0])
    linear_extrude(height=thick)
    text("Dr Tom Flint", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

    translate([0,0,0])
    linear_extrude(height=thick)
    text("@gmail.com", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

    translate([0,-vspace,0])
    linear_extrude(height=thick)
    text("802-829-7207", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

}

//----------------------------------------------------------------------
module back1(){
  
  difference(){
    linear_extrude(height=thin)
    offset(r=r0,$fn=88)
    square([x0,y0],center=true);
    
    translate([0,0,-thick/2])
    scale([1,1,2])
    text1();

  }
  
}

//----------------------------------------------------------------------
module lip1(){
  difference(){
    linear_extrude(height=thick)
    offset(r=r0+lip,$fn=88)
    square([x0,y0],center=true);

    translate([0,0,-thick/2])
    linear_extrude(height=2*thick)
    offset(r=r0,$fn=88)
    square([x0,y0],center=true);
  }
}

//----------------------------------------------------------------------
module back2(){
  
  intersection(){
    back1();
    translate([0,-y0/2,0])
    cylinder(r=y0/3,h=2*thick,$fn=88,center=true);
  }
}

//----------------------------------------------------------------------
module back3(){
  
  difference(){
    intersection(){
      back1();
      translate([0,-y0/2,0])
      cylinder(r=0.8*y0,h=2*thick,$fn=88,center=true);
    }
    translate([0,-y0/2,0])
    cylinder(r=y0/3,h=2*thick,$fn=88,center=true);
  }
}

//----------------------------------------------------------------------
module back4(){
  
  difference(){
    back1();
    translate([0,-y0/2,0])
    cylinder(r=0.8*y0,h=2*thick,$fn=88,center=true);    
  }
}

//----------------------------------------------------------------------
module base(){
  
  translate([0,0,-thin])
  intersection(){
    linear_extrude(height=thin)
    offset(r=r0+lip,$fn=88)
    square([x0,y0],center=true);
    
    translate([0,0,-thin])
    linear_extrude(height=thick)
    scale([4,4,1])
    penrose_tiling(n=5, w=0.25);
  }
  // solid lip
  difference(){
    translate([0,0,-thin])
    linear_extrude(height=thin)
    offset(r=r0+lip,$fn=88)
    square([x0,y0],center=true);

    translate([0,0,-thick])
    linear_extrude(height=2*thick)
    offset(r=r0,$fn=88)
    square([x0,y0],center=true);
  }

}

//======================================================================

//text1();
//lip1();
//base();

back1();

//back2();
//back3();
//back4();

//======================================================================




