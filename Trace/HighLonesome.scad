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
module min(eyes=1){

  difference(){
    // magnify and trim off the registration marks
    intersection(){
      scale([mag,mag,thick])
      HighLonesomeMin();

      cylinder(r=0.6*mag,h=3*thick,center=true);
    }
    if(eyes==1){
      // mad eyes
      translate([0.085*mag,0.074*mag,0])
      cylinder(r=2,h=3*thick,center=true,$fn=33);
      translate([-0.094*mag,0.074*mag,0])
      cylinder(r=2,h=3*thick,center=true,$fn=33);
    }
  }
}

//----------------------------------------------------------------------
module eyes(){

  translate([0.085*mag,0.072*mag,0])
  cylinder(r=2,h=thick,$fn=33);
  translate([-0.094*mag,0.074*mag,0])
  cylinder(r=2,h=thick,$fn=33);
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
    translate([-0.75,-1,0])
    cylinder(r=0.48*mag,h=thick,$fn=200);
    //~ hull(){
      //~ main();
    //~ }
    
    main();
    //~ mountain();
    //~ water();
    //~ stars();

    // hanger hole
    translate([-0.75,0.455*mag,0])
    #cylinder(r=1,h=3*thick,center=true,$fn=22);
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

y1=0.505*mag;
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
    
    // thicken in xy direction all lines in min
    linear_extrude(height=thick)
    offset(r=3.5)
    projection(cut = false) 
    min();
    
    // subtract out min
    min();
    eyes();
  }
}

//----------------------------------------------------------------------
module min2(eyes=1){

  difference(){
    
    // magnify and trim off the registration marks
    linear_extrude(height=thick)
    offset(r=0.2)
    projection(cut = false) 
    intersection(){
      scale([mag,mag,thick])
      HighLonesomeMin();

      cylinder(r=0.6*mag,h=3*thick,center=true);
    }
    
    
    if(eyes==1){
      // mad eyes
      translate([0.085*mag,0.074*mag,0])
      cylinder(r=2,h=3*thick,center=true,$fn=33);
      translate([-0.094*mag,0.074*mag,0])
      cylinder(r=2,h=3*thick,center=true,$fn=33);
    }
  }
}

//----------------------------------------------------------------------
module backMin2(){

  difference(){
    
    // thicken in xy direction all lines in min
    linear_extrude(height=thick)
    offset(r=3.5)
    projection(cut = false) 
    min();
    
    // subtract out min
    min();
    #eyes();
  }
}

//======================================================================

// Entire disk:

//~ main();
//~ mountain();
//~ water();
//~ stars();

back();

//~ tab();    // dont use on full disk

// Just the innner bighorn:

//~ min();
//~ backMin();
//~ tabMin();
//~ eyes();

//~ min2();
//~ tabMin();
//~ backMin2();

//======================================================================
