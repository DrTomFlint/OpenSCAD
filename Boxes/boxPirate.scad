//=================================================================================
// boxPirate.scad
//
// For Fairy Crystal storage box.
//
// Dr Tom Flint, 27 Jan 2023
//
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>
use <../Fractals/Lsystem.scad>

use <../Trace/FlyingF.scad>
use <../Trace/FlyingFaround.scad>


//----------------------------------------------------------------------------------
module wingedF(){

      translate([3,0,0])
      scale([200,200,2.1])
      intersection(){
        FlyingF();
        cube([0.7,0.7,6],center=true);
      }


}
//----------------------------------------------------------------------------------
module wingedFa(){

      translate([3,0,0])
      scale([200,200,1.2])
      intersection(){
        FlyingF();
        cube([0.7,0.7,6],center=true);
      }


}
//----------------------------------------------------------------------------------
module wingedFb(){

      translate([3,0,1.2])
      scale([200,200,2.1-1.2])
      intersection(){
        FlyingF();
        cube([0.7,0.7,6],center=true);
      }


}

//----------------------------------------------------------------------------------
module backing(){

  difference(){
      translate([3,0,0])
      scale([200,200,1.2])
      intersection(){
        FlyingFaround();
        cube([0.7,0.7,6],center=true);
      }

    wingedF();
  }

}

//----------------------------------------------------------------------------------
module backing2(){

  // fractal
  intersection(){
    translate([0,-10,-2])
    rotate([0,0,90])
    linear_extrude(height=2)
    scale([4,4])
    penrose_tiling(n=5, w=0.3);   // Recommended n <= 6

    translate([0,5,0])
    cube([120,60,10],center=true);
  }


}



//----------------------------------------------------------------------------------
module lidPirate(){

  translate([0,0,-50])
  difference(){
    rotate([0,90,0])
    cylinder(r=150,h=310,$fn=199,center=true);

    translate([0,0,35])
    cube([320,302,70],center=true);

    translate([0,0,-90])
    cube([320,302,200],center=true);
  }

  translate([0,0,10])
  cube([310,266,20],center=true);
}

//----------------------------------------------------------------------------------
module boxPirate(){

  translate([0,0,-190/2])
  cube([310,266,190],center=true);
}


//----------------------------------------------------------------------------------
module flints2(){

  difference(){
    hull(){
      translate([100,0,0])
      cylinder(r=10,h=1.2,$fn=88);
      translate([-100,0,0])
      cylinder(r=10,h=1.2,$fn=88);
    }
    hull(){
      translate([100,0,-1])
      cylinder(r=8,h=3,$fn=88);
      translate([-100,0,-1])
      cylinder(r=8,h=3,$fn=88);
    }
  }

  difference(){
    intersection(){
      translate([0,0,0])
      rotate([0,0,90])
      linear_extrude(height=1.2)
      scale([3,6.5])
      penrose_tiling(n=6, w=0.3);   // Recommended n <= 6

      hull(){
        translate([100,0,-1])
        cylinder(r=8,h=3,$fn=88);
        translate([-100,0,-1])
        cylinder(r=8,h=3,$fn=88);
      }
    }
    
    color("red")
    translate([0,-1,0])
    linear_extrude(height=2.4)
    text("Flint's  Finest  Fairy  Crystals", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);
  }
}
//----------------------------------------------------------------------------------
module flints(){

  difference(){
    hull(){
      translate([70,0,0])
      cylinder(r=12,h=1.2,$fn=88);
      translate([-70,0,0])
      cylinder(r=12,h=1.2,$fn=88);
    }
    hull(){
      translate([70,0,0.9])
      cylinder(r=10,h=3,$fn=88);
      translate([-70,0,0.9])
      cylinder(r=10,h=3,$fn=88);
    }

    color("red")
    translate([0,-1,0])
    linear_extrude(height=2.4)
    text("Flint's  Finest", font = "Open Sans:style=Bold", size=12,halign="center",valign="center",spacing=1.1);
  }
  
}

//----------------------------------------------------------------------------------
module flintsText(){
    color("red")
    translate([0,-1,0])
    linear_extrude(height=1.5)
    text("Flint's  Finest", font = "Open Sans:style=Bold", size=12,halign="center",valign="center",spacing=1.1);
}

//----------------------------------------------------------------------------------
module pirateFeet(){

scale([2,2,1.5]){
  
if(1){
  difference(){
    translate([0,0,12])
    sphere(r=15,$fn=99);
    translate([0,0,-5])
    cube([30,30,10],center=true);
  }
}
  hull(){
    translate([7,7,45])
    cube([26,26,2.4],center=true);

    translate([0,0,22])
    cylinder(r1=11,r2=13,h=6,$fn=55);
  }
  
  difference(){
    translate([12,12,44])
    linear_extrude(scale=1.1,height=2.4)
    square([36,36],center=true);
    translate([25,25,45])
    cylinder(r=2,h=6,$fn=55,center=true);
    translate([25,0,45])
    cylinder(r=2,h=6,$fn=55,center=true);
    translate([0,25,45])
    cylinder(r=2,h=6,$fn=55,center=true);
  }

  for(i=[0:2]){
    rotate([0,0,60*i+30])
    translate([-8,0,28])
    rotate([180,0,0])
    linear_extrude(scale=0.2,twist=160,height=25,$fn=99)
    translate([15,0])
    scale([1,2])
    circle(r=5,$fn=55);
  }
}
}

//=================================================================================

if(1){
  color("cyan")
  lidPirate();
  color("green")
  boxPirate();
}


if(0){
  translate([320/2,4,-40])
  rotate([0,90,0])
  rotate([0,0,90]){
    flints();
    flintsText();
  }
}

if(0){
  translate([320/2,4,35])
  rotate([0,90,0])
  rotate([0,0,90])
  wingedF();
}

if(1){
  translate([130,110,-190-45-24])
  rotate([0,0,180])
  pirateFeet();

  translate([130,-110,-190-45-24])
  rotate([0,0,90])
  pirateFeet();
  
  translate([-130,-110,-190-45-24])
  rotate([0,0,0])
  pirateFeet();

  translate([-130,110,-190-45-24])
  rotate([0,0,-90])
  pirateFeet();

}


//wingedF();
//wingedFa();
//wingedFb();

//backing();

//flints();
//flintsText();

//pirateFeet();

//=================================================================================



