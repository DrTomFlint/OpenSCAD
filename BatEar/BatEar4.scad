//======================================================================
// BatEar3.scad
//
// Passive vocal monitor that clips onto safety glasses
//
// DrTomFlint, 6 March 2025
//======================================================================

use <../Parts/rounder.scad>
use <../Parts/hexcut.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>

flip=0;

// location of ear
x1 = -35;
y1 = -5;
z1 = -25;
m1 = 12;

// location of midway
x2 = 40;
y2 = 0;
z2 = -60;
m2 = 30;
flat2 = 0.6;

// location of mouth
x3 = 75;
y3 = 20;
z3 = -70;
m3 = 40;
flat3 = 0.60;

// move hollow out to account for flattening
flatfix = 0.5;

// height of lenses
z0 = 55;      

// location of pivot post
zpost=5;
stopAngle= 2 * 360/10;

Version="J";

F1=299;
F2=55;


//----------------------------------------------------------------------
// over the glasses protective goggles
module glassHalf(){
  
  // lens front
  translate([0,-238,-5])
  intersection(){
    linear_extrude(height=z0)
    difference(){
      circle(r=250,$fn=F1);
      circle(r=248,$fn=F1);
    }
    translate([35,200,0])
    cube  ([70,180,150],center=true);
  }
  
  points=[ [0,0], [0,45], [-14,45], [-38,40], [-72,30], [-97,20], [-110,10], [-120,0], [-130,-15], [-124,-25], [-113,-15], [-112,0], [-92,10], [-78,12], [-63,10], [-14,0] ];
  translate([70,0,0])
  rotate([0,0,90])
  rotate([90,0,0])
  linear_extrude(height=2)
  polygon(points);
  
}

//----------------------------------------------------------------------
// mounting point onto glassses
module mount2(){

thick=2;
ang=14;
  
  // main loop
  intersection(){
    difference(){
      hull(){
        translate([0,0,12.5])
        rotate([0,90-ang,0])
        cylinder(r=1.5*thick,h=17+1,center=true,$fn=F2);
        translate([0,0,-12.5])
        rotate([0,90+ang,0])
        cylinder(r=1.5*thick,h=17+1,center=true,$fn=F2);
      }
      translate([0,-0.5,0]){
        hull(){
          translate([0,0,12.5])
          rotate([0,90-ang,0])
          cylinder(r=0.6*thick,h=17+2,center=true,$fn=F2);
          translate([0,0,-12.5])
          rotate([0,90+ang,0])
          cylinder(r=0.6*thick,h=17+2,center=true,$fn=F2);
        }
        // extra trim at edges
        translate([0,0.5,12.5-0.5])
        rotate([0,90-ang,0])
        cylinder(r=0.85*thick,h=17+2,center=true,$fn=F2);
        translate([0,0.5,-12.5+0.5])
        rotate([0,90+ang,0])
        cylinder(r=0.85*thick,h=17+2,center=true,$fn=F2);
        
        // version number
        translate([0,1.5*thick,0])
        rotate([0,0,180])
        rotate([90,0,0])
        linear_extrude(height=0.605)
        text(Version, font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);

      }
    }
    cube([16,20,40],center=true);
  }
  
  // post
  intersection(){
    difference(){
      union(){
        // fillet
        translate([5,-1.5*thick,zpost])
        rotate([90,0,0])
        cylinder(r1=4.8,r2=3.9,h=1,$fn=F2);        
        // main shaft
        translate([5,-1.5*thick,zpost])
        rotate([90,0,0])
        cylinder(r=4,h=5.2,$fn=F2);
        // inner angle
        translate([5,-1.5*thick-4.5,zpost])
        rotate([90,0,0])
        cylinder(r1=4.0,r2=4.8,h=0.5,$fn=F2);
        // outer angle
        translate([5,-1.5*thick-5,zpost])
        rotate([90,0,0])
        cylinder(r1=4.8,r2=3.9,h=1,$fn=F2);
      }
      translate([5,-1.5*thick-5.5,zpost])
      cube([20,10,1.5],center=true);
      translate([5,-1.5*thick-5.5,zpost])
      cube([1.5,10,20],center=true);
    }
  
    cube([16,20,40],center=true);
  }
  
  // stopper
  translate([-5.5,-3,-5])
  rotate([90,0,0])
  cylinder(r=2,h=5,$fn=10);

  
}


//----------------------------------------------------------------------
module stopAdjust(tol=0.15){

    translate([-5.5,-3,-5])
    rotate([0,stopAngle,0])
    translate([5.5,3,5])

  difference(){
    translate([-5.5-1.5,-3,-5])
    rotate([90,0,0])
    cylinder(r=5,h=5,$fn=F2);

    translate([-5.5,-3,-5])
    rotate([90,0,0])
    cylinder(r=2+tol,h=5,$fn=10);
  }

}

//----------------------------------------------------------------------
// mounting point onto headloop
module mount3(){

thick=2;
ang=14;
  
  // main loop
  intersection(){
    difference(){
      hull(){
        translate([0,0,12.5])
        rotate([0,90-ang,0])
        cylinder(r=1.5*thick,h=17+1,center=true,$fn=F2);
        translate([0,0,-12.5])
        rotate([0,90+ang,0])
        cylinder(r=1.5*thick,h=17+1,center=true,$fn=F2);
      }
      translate([0,-0.5,0]){
        hull(){
          translate([0,0,12.5])
          rotate([0,90-ang,0])
          cylinder(r=0.6*thick,h=17+2,center=true,$fn=F2);
          translate([0,0,-12.5])
          rotate([0,90+ang,0])
          cylinder(r=0.6*thick,h=17+2,center=true,$fn=F2);
        }
        // extra trim at edges
        translate([0,0.5,12.5-0.5])
        rotate([0,90-ang,0])
        cylinder(r=0.85*thick,h=17+2,center=true,$fn=F2);
        translate([0,0.5,-12.5+0.5])
        rotate([0,90+ang,0])
        cylinder(r=0.85*thick,h=17+2,center=true,$fn=F2);
        
        // version number
        translate([0,1.5*thick,0])
        rotate([0,0,180])
        rotate([90,0,0])
        linear_extrude(height=0.605)
        text(Version, font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);

      }
    }
    cube([16,20,40],center=true);
  }
  
  // post
  intersection(){
    difference(){
      union(){
        // fillet
        translate([5,-1.5*thick,zpost])
        rotate([90,0,0])
        cylinder(r1=4.8,r2=3.9,h=1,$fn=F2);        
        // main shaft
        translate([5,-1.5*thick,zpost])
        rotate([90,0,0])
        cylinder(r=4,h=5.2,$fn=F2);
        // inner angle
        translate([5,-1.5*thick-4.5,zpost])
        rotate([90,0,0])
        cylinder(r1=4.0,r2=4.8,h=0.5,$fn=F2);
        // outer angle
        translate([5,-1.5*thick-5,zpost])
        rotate([90,0,0])
        cylinder(r1=4.8,r2=3.9,h=1,$fn=F2);
      }
      translate([5,-1.5*thick-5.5,zpost])
      cube([20,10,1.5],center=true);
      translate([5,-1.5*thick-5.5,zpost])
      cube([1.5,10,20],center=true);
    }
  
    cube([16,20,40],center=true);
  }
  
  // stopper
  translate([-5.5,-3,-5])
  rotate([90,0,0])
  cylinder(r=2,h=5,$fn=10);

  
}


//----------------------------------------------------------------------
module tunnel2(T=1.2){

  // tunnel
  difference(){
    union(){
      // upper tunnel
      hull(){  
        translate([x1,y1,z1])  
        sphere(r=m1,$fn=F1);
        translate([x2,y2,z2])
        scale([1,flat2,1])
        sphere(r=m2,$fn=F1);

        translate([x1,y1+30,z1])  
        sphere(r=m1,$fn=F1);
        translate([x2,y2+30,z2])
        scale([1,flat2,1])
        sphere(r=m2,$fn=F1);
      }
      // lower tunnel
      hull(){  
        translate([x2,y2,z2])  
        scale([1,flat2,1])
        sphere(r=m2,$fn=F1);
        translate([x3,y3,z3])
        scale([0.5,flat3,1])
        sphere(r=m3,$fn=F1);

        translate([x2,y2+40,z2])  
        scale([1,flat2,1])
        sphere(r=m2,$fn=F1);
        translate([x3,y3+40,z3])
        scale([0.5,flat3,1])
        sphere(r=m3,$fn=F1);
      }
      // ear disk
      translate([x1,y1+0,z1])  
      rotate([0,-45,0])
      rotate([90,0,0])
      scale([1,1.4,1])
      cylinder(r=20,h=1.5*T,center=true,$fn=F2);

      // upper panel
      hull(){
        translate([x1,y1+0,z1+16])  
        rotate([90,0,0])
        cylinder(r=6,h=1.5*T,center=true,$fn=F2);
        translate([x2,y1+3,z2+30])  
        rotate([90,0,0])
        cylinder(r=12,h=1.5*T,center=true,$fn=F2);
      }

      // lower attach to post
      hull(){
        // midpoint block
        translate([5,-5,-6])
        rotate([0,10,0])
        cube([10,4,1],center=true);
        // tunnel block
        translate([5,-6,-30])
        rotate([0,18,0])
        cube([30,3,1],center=true);
      }
    }

    // cut for stop adjuster
    translate([-8,y1+0,z1+17])  
    scale([1,1,0.7])
    rotate([90,0,0])
    cylinder(r=6,h=10,center=true,$fn=F2);
    
    // hollow out
    hull(){  
      translate([x1,y1+flatfix,z1])  
      sphere(r=m1-T,$fn=F1);
      translate([x2,y2+flatfix,z2])
      scale([1,flat2,1])
      sphere(r=m2-T,$fn=F1);

      translate([x1,y1+40+flatfix,z1])  
      sphere(r=m1-T,$fn=F1);
      translate([x2,y2+40+flatfix,z2])
      scale([1,flat2,1])
      sphere(r=m2-T,$fn=F1);
    }
    hull(){  
      translate([x2,y2+flatfix,z2])  
      scale([1,flat2,1])
      sphere(r=m2-T,$fn=F1);
      translate([x3-flatfix,y3+flatfix,z3])
      scale([0.5,flat3,1])
      sphere(r=m3-T,$fn=F1);

      translate([x2,y2+40+flatfix,z2])  
      scale([1,flat2,1])
      sphere(r=m2-T,$fn=F1);
      translate([x3-flatfix,y3+40+flatfix,z3])
      scale([0.5,flat3,1])
      sphere(r=m3-T,$fn=F1);
    }
    
    // cut away near ear
    hull(){
      translate([x1-40,y1+25,z1])
      rotate([15,0,0])
      rotate([0,20,0])
      cylinder(r=m1-T+8,h=50,center=true,$fn=F2);
      
      translate([x2+0,y2+38,z2])
      rotate([15,0,0])
      rotate([0,20,0])
      cylinder(r=m2,h=84,center=true,$fn=F2);
    }

    // cut away near mouth
    hull(){
      translate([x2,74,z2])
      rotate([12,0,0])
      rotate([0,20,0])
      cylinder(r=65,h=120,center=true,$fn=F2);
    
      translate([x3,74+20,z2])
      rotate([12,0,0])
      rotate([0,20,0])
      cylinder(r=65,h=120,center=true,$fn=F2);
    
    }
    
    // version   
    //~ translate([5,-6.8,-15])
    //~ rotate([0,10,0])
    //~ rotate([90,0,0])
    //~ linear_extrude(height=1.5)
    //~ text(Version, font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);

    if(0){
      words();
    }
    
  }
        
  // upper section attach to post
  thick=2;
  difference(){  
    hull(){
      // surround the post
      translate([5,-1.5*thick,zpost])
      rotate([90,0,0])
      cylinder(r=7,h=4.5,$fn=F1);
      // attachment to the tunnel
      translate([5,-5,-6])
      rotate([0,10,0])
      cube([10,4,1],center=true);
    }
    
    // cuts for pivot
    translate([5,-1.5*thick,zpost])
    rotate([90,0,0])
    cylinder(r=4.2,h=20,center=true,$fn=F1);
    
    translate([5,-2*thick-5.5,zpost])
    rotate([90,0,0])
    cylinder(r=6,h=4,center=true,$fn=F1);

    // fillet cut
    translate([5,-1.5*thick,zpost])
    rotate([90,0,0])
    cylinder(r1=4.8,r2=3.9,h=1,$fn=F2);        
  }
  
}

//-----------------------------------------------------------------------------------------------
module words(){
  
    translate([5,-17,-44])
    rotate([0,0,-1])
    rotate([0,24,0])
    rotate([90,0,0])
    #linear_extrude(height=0.9)
    text("How About No", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);
}

//======================================================================

// choose 1 for design, 0 for print
design=1;

//---------------------------------------------------------
if(design==1){

thick=2;

//~ mount2();
//~ stopAdjust();

mount3();

translate([5,-1.5*thick,zpost])
rotate([0,-flip,0])
translate([-5,1.5*thick,-zpost])

tunnel2();

if(0){
  difference(){
    tunnel2();
    translate([0,0,0])
  cube([300,100,100],center=true);
  }
}

// safety glasses approx
if(0){
  translate([55,71,-22])
  rotate([0,0,-90])
  glassHalf();
  mirror([0,1,0])
  translate([55,-71,-22])
  rotate([0,0,-90])
  glassHalf();
}


//---------------------------------------------------------
}else{
//---------------------------------------------------------
  
//~ mount();
//~ beam();
//~ beam2();
//~ ear();
//~ mouth();
//~ tunnel();


//~ mount2();
//~ stopAdjust();
tunnel2();
//~ words();

//~ mount3();

}  

//======================================================================
