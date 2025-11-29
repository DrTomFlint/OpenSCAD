//=================================================================================
// bigRackB.scad
//
// 2 Big racks will hold size B Fairy Crystals in a Big Box
// 
// Dr Tom Flint, 28 Nov 2025
//  
//=================================================================================

use <../Parts/rounder.scad>
use <../Fractals/Lsystem.scad>


// order of sierpinski fractal
order = 4; //[0,1,2,3,4,5,6,7]
// size of smallest pyramid
size = 2.5; //[2:50]

/* [Hidden] */
eps = 0.25;         // translate for pyramids
//epsr = 0.1;
epsr = 0.05;

epsh = 2.5*eps;
sq2 = 1.41421356;       
epsl = 0.5;         // translate for cube cuts
epsy = 0.12;        // translate for cube cuts

bottom=5.8;     // size 5 order 3

trayz=3;
zfoot=8;
zrise=2;

wall=22+8;

//---------------------------------------------------------------------------------
// single solid, same size as B Fairy Crystal
module s7cut(tol=0.2){
    
    size2=size*14+tol;  // for order 4
    
        
    translate([0,0,-0.01])
    //scale([1,1,0.98])
    rotate([0,0,45])cylinder(r1=size2+1*tol,r2 = epsr+1*tol, h = 0.97*size2+tol, $fn=4);
    
    mirror([0,0,1])
    difference() {
    rotate([0,0,45])cylinder(r1=size2+1*tol,r2 = epsr+1*tol, h = 0.97*size2+tol, $fn=4);
        translate([-120,-120,bottom])
        cube([240,240,80]);
    }
}

//---------------------------------------------------------------------------------
module rack3(show=0){

  difference(){
    linear_extrude(height=bottom,scale=[0.96,0.96])
    square([218,164],center=true);

    union(){
      for(xi=[-1:2]){
          for(yi=[-1:1]){
              translate([52.0*xi-26,0+52*yi,bottom-0.01])
              s7cut(tol=0.4);
          }
      }
    }
  }
  // option to display the crystals
  if(show==1){
    for(xi=[-1:2]){
        for(yi=[-1:1]){
            translate([52.0*xi-26,0+52*yi,bottom-0.01])
            s7cut(tol=0.4);
        }
    }
  }
  
}

//-------------------------------------------------------------------
module bigBox(){
    
    translate([0,0,85/2-6])
    difference(){
        cube([250,200,85],center=true);
        translate([0,0,6])
        cube([236,185,85],center=true);
    }
}

//-------------------------------------------------------------------
module bigLid(){

x1=226;
y1=172;
zpad=1;
    
    translate([0,0,85+26/2-5.8])
    difference(){
        cube([250,200,26],center=true);
        translate([0,0,-6])
        cube([236,185,26],center=true);
    }
    // bottom pad for dimensions
    if(1){
        translate([0,0,85+26/2-5.8])
        translate([0,0,-zpad/2+7])
        cube([x1,y1,zpad],center=true);
    }
    
}
//-------------------------------------------------------------------
module bigTray2(){

x1=226;
y1=172;
z1=20;
zpad=0.5;
    
    // base
    color("cyan")
    translate([0,0,trayz/2])
    cube([x1-6,y1-6,trayz],center=true);
    
    // front back
    translate([0,y1/2-trayz/2,trayz+wall/2])
    bigFront2();

    translate([0,-y1/2+trayz/2,trayz+wall/2])
    rotate([0,0,180])
    bigFront2();
    
    // sides
    translate([x1/2-trayz/2,0,trayz+wall/2])
    bigSide2();
    
    translate([-x1/2+trayz/2,0,trayz+wall/2])
    rotate([0,0,180])
    bigSide2();

    // bottom pad for dimensions
    if(1){
        color("red")
        translate([0,0,zpad/2-zpad])
        cube([x1-25,y1-25,zpad],center=true);
    }
    
}
//-------------------------------------------------------------------
module bigFront2(){

x1=226;
y1=172;
z1=20;
zpad=1.5;

    difference(){
        translate([0,0,-3])
        cube([x1,trayz,wall],center=true);
        
        translate([x1/2,1.5,-wall/2-3])
        rotate([0,0,180])
        bevel(x=3,y=3,h=wall);
        translate([-x1/2,1.5,-wall/2-3])
        rotate([0,0,-90])
        bevel(x=3,y=3,h=wall);
        
        translate([0,0,1])
        hull(){
            translate([x1/2-35,1.5,wall/2])
            rotate([90,0,0])
            cylinder(r=12,h=10,center=true,$fn=99);
            translate([-x1/2+35,1.5,wall/2])
            rotate([90,0,0])
            cylinder(r=12,h=10,center=true,$fn=99);
        }

        color("red")
        translate([0,0.9,-7.0])
        rotate([0,0,180])
        rotate([90,0,0])
        linear_extrude(height=0.9)
        text("Flint's  Finest  Fairy  Crystals", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.2);
    }


}

//-------------------------------------------------------------------
module bigSide2(){

x1=226;
y1=172;
z1=20;
zpad=1.5;

    difference(){
       translate([0,0,-3])
        cube([trayz,y1-6,wall],center=true);

        translate([0,0,1]){
        hull(){
            translate([1.5,y1/2-35,wall/2])
            rotate([0,90,0])
            cylinder(r=12,h=10,center=true,$fn=99);
            translate([1.5,y1/2-50,wall/2])
            rotate([0,90,0])
            cylinder(r=12,h=10,center=true,$fn=99);
        }
        hull(){
            translate([1.5,-y1/2+35,wall/2])
            rotate([0,90,0])
            cylinder(r=12,h=10,center=true,$fn=99);
            translate([1.5,-y1/2+50,wall/2])
            rotate([0,90,0])
            cylinder(r=12,h=10,center=true,$fn=99);
        }
        }
        translate([0,0,-4])
        hull(){
            translate([1.5,10,wall/2-5])
            rotate([0,90,0])
            cylinder(r=3,h=10,center=true,$fn=99);
            translate([1.5,-10,wall/2-5])
            rotate([0,90,0])
            cylinder(r=3,h=10,center=true,$fn=99);
        }
        translate([-4,y1/2-30+7.5,wall/2])
        rotate([0,90,0])
        rotate([0,0,0])
        rounder(r=2.5,h=10,f=99);

        translate([-4,y1/2-65+7.5,wall/2])
        rotate([0,90,0])
        rotate([0,0,-90])
        rounder(r=2.5,h=10,f=99);

        translate([-4,-y1/2+30-7.5,wall/2])
        rotate([0,90,0])
        rotate([0,0,-90])
        rounder(r=2.5,h=10,f=99);

        translate([-4,-y1/2+65-7.5,wall/2])
        rotate([0,90,0])
        rotate([0,0,0])
        rounder(r=2.5,h=10,f=99);

        color("red")
        translate([0.9,0,-6.0])
        rotate([0,0,90])
        rotate([90,0,0])
        linear_extrude(height=0.9)
        text("One Dozen", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.2);
    }

    
}
//-------------------------------------------------------------------
module bigTrayFoot2(){

x1=226;
y1=172;
z1=22+16-0.1;

x2=20;
y2=20;
zfoot=8;
zrise=2;
zpad=1.5;
lip=2;

z2=z1+zfoot;
tol=0.2;
    
translate([x1/2-x2/2+trayz,y1/2-y2/2+trayz,z2/2-zfoot]){
    difference(){
        union(){
            translate([0,0,zrise/2+0.5*lip])
            cube([x2,y2,z2+zrise-lip],center=true);
            translate([-0.5*trayz,-0.5*trayz,0])
            cube([x2-trayz,y2-trayz,z2],center=true);
            translate([0,0,-2.5*trayz])
            cube([x2,y2,trayz],center=true);
        }
        // cut above lip
        translate([-trayz,-trayz,zrise+6])
        cube([x2,y2,z2],center=true);

        // extra clearance on top for lip
        translate([-trayz,-trayz,z1/2+4])
        linear_extrude(height=3,scale=1.1)
        square([x2,y2],center=true);
        
        translate([-2*trayz-tol,-2*trayz-tol,trayz])
        cube([x2,y2,z2+2*tol+2*trayz],center=true);

        // slot in top surface for the lip
        translate([-2*trayz-tol,-2*trayz-tol,z1-5])
        cube([x2,y2,10],center=true);

        // rounder on lip
        translate([x2/2-1*trayz,y2/2-1*trayz,-zfoot-7])
        rotate([0,0,180])
        rounder(r=5,h=lip,f=88);

        // bevel on lip
        translate([x2/2-trayz,y2/2,-zfoot-15])
        rotate([90,0,0])
        rotate([0,0,90])
        bevel(x=lip,y=0.5*lip,h=x2);
        translate([x2/2,y2/2-trayz,-zfoot-15])
        rotate([0,-90,0])
        rotate([0,0,-90])
        bevel(x=0.5*lip,y=lip,h=x2);


        // rounder on base support
        translate([-x2/2,-y2/2,-5*trayz])
        rounder(r=x2,h=60,f=200);
    
        // main corner bevel
        translate([x2/2,y2/2,-25])
        rotate([0,0,180])
        bevel(x=0.7*trayz,y=0.7*trayz,h=60);

        // end bevels
        translate([-x2/2,y2/2,-25])
        rotate([0,0,-90])
        bevel(x=trayz/2,y=trayz/2,h=60);

        translate([x2/2,-y2/2,-25])
        rotate([0,0,90])
        bevel(x=trayz/2,y=trayz/2,h=60);
        
        // Lettering
        if(0){
            translate([x2/2-0.2,0,5])
            rotate([0,0,90])
            rotate([90,0,0])
            linear_extrude(height=2)
            text("F", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.2);
            
            translate([-1.5,y2/2-0.2,5])
            rotate([0,0,180])
            rotate([90,0,0])
            linear_extrude(height=2)
            text("F", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.2);
        }
    }
    // add a foot for the tray corner
    difference(){
        translate([0,0,-8.5])
        cube([x2,y2,trayz],center=true);
        translate([-x2/2,-y2/2,-5*trayz])
        rounder(r=x2,h=60,f=200);
        translate([0,0,-6])
        cylinder(r=1,h=10,center=true,$fn=55);

        // end bevels
        translate([-x2/2,y2/2,-20])
        rotate([0,0,-90])
        bevel(x=trayz/2,y=trayz/2,h=60);

        translate([x2/2,-y2/2,-20])
        rotate([0,0,90])
        bevel(x=trayz/2,y=trayz/2,h=60);
        
        // main corner bevel
        translate([x2/2,y2/2,-20])
        rotate([0,0,180])
        bevel(x=0.7*trayz,y=0.7*trayz,h=60);
    }

    // fillet upper section
    translate([x2/2-trayz+tol,y2/2-trayz+tol,-zfoot+0])
    rotate([0,0,180])
    rounder(r=4,h=25,f=88);
    //fillet lower section
    translate([x2/2-2*trayz,y2/2-2*trayz,-zfoot-7])
    rotate([0,0,180])
    rounder(r=4,h=6,f=88);
}


}

//-------------------------------------------------------------------
module bigTrayFoot3(){

x1=226;
y1=172;
z1=22+16-0.1;

x2=20;
y2=20;
zfoot=8;
zrise=2;
zpad=1.5;
lip=2;

z2=z1+zfoot;
tol=0.2;
    
translate([x1/2-x2/2+trayz,y1/2-y2/2+trayz,z2/2-zfoot]){
  
    difference(){
        union(){
            translate([0,0,zrise/2+0.5*lip-0.5])
            cube([x2,y2,z2+zrise-lip-1],center=true);
            translate([-0.5*trayz,-0.5*trayz,0])
            cube([x2-trayz,y2-trayz,z2],center=true);
            translate([0,0,-2.5*trayz])
            cube([x2,y2,trayz],center=true);
        }
        // cut above lip
        translate([-trayz,-trayz,zrise+6])
        cube([x2,y2,z2],center=true);

        // extra clearance on top for lip
        translate([-trayz,-trayz,z1/2+2])
        linear_extrude(height=3,scale=1.1)
        square([x2,y2],center=true);
        
        translate([-2*trayz-tol,-2*trayz-tol,trayz])
        cube([x2,y2,z2+2*tol+2*trayz],center=true);

        // rounder on lip
        translate([x2/2-1*trayz,y2/2-1*trayz,-zfoot-7])
        rotate([0,0,180])
        rounder(r=5,h=lip,f=88);

        // bevel on lip
        translate([x2/2-trayz,y2/2,-zfoot-15])
        rotate([90,0,0])
        rotate([0,0,90])
        bevel(x=lip,y=0.5*lip,h=x2);
        translate([x2/2,y2/2-trayz,-zfoot-15])
        rotate([0,-90,0])
        rotate([0,0,-90])
        bevel(x=0.5*lip,y=lip,h=x2);


        // rounder on base support
        translate([-x2/2,-y2/2,-5*trayz-10])
        rounder(r=x2,h=60,f=200);
    
        // main corner bevel
        translate([x2/2,y2/2,-25])
        rotate([0,0,180])
        bevel(x=0.7*trayz,y=0.7*trayz,h=60);

        // end bevels
        translate([-x2/2,y2/2,-25])
        rotate([0,0,-90])
        bevel(x=trayz/2,y=trayz/2,h=60);

        translate([x2/2,-y2/2,-25])
        rotate([0,0,90])
        bevel(x=trayz/2,y=trayz/2,h=60);
        
    }
    // add a foot for the tray corner
    difference(){
        translate([0,0,-8.5-7])
        cube([x2,y2,trayz],center=true);
        
        translate([-x2/2,-y2/2,-5*trayz-10])
        rounder(r=x2,h=60,f=200);
        
        translate([0,0,-14])
        cylinder(r=2,h=10,center=true,$fn=55);

        // end bevels
        translate([-x2/2,y2/2,-20])
        rotate([0,0,-90])
        bevel(x=trayz/2,y=trayz/2,h=60);

        translate([x2/2,-y2/2,-20])
        rotate([0,0,90])
        bevel(x=trayz/2,y=trayz/2,h=60);
        
        // main corner bevel
        translate([x2/2,y2/2,-20])
        rotate([0,0,180])
        bevel(x=0.7*trayz,y=0.7*trayz,h=60);
    }

    // fillet upper section
    translate([x2/2-trayz+tol,y2/2-trayz+tol,-zfoot-6])
    rotate([0,0,180])
    rounder(r=4,h=30,f=88);
    
}

}
//======================================================================================

// For Printing:

//~ rack3();

//~ bigTrayFoot3();

//~ bigFront2();
bigSide2();


// For design:

//~ bigTray2();

// Cutaway View:
if(0){
    difference(){
        union(){
            translate([0,0,zfoot]){
                translate([0,0,1.0*trayz+0.1+1])
                color("gray")
                rack3(show=1);
                translate([0,0,1])
                bigTray2();
                bigTrayFoot3();                

            }
            // stack a second rack on top:
            if(1){
                translate([0,0,zfoot+44.5]){
                translate([0,0,1.0*trayz+0.1+1])
                color("gray")
                rack3(show=1);
                translate([0,0,1])
                bigTray2();
                bigTrayFoot3();                
                }
            }
            if(1){
                color("silver",alpha=0.3)
                bigBox();
                color("silver",alpha=0.3)
                bigLid();
            }
        }
        if(1){
            // side cut
            translate([-150,0,0])
            cube([300,300,300],center=true);
            // front cut
            translate([0,-150,0])
            cube([300,300,300],center=true);
        }
    }
}


