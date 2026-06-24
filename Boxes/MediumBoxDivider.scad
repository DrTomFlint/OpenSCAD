//======================================================================
// MediumBoxDivider.scad
//
// For medium display box, divide into 6 sections to support earrings.
//
// DrTomFlint, 23 Jan 2025
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>
use <../Parts/hexcut.scad>

F1=200;
F2=77;

//----------------------------------------------------------------------
module box(){

  difference(){
    translate([0,0,-8])
    cube([185+16,135+16,48+8],center=true);
    
    cube([185,135,48],center=true);
  }
  
}
//----------------------------------------------------------------------
module divider(){

  difference(){
    // boss
    //~ cube([185-1,135-1,6],center=true);
    translate([0,0,-3])
    linear_extrude(height=6)
    offset(r=3,$fn=F2)
    square([184-6,134-6],center=true);
    
    // six holes
    translate([-46+0.5,33.5+10,0])
    cube([85,36.67+2,20],center=true);
    translate([-46+0.5,0,0])
    cube([85,36.67,20],center=true);
    translate([-46+0.5,-33.5-10,0])
    cube([85,36.67+2,20],center=true);
    
    translate([46-0.5,33.5+10,0])
    cube([85,36.67+2,20],center=true);
    translate([46-0.5,0,0])
    cube([85,36.67,20],center=true);
    translate([46-0.5,-33.5-10,0])
    cube([85,36.67+2,20],center=true);
    
    // cuts for foam
    translate([0,0,-3])
    cube([2,130,8],center=true);
    translate([91,0,-3])
    cube([2,130,8],center=true);
    translate([-91,0,-3])
    cube([2,130,8],center=true);

    translate([0,22.3-1,-3])
    cube([180,2,8],center=true);
    translate([0,67-1,-3])
    cube([184,2,8],center=true);

    translate([0,-22.3+1,-3])
    cube([180,2,8],center=true);
    translate([0,-67+1,-3])
    cube([184,2,8],center=true);
    
    // topside bevel 
    translate([-46+0.5,33.5+10,1])
    linear_extrude(height=2,scale=[1.02,1.05])
    offset(r=1,$fn=F2)
    square([85-2,36.67],center=true);
    
    translate([-46+0.5,0,1])
    linear_extrude(height=2,scale=[1.02,1.05])
    offset(r=1,$fn=F2)
    square([85-2,36.67-2],center=true);

    translate([-46+0.5,-33.5-10,1])
    linear_extrude(height=2,scale=[1.02,1.05])
    offset(r=1,$fn=F2)
    square([85-2,36.67],center=true);
    
    translate([46-0.5,33.5+10,1])
    linear_extrude(height=2,scale=[1.02,1.05])
    offset(r=1,$fn=F2)
    square([85-2,36.67],center=true);
    
    translate([46-0.5,0,1])
    linear_extrude(height=2,scale=[1.02,1.05])
    offset(r=1,$fn=F2)
    square([85-2,36.67-2],center=true);

    translate([46-0.5,-33.5-10,1])
    linear_extrude(height=2,scale=[1.02,1.05])
    offset(r=1,$fn=F2)
    square([85-2,36.67],center=true);


  }


}
//----------------------------------------------------------------------
module walls(){

  difference(){
    union(){
      // cuts for foam
      translate([0,0,-3])
      cube([2,130,36],center=true);
      translate([91,0,-3])
      cube([2,130,36],center=true);
      translate([-91,0,-3])
      cube([2,130,36],center=true);

      translate([0,22.3-1,-3])
      cube([180,2,36],center=true);
      translate([0,67-1,-3])
      cube([184,2,36],center=true);

      translate([0,-22.3+1,-3])
      cube([180,2,36],center=true);
      translate([0,-67+1,-3])
      cube([184,2,36],center=true);
    }
    // short walls
    translate([-100,-15,-3])
    rotate([0,90,0])
    #hexcut1(R=5.0,x0=0,y0=0,h0=300,N0=4,wall=0.8);
    translate([-100,-15+44,-3])
    rotate([0,90,0])
    hexcut1(R=5.0,x0=0,y0=0,h0=300,N0=4,wall=0.8);
    translate([-100,-15-44,-3])
    rotate([0,90,0])
    hexcut1(R=5.0,x0=0,y0=0,h0=300,N0=4,wall=0.8);
    
    // long walls
    translate([-10,100,-3])
    rotate([90,0,0])
    rotate([0,0,90])
    hexcut1(R=5.0,x0=0,y0=0,h0=300,N0=8,wall=0.8);
    translate([-10+90,100,-3])
    rotate([90,0,0])
    rotate([0,0,90])
    hexcut1(R=5.0,x0=0,y0=0,h0=300,N0=8,wall=0.8);

  }
      

}

//======================================================================

//~ intersection(){
//~ box();
//~ translate([0,0,10])
//~ divider();

translate([0,0,-6])
walls();

//~ }


//======================================================================
