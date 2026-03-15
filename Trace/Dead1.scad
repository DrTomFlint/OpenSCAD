//======================================================================
// Dead1.scad
//
// Aoxomoxoa style Grateful Dead logo.
//
// DrTomFlint 9 Jan
//
//======================================================================

use <../Parts/rounder.scad>

layer = 0.24;
thick = 6*layer;
mag = 0.075;

ra = 208;
rb = 192;
rx = 20;
ya=200;

//----------------------------------------------------------------------
module dead1(){

  render()
  intersection(){
    translate([0,0,1])
    scale([mag,mag,3])
    surface(file="./GratefulDead.png", center = true, invert=true);
  
    translate([0,0,thick/2])
    cube([1000,1000,thick],center=true);
  }

}

//----------------------------------------------------------------------
module dead2(){
  
  linear_extrude(height=thick)
  offset(r=2,$fn=33)
  projection(cut = false)
  dead1();
  
}

//----------------------------------------------------------------------
module dead3(){
  
  difference(){
    dead2();
    scale([1,1,3])
    dead1();
  }
}


//----------------------------------------------------------------------
module dead1a(){
  
  difference(){    
    dead1();
    translate([0,-ya,0])
    cylinder(r1=ra,r2=ra+rx,h=3*thick,center=true,$fn=99);
  }
  
}
//----------------------------------------------------------------------
module dead1b(){
  
  difference(){
    intersection(){    
      dead1();
      translate([0,-ya,0])
      cylinder(r1=ra,r2=ra+rx,h=3*thick,center=true,$fn=99);
    }
    translate([0,-ya,0])
    cylinder(r1=rb,r2=rb+rx,h=3*thick,center=true,$fn=99);
  }
}

//----------------------------------------------------------------------
module dead1c(){
  
  intersection(){    
    dead1();
    translate([0,-ya,0])
    cylinder(r1=rb,r2=rb+rx,h=3*thick,center=true,$fn=99);
  }
  
}

//----------------------------------------------------------------------
module dead3a(){
  
  intersection(){    
    dead3();
    translate([0,0,1*layer/2])
    cube([300,300,1*layer],center=true);
  }
}

//----------------------------------------------------------------------
module dead3b(){
  
  intersection(){    
    dead3();
    translate([0,0,1*layer+5*layer/2])
    cube([300,300,5*layer],center=true);
  }
}
  
//======================================================================

//~ dead1();
//~ dead2();
//~ dead3();


//~ dead1a();
//~ dead1b();
//~ dead1c();

//~ dead3a();
dead3b();


//======================================================================
