//======================================================================
// Seeder.scad
// 
// A multi-row seeder for microgreens in a standard 10x20 inch tray.
//
// DrTomFlint 13 Jan 2024
//======================================================================


r0 = 20;    // radius disks
r1 = 20.5;  // radius of tub cuts

r3 = 1.5;     // radius of axle

r4 = 4;     // radius of outlet 

x0 = 2;     // thickness of disks
x1 = 20;    // thickness at top of tub

thick = 1.2;  // thickness of tub walls

d0 = 0.5;     // gap between disk and tub

$fn=55;

//----------------------------------------------------------------------
module tub(){

  difference(){
    union(){
      // main bin
      hull(){
        rotate([0,90,0])
        cylinder(r=r1+thick,h=x0+d0+thick);
        
        translate([0,-r1-thick,r1])
        cube([x1+2*thick,2*r1+2*thick,2]);
      }
      // exit hole 
      translate([-thick-1.5,-r1/2,3])
      rotate([0,30,0])
      cylinder(r1=r4+thick-2,r2=r4+thick,h=16);              
      // downpipe
      translate([-thick-1,-r1/2,-25.5])
      cylinder(r=r4+thick-2,h=30);              
    }
    
    // main bin cut
    hull(){
      translate([thick,0,0])
      rotate([0,90,0])
      cylinder(r=r1-thick,h=x0+d0);
      
      translate([thick,-r1,r1])
      cube([x1,2*r1,3]);
    }

    // exit hole cut
    translate([-thick-1.5,-r1/2,3])
    rotate([0,30,0])
    cylinder(r1=r4-2,r2=r4,h=16.1);              
    // downpipe cut
    translate([-thick-1,-r1/2,-25.5])
    cylinder(r=r4-1.75,h=30);              
    
    // axle cut
    translate([0,0,0])
    rotate([0,90,0])
    cylinder(r=r3+0.15,h=2*x1,center=true);
    
  }
  
}

//----------------------------------------------------------------------
module disk(N=5,rs=1){

  difference(){
    // main disk
    rotate([0,90,0]){
      cylinder(r=r0, h=x0);
    }  

    // axle cut
    translate([0,0,0])
    rotate([0,90,0])
    cylinder(r=r3+0.15,h=2*x1,center=true);
  
    // scoop cuts
    for(i=[0:N-1]){
      rotate([360/N*i,0,0])
      translate([x0/2,r0-rs-1.4,0])
      rotate([0,-45,0])
      cylinder(r1=rs+0.8,r2=rs,h=4*x0,center=true);
    }
    
    // material reduction
    translate([1.5,0,0])
    rotate([0,90,0])
    difference(){
      cylinder(r1=r0-4*rs-2,r2=r0-4*rs,h=x0,center=true);
      cylinder(r1=r3+2,,r2=r3+1,h=x0,center=true);
    }
  }
  
  
  
  
}

//----------------------------------------------------------------------
module axle(){

    translate([0,0,0])
    rotate([0,90,0])
    cylinder(r=r3,h=2*x1,center=true);
    
}

//======================================================================
// diskA is default

//~ tub();

translate([thick+0.2,0,0])
disk();

//~ axle();


//======================================================================

