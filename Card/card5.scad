//======================================================================
// card.scad
//
// Business card, version 5 with much wider color overlaps
//
// DrTomFlint 25 March 2023
//
//======================================================================

use <../Parts/rounder.scad>
use <../Fractals/Lsystem.scad>
use <./card5red.scad>
use <./card5orange.scad>
use <./card5yellow.scad>

thick=0.9;
//thin=0.3;
thin=0.3;
vspace=14;
tsize=8;
tspace=1.1;
x0=70;
y0=40;
r0=4;
lip=1.5;

mag=130;
//~ x1=5;
//~ x2=8;
//~ x3=11;

x1=3;
x2=10;
x3=15;
//----------------------------------------------------------------------
module text1(){

    $fn=200;
    
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
    linear_extrude(height=thick)
    offset(r=r0,$fn=88)
    square([x0,y0],center=true);
    
    translate([0,0,0])
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
module base(){
  
  translate([0,0,-thin])
  intersection(){
    linear_extrude(height=thin)
    offset(r=r0+lip,$fn=88)
    square([x0,y0],center=true);
    
    translate([0,0,-thin])
    linear_extrude(height=thick)
    scale([4,4,1])
//    penrose_tiling(n=5, w=0.25);
    penrose_tiling(n=5, w=0.4);
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

//----------------------------------------------------------------------
module backred1(){
  
  intersection(){
    back1();
    translate([x1,0,0])
    scale([mag,mag,3*thick])
    card5red();
    translate([30,0,0.15+0.0])
    cube([60,80,0.3],center=true);
  }
}
//----------------------------------------------------------------------
module backred2(){
  
  intersection(){
    back1();
    translate([x2,0,0])
    scale([mag,mag,3*thick])
    card5red();
    translate([30,0,0.15+0.3])
    cube([60,80,0.3],center=true);
  }
}
//----------------------------------------------------------------------
module backred3(){
  
  intersection(){
    back1();
    translate([x3,0,0])
    scale([mag,mag,3*thick])
    card5red();
    translate([30,0,0.15+0.6])
    cube([60,80,0.3],center=true);
  }
}

//----------------------------------------------------------------------
module backorange1(){
  
  intersection(){
    back1();
    translate([x1,0,0])
    scale([mag,mag,3*thick])
    card5orange();
    translate([0,0,0.15+0.0])
    cube([80,80,0.3],center=true);
  }
}
//----------------------------------------------------------------------
module backorange2(){
  
  intersection(){
    back1();
    translate([x2,0,0])
    scale([mag,mag,3*thick])
    card5orange();
    translate([0,0,0.15+0.3])
    cube([80,80,0.3],center=true);
  }
}
//----------------------------------------------------------------------
module backorange3(){
  
  intersection(){
    back1();
    translate([x3,0,0])
    scale([mag,mag,3*thick])
    card5orange();
    translate([0,0,0.15+0.6])
    cube([80,80,0.3],center=true);
  }
}

//----------------------------------------------------------------------
module backyellow1(){
  
  intersection(){
    back1();
    translate([x1,0,0])
    scale([mag,mag,3*thick])
    card5yellow();
    translate([-10,0,0.15+0.0])
    cube([60,80,0.3],center=true);
  }
}
//----------------------------------------------------------------------
module backyellow2(){
  
  intersection(){
    back1();
    translate([x2,0,0])
    scale([mag,mag,3*thick])
    card5yellow();
    translate([-10,0,0.15+0.3])
    cube([60,80,0.3],center=true);
  }
}
//----------------------------------------------------------------------
module backyellow3(){
  
  intersection(){
    back1();
    translate([x3,0,0])
    scale([mag,mag,3*thick])
    card5yellow();
    translate([-10,0,0.15+0.6])
    cube([60,80,0.3],center=true);
  }
}

//======================================================================

//~ text1();
//~ lip1();
//~ base();


//~ backred();
//~ backorange();
//~ backyellow();

// Stagger the border between colors for strength uncomment all 3 parts
// to make a single rendered part for each color

//~ backred1();
//~ backred2();
//~ backred3();

//~ backorange1();
//~ backorange2();
//~ backorange3();

backyellow1();
backyellow2();
backyellow3();

//back1();

//======================================================================




