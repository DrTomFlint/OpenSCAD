//====================================================================
// Lightning1.scad
// 
//====================================================================


use <./Lightning1white.scad>
use <./Lightning1blue.scad>
use <./Lightning1red.scad>

thick = 1.5;    // thickness of the blades

mag=40;
R0=16;

//------------------------------------------------------------
module L1white(){
  
  intersection(){
    
      translate([0,0,-1])
      scale([mag,mag,10])
      Lightning1white();
  
    cylinder(r=mag/2,h=thick);
  }

}

//------------------------------------------------------------
module L1blue(){
  
  intersection(){
    
      translate([0,0,-1])
      scale([mag,mag,10])
      Lightning1blue();
  
    cylinder(r=mag/2,h=thick);
  }

}

//------------------------------------------------------------
module L1red(){
  
  intersection(){
    
      translate([0,0,-1])
      scale([mag,mag,10])
      Lightning1red();
  
    cylinder(r=mag/2,h=thick);
  }

}
//------------------------------------------------------------
module L1black(){
  
  difference(){
    
    hull(){
      translate([0,0.6+R0-1,0])
      cylinder(r=3,h=thick, $fn=222);

      translate([0,0.6,0])
      cylinder(r=R0,h=thick, $fn=222);
    }
    
    translate([0,0,-1])
    scale([mag,mag,10]){
      Lightning1red();
      Lightning1white();
      Lightning1blue();
    }

    // trim out thin line between red-white-blue
    translate([0,0.6,0])
    cylinder(r=R0-1.6,h=thick, $fn=222);

    // hanger hole
    translate([0,0.6+R0+0.5,0])
    cylinder(r=0.8,h=3*thick, center=true, $fn=222);
  }

}
//------------------------------------------------------------
module L1blackB(){
  
  difference(){
    
    translate([0,0.6,0])
    cylinder(r=R0,h=thick, $fn=222);
    
    translate([0,0,-1])
    scale([mag,mag,10]){
      Lightning1red();
      Lightning1white();
      Lightning1blue();
    }

    // trim out thin line between red-white-blue
    translate([0,0.6,0])
    cylinder(r=R0-1.6,h=thick, $fn=222);

  }

}

//------------------------------------------------------------
// a jig to hold the part while drilling
// location of hanger hole:  translate([0,0.6+R0+0.5,0])
// 15.70 mm from hanger hole to the T-slot
module L1jig(){
  
  difference(){
      translate([0,24,5/2])
      cube([34,45,5],center=true);
      
    hull(){
      translate([0,0.6+R0-1,-1])
      cylinder(r=3,h=7, $fn=222);

      translate([0,0.6,-1])
      cylinder(r=R0,h=7, $fn=222);
    }
    
    // hole for M4 into T-Slot
    hull(){
      translate([0,0.6+R0+0.5+15.0,-1])
      cylinder(r=2.1,h=7, $fn=22);
      translate([0,0.6+R0+0.5+20.0,-1])
      cylinder(r=2.1,h=7, $fn=22);
    }

    translate([0,25,5-0.6])
    linear_extrude(height=0.7,scale=1)
    text("L1", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);
  }
  

  
}
    
//------------------------------------------------------------
module L3white(){

mag3=100;
  
  difference(){
    
      scale([mag3,mag3,10])
      Lightning1white();
  
      translate([mag3/2,mag3/2,-1])
      cylinder(r=mag3/4,h=20);
      translate([-mag3/2,mag3/2,-1])
      cylinder(r=mag3/4,h=20);
      translate([-mag3/2,-mag3/2,-1])
      cylinder(r=mag3/4,h=20);
      translate([mag3/2,-mag3/2,-1])
      cylinder(r=mag3/4,h=20);
  }

}

//===============================================================

//~ L1white();
//~ L1blue();
//~ L1red();
L1black();    // with hanger hole

//L1blackB();   // no hanger hole

//L1jig();

//L3white();

//===============================================================


