//=================================================================================
// tele.scad
//
// TelePrompter parts for the fluid head on tripod
//
// Dr Tom Flint, 25 May 2021
//=================================================================================

use <../Parts/rounder.scad>

//--------------------------------------------------------------------------------

topThick=3;
bridgeThick=3;
sideThick=3;
frontThick=3;
x1=2;   // offset for M3 attach points

$fn=89;

module bracket(){
  
  // top pads
  difference(){
    translate([-25.5,44,topThick])
    cube([51,28,topThick*2],center=true);
  
    translate([-50.5,30,0])
    scale([1.5,1,1])
    cylinder(r=23,h=30,center=true,$fn=222);
  }
  difference(){
    translate([-25.5,-44,topThick])
    cube([51,28,topThick*2],center=true);
  
    translate([-50.5,-30,0])
    scale([1.5,1,1])
    cylinder(r=23,h=30,center=true,$fn=222);
  }
  
  // top bridge
  translate([-8,0,bridgeThick/2+topThick])
  cube([16,100,bridgeThick],center=true);
  
  // sides
  difference(){
  color("orange")
    union(){
      translate([-41,55,-15])
      rotate([-90,0,0])
      cylinder(r=10,h=sideThick);

      translate([-25.5,55+sideThick/2,-8+bridgeThick/2+topThick/2])
      cube([51,sideThick,16+topThick+bridgeThick],center=true);

      translate([-4,50+sideThick,-8+bridgeThick/2+topThick/2])
      cube([8,sideThick*2,16+topThick+bridgeThick],center=true);
    }
    
    translate([-41,55,-15])
    rotate([-90,0,0])
    cylinder(r=9.3/2,h=sideThick*3,center=true);
  }  

  
  mirror([0,1,0])
  difference(){
  color("orange")
    union(){
      translate([-41,55,-15])
      rotate([-90,0,0])
      cylinder(r=10,h=sideThick);

      translate([-25.5,55+sideThick/2,-8+bridgeThick/2+topThick/2])
      cube([51,sideThick,16+topThick+bridgeThick],center=true);

      translate([-4,50+sideThick,-8+bridgeThick/2+topThick/2])
      cube([8,sideThick*2,16+topThick+bridgeThick],center=true);
    }
    
    translate([-41,55,-15])
    rotate([-90,0,0])
    cylinder(r=9.3/2,h=sideThick*3,center=true);
  }  
  
  // front plate
  color("green")
  difference(){
    union(){
      translate([frontThick/2,0,-0.5*(16+topThick+bridgeThick)+topThick+bridgeThick])
      cube([frontThick,110+2*sideThick,16+topThick+bridgeThick],center=true);
      
      translate([x1+frontThick/2, 55, -0.5*(16+topThick+bridgeThick)+topThick+bridgeThick])
      cylinder(r=frontThick,h=(16+topThick+bridgeThick),center=true);

      translate([x1+frontThick/2, -55, -0.5*(16+topThick+bridgeThick)+topThick+bridgeThick])
      cylinder(r=frontThick,h=(16+topThick+bridgeThick),center=true);
    }
    
    // holes for M3x30
    translate([x1+frontThick/2, 55, -0.5*(30+topThick+bridgeThick)+topThick+bridgeThick])
    cylinder(r=1.8,h=(40+topThick+bridgeThick),center=true);

    translate([x1+frontThick/2, -55, -0.5*(30+topThick+bridgeThick)+topThick+bridgeThick])
    cylinder(r=1.8,h=(40+topThick+bridgeThick),center=true);

/*
    translate([frontThick, -54, -22])
    rotate([0,0,90])
    rounder(r=3,h=30,f=89);

    translate([frontThick, 54, -22])
    rotate([0,0,180])
    rounder(r=3,h=30,f=89);
    */
    
    // arch cut
    translate([0, 0, -30])
    rotate([0,90,0])
    scale([1,1.8,1])
    cylinder(r=31,h=40,center=true,$fn=222);
  }
}
//------------------------------------------------------------------------------
module L1(){

  // post
  difference(){
    translate([3.5+frontThick/2, 56, -45+topThick+bridgeThick+4])
    cube([13,14,90],center=true);

    translate([0.5+frontThick/2, 56-3, -45+topThick+bridgeThick-29])
    cube([12,14,70],center=true);

    // M3 attach point
    translate([x1+frontThick/2, 55, -0.5*(40+topThick+bridgeThick)+topThick+bridgeThick+4])
    cylinder(r=1.8,h=(40+topThick+bridgeThick),center=true);
    
    // front plate
    union(){
      translate([frontThick/2+0.1-2,0,-0.5*(16.2+topThick+bridgeThick)+topThick+bridgeThick])
      cube([frontThick+0.2+4,110.2+2*sideThick,16.2+topThick+bridgeThick],center=true);
      
      translate([x1+frontThick/2+0.1, 55, -0.5*(16+topThick+bridgeThick)+topThick+bridgeThick])
      cylinder(r=frontThick+0.2,h=(16.2+topThick+bridgeThick),center=true);

      translate([x1+frontThick/2+0.1, -55, -0.5*(16+topThick+bridgeThick)+topThick+bridgeThick])
      cylinder(r=frontThick+0.2,h=(16.2+topThick+bridgeThick),center=true);
    }  
  }
  
  // foot
  difference(){
    union(){
      color("red")
      translate([62.5,61.5,-85])
      cube([120+8,3,10],center=true);
      
      color("green")
      translate([62.5,56,-81.5])
      cube([120+8,14,3],center=true);
      
      color("pink")
      translate([-1.5,60,-81.5-1.5])
      rotate([0,90,0])
      rotate([0,0,-90])
      rounder(h=120+8,r=6,f=89);
    }
    translate([40,54,-90])
    cylinder(r=1.8,h=30,center=true);
    translate([80,54,-90])
    cylinder(r=1.8,h=30,center=true);
    translate([120,54,-90])
    cylinder(r=1.8,h=30,center=true);
  }
  
  color("blue")
  translate([11.5, 63, -80])
  rotate([90,0,0])
  rotate([0,0,0])
  rounder(h=14,r=10,f=89);

  color("cyan")
  translate([8, 63-14, -80])
  rotate([0,0,180])
  rotate([90,0,0])
  rounder(h=14,r=10,f=89);

}
//=================================================================================


//bracket();

//L1();

mirror([0,1,0])
L1();

//=================================================================================
  
