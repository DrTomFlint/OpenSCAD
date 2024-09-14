//======================================================================
// HighLonesome.scad
//
// DrTomFlint 13 Sept 2024
//
//======================================================================

use <../Parts/rounder.scad>
use <../Fractals/Lsystem.scad>

use <./HighLonesomeMain.scad>
use <./HighLonesomeMountain.scad>
use <./HighLonesomeWater.scad>
use <./HighLonesomeStars.scad>
use <./HighLonesomeMin.scad>

thick=1.2;
thin=0.15;
mag=130;

//----------------------------------------------------------------------
module main(){

  // magnify and trim off the registration marks
  intersection(){
    scale([mag,mag,thick])
    HighLonesomeMain();

    cylinder(r=0.6*mag,h=3*thick,center=true);
  }
}

//----------------------------------------------------------------------
module min(){

  // magnify and trim off the registration marks
  intersection(){
    scale([mag,mag,thick])
    HighLonesomeMin();

    cylinder(r=0.6*mag,h=3*thick,center=true);
  }
}

//----------------------------------------------------------------------
module mountain(){

  // magnify and trim off the registration marks
  intersection(){
    scale([mag,mag,thick])
    HighLonesomeMountain();

    cylinder(r=0.6*mag,h=3*thick,center=true);
  }
}

//----------------------------------------------------------------------
module water(){

  // magnify and trim off the registration marks
  intersection(){
    scale([mag,mag,thick])
    HighLonesomeWater();

    cylinder(r=0.6*mag,h=3*thick,center=true);
  }
}

//----------------------------------------------------------------------
module stars(){

  // magnify and trim off the registration marks
  intersection(){
    scale([mag,mag,thick])
    HighLonesomeStars();

    cylinder(r=0.6*mag,h=3*thick,center=true);
  }
}

//----------------------------------------------------------------------
module back(){

  difference(){
    hull(){
      main();
    }
    
    main();
    mountain();
    water();
    stars();
  }
}

//----------------------------------------------------------------------
module tab(){

y1=0.48*mag;

  difference(){
    hull(){
      translate([0,y1,0])
      cylinder(r=2,h=thick,$fn=44);
      translate([0,0.8*y1,0])
      cylinder(r=10,h=thick,$fn=44);
    }
    translate([0,y1,-1])
    cylinder(r=1,h=thick+2,$fn=44);
    hull(){
      main();
    }
  }
  
}

//----------------------------------------------------------------------
module tabMin(){

y1=0.495*mag;
x1 = -0.5;

  difference(){
    translate([x1,y1,0])
    cylinder(r=3,h=thick,$fn=44);
    translate([x1,y1,-1])
    cylinder(r=1,h=thick+2,$fn=44);
  }
  
}

//----------------------------------------------------------------------
module backMin(){

  difference(){
    
    linear_extrude(height=thick)
    offset(r=2)
    projection(cut = false) 
    //~ hull(){
      min();
    //~ }
    
    min();
  }
}


//======================================================================

//~ main();
//~ mountain();
//~ water();
//~ stars();

//~ back();
//~ tab();


min();
//~ backMin();
//~ tabMin();


//======================================================================
