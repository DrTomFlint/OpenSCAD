//======================================================================
// DancingBears.scad
//
//
// DrTomFlint 7 Dec 2023
//======================================================================

use <./DancingBear1.scad>
use <./DancingBear2.scad>
use <./DancingBear3.scad>
use <./DancingBear4.scad>
use <./DancingBear5.scad>
use <./DancingMask1.scad>
use <./DancingMask2.scad>
use <./DancingMask3.scad>
use <./DancingMask4.scad>
use <./DancingMask5.scad>
use <./DancingBib1.scad>
use <./DancingBib2.scad>
use <./DancingBib3.scad>
use <./DancingBib4.scad>
use <./DancingBib5.scad>

mag=42;
thick=1.5;

//----------------------------------------------------------------------
module bear1(){
  
  difference(){
    scale([mag,mag,thick])  
    DancingBear1();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
  }
  
}
//----------------------------------------------------------------------
module bear2(){
  
  difference(){
    scale([mag,mag,thick])  
    DancingBear2();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
  }
  
}
//----------------------------------------------------------------------
module bear3(){

mag2=mag+3;
  
  difference(){
    scale([mag2,mag2,thick])  
    DancingBear3();
    translate([mag2/2,mag2/2,-1])
    cylinder(r=mag2/8,h=thick+2);
    translate([-mag2/2,mag2/2,-1])
    cylinder(r=mag2/8,h=thick+2);
    translate([-mag2/2,-mag2/2,-1])
    cylinder(r=mag2/8,h=thick+2);
    translate([mag2/2,-mag2/2,-1])
    cylinder(r=mag2/8,h=thick+2);
  }
  
}
//----------------------------------------------------------------------
module bear4(){
  
  difference(){
    scale([mag,mag,thick])  
    DancingBear4();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
  }
  
}
//----------------------------------------------------------------------
module bear5(){
  
  difference(){
    scale([mag,mag,thick])  
    DancingBear5();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
  }
  
}


//----------------------------------------------------------------------
module back1(){
  difference(){
    scale([mag,mag,thick])  
    DancingMask1();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    bear1();
  }
}

//----------------------------------------------------------------------
module bib1(){
  difference(){
    scale([mag,mag,thick])  
    DancingBib1();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    bear1();
  }
}

//----------------------------------------------------------------------
module back2(){
  difference(){
    scale([mag,mag,thick])  
    DancingMask2();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    bear2();
  }
}

//----------------------------------------------------------------------
module bib2(){
  difference(){
    scale([mag,mag,thick])  
    DancingBib2();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    bear2();
  }
}

//----------------------------------------------------------------------
module back3(){
  difference(){
    scale([mag,mag,thick])  
    DancingMask3();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    bear3();
  }
}

//----------------------------------------------------------------------
module bib3(){
  difference(){
    scale([mag,mag,thick])  
    DancingBib3();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    bear3();
  }
}

//----------------------------------------------------------------------
module back4(){
  difference(){
    scale([mag,mag,thick])  
    DancingMask4();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    bear4();
  }
}


//----------------------------------------------------------------------
module bib4(){
  difference(){
    scale([mag,mag,thick])  
    DancingBib4();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    bear4();
  }
}

//----------------------------------------------------------------------
module back5(){
  difference(){
    scale([mag,mag,thick])  
    DancingMask5();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    bear5();
  }
}

//----------------------------------------------------------------------
module bib5(){
  difference(){
    scale([mag,mag,thick])  
    DancingBib5();
    translate([mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([-mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    translate([mag/2,-mag/2,-1])
    cylinder(r=mag/8,h=thick+2);
    bear5();
  }
}

//----------------------------------------------------------------------
module tab(wide=6){
  
  difference(){
    translate([0,0,-4])
    linear_extrude(height=4.0,scale=[1,1.2])
    square([wide, 18.0],center=true);
    translate([0,0,-4.05])
    linear_extrude(height=4.1,scale=[1,1.1])
    square([wide+2, 14.0],center=true);
  }
}

//======================================================================

translate([0,4,0])
tab();
translate([80,4,0])
tab();
translate([160,4,0])
tab();
translate([30,-110+4,0])
tab();
translate([120,-110+4,0])
tab();

bear1();
translate([80,0,0])
bear2();
translate([160,0,0])
bear3();
translate([30,-110,0])
bear4();
translate([120,-110,0])
bear5();


//~ back1();
//~ translate([80,0,0])
//~ back2();
//~ translate([160,0,0])
//~ back3();
//~ translate([30,-110,0])
//~ back4();
//~ translate([120,-110,0])
//~ back5();


//~ bib1();
//~ translate([80,0,0])
//~ bib2();
//~ translate([160,0,0])
//~ bib3();
//~ translate([30,-110,0])
//~ bib4();
//~ translate([120,-110,0])
//~ bib5();


//======================================================================

