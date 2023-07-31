//====================================================================
// wallet.scad 
// 
// Dr Tom Flint, 24 July 2023
//
//====================================================================


use <../Parts/hexcut.scad>
use <../Parts/rounder.scad>
use <../Trace/fan9red.scad>
use <../Trace/fan9yellow.scad>
use <../Trace/fan9blue.scad>
use <../Trace/fan9black.scad>
use <../Fractals/Lsystem.scad>


layer = 0.3;          // thickness of 1 layer, not parametric
thick = 6*layer;      // how many layers

// inside dimensions of each pocket
x0=76;
y0=94;
z0=12;
r0=8;

zlid=4;

// panel
x1=x0-12;
y1=y0-12;
off1=6;     // offset for panel lip

// hinge
x2=thick;
y2=10;
z2=2*thick;
off2=0.32*y0;

F1=20;

//--------------------------------------------------------------------
module frame(tol=0.15){

  difference(){
    union(){
      // boss
      translate([0,0,0])
      linear_extrude(height=z0-tol)
      offset(r=r0,$fn=F1)
      square([x0-2*r0+thick,y0-2*r0+thick],center=true);      

      // latching bump
      translate([x0/2+thick/4,0,z0-zlid/2])
      rotate([90,0,0])
      rotate([0,0,180/8])
      cylinder(r=0.75*thick,h=0.7*y0,center=true,$fn=8);
      
      // tab for index finger
      translate([x0/2-20,y0/2,thick+thick/8])
      scale([1,0.5,1])
      minkowski(){
        cylinder(r=8,h=thick/4,center=true,$fn=F1);
        sphere(r=thick,$fn=F1);
      }
      
    }
    
    // main pocket
    translate([0,0,thick/2])
    linear_extrude(height=z0)
    offset(r=r0,$fn=F1)
    square([x0-2*r0-thick/2,y0-2*r0-thick/2],center=true);

    // through hole
    intersection(){
      translate([0,0,-thick/2])
      linear_extrude(height=z0)
      offset(r=thick,$fn=F1)
      square([x0-20,y0-20],center=true);
     
      union(){
        translate([x0/4+1.8,-y0/2-8-1,-thick])
        hexcut1(R=8,x0=0,y0=0,h0=10,N0=8);    
        translate([-x0/4-1.8,-y0/2-1,-thick])
        hexcut1(R=8,x0=0,y0=0,h0=10,N0=8);    
      }
    }
  }

  // hinges
  difference(){
    hull(){
      translate([-x0/2-2.5*thick-tol,off2,z0-thick])
      rotate([90,0,0])
      cylinder(r=2*thick,h=6,center=true,$fn=F1);
      translate([-x0/2-0.05,off2,z0/2-tol])
      cube([0.1,6,z0-tol],center=true);
    }
    
    translate([-x0/2-2.5*thick-tol,off2,z0-thick])
    rotate([90,0,0])
    cylinder(r=1.2,h=8,center=true,$fn=F1);
  }
  difference(){
    hull(){
      translate([-x0/2-2.5*thick-tol,-off2,z0-thick])
      rotate([90,0,0])
      cylinder(r=2*thick,h=6,center=true,$fn=F1);
      translate([-x0/2-0.05,-off2,z0/2-tol])
      cube([0.1,6,z0-tol],center=true);
    }
    
    translate([-x0/2-2.5*thick-tol,-off2,z0-thick])
    rotate([90,0,0])
    cylinder(r=1.2,h=8,center=true,$fn=F1);
  }
}


//--------------------------------------------------------------------
module lid(tol=0.15){

  difference(){
    union(){
      // boss
      difference(){
        translate([0,0,z0-zlid])
        minkowski(){
          linear_extrude(height=zlid)
          offset(r=r0,$fn=F1)
          square([x0-2*r0+thick,y0-2*r0+thick],center=true);      
          sphere(r=thick,$fn=F1);
        }
        translate([-x0/2-2*thick,0,z0/2-1*thick])
        cube([2*r0,y0+20,z0],center=true);
        translate([-x0/2+3.5*thick,0,z0/2-4*thick+tol])
        rotate([0,35,0])
        cube([2*r0,y0+40,2*r0],center=true);        
      }
      
      // thumb latch opposite one hinge
      translate([x0/2+thick/2,y0/4,z0-thick/8])
      scale([0.5,1,1])
      minkowski(){
        cylinder(r=8,h=thick/4,center=true,$fn=F1);
        sphere(r=thick,$fn=F1);
      }
      
      // hinge barrel
      hull(){
        translate([-x0/2-2.5*thick-tol,0,z0-thick])
        rotate([90,0,0])
        cylinder(r=2*thick,h=y0-2*r0,center=true,$fn=F1);
        translate([-x0/2-0.5*thick,0,z0+thick-0.2])
        rotate([90,0,0])
        cylinder(r=0.2,h=y0-2*r0,center=true,$fn=F1);
      }
    } // end of union

    // cut for main frame boss
    translate([0,0,-2*thick])
    linear_extrude(height=z0+2*thick)
    offset(r=r0,$fn=F1)
    square([x0-2*r0+thick+2*tol,y0-2*r0+thick+2*tol],center=true);      
    
    // panel hole
    translate([0,0,z0/2+3*thick+2*tol])
    linear_extrude(height=thick+2*tol,scale=1.01)
    offset(r=r0,$fn=F1)
    square([x1-2*r0+tol,y1-2*r0+tol],center=true);
    
    // panel lip
    translate([0,0,z0/2+2.75*thick])
    linear_extrude(height=thick,scale=1.01)
    offset(r=r0,$fn=F1)
    square([x1-2*r0+tol+6,y1-2*r0+tol+6],center=true);
    
    // latching bump
    translate([x0/2+thick/4,0,z0-zlid/2])
    rotate([90,0,0])
    rotate([0,0,180/8])
    cylinder(r=0.75*thick+tol,h=0.7*y0+2*tol,center=true,$fn=8);

    // cuts for hinges
    translate([-x0/2-3*thick+tol,off2,z0-thick])
    cube([5*thick,6+2*tol,5*thick],center=true);
    translate([-x0/2-3*thick+tol,-off2,z0-thick])
    cube([5*thick,6+2*tol,5*thick],center=true);
    
    // cut for hinge pins
    translate([-x0/2-2.5*thick-tol,off2+10,z0-thick])
    rotate([90,0,0])
    cylinder(r=0.8,h=24+10,center=true,$fn=F1);
    translate([-x0/2-2.5*thick-tol,-off2-10,z0-thick])
    rotate([90,0,0])
    cylinder(r=0.8,h=24+10,center=true,$fn=F1);
    

  }

}

//--------------------------------------------------------------------
module bundle(){

    translate([0,0,5+thick/2])
    cube([69,86,10],center=true);
    
}

//--------------------------------------------------------------------
module cards(){

    translate([0,0,5+thick/2])
    cube([54,85,10],center=true);
    
}
//--------------------------------------------------------------------
module cash(){

    translate([0,0,5+thick/2])
    cube([67,80,10],center=true);
    
}


//--------------------------------------------------------------------
module spring(){

    translate([x0/2-9,0,thick/4])
    cube([x0/8,24,thick/2],center=true);

    
    translate([x0/4,0,0])
    scale([1,1,0.3])
    rotate([90,0,0])
    difference(){
      cylinder(r=6,h=24,center=true,$fn=F1);
      cylinder(r=6-thick/2,h=26,center=true,$fn=F1);
      translate([0,-10,0])
      cube([20,20,30],center=true);
    }
    
  
}

//--------------------------------------------------------------------
module panel(tol2=0.15){
  
  difference(){
    union(){
      // panel hole
      translate([0,0,z0/2+3.25*thick+tol])
      linear_extrude(height=thick,scale=1.01)
      offset(r=r0,$fn=F1)
      square([x1-2*r0-tol2,y1-2*r0-tol2],center=true);
      
      // panel lip
      translate([0,0,z0/2+3.25*thick])
      linear_extrude(height=thick/2,scale=1.01)
      offset(r=r0,$fn=F1)
      square([x1-2*r0+6-tol2,y1-2*r0+6-tol2],center=true);
    }
    // make it thinner
    translate([0,0,z0/2+4*thick])
    linear_extrude(height=thick,scale=1.02)
    offset(r=r0,$fn=F1)
    square([x1-2*r0-6,y1-2*r0-6],center=true);
    
  }
}

//--------------------------------------------------------------------
module panelYellow(tol2=0.15){

intersection(){
  translate([px,py,10])
  scale([pmag,pmag,4])
  rotate([0,0,90])
  fan9yellow();
  
  panel();
}
  
}

//--------------------------------------------------------------------
module panelBlue(tol2=0.15){

intersection(){
  translate([px,py,10])
  scale([pmag,pmag,4])
  rotate([0,0,90])
  fan9blue();
  
  panel();
}
  
}

//--------------------------------------------------------------------
module panelRed(tol2=0.15){

intersection(){
  translate([px,py,10])
  scale([pmag,pmag,4])
  rotate([0,0,90])
  fan9red();
  
  panel();
}
  
}

//--------------------------------------------------------------------
module panelBlack(tol2=0.15){

intersection(){
  translate([px,py,10])
  scale([pmag,pmag,4])
  rotate([0,0,90])
  fan9black();
  
  panel();
}
  
}

//====================================================================

tol=0.15;
angle=0;

pmag=153;
py=-2;
px=3;

//panelYellow();
//panelRed();
//panelBlue();
//panelBlack();

if(1){
//  difference(){
  intersection(){
    union(){
      frame();
      translate([-x0/2-2.5*thick-tol,0,z0-thick])
      rotate([0,-angle,0])
      translate([x0/2+2.5*thick+tol,0,-z0+thick])
      lid();
      translate([0,0,-0.1])
      panel();
      //spring();
      //~bundle();
      //~ cards();
      //~ cash();
    }
    translate([0,y0+off2,0])
    cube([2*x0,2*y0+7,8*z0],center=true);
  }
}

//frame();
//lid();
//panel();
//bundle();
//cards();
//cash();


//====================================================================


