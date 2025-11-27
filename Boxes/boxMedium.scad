//=================================================================================
// boxMedium.scad
//
// Decorative "brass" trim for the Medium Size boxes.
// Cleaned up from boxCorners4.scad.
// 
// Dr Tom Flint, 27 Nov 2025
//  
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>
use <../Fractals/Lsystem.scad>

$fn=8;

// medium box
  xbox=100.5;  
  ybox=75.5;  
  ztop=26;
  zbase=54;
  zfoot=10;
  baseScale=0.65;
  baseWide=0.3;
  railThick=2.1;
  railWide=6;
  panelThick=0.9;
  panelCut=-55;
  gap=0.1;

//-----------------------------------------------------------------------------------
// Single piece top frame
module top2(){

extra=2.0;

    // front rail
    difference(){
      union(){
        // front rail
        translate([-xbox-railThick,-ybox-railThick, zbase+ztop-railWide+railThick])
        cube([2*xbox+2*railThick,railThick,railWide]);
        translate([-xbox-railThick,-ybox-railThick, zbase+ztop])
        cube([2*xbox+2*railThick,railWide,railThick]);

        // left rail
        translate([-xbox-railThick,-ybox-railThick, zbase+ztop-railWide+railThick])
        cube([railThick,2*ybox+2*railThick,railWide]);
        translate([-xbox-railThick,-ybox-railThick, zbase+ztop])
        cube([railWide,2*ybox+2*railThick,railThick]);
        
        // left front post
        translate([-xbox-railThick,-ybox-railThick, zbase])
        cube([railWide,railThick,ztop-railWide+railThick]);
        translate([-xbox-railThick,-ybox-railThick, zbase])
        cube([railThick,railWide,ztop-railWide+railThick]);

        // right front post
        mirror([1,0,0]){
          translate([-xbox-railThick,-ybox-railThick, zbase])
          cube([railWide,railThick,ztop-railWide+railThick]);
          translate([-xbox-railThick,-ybox-railThick, zbase])
          cube([railThick,railWide,ztop-railWide+railThick]);
        }

        // backside 
        rotate([0,0,180]){
          // front rail
          translate([-xbox-railThick,-ybox-railThick, zbase+ztop-railWide+railThick])
          cube([2*xbox+2*railThick,railThick,railWide]);
          translate([-xbox-railThick,-ybox-railThick, zbase+ztop])
          cube([2*xbox+2*railThick,railWide,railThick]);

          // left rail
          translate([-xbox-railThick,-ybox-railThick, zbase+ztop-railWide+railThick])
          cube([railThick,2*ybox+2*railThick,railWide]);
          translate([-xbox-railThick,-ybox-railThick, zbase+ztop])
          cube([railWide,2*ybox+2*railThick,railThick]);
          
          // left front post
          translate([-xbox-railThick,-ybox-railThick, zbase])
          cube([railWide,railThick,ztop-railWide+railThick]);
          translate([-xbox-railThick,-ybox-railThick, zbase])
          cube([railThick,railWide,ztop-railWide+railThick]);

          // right front post
          mirror([1,0,0]){
            translate([-xbox-railThick,-ybox-railThick, zbase])
            cube([railWide,railThick,ztop-railWide+railThick]);
            translate([-xbox-railThick,-ybox-railThick, zbase])
            cube([railThick,railWide,ztop-railWide+railThick]);
          }
        }
      }
      // front bevel
      translate([-xbox-railThick,-ybox-railThick-railWide, zbase+ztop+1*railThick])
      rotate([-45,0,0])
      cube([2*xbox+2*railThick,railWide,railWide]);

      // left bevel
      translate([-xbox-railThick-railWide,-ybox-railThick, zbase+ztop+1*railThick])
      rotate([0,45,0])
      cube([railWide,2*ybox+2*railThick,railWide]);

      // left front post bevel
      translate([-xbox-1.25*railThick,-ybox-railThick-railWide, zbase-railWide+railThick])
      rotate([0,0,45])
      cube([railWide,railWide,ztop+railWide]);

      // right front post bevel
      mirror([1,0,0]){
        translate([-xbox-1.25*railThick,-ybox-railThick-railWide, zbase-railWide+railThick])
        rotate([0,0,45])
        cube([railWide,railWide,ztop+railWide]);
      }

      rotate([0,0,180]){
        // front bevel
        translate([-xbox-railThick,-ybox-railThick-railWide, zbase+ztop+1*railThick])
        rotate([-45,0,0])
        cube([2*xbox+2*railThick,railWide,railWide]);

        // left bevel
        translate([-xbox-railThick-railWide,-ybox-railThick, zbase+ztop+1*railThick])
        rotate([0,45,0])
        cube([railWide,2*ybox+2*railThick,railWide]);

        // left front post bevel
        translate([-xbox-1.25*railThick,-ybox-railThick-railWide, zbase-railWide+railThick])
        rotate([0,0,45])
        cube([railWide,railWide,ztop+railWide]);

        // right front post bevel
        mirror([1,0,0]){
          translate([-xbox-1.25*railThick,-ybox-railThick-railWide, zbase-railWide+railThick])
          rotate([0,0,45])
          cube([railWide,railWide,ztop+railWide]);
        }
      }
    }      
}    


//-----------------------------------------------------------------------------------
module base1(){
  
  // This part makes just 1 corner, add mirrors with if(1) below
  // front left
  postBase();
  panel();
  
  translate([-xbox,-ybox,0])
  rotate([0,0,-90])
  mirror([1,0,0])
  translate([xbox,ybox,0])
  panel();
  
if(1){  
  // Turn on/off the mirrors for other 3 corners
  // front right
  mirror([1,0,0]){
    postBase();
    panel();

    translate([-xbox,-ybox,0])
    rotate([0,0,-90])
    mirror([1,0,0])
    translate([xbox,ybox,0])
    panel();
  }
  
  // rear is rotation of front
  rotate([0,0,180]){
    postBase();
    panel();
    
    translate([-xbox,-ybox,0])
    rotate([0,0,-90])
    mirror([1,0,0])
    translate([xbox,ybox,0])
    panel();
    
    mirror([1,0,0]){
      postBase();
      panel();

      translate([-xbox,-ybox,0])
      rotate([0,0,-90])
      mirror([1,0,0])
      translate([xbox,ybox,0])
      panel();
    }
  }
}

}

//--------------------------------------------------------------------------------------
module postBase(){

gap=0.1;

  difference(){
    union(){
      // post along base
      translate([-xbox-railThick,-ybox-railThick, 0])
      cube([railWide,railThick,zbase]);
      translate([-xbox-railThick,-ybox-railThick, 0])
      cube([railThick,railWide,zbase]);
      // feet
      translate([-xbox-railThick,-ybox-railThick, -zfoot])
      cube([2*railWide,railThick,zfoot]);
      translate([-xbox-railThick,-ybox-railThick, -zfoot])
      cube([railThick,2*railWide,zfoot]);
      // backside fillet
      translate([-xbox,-ybox, -zfoot])
      rotate([0,0,0])
      rounder(r=4,h=zfoot,f=55);
      // nailing tab
      translate([-xbox-railThick,-ybox-railThick,-railThick])
      cube([2*railWide,2*railWide,railThick]);
    }
    // bevel cut
    translate([-xbox-1.0*railThick,-ybox-railThick-railWide, -zfoot-1])
    rotate([0,0,45])
    cube([railWide,railWide,zbase+zfoot+1]);
    // front cut for panels
    translate([-xbox+railThick,-ybox-panelThick-0.1, 0])
    cube([railWide,panelThick+0.1,zbase]);
    // side cut for panels
    translate([-xbox-panelThick-0.1,-ybox+railThick, 0])
    cube([panelThick+0.1,railWide,zbase]);
    // cuts on feet
    translate([-xbox-railThick+2*railWide,-ybox+railThick, -zfoot])
    rotate([90,0,0])
    scale([0.7,1,1])
    cylinder(r=zfoot-railThick,h=10,$fn=99);
    translate([-xbox-2*railThick,-ybox+2*railWide-railThick, -zfoot])
    rotate([0,90,0])
    scale([1,0.7,1])
    cylinder(r=zfoot-railThick,h=10,$fn=99);

    // nailing tab
    translate([-xbox+railThick,-ybox+railThick,-railThick])
    cylinder(r=0.4,h=10,center=true,$fn=44);
    translate([-xbox+2*railWide-railThick,-ybox+2*railWide-railThick,-railThick-1])
    rotate([0,0,180])
    rounder(r=1.5*railWide,h=10,f=66);
  
  }

}

//--------------------------------------------------------------------------------------
module panel(){

  // frame
  difference(){
    union(){
      translate([-xbox+railThick+0.2,-ybox-panelThick, -railThick])
      cube([railWide-0.2,panelThick,zbase]);
      translate([-xbox+railThick+0.2,-ybox-panelThick, -railThick])
      cube([zbase+railThick-0.2,panelThick,railWide]);
      // bottom lip
      translate([-xbox+2*railThick+railWide,-ybox, -railThick])
      cube([zbase+railThick-railWide,railThick,railThick]);
    }
    translate([panelCut,-ybox-10,-railThick-1])
    cube([xbox+panelCut,20,railWide+2]);
    
    translate([-xbox+railWide+railThick,-ybox+1,zbase-railThick])
    rotate([90,0,0])
    rotate([0,0,180])
    rounder(r=railWide,h=10,f=88);
    
    // nailing tab of the post
    translate([-xbox-railThick,-ybox-railThick,-railThick])
    cube([2*railWide+0.2,2*railWide,railThick+0.2]);

  }
  
  // fractal
  intersection(){
    translate([-xbox,-ybox-panelThick,0])
    rotate([-90,0,0])
    linear_extrude(height=panelThick)
    scale([10*baseScale,10*baseScale])
    penrose_tiling(n=4, w=0.3);   // Recommended n <= 6

    translate([-xbox+railWide,-ybox-2*panelThick,railWide-2*railThick])
    cube([zbase-railWide,3*panelThick,zbase-railWide]);
  }

  // tab for nailing
  difference(){
    intersection(){
      translate([-xbox-panelCut-10-2*railWide,-ybox, -railThick])
      cube([2*railWide,2*railWide,railThick]);
      translate([-xbox-panelCut-10-railWide,-ybox+railThick, -railThick])
      cylinder(r=railWide,h=railThick,$fn=77);
    }
    translate([-xbox-panelCut-10-railWide,-ybox+railWide/2, -railThick])
    cylinder(r=0.5,h=3*railThick,$fn=77);
  }
  
}

//--------------------------------------------------------------------------------------
module panelTop(){

mag=2;

  // frame
  difference(){
    union(){
      translate([-xbox+railThick+0.2,-ybox-panelThick, -railThick])
      cube([railWide-0.2,panelThick,mag*zbase]);
      translate([-xbox+railThick+0.2,-ybox-panelThick, -railThick])
      cube([mag*(zbase+railThick-0.2),panelThick,railWide]);
    }
    
    translate([-xbox+railWide+railThick+106,-ybox+1,zbase-railThick-48])
    rotate([90,0,0])
    rotate([0,0,180])
    rounder(r=railWide,h=10,f=88);
        
    translate([-xbox+railWide+railThick,-ybox+1,zbase-railThick+54])
    rotate([90,0,0])
    rotate([0,0,180])
    rounder(r=railWide,h=10,f=88);
    
  }
  
  // fractal
  intersection(){
    translate([-xbox,-ybox-panelThick,0])
    rotate([-90,0,0])
    linear_extrude(height=panelThick)
    scale([12*baseScale,12*baseScale])
    penrose_tiling(n=5, w=0.3);   // Recommended n <= 6

    translate([-xbox+railWide,-ybox-2*panelThick,railWide-2*railThick])
    cube([2*zbase-railWide,3*panelThick,2*zbase-railWide]);
  }

  
}

//-----------------------------------------------------------------------------------
// This is the box itself
module boxTop(a=0,tol=0){

translate([-xbox-tol,-ybox-tol,zbase-tol])
translate([0,-2,0])
rotate([a,0,0])
translate([0,2,0])
cube([2*xbox+2*tol,2*ybox+2*tol,ztop+2*tol]);

// front latch
translate([0,ybox+5,zbase+15/2])
cube([30,10,15],center=true);

// back hinges
translate([60,-ybox-5,zbase+15/2])
cube([30,5,15],center=true);
translate([-60,-ybox-5,zbase+15/2])
cube([30,5,15],center=true);

}

//-----------------------------------------------------------------------------------
// This is the box itself
module boxBase(tol=0){

translate([0,0,zbase/2])
cube([2*xbox+2*tol,2*ybox+2*tol,zbase+2*tol],center=true);

// front latch
translate([0,ybox+5,zbase-24/2])
cube([30,10,24],center=true);

// back hinges
translate([60,-ybox-5,zbase-15/2])
cube([30,5,15],center=true);
translate([-60,-ybox-5,zbase-15/2])
cube([30,5,15],center=true);

}

//================================================================================

// For printing, 4x postBase, 4x panel, 4x mirror panel, 1x top2
//~ postBase();
//~ top2();
//~ panel();

//~ mirror([1,0,0])
//~ panel();

//~ panelTop();

// For Design

// Show the box itself
if(1){
  color("cyan")
  boxTop(a=0);

  color("green")
  boxBase();
}

// Show the trim
if(1){
  top2();
  base1();
}

// Add a topside corner protector where the velvet paper gets worn out
if(1){
  translate([0,-ybox,5])
  rotate([-90,0,0])
  panelTop();
}

//================================================================================

