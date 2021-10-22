//=================================================================================
// bigcam.scad
//
// For Raspberry Pi HQ Camera and Lenses
// - add a focus ring using continuous servo and worm gear
// - might need to use a pinion and regular gear since focus moves teeth
// - legos use a straight rack and helical worm so should be ok
//
// Dr Tom Flint, 19 Oct 2021
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>


//-----------------------------------------------------------------------------------
module hqcam(extraX=0){

  // foot
  difference(){
    translate([0,0,11.2/2])
    cube([11.5,13.97,11.2],center=true);

    translate([0,0,-1])
    cylinder(r=5/2,h=10.5+1,$fn=22);
  }
  hull(){
    translate([0,9,12.0])
    rotate([0,90,0])
    cylinder(r=4,h=11.5,$fn=23,center=true);
    translate([0,-9,12.0])
    rotate([0,90,0])
    cylinder(r=4,h=11.5,$fn=23,center=true);
    translate([0,0,7])
    cube([11.5,13.97,2],center=true);
  }
  color("red")
  translate([0,10.5,6])
  rotate([32,0,0])
  cylinder(r=2,h=2,$fn=22);
  color("orange")
  translate([0,-10.5,6])
  rotate([-32,0,0])
  cylinder(r=2,h=2,$fn=22);

  // top box
  translate([2.9,0,11.2+38])
  cube([5.2,10.3,8],center=true);

  // pcb
  color("green")
  translate([-11.5/2,0,11.2+38/2])
  difference(){
    cube([1.5,38,38],center=true);
  
    // mounting holes
    translate([0,38/2-4,38/2-4])
    rotate([0,90,0]){
      cylinder(r=2.5/2,h=3,$fn=23,center=true);
      translate([-4,4,-1.5])
      rotate([0,0,-90])
      rounder(r=4,h=3,f=23);
    }

    translate([0,-38/2+4,38/2-4])
    rotate([0,90,0]){
      cylinder(r=2.5/2,h=3,$fn=23,center=true);
      translate([-4,-4,-1.5])
      rotate([0,0,0])
      rounder(r=4,h=3,f=23);
    }

    translate([0,-38/2+4,-38/2+4])
    rotate([0,90,0]){
      cylinder(r=2.5/2,h=3,$fn=23,center=true);
      translate([4,-4,-1.5])
      rotate([0,0,90])
      rounder(r=4,h=3,f=23);
    }

    translate([0,38/2-4,-38/2+4])
    rotate([0,90,0]){
      cylinder(r=2.5/2,h=3,$fn=23,center=true);
      translate([4,4,-1.5])
      rotate([0,0,180])
      rounder(r=4,h=3,f=23);
    }

  }
  // pcb backside components
  translate([-11.5/2,0,11.2+38/2]){
  color("pink")
    translate([-2.25,38/2-7,0])
    rotate([0,90,0])
    cylinder(r=3.6/2,h=3,$fn=23,center=true);
    color("pink")
    translate([-2.25,-38/2+7,0])
    rotate([0,90,0])
    cylinder(r=3.6/2,h=3,$fn=23,center=true);
    // cable
    color("red")
    translate([-2.25,0,-38/2+4])
    cube([2.8,21,8],center=true);
  }
  
  // body
  difference(){
    union(){
      color("gray")
      translate([0.25,0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=35/2,h=10.5,$fn=189,center=true);

      color("gray")
      translate([0.25+extraX,0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=26/2,h=10.5+extraX,$fn=189,center=true);

      color("cyan")
      translate([(10.5+1.35)/2+0.25+extraX,0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=36/2,h=1.35,$fn=189,center=true);
    }
    color("blue")
    translate([(10.5+1.35)/2+0.25-3.25+extraX,0,11.2+38/2])
    rotate([0,90,0])
    cylinder(r=22.4/2,h=8+extraX,$fn=189,center=true);
  }

}
//-----------------------------------------------------------------------------------
module shortLens(extraX=0,focus=1.5){

  difference(){
    union(){
      color("orange")
      translate([(10.5+1.35)/2+0.25+extraX,0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=30.0/2,h=9.8,$fn=189);

      color("gray")
      translate([(10.5+1.35)/2+0.25+extraX+9.8,0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=28.5/2,h=focus,$fn=189);

      color("gray")
      translate([(10.5+1.35)/2+0.25+extraX+9.8+focus, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=30/2,h=8,$fn=189);

      color("gray")
      translate([(10.5+1.35)/2+0.25+extraX+9.8+focus+8, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=28.5/2,h=1.5,$fn=189);

      color("gray")
      translate([(10.5+1.35)/2+0.25+extraX+9.8+focus+8+1.5, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=30/2,h=9,$fn=189);
    }

    color("blue")
    translate([(10.5+1.35)/2+0.25+extraX,0,11.2+38/2])
    rotate([0,90,0])
    cylinder(r=18/2,h=33,$fn=189);

    color("blue")
    translate([(10.5+1.35)/2+0.25+extraX+27.5,0,11.2+38/2])
    rotate([0,90,0])
    cylinder(r=26/2,h=2.5,$fn=189);
  }    
    
}

//=================================================================================

x1=2.0;
x2=1.5;

hqcam(extraX=x1);
shortLens(extraX=x1,focus=x2);

//=================================================================================

