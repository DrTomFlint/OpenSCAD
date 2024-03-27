//====================================================================
// SteelMonkey.scad
//
// Steel Monkey band logo for coins or disks
// 
// DrTomFlint 23 March 2024
//====================================================================


use <./Tull1.scad>
use <./Tull2.scad>

layer = 0.3;
//~ thick = 7*layer;    // thickness not including top and bottom
thick = 4*layer;    // thickness not including top and bottom

mag=32;   // scaling
R0=2;     // rounding of corners
F1=77;

//------------------------------------------------------------
module SteelYellowX(){
  
  scale([mag,mag,thick])
  Tull1();
  
  difference(){
    translate([0.05*mag,0.05*mag,0])
    cylinder(r=0.57*mag,h=thick,$fn=F1);
    translate([0.05*mag,0.05*mag,-0.5*thick])
    scale([0.9,1,1])
    cylinder(r=0.55*mag,h=2*thick,$fn=F1);
  }

}

//------------------------------------------------------------
module SteelText(){
  
  translate([0.05*mag,0,0])
  scale([mag,mag,thick])
  Tull2();
  
}

//---------------------------------------------------------------
module SteelBlue(){

  difference(){
    translate([0.05*mag,0.05*mag,0])
    scale([0.9,1,1])
    cylinder(r=0.55*mag,h=thick,$fn=F1);
    translate([0,0,-0.5*thick])
    scale([mag,mag,2*thick])
    Tull1();

    translate([0.05*mag,0.55*mag,-0.5*thick])
    cylinder(r=0.5,h=2*thick,$fn=F1);

    translate([0.05*mag,0,-0.5*thick])
    scale([mag,mag,2*thick])
    Tull2();
  }
}

//------------------------------------------------------------
module SteelYellow(){
  
  difference(){
    SteelYellowX();

    translate([0,0,-9.25])
    rotate([-2,0,0])
    cube([2*mag,2*mag,20],center=true);
  }
  
}

//------------------------------------------------------------
module SteelOrange(){
  
  intersection(){
    SteelYellowX();

    translate([0,0,-9.25])
    rotate([-2,0,0])
    cube([2*mag,2*mag,20],center=true);
  }
  
}

//------------------------------------------------------------
module SteelRim(){

  difference(){
    translate([0.05*mag,0.05*mag,0])
    cylinder(r=0.59*mag,h=thick,$fn=F1);
    translate([0.05*mag,0.05*mag,-0.5*thick])
    cylinder(r=0.57*mag,h=2*thick,$fn=F1);
  }
}



//=====================================================================

//~ SteelYellow();
//~ SteelOrange();

SteelRim();

//~ SteelBlue();
//~ SteelText();

//=====================================================================
