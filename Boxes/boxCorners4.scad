//=================================================================================
// boxCorners2.scad
//
// For Fairy Crystal storage box.
// Adjusted for the small boxes.
//
// Dr Tom Flint, 1 Jan 2023
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>
use <../Fractals/Lsystem.scad>


r1=4;   // radius of knob
$fn=8;


// medium box
//if(1){
  xbox=100;  
  ybox=75;  
  ztop=26;
  zbase=54;
  baseScale=0.7;
  baseWide=0.3;
  railThick=1.5;
  railWide=5;
  panelThick=0.9;
  panelCut=-zbase+2.5;
//}

// small box
if(0){
  xbox=75;  
  ybox=50;  
  ztop=25;
  zbase=30;
  baseScale=0.4;
  baseWide=0.2;
}


//--------------------------------------------------------------------------------------
module postBall(){

  difference(){
    translate([-xbox+railThick,-ybox+railThick, zbase+ztop-railWide+railThick])
    cylinder(r=railWide,h=railWide+railThick,$fn=88);
    
    railFront(tol=0.15);
    railSide(tol=0.15);
    postTop();
    translate([-xbox-railThick,-ybox-railThick, zbase+ztop-railWide])
    cube([2*railWide,2*railWide,railWide+railThick]);
  }
  
  translate([-xbox+railThick,-ybox+railThick, zbase+ztop+2*railThick])
  cylinder(r1=railWide,r2=railWide-railThick,h=railThick,$fn=88);
}

//--------------------------------------------------------------------------------------
module postTop(){

gap=0.1;

  difference(){
    union(){
      translate([-xbox-railThick,-ybox-railThick, zbase])
      cube([railWide,railThick,ztop-railWide+railThick-gap]);
      translate([-xbox-railThick,-ybox-railThick, zbase])
      cube([railThick,railWide,ztop-railWide+railThick-gap]);
      translate([-xbox-railThick,-ybox-railThick, zbase+ztop-railWide+railThick-gap])
      cube([railThick,railThick,railWide]);
    }
    // bevel cut
    translate([-xbox-1.5*railThick,-ybox-1.5*railThick-railWide, zbase-railWide+railThick-gap])
    rotate([0,0,45])
    cube([railWide,railWide,ztop-railThick]);
  }
}

//--------------------------------------------------------------------------------------
module railFront(tol=0){
  
    difference(){
      union(){
        // main L rail
        translate([-xbox,-ybox-railThick, zbase+ztop-railWide+railThick])
        cube([2*xbox,railThick,railWide]);
        translate([-xbox,-ybox-railThick, zbase+ztop])
        cube([2*xbox,railWide,railThick]);
      }
      // bevel cut
      translate([-xbox+railThick,-ybox-railThick-railWide, zbase+ztop+2*railThick])
      rotate([-45,0,0])
      cube([2*xbox-2*railThick,railWide,railWide]);

      // 45 cut for corners
      translate([-xbox-0.707*2*railWide,-ybox+0.707*2*railWide, zbase+ztop-railWide+2*railThick])
      rotate([0,0,45])
      cube([4*railWide,4*railWide,4*railWide],center=true);
      translate([xbox+0.707*2*railWide,-ybox+0.707*2*railWide, zbase+ztop-railWide+2*railThick])
      rotate([0,0,45])
      cube([4*railWide,4*railWide,4*railWide],center=true);
    }
    // retainer tabs
    translate([-xbox-tol/2,-ybox-2*railThick-tol/2, zbase+ztop-railWide+railThick-tol/2])
    cube([railThick+tol,2*railThick+tol,railWide+tol]);
    translate([ xbox-railThick-tol/2,-ybox-2*railThick-tol/2, zbase+ztop-railWide+railThick-tol/2])
    cube([railThick+tol,railThick+tol,railWide+tol]);

}
//--------------------------------------------------------------------------------------
module railSide(tol=0){
  
    difference(){
      union(){
        // main L rail
        translate([-xbox-railThick,-ybox, zbase+ztop-railWide+railThick])
        cube([railThick,2*ybox,railWide]);
        translate([-xbox-railThick,-ybox, zbase+ztop])
        cube([railWide,2*ybox,railThick]);
      }
      // bevel cut
      translate([-xbox-railThick-railWide,-ybox+railThick, zbase+ztop+2*railThick])
      rotate([0,45,0])
      cube([railWide,2*ybox-2*railThick,railWide]);
      
      // 45 cut for corners
      translate([-xbox+0.707*2*railWide,-ybox-0.707*2*railWide, zbase+ztop-railWide+2*railThick])
      rotate([0,0,45])
      cube([4*railWide,4*railWide,4*railWide],center=true);
      translate([-xbox+0.707*2*railWide,ybox+0.707*2*railWide, zbase+ztop-railWide+2*railThick])
      rotate([0,0,45])
      cube([4*railWide,4*railWide,4*railWide],center=true);
    }
    // retainer tabs
    translate([-xbox-2*railThick-tol/2,-ybox-tol/2, zbase+ztop-railWide+railThick-tol/2])
    cube([railThick+tol,railThick+tol,railWide+tol]);
    translate([-xbox-2*railThick-tol/2,ybox-railThick-tol/2, zbase+ztop-railWide+railThick-tol/2])
    cube([railThick+tol,railThick+tol,railWide+tol]);

}

//-----------------------------------------------------------------------------------
module top1(){

extra=2.0;

    railFront();
    railSide();
    postTop();
    postBall();
    
    rotate([0,0,180]){
      railFront();
      railSide();
      postTop();
      postBall();
    }
    
    mirror([1,0,0]){
      postTop();
      postBall();
    }

    mirror([0,1,0]){
      postTop();
      postBall();
    }
}

//-----------------------------------------------------------------------------------
module base1(){
  
  // front left
  postBase();
  panel();
  
  translate([-xbox,-ybox,0])
  rotate([0,0,-90])
  mirror([1,0,0])
  translate([xbox,ybox,0])
  panel();
  
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

//--------------------------------------------------------------------------------------
module postBase(){

gap=0.1;

  difference(){
    union(){
      translate([-xbox-railThick,-ybox-railThick, 0])
      cube([railWide,railThick,zbase]);
      translate([-xbox-railThick,-ybox-railThick, 0])
      cube([railThick,railWide,zbase]);
    }
    // bevel cut
    translate([-xbox-1.5*railThick,-ybox-1.5*railThick-railWide, 0])
    rotate([0,0,45])
    cube([railWide,railWide,zbase]);
    // front cut for panels
    translate([-xbox+railThick,-ybox-panelThick-0.1, 0])
    cube([railWide,panelThick+0.1,zbase]);
    // side cut for panels
    translate([-xbox-panelThick-0.1,-ybox+railThick, 0])
    cube([panelThick+0.1,railWide,zbase]);
  }
}

//--------------------------------------------------------------------------------------
module panel(){

  // frame
  difference(){
    union(){
      translate([-xbox+railThick+0.2,-ybox-panelThick, -railThick])
      cube([railWide-0.2,panelThick,zbase+railThick]);
      translate([-xbox+railThick+0.2,-ybox-panelThick, -railThick])
      cube([zbase+railThick-0.2,panelThick,railWide]);
      // bottom lip
      translate([-xbox+railThick+railWide/2,-ybox, -railThick])
      cube([zbase+railThick-railWide,railThick,railThick]);
    }
    translate([panelCut,-ybox-10,-railThick])
    cube([20,20,railWide]);
  }
  
  // fractal
  intersection(){
    translate([-xbox,-ybox-panelThick,0])
    rotate([-90,0,0])
    linear_extrude(height=panelThick)
    scale([10*baseScale,10*baseScale])
    penrose_tiling(n=4, w=0.3);   // Recommended n <= 6

    translate([-xbox+railWide,-ybox-2*panelThick,railWide-2*railThick])
    cube([zbase-railWide,2*panelThick,zbase-railWide]);
  }

  // tab for nailing
  difference(){
    intersection(){
      translate([-xbox-panelCut-13,-ybox, -railThick])
      cube([2*railWide,2*railWide,railThick]);
      translate([-xbox-panelCut-13+railWide,-ybox, -railThick])
      cylinder(r=railWide,h=railThick,$fn=77);
    }
    translate([-xbox-panelCut-13+railWide,-ybox+railWide/2, -railThick-1])
    cylinder(r=0.5,h=3*railThick,$fn=77);
  }
  
}


//-----------------------------------------------------------------------------------
module base2(tol=0){

extra=0.5;
foot=10;
thick=0.9;

  translate([xbox,ybox,0])
  rotate([-90,0,0])
  intersection(){
    linear_extrude(height=thick+tol)
    scale([10*baseScale,10*baseScale])
    rotate(10)
    offset(tol)
    penrose_tiling(n=4, w=baseWide);   // Recommended n <= 6

    translate([-ybox,-ybox,-1])
    cube([ybox,ybox,2]);
  }

  translate([xbox-64*baseScale,ybox,0])
  cube([64*baseScale,0.9,3*baseScale]);  

  translate([xbox-3,ybox,0])
  cube([3*baseScale,0.9,67*baseScale]);  

  // tab under box
  difference(){
    union(){
      translate([xbox-66*baseScale,ybox-4+0.9, -1.1])
      cube([33*baseScale,4,1.2]);                        // baseScale didn't work here
      translate([xbox-56*baseScale,ybox-4+0.9, -1.1])
      cylinder(r=4,h=1.2,$fn=88);
    }
      translate([xbox-56*baseScale,ybox-4+0.9, -1.1])
    cylinder(r=0.7,h=8,center=true,$fn=88);
  }
}

//-----------------------------------------------------------------------------------
module base3(tol=0){

extra=0.5;
foot=10;
thick=0.9;


  translate([xbox,ybox,0])
  rotate([0,90,0])
  intersection(){
    linear_extrude(height=thick+tol)
    scale([10*baseScale,10*baseScale])
    rotate(10)
    offset(tol)
    penrose_tiling(n=4, w=baseWide);   // Recommended n <= 6

    translate([-ybox,-ybox,-1])
    cube([ybox,ybox,2]);
  }

  translate([xbox,ybox-66*baseScale,0])
  cube([0.9,66*baseScale,3*baseScale]);  

  translate([xbox,ybox-3*baseScale,0])
  cube([0.9,3*baseScale,67.7*baseScale]);  

  // tab under box
  difference(){
    union(){
      translate([xbox-4+0.9,ybox-34*baseScale-13.2, -1.1])    // baseScale not working
      cube([4,34*baseScale,1.2]);
      translate([xbox-4+0.9,ybox-34*baseScale-9.2, -1.1])
      cylinder(r=4,h=1.2,$fn=88);
    }
    translate([xbox-4+0.9,ybox-34*baseScale-9.2, -1.1])
    cylinder(r=0.7,h=8,center=true,$fn=88);
  }
}

//-----------------------------------------------------------------------------------
module boxTop(a=0,tol=0){

translate([-xbox-tol,-ybox-tol,zbase-tol])
translate([0,-2,0])
rotate([a,0,0])
translate([0,2,0])
cube([2*xbox+2*tol,2*ybox+2*tol,ztop+2*tol]);

}

//-----------------------------------------------------------------------------------
module boxBase(tol=0){

translate([0,0,zbase/2])
cube([2*xbox+2*tol,2*ybox+2*tol,zbase+2*tol],center=true);

}

//================================================================================


//    railFront();
//    railSide();
//    postTop();
//    postBall();


if(0){
  color("cyan")
  boxTop(a=0);

  color("green")
  boxBase();
}

if(1){
  //top1();
  base1();
  //base2();
  //base3();
}


if(0){
  mirror([1,0,0])
  top1();
  mirror([1,0,0])
  base1();

  mirror([1,0,0])
  base2();
  mirror([1,0,0])
  base3();
}

if(0){
  rotate([0,0,180]){
    top1();
    base1();
    base2();
    base3();
    mirror([1,0,0])
    top1();
    mirror([1,0,0])
    base1();
    mirror([1,0,0])
    base2();
    mirror([1,0,0])
    base3();
  }
}

//================================================================================

