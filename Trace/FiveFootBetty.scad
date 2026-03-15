//======================================================================
// FiveFootBetty.scad
//
// Earrings for 5 Foot Betty
//
// DrTomFlint 28 Dec 2025
//
//======================================================================

use <../Parts/rounder.scad>

layer = 0.24;
thick = 4*layer;
mag = 0.075;

F1 = 99;
F2 = 24;  

yoff1= -37.5;
a1 = -25.5;
a2 = -14;
a3 = 0;
a4 = 15;
a5 = 29;

yoff2= -47.5;
b1 = -21;
b2 = -11;
b3 = 0;
b4 = 11.5;
b5 = 23;

tsize = 9;
//~ poff = 5;


//----------------------------------------------------------------------
module BettyText5(){
    rotate([0,0,a1])
    translate([0,yoff1,0])
    linear_extrude(height=thick)
    text("5", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

}

//----------------------------------------------------------------------
module BettyText(){

    //~ rotate([0,0,a1])
    //~ translate([0,yoff1,0])
    //~ linear_extrude(height=thick)
    //~ text("5", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a2])
    translate([0,yoff1,0])
    linear_extrude(height=thick)
    text("F", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a3])
    translate([0,yoff1,0])
    linear_extrude(height=thick)
    text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a4])
    translate([0,yoff1,0])
    linear_extrude(height=thick)
    text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a5])
    translate([0,yoff1,0])
    linear_extrude(height=thick)
    text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);


    rotate([0,0,b1])
    translate([0,yoff2,0])
    linear_extrude(height=thick)
    text("B", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,b2])
    translate([0,yoff2,0])
    linear_extrude(height=thick)
    text("E", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,b3])
    translate([0,yoff2,0])
    linear_extrude(height=thick)
    text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,b4])
    translate([0,yoff2,0])
    linear_extrude(height=thick)
    text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,b5])
    translate([0,yoff2,0])
    linear_extrude(height=thick)
    text("Y", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
}

//----------------------------------------------------------------------
module BettyText2(){

m1=1.2;

    rotate([0,0,a1])
    translate([0,yoff1,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("5", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("5", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a2])
    translate([0,yoff1,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("F", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("F", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a3])
    translate([0,yoff1,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a4])
    translate([0,yoff1,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a5])
    translate([0,yoff1,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    //-------------------------
    
    rotate([0,0,b1])
    translate([0,yoff2,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("B", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("B", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,b2])
    translate([0,yoff2,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("E", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("E", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,b3])
    translate([0,yoff2,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,b4])
    translate([0,yoff2,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,b5])
    translate([0,yoff2,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("Y", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("Y", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }


}

//----------------------------------------------------------------------
module BettyYellow(){

  render()
  intersection(){
    translate([0,0,1])
    scale([mag,mag,1])
    surface(file="./FiveFootYellow.png", center = true, invert=true);
  
    translate([0,0,thick/2])
    cube([1000,1000,thick],center=true);
  }

}

//----------------------------------------------------------------------
module BettyBlue(){

  render()
  intersection(){
    translate([0,0,1])
    scale([mag,mag,1])
    surface(file="./FiveFootBlue.png", center = true, invert=true);
  
    translate([0,0,thick/2])
    cube([1000,1000,thick],center=true);
  }

}

//----------------------------------------------------------------------
module BettyEdge(){

  render()
  intersection(){
    translate([0,0,1])
    scale([mag,mag,1])
    surface(file="./FiveFootBlack.png", center = true, invert=true);
  
    translate([0,0,thick/2])
    cube([1000,1000,thick],center=true);
  }

}

//----------------------------------------------------------------------
module loop(){

  translate([2,22,0])
  scale([1.2,1.1,1])
  difference(){
    cylinder(r=3,h=thick,$fn=F1);
    cylinder(r=1.5,h=5*thick,center=true,$fn=F1);
  }

}

//----------------------------------------------------------------------
module BettyBlack(){

  intersection(){
    union(){
      BettyEdge();
      loop();
      BettyText2();
    }
    translate([0,0,layer/2])
    cube([1000,1000,layer],center=true);
  }


}

//----------------------------------------------------------------------
module BettyClear(){

  intersection(){
    union(){
      BettyEdge();
      loop();
      BettyText2();
    }
    translate([0,0,layer+(thick-layer)/2])
    cube([1000,1000,thick-layer],center=true);
  }

}

//====================================================================================================

//~ BettyText();
//~ BettyText2();

//~ BettyText5();
BettyYellow();

BettyBlue();

//~ BettyEdge();
//~ loop();

BettyBlack();
//~ BettyClear();


//====================================================================================================
