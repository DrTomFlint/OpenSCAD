//====================================================================
// Lightning1.scad
// 
//====================================================================


use <./Lightning1white.scad>
use <./Lightning1blue.scad>
use <./Lightning1red.scad>

thick = 2.1;    // thickness of the blades

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

//===============================================================

//L1white();
//L1blue();
//L1red();
//L1black();    // with hanger hole
L1blackB();   // no hanger hole

//===============================================================


