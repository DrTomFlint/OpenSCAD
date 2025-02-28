//======================================================================
// SonoffClip.scad
//
// Programming clip for Sonoff S31 2.4GHz, b/g/n wifi power plug
//
// DrTomFlint, 25 Jan 2025
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/hexcut.scad>

compress=0.5;

F1=299;
F2=77;

//----------------------------------------------------------------------
module board(tol=0){

  translate([0,0,0])
  cube([32.3+tol,1.2+tol,9+tol]);
  
  #for(i=[0:5])
  translate([18+i*12.7/5, 0, 9-1.34])
  rotate([90,0,0])
  cylinder(r=1.0,h=0.1,$fn=F2);
  
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
    translate([-3,-9,4])
    cube([10,12,8]);

    // cut for board
    board(tol=0.15);
    
    // cut for arm
    translate([-1-tol/2,-9-tol/2,6-tol/2])
    cube([40+tol,7+tol,4+tol]);
    
    // cut for peg
    translate([3.5,-9+3.5,4])
    cylinder(r=1+tol/2,h=8,$fn=F2);
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
    union(){
      // arm
      translate([10-tol/2,-20-tol/2,6-tol/2])
      cube([25+tol,5+tol,4+tol]);
      // left
      translate([10-tol/2,-20-tol/2,6-tol/2])
      cube([5+tol,25+tol,4+tol]);
      // right
      translate([32.5-tol/2,-20-tol/2,6-tol/2])
      cube([5+tol,25+tol,4+tol]);
      // back
      translate([10-tol/2,1,5-tol/2])
      cube([27.5+tol,5+tol,5+tol]);
    }
    
    // cut for pogos
    for(i=[0,3,4,5])
    translate([18+i*12.7/5, 0.5, 9-1.34])
    rotate([90,0,0])
    pogo2(tol=0.2);  
    
    // cut for peg
    translate([3.5,-9+3.5,4])
    cylinder(r=1+0.15,h=8,$fn=F2);
    
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


board();
arm();
pogos();

//~ pogo2();


//======================================================================
