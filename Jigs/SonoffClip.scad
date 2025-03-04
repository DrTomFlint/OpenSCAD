//======================================================================
// SonoffClip.scad
//
// Programming clip for Sonoff S31 2.4GHz, b/g/n wifi power plug
//
// DrTomFlint, 25 Jan 2025
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/hexcut.scad>

compress=1.5;

F1=299;
F2=77;

//----------------------------------------------------------------------
module board(tol=0){

  // pcb edge is Origin
  translate([0,0,0])
  cube([32.3+tol,1.2+tol,25+tol]);
  
  // testpoint pads
  #for(i=[0:5])
  translate([18+i*12.7/5, 0, 25-1.34])
  rotate([90,0,0])
  cylinder(r=1.0,h=0.1,$fn=F2);
  
  // relay box
  translate([4.75,3.8,4.8])
  cube([23.9+tol,15.5+tol,10+tol]);
  
  // horizontal pcb
  translate([-2,1.2,3.0])
  cube([34.5+tol,64.0+tol,1.5+tol]);
  
}

//----------------------------------------------------------------------
module pogo(tol=0){

  // pogo section
  translate([0,0,compress])
  cylinder(r=1.06/2+tol,h=2.5-compress,$fn=F2);

  // barrel
  translate([0,0,2.5])
  //~ cylinder(r=1.52/2+tol,h=4.5,$fn=F2);
  // increase barrel cut to size of ring
  cylinder(r=1.74/2+tol,h=4.5,$fn=F2);
  
  // ring
  translate([0,0,6])
  cylinder(r=1.84/2+tol,h=0.5,$fn=F2);

  // wiring pin
  translate([0,0,2.5+4.5])
  cylinder(r=0.62/2+tol,h=4.5,$fn=F2);

}

//----------------------------------------------------------------------
module pogo2(tol=0){

translate([0,0,compress]){
  // pogo section
  translate([0,0,0])
  cylinder(r1=0.05,r2=1.31/2+tol,h=1,$fn=F2);
  
  translate([0,0,1])
  cylinder(r=1.31/2+tol,h=1.5,$fn=F2);

  translate([0,0,1+1.5])
  cylinder(r=0.72/2+tol,h=6.0,$fn=F2);
}

  // barrel
  translate([0,0,1+1.5+6])
  cylinder(r=1.2/2+tol,h=25,$fn=F2);
  

}

//----------------------------------------------------------------------
module box(tol=0.15){

  // hinge box
  difference(){
    union(){
      // lower surrounds relay
      translate([4.75/2,6,4.8])
      cube([23.9+4+tol,15+tol,22+tol]);

      // upper surrounds board and arm
      translate([-2,-16,18.8])
      cube([36+5+tol,37+tol,9+tol]);
    }
    
    // cut for board
    board(tol=0.15);
    
    // cut to expose testpoints
    translate([9,-20,15])
    cube([23,25,20]);
    translate([10,-20,15])
    cube([23,15,20]);
    
    // cut for the swing arm
    translate([-4,-16,22-0.2])
    cube([48,5,4+0.4]);
    
    // cut for peg
    translate([3-tol/2,-16+2.5-tol/2,10])
    cylinder(r=0.9,h=20,$fn=F2);
    
    // cut for pin
    translate([36,-16+2.5-tol/2,10])
    cylinder(r=0.9,h=20,$fn=F2);
    
    // text
#    translate([18,12,28-0.3])
    linear_extrude(height=0.3)
    text("FLINT", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.16);
    
  }

}  
//----------------------------------------------------------------------
module arm_old(tol=0){

  // arm
  difference(){
    hull(){  
      translate([6-tol/2,-8-tol/2,6-tol/2])
#      cube([26.5+tol,5+tol,4+tol]);
      translate([3.5,-9+3.5,6])
      cylinder(r=2.5+tol/2,h=4,$fn=F2);
    }
    // cut for pogos
    for(i=[0:5])
    translate([18+i*12.7/5, 0, 9-1.34])
    rotate([90,0,0])
    pogo2(tol=0.2);  
    
    // cut for peg
    translate([3.5,-9+3.5,4])
    cylinder(r=1+0.15,h=8,$fn=F2);
  }
  
  //~ // latch
  //~ difference(){
    //~ translate([31.5,-8-tol/2,6-tol/2])
    //~ cube([2.5,12,4]);
  
    //~ translate([30.5,-3,6])
    //~ cube([2,4.5,4]);

    //~ translate([31.0,1.5,6])
    //~ rotate([0,0,45])
    //~ cube([4,4,4]);
  //~ }
  
}

//----------------------------------------------------------------------
module arm(tol=0){

  // arm
  difference(){
    // arm
    //~ hull(){
      //~ translate([3-tol/2,-16+2.5-tol/2,22-tol/2])
      //~ cylinder(r=2.5+tol,h=4+tol,$fn=F2);
      
      //~ translate([13-tol/2,-16-tol/2,22-tol/2])
      //~ cube([26+tol,5+tol,4+tol]);
    //~ }
    hull(){
      translate([3-tol/2,-16+2.5-tol/2,22-tol/2])
      cylinder(r=2.5+tol,h=4+tol,$fn=F2);
      
      translate([36-tol/2,-16+2.5-tol/2,22-tol/2])
      cylinder(r=2.5+tol,h=4+tol,$fn=F2);
    }
    // cut for pogos
    for(i=[0,3,4,5])
    translate([18+i*12.7/5, compress, 25-1.34])
    rotate([90,0,0])
    #pogo2(tol=0.05);  
    
    // cut for peg
    translate([3-tol/2,-16+2.5-tol/2,10])
    cylinder(r=0.9,h=20,$fn=F2);
    
    // cut for pin
    translate([36,-16+2.5-tol/2,10])
    cylinder(r=0.9,h=20,$fn=F2);
    
    // cut for board
    board(tol=0.2);
    
  }
    
}

//----------------------------------------------------------------------
module peg(tol=0){

  translate([3.5,-9+3.5,4])
  cylinder(r=1,h=8,$fn=F2);

}

//----------------------------------------------------------------------
module pogos(){
  
    for(i=[0,3,4,5])
    translate([18+i*12.7/5, 0.5, 9-1.34])
    rotate([90,0,0])
    pogo2(tol=0.2);  

}

//======================================================================

//~ color("grey")
//~ board();
//~ box();

color("cyan")
arm();

//~ pogos();

//~ pogo2();


//======================================================================
