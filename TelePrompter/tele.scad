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


//-----------------------------------------------------------------------
module bridge2(){
  
  // top pads
  translate([-8,40,topThick])
  cube([16,20,topThick*2],center=true);
  
  translate([-8,-40,topThick])
  cube([16,20,topThick*2],center=true);  
  
  // pegs into the side panels
  color("red")
  translate([-8,51,topThick])
  cube([10,14,topThick],center=true);

  color("red")
  translate([-8,-51,topThick])
  cube([10,14,topThick],center=true);
  
  
  // support for lens tunnel
  difference(){
    union(){
      // top bridge
      translate([-8,0,bridgeThick/2+topThick])
      cube([16,100-16,bridgeThick],center=true);

      hull(){
        translate([-16,16,29])
        rotate([0,90,0])
        cylinder(r=40/2+2,h=16,$fn=333);
        
        translate([-8,16,5])
        cube([16,64,1],center=true);
      }
      
      // flange around lens hole
      difference(){
        translate([-1.2,16,29])
        rotate([0,90,0])
        cylinder(r=42/2+6,h=1.2,$fn=333);
      
        translate([-8,0,topThick/2])
        cube([18,100-30,topThick],center=true);
      }            
      
    }
    // lens bore
    translate([-17,16,29])
    rotate([0,90,0])
    cylinder(r=42/2,h=18,$fn=333);

    // smaller holes down low
    translate([-17,16-23,12])
    rotate([0,90,0])
    cylinder(r=4,h=18);
    translate([-17,16+23,12])
    rotate([0,90,0])
    cylinder(r=4,h=18);
  }  

  // text
  color("red")
  translate([-8,-33,4.5])
  rotate([0,0,-90])
  linear_extrude(height=2)
  text("Flint", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.2);

}
  

//-----------------------------------------------------------------------
module bracket2(){
  
  // sides
  difference(){
    union(){      
      hull(){
        // around the screw
        translate([-41,55,-15])
        rotate([-90,0,0])
        cylinder(r=10,h=sideThick);

        // vertical side plate
        translate([-8,55+sideThick/2,bridgeThick/2+topThick/2])
        cube([16,sideThick,160+topThick+bridgeThick],center=true);

      }
      // top reinforce 
      color("pink")
      translate([-8,50+sideThick-3,85])
      rotate([-90,0,0])
      cylinder(r=8,8);

      // reinforce around the screw
      color("cyan")
      translate([-41,55-2.5,-15])
      rotate([-90,0,0])
      difference(){
        cylinder(r=10,h=sideThick+2.5);
        cylinder(r=17.5/2,h=sideThick+10,center=true);
      }
      
      // rib lower back
      color("pink")
      translate([-32.5,53.75,-52+bridgeThick/2+topThick/2])
      rotate([0,-29.3,0])
      cube([1.5,2.5,63.5+topThick+bridgeThick],center=true);

      // rib central
      color("blue")
      translate([-29,53.75,-0.25])
      rotate([0,68,0])
      cube([1.5,2.5,29],center=true);

      // junction box for the bridge
      color("red")
      translate([-8,50+sideThick,-4+bridgeThick/2+topThick/2])
      cube([16,sideThick*2,8+topThick+bridgeThick],center=true);
     
      // front rib
      color("green")
      translate([-2,50+sideThick,bridgeThick/2+topThick/2])
      cube([4,sideThick*2,160+topThick+bridgeThick],center=true);

      // lower reinforce
      color("blue")
      translate([-8,50+sideThick+1,-80])
      rotate([90,0,0])
      cylinder(r=8,h=sideThick*2+2,center=true);

      // rib upper back
      color("pink")
      translate([-32.3,53.75,37.5])
      rotate([0,19.5,0])
      cube([1.5,2.5,101],center=true);
      
      // leg I-beam
      color("orange")
      translate([60,50+sideThick+1,-77])
      cube([135,sideThick*2+2,2],center=true);
      translate([60,50+sideThick+1,-87])
      cube([135,sideThick*2+2,2],center=true);      
      color("red")
      translate([60,56.5,-82])
      cube([135,3,10],center=true);
      // leg tip reinforce
      color("blue")
      translate([127,50+sideThick+1,-82])
      rotate([90,0,0])
      cylinder(r=6,h=sideThick*2+2,center=true);
  
    }
  
    
    // mount hole for the 3/8 screw to fluid head
    translate([-41,55,-15])
    rotate([-90,0,0])
    cylinder(r=9.3/2,h=sideThick*4,center=true);

    // pegs of the bridge
    color("red")
    translate([-8,51,topThick])
    cube([10.2,14.1,topThick+0.2],center=true);

    // top hole for unknown mounts
    translate([-8,50+sideThick-3,85])
    rotate([-90,0,0])
    cylinder(r=3,h=22,center=true);

    // hole in leg tip
    translate([127,50+sideThick+1,-82])
    rotate([90,0,0])
    cylinder(r=3,h=sideThick*2+4,center=true);

    // hole in leg base
    translate([-8,50+sideThick+1,-80])
    rotate([90,0,0])
    cylinder(r=3,h=sideThick*2+4,center=true);

    // material reduce
    hull(){
      translate([-18,55,-22])
      rotate([-90,0,0])
      cylinder(r=10,h=sideThick*3,center=true);
      
      translate([-11,55,-60])
      rotate([-90,0,0])
      cylinder(r=3,h=sideThick*3,center=true);
    }

    hull(){
      translate([-20,55,20])
      rotate([-90,0,0])
      cylinder(r=10,h=sideThick*3,center=true);
      
      translate([-13,55,63])
      rotate([-90,0,0])
      cylinder(r=3,h=sideThick*3,center=true);
    }

  }  

  // main fillet in the L
  translate([0,58,-76])
  rotate([90,0,0])
  rounder(r=10,h=sideThick*2+2,f=89);

  
}
//------------------------------------------------------------------------------
//=================================================================================


color("gray")
bridge2();

color("cyan")
bracket2();

color("cyan")
mirror([0,1,0])
bracket2();

//=================================================================================
  
