//=================================================================================
// stencil.scad
//
// 
//
// Dr Tom Flint, 8 Oct 2021
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>

use <UnconformRound.TTF>

//-----------------------------------------------------------------------------------
module water1(){
h0=24;
h1=25;
thick=0.6;
long=208;
high=26;
cutwide=0.25;

difference(){
  cube([long,high,thick],center=true);
  
  color("red")
  translate([0,0,-1])
  linear_extrude(height=2,scale=1)
  text("WATER IS LIFE", font = "Open Sans:style=Bold", size=16,halign="center",valign="center",spacing=1.1);

//  text("STENCIL", font = "UnconformRound", size=16,halign="center",valign="center",spacing=1.1);

  // cuts to make it flex, left to right order
  translate([-71,0,0])
  rotate([0,0,-18])
  cube([cutwide,h1,1],center=true);
  
  translate([-54,0,0])
  rotate([0,0,18])
  cube([cutwide,h1,1],center=true);

  translate([-37.5,0,0])
  rotate([0,0,0])
  cube([cutwide,h0,1],center=true);

  translate([-22,0,0])
  rotate([0,0,0])
  cube([cutwide,h0,1],center=true);

  translate([0,0,0])
  rotate([0,0,0])
  cube([cutwide,h0,1],center=true);

  translate([13.5,0,0])
  rotate([0,0,0])
  cube([cutwide,h0,1],center=true);

  translate([35,0,0])
  rotate([0,0,0])
  cube([cutwide,h0,1],center=true);

  translate([55,0,0])
  rotate([0,0,0])
  cube([cutwide,h0,1],center=true);

  translate([63,0,0])
  rotate([0,0,0])
  cube([cutwide,h0,1],center=true);

  translate([79,0,0])
  rotate([0,0,0])
  cube([cutwide,h0,1],center=true);

}

// A needs support
color("red")
translate([-64.6,-4,0])
rotate([0,0,-19])
cube([1.2,10,thick],center=true);

color("green")
translate([-60,-4,0])
rotate([0,0,19])
cube([1.2,10,thick],center=true);

// R needs support
color("blue")
translate([-14.65,0,0])
rotate([0,0,0])
cube([1.6,10,thick],center=true);

// add spines
color("pink")
translate([0,high/2-0.5,thick])
cube([long,1,2*thick],center=true);

color("pink")
translate([0,-high/2+0.5,thick])
cube([long,1,2*thick],center=true);


}

//-----------------------------------------------------------------------------------
module dots(){
h0=24;
h1=25;
thick=0.6;
long=208;
high=26;
cutwide=0.25;

difference(){
  cube([long,high,thick],center=true);
  

//  text("STENCIL", font = "UnconformRound", size=16,halign="center",valign="center",spacing=1.1);
$fn=99;

  // cuts to make it flex, left to right order
  translate([-90,0,0])
  cylinder(r=10, h=2, center=true);
  
  translate([-65,0,0])
  cylinder(r=8, h=2, center=true);
  
  translate([-44,0,0])
  cylinder(r=6, h=2, center=true);
  
  translate([-26,0,0])
  cylinder(r=4, h=2, center=true);
  
  translate([-12,0,0])
  cylinder(r=3, h=2, center=true);
  
  translate([0,0,0])
  cylinder(r=2, h=2, center=true);
  
  translate([90,0,0])
  cylinder(r=10, h=2, center=true);
  
  translate([65,0,0])
  cylinder(r=8, h=2, center=true);
  
  translate([44,0,0])
  cylinder(r=6, h=2, center=true);
  
  translate([26,0,0])
  cylinder(r=4, h=2, center=true);
  
  translate([12,0,0])
  cylinder(r=3, h=2, center=true);
  
  translate([-76,0,0])
  cube([cutwide,h0,1],center=true);

  translate([-53,0,0])
  cube([cutwide,h0,1],center=true);

  translate([-34,0,0])
  cube([cutwide,h0,1],center=true);

  translate([-19,0,0])
  cube([cutwide,h0,1],center=true);

  translate([-5,0,0])
  cube([cutwide,h0,1],center=true);

  translate([76,0,0])
  cube([cutwide,h0,1],center=true);

  translate([53,0,0])
  cube([cutwide,h0,1],center=true);

  translate([34,0,0])
  cube([cutwide,h0,1],center=true);

  translate([19,0,0])
  cube([cutwide,h0,1],center=true);

  translate([5,0,0])
  cube([cutwide,h0,1],center=true);

  
}


// add spines
color("pink")
translate([0,high/2-0.5,thick])
cube([long,1,2*thick],center=true);

color("pink")
translate([0,-high/2+0.5,thick])
cube([long,1,2*thick],center=true);


}
//======================================================================================

//water1();

dots();

//======================================================================================

