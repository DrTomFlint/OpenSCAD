//=================================================================================
// switchPaddle.scad
//
// Black plastic paddle switches on/on 3 terminal type R13-402
//
// Dr Tom Flint, 27 Oct 2021
//=================================================================================


use <../Parts/rounder.scad>

//----------------------------------------------------------------------
module switchPaddleCut(tol=0){
  // switch body
  translate([0,0,-14.5])
  intersection(){
    cylinder(r=14.5/2+tol/2, h=14.5+tol, $fn=67);
    cube([20+tol,13.6+tol,30+tol],center=true);
  }

}

//---------------------------------------------------------------------
module switchPaddle(position=1,tol=0){
  
  // switch body
  translate([0,0,-14.5])
  intersection(){
    cylinder(r=14.5/2+tol/2, h=14.5+tol, $fn=67);
    cube([20+tol,13.6+tol,30+tol],center=true);
  }
  
  // tabs
  translate([0,0,-14.5-4.3/2])
  cube([2.2,0.75,5.3],center=true);
  translate([0,4.7,-14.5-4.3/2])
  cube([2.2,0.75,4.3],center=true);
  translate([0,-4.7,-14.5-4.3/2])
  cube([2.2,0.75,4.3],center=true);
  
  // flange
  intersection(){
    difference(){
      translate([0,0,1])
      cube([17.85, 21.9, 2.0],center=true);

      translate([17.85/2,21.9/2,-1])
      rotate([0,0,180])
      rounder(r=2,h=3,f=21);
      translate([-17.85/2,21.9/2,-1])
      rotate([0,0,-90])
      rounder(r=2,h=3,f=21);
      translate([-17.85/2,-21.9/2,-1])
      rotate([0,0,0])
      rounder(r=2,h=3,f=21);
      translate([17.85/2,-21.9/2,-1])
      rotate([0,0,90])
      rounder(r=2,h=3,f=21);
    }
    
    translate([0,0,-57.5])
    sphere(r=60,$fn=200);
  }
  
  // ball
  sphere(r=5.5,$fn=60);
  
  // paddle
  rotate([10*position,0,0])
  linear_extrude(height= 14.3, scale=[0.875,0.66])
  square([8,3],center=true);
    
}

//------------------------------------------------------------
module switchNut(){

  translate([0,0,3])
  cylinder(r=21/2,h=2,$fn=89);
  cylinder(r=21/2,h=5,$fn=6);
}

//====================================================================

switchPaddle();
color("gray")
translate([0,0,-8])
switchNut();

translate([22,0,0])
switchPaddle(position=-1);
color("gray")
translate([22,0,-12])
switchNut();

//====================================================================
