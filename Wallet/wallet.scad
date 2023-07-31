//====================================================================
// wallet.scad 
// 
// Dr Tom Flint, 24 July 2023
//
//====================================================================


use <../Parts/threads.scad>
use <../Parts/rounder.scad>


layer = 0.3;          // thickness of 1 layer, not parametric
thick = 4*layer;      // how many layers

// inside dimensions of each pocket
x0=70;
y0=88;
z0=10;

// panel
x1=x0-20;
y1=y0-20;
off1=6;     // offset for panel lip

// hinge
x2=thick;
y2=10;
z2=2*thick;
off2=0.3*y0;

F1=44;

//--------------------------------------------------------------------
module frame(tol=0.2){

  difference(){
    // boss
    translate([0,0,0])
    linear_extrude(height=z0)
    offset(r=thick,$fn=F1)
    square([x0,y0],center=true);      
    
    // main pocket, offset to make back wall thicker
    translate([thick,0,thick/2])
    linear_extrude(height=z0)
    offset(r=thick,$fn=F1)
    square([x0-4*thick,y0-2*thick],center=true);

    // through hole
    translate([0,0,-thick/2])
    linear_extrude(height=z0)
    offset(r=thick,$fn=F1)
    square([x0-20,y0-20],center=true);
    
    // cuts for lid hinge
    translate([-x0/2,off2,z0-2*thick+z2/2])
    cube([4*x2+1,y2,2*z2+tol],center=true);
    translate([-x0/2,-off2,z0-2*thick+z2/2])
    cube([4*x2+1,y2,2*z2+tol],center=true);
    
    // cut to insert hinge pins
    translate([-x0/2,0,z0-z2+tol])
    rotate([90,0,0])
    cylinder(r=0.5,h=y0+4*thick,center=true,$fn=F1);

    // cut for thumb latch opposite one hinge
    translate([-(-x0/2-thick/2+tol/2+x2/2),off2,z0])
    difference(){
      scale([0.3,1,1])
      minkowski(){
        cylinder(r=10,h=thick,center=true,$fn=F1);
        sphere(r=thick,$fn=F1);
      }
      translate([0,0,-4-thick])
      cube([20,30,8],center=true);
    }

    // latching cut for main pocket insert, note scale in x to make latch
    translate([1.25*thick,0,z0-thick])
    linear_extrude(height=thick,scale=[0.995,1])
    offset(r=thick,$fn=F1)
    square([x0-4*thick-tol,y0-2*thick-tol],center=true);
    
    // round off inner back wall
    translate([-x0/2+2*thick,y0/2,z0])
    rotate([90,0,0])
    rotate([0,0,180])
    rounder(r=2*thick,h=y0,f=88);

    // round off outer back wall
    translate([-x0/2-thick,y0/2+2*thick,z0])
    rotate([90,0,0])
    rotate([0,0,-90])
    rounder(r=thick,h=y0+4*thick,f=88);

  }

}


//--------------------------------------------------------------------
module lid(tol=0.2){

  difference(){
    union(){
      // boss
      difference(){
        translate([0,0,z0])
        minkowski(){
          cube([x0,y0,thick],center=true);
          sphere(r=thick,$fn=F1);
        }
        translate([0,0,z0-thick])
        cube([x0+2*thick,y0+2*thick,2*thick],center=true);
      }
        
      // main pocket insert, note scale in x to make latch
      translate([thick/5,0,z0-thick])
      linear_extrude(height=thick,scale=[0.995,1])
      offset(r=thick,$fn=F1)
      square([x0-2*thick-tol,y0-2*thick-tol],center=true);
      
    }
    
    // panel hole
    translate([0,0,z0])
    linear_extrude(height=2*thick+0.01,scale=1.02)
    offset(r=thick,$fn=F1)
    square([x1+tol,y1+tol],center=true);

    // panel lip
    translate([0,0,z0-thick-0.005])
    linear_extrude(height=thick+0.01,scale=1.01)
    offset(r=thick,$fn=F1)
    square([x1+off1+tol,y1+off1+tol],center=true);

    // clearance cut
    translate([-x0/2,0,z0-z2+tol])
    rotate([90,0,0])
    cylinder(r=2*thick+tol/2,h=y0+4*thick,center=true,$fn=F1);
  }

  // hinge
  difference(){
    hull(){
      translate([-x0/2-thick/2+tol/2+x2/2,off2,z0+tol])
      cube([2*x2+tol,y2-tol,thick/2],center=true);

      translate([-x0/2,off2,z0-z2+tol])
      rotate([90,0,0])
      cylinder(r=thick,h=y2-tol,center=true,$fn=F1);
    }
    translate([-x0/2,off2,z0-z2+tol])
    rotate([90,0,0])
    cylinder(r=0.5,h=y2+2*tol,center=true,$fn=F1);
  }  
  
  difference(){
    hull(){
      translate([-x0/2-thick/2+tol/2+x2/2,-off2,z0+tol])
      cube([2*x2+tol,y2-tol,thick/2],center=true);

      translate([-x0/2,-off2,z0-z2+tol])
      rotate([90,0,0])
      cylinder(r=thick,h=y2-tol,center=true,$fn=F1);
    }
    translate([-x0/2,-off2,z0-z2+tol])
    rotate([90,0,0])
    cylinder(r=0.5,h=y2+2*tol,center=true,$fn=F1);
  }  
  
  // thumb latch opposite one hinge
  translate([-(-x0/2-thick/2+tol/2+x2/2),off2,z0])
  difference(){
    scale([0.3,1,1])
    minkowski(){
      cylinder(r=10,h=thick,center=true,$fn=F1);
      sphere(r=thick,$fn=F1);
    }
    translate([0,0,-4-thick])
    cube([20,30,8],center=true);
  }
      
}
//====================================================================

tol=0.2;
angle=0;


if(0){
  difference(){
    union(){
      frame();
      translate([-x0/2,-off2,z0-z2+tol])
      //translate([-x0/2-thick/2,0,z0-3.5*thick+tol])
      rotate([0,-angle,0])
      translate([x0/2,off2,-(z0-z2+tol)])
      //translate([x0/2+thick/2,0,-z0+3.5*thick-tol])
      lid();
    }
    translate([0,y0+off2,0])
    cube([2*x0,2*y0+30,4*z0],center=true);
  }
}

//frame();
lid();

//====================================================================


