//======================================================================
// SmallBoxMendels.scad
//
// For small display box, remove base weights used with fairy crystals,
// add divider and frontal washer weights to use with 6 small Mendel1a
// fractals
//
// DrTomFlint, 7 May 2025
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>

F1=200;
F2=77;

//----------------------------------------------------------------------
module box(){

  difference(){
    translate([0,0,-8])
    cube([135+16,85+16,24+8],center=true);
    
    cube([135,85,24],center=true);
  }
  
}
//----------------------------------------------------------------------
module divider(tol=0.2){

dy=[0,-5,-5,0];

  difference(){
    // boss
    translate([0,0,-20+0.1])
    linear_extrude(height=20)
    offset(r=3,$fn=F2)
    square([135-6,85-6],center=true);
    
    // cuts in corners for weight washers
    translate([135/2-28/2,-85/2+28/2,-20+0.1])
    cylinder(r=25.5/2+tol,h=18,$fn=F2);
    translate([-135/2+28/2,-85/2+28/2,-20+0.1])
    cylinder(r=25.5/2+tol,h=18,$fn=F2);
    
    // back row
    for(i=[0:3])
    translate([-49.0+i*32.5,20+dy[i],-21])
    linear_extrude(height=22,scale=1.02)
    offset(r=1,$fn=F2)
    square([29,29],center=true);

    for(i=[0:3])
    translate([-49.0+i*32.5,20+dy[i],-10.65])
    linear_extrude(height=1,scale=1.05)
    offset(r=1,$fn=F2)
    square([29,29],center=true);
      
    // front row
    for(i=[1:2])
    translate([-54+i*36,-22,-21])
    linear_extrude(height=22,scale=1.02)
    offset(r=1,$fn=F2)
    square([29,29],center=true);

    for(i=[1:2])
    translate([-54+i*36,-22,-10.65])
    linear_extrude(height=1,scale=1.05)
    offset(r=1,$fn=F2)
    square([29,29],center=true);

    // top cut back  
    translate([0,36,-10])
    linear_extrude(height=11,scale=1.2)
    square([135,85],center=true);

    // top cut front
    translate([0,0,-10])
    linear_extrude(height=11,scale=1.1)
    square([74,85],center=true);

    // tagline
    translate([0,33.5,-10-0.9])
    rotate([0,0,0])
    rotate([0,0,0])
    linear_extrude(height=0.9)
    text("Flint's Finest", font = "Open Sans:style=Bold", size=6.5,halign="center",valign="bottom",spacing=1.1);
      
  }


}

//======================================================================

difference(){
  union(){
    
    //~ box();

    translate([0,0,8])
    divider();
    
  }
  translate([0,100,-400])
  cube([200,200,200],center=true);
}


//======================================================================
