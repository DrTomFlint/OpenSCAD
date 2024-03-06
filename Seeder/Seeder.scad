//======================================================================
// Seeder.scad
// 
// A multi-row seeder for microgreens in a standard 10x20 inch tray.
//
// DrTomFlint 13 Jan 2024
//======================================================================

use <../Gears/gears.scad>

r0 = 20;    // radius disks
//r0 = 19;    // radius disks

r3 = 2.5;     // radius of axle

r3b = 2.5;     // radius of axle
r3c = 0.866*r3b;     // radius of axle
r3a = r3b+0.1;     // radius of axle

r4 = 4;     // radius of outlet 
ang1 = 35;  // rotation of popout to match outlet

r5 = 5;  // radius of popout

x0 = 2.5;     // thickness of disks
//x0 = 4;     // thickness of disks

x1 = 25;    // thickness at top of tub

//thick = 1.2;  // thickness of tub walls
thick = 0.8;  // thickness of tub walls

d0 = 0.2;     // gap around edge of disk
d1 = 3;     // gap from front of disk to tub

F1 = 200;
F2 = 33;

//----------------------------------------------------------------------
module tub(){

  difference(){
    union(){
      // main bin
      hull(){        
        translate([(x0+d1+2*thick)/2,0,0])
        rotate([0,90,0])
        rotate_extrude($fn=F1)
        translate([r0+d0+thick,0,0])
        circle(r=(x0+d1+2*thick)/2,$fn=F2);

        translate([(x0+d1+2*thick)/2+d1,0,0])
        rotate([0,90,0])
        rotate_extrude($fn=F1)
        translate([r0+d0+thick,0,0])
        circle(r=(x0+d1+2*thick)/2,$fn=F2);
        
        translate([thick+x1/2,0,r0+d1+x0])
        cube([x1+2*thick,2*(r0+d0+thick)+(x0+d1+2*thick),3],center=true);
      }

      // exit hole 
      translate([-thick-1.5,-r0/2,3])
      rotate([0,30,0])
      cylinder(r1=r4+thick-2,r2=r4+thick,h=16,$fn=F2);              
      // downpipe
      translate([-thick-1,-r0/2,-25.5])
      cylinder(r=r4+thick-2,h=30,$fn=F2);              
    }
    
    // main bin cut
    hull(){
      translate([(x0+d1+2*thick)/2,0,0])
      rotate([0,90,0])
      rotate_extrude($fn=F1)
      translate([r0+d0,0,0])
      circle(r=(x0+d1)/2,$fn=F2);

      translate([(x0+d1+2*thick)/2+d1,0,0])
      rotate([0,90,0])
      rotate_extrude($fn=F1)
      translate([r0+d0,0,0])
      circle(r=(x0+d1)/2,$fn=F2);
      
      translate([thick+x1/2,0,r0+d0+d1+x0+0.1])
      cube([x1,2*(r0+d0)+(x0+d1),3],center=true);
    }

    // exit hole cut
    translate([-thick-1.5,-r0/2,3])
    rotate([0,30,0])
    cylinder(r1=r4-2,r2=r4,h=16.1,$fn=F2);  
                
    // downpipe cut
    translate([-thick-1,-r0/2,-25.5])
    cylinder(r=r4-1.75,h=30,$fn=F2);              
    
    // axle cuts
    translate([0.75*x1,0,0])
    rotate([0,90,0])
    cylinder(r=r3a+0.15,h=10,center=true,$fn=F2);
    translate([0,0,0])
    rotate([0,90,0])
    cylinder(r=r3c+0.15,h=10,center=true,$fn=F2);
    
  }

  // built in washer so disk spins freely
  difference(){
    // axle cut
    translate([thick,0,0])
    rotate([0,90,0])
    cylinder(r=r3+5,h=0.5,center=true,$fn=F2);

    // axle cut
    translate([0,0,0])
    rotate([0,90,0])
    cylinder(r=r3+4.5,h=2*x1,center=true,$fn=F2);
  }
  
}

//----------------------------------------------------------------------
module tub_OLD(){

  difference(){
    union(){
      // main bin
      hull(){
        rotate([0,90,0])
        cylinder(r=r1+thick,h=x0+d0+thick+1);
        
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
      cylinder(r=r1-thick,h=x0+d0+1);
      
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
    cylinder(r=r3+0.05,h=2*x1,center=true);
    
  }
  
}

//----------------------------------------------------------------------
module disk(N=5,rs=1){

  difference(){

    translate([(x0+d1+2*thick)/2,0,0])
    rotate([0,90,0])
    rotate_extrude($fn=F1)
    
    hull(){
      translate([r0,0,0])
      circle(r=(x0)/2,$fn=F2);
      translate([0.5,0])
      square([1,x0],center=true);
    }
    
    // axle cut
    translate([0,0,0])
    rotate([0,90,0])
    cylinder(r=r3+0.1,h=2*x1,center=true,$fn=6);
  
    // scoop cuts
    for(i=[0:N-1]){
      rotate([360/N*i-15,0,0])
      translate([x0/2+2.5,r0-rs-2.5,0])
      rotate([0,-45,0])
      cylinder(r1=3.0*rs,r2=0.8*rs,h=4*x0,center=true,$fn=F2);

      rotate([360/N*i-37,0,0])
      translate([x0/2+4,r0-rs-2,0])
      rotate([15,-6,0])
      rotate([0,-90,0])
      scale([1.5,0.8,1])
      cylinder(r=5.5,h=2,center=true,$fn=F2);
    }
    

  }

}

//----------------------------------------------------------------------
module popout(N=5,rs=1){

rotate([ang1,0,0])
  translate([r5+5.5,0,r0-4.5]){
    difference(){
      // main disk
      rotate([0,0,0]){
        cylinder(r=r5, h=4);
      }  

      // axle cut
      translate([0,0,0])
      rotate([0,0,0])
      cylinder(r=1.7,h=10,center=true);


    }
    
    // popouts
    rotate([0,0,90])
    translate([0,0,2])
    for(i=[0:1]){
      rotate([360/2*i,0,0])
      translate([0,r5+2,0])
      rotate([0,0,0])
      rotate([90,0,0])
      scale([1.5,1,1])
      cylinder(r1=0.5*rs,r2=1.25*rs,h=6.0,center=true);
    }
  }  
  
}

//----------------------------------------------------------------------
module axle(){

  translate([x1,0,0])
  rotate([0,90,0])
  cylinder(r=r3a,h=39,center=true,$fn=F2);

  translate([7.5,0,0])
  rotate([0,90,0])
  cylinder(r=r3,h=10,center=true,$fn=6);
   
  translate([0,0,0])
  rotate([0,90,0])
  cylinder(r=r3c,h=10,center=true,$fn=F2);
}

//----------------------------------------------------------------------
module axle2(){

  difference(){
    rotate([ang1,0,0])
    union(){
      translate([r5+5.5,0,x1-3])
      cylinder(r=r3,h=x1+15,center=true);
      hull(){
        translate([8.75,0,0])
        rotate([0,90,0])
        cylinder(r=r3+1,h=5.5,center=true);
        translate([8.75+1.75,0,6])
        rotate([0,90,0])
        cylinder(r=r3,h=2,center=true);
      }
    }
    
    // axle cut
    rotate([0,90,0])
    cylinder(r=r3+0.2,h=2*x1,center=true);

    tub();
    
    // printable flat
    translate([50+11.5,0,0])
    cube([100,100,100],center=true);
  }
}

//----------------------------------------------------------------------
module cap_OLD(){

  difference(){
    translate([(x1+4*thick)/2-thick,-r0/2-3*thick,r0+thick])
    cube([x1+4*thick,20,4*thick],center=true);

    // main cut
    translate([(x1+4*thick)/2-thick,-r0/2-2*thick,r0])
    cube([x1+2*thick+0.5,20,4*thick],center=true);

    // cut for axle2
    rotate([ang1,0,0])
    translate([r5+5.5,0,x1-5])
    cylinder(r=r3+0.2,h=x1+15,center=true);

  }

  difference(){

    // collar
    rotate([ang1,0,0])
    translate([r5+5.5,0,x1+2])
    cylinder(r=r3+3,h=14.75,center=true);

    // cut for axle2
    rotate([ang1,0,0])
    translate([r5+5.5,0,x1-5])
    cylinder(r=r3+0.2,h=x1+15,center=true);

    // cut collar off flat
    translate([(x1+4*thick)/2-thick,-r0/2-3*thick,r0+8.5])
    cube([x1+4*thick,20,10],center=true);
  }
  
}

//----------------------------------------------------------------------
module cap(tol=0.2){

  difference(){
    translate([thick+x1/2,0,r0+d0+thick-1])
    cube([x1+4*thick,2*r0+4*thick,5],center=true);

    translate([thick+x1/2,0,r0+d0-1])
    cube([x1+2*thick+tol,2*r0+2*thick+tol,5],center=true);
  
  }
  
}


//======================================================================
// diskA is default

xoff=0;
yoff=100;

difference(){
  union(){
    
// gear for modeling
//~ rotate([ang1,0,0])
//~ translate([x0+1.4,0,0])
//~ rotate([0,90,0])
//~ bevel_gear_pair(modul=1, gear_teeth=12*2.5, pinion_teeth=12, axis_angle=90, tooth_width=5, gear_bore=r3*2+0.2, pinion_bore=r3*2+0.2, pressure_angle = 20, helix_angle=20, together_built=true);

// gear for printing
//~ bevel_gear_pair(modul=1, gear_teeth=12*2.5, pinion_teeth=12, axis_angle=90, tooth_width=5, gear_bore=r3*2+0.2, pinion_bore=r3*2+0.2, pressure_angle = 20, helix_angle=0, together_built=false);

//~ tub();

//~ cap();

//~ translate([-0.5,0,0])
//~ disk();

//~ popout();

axle();

//~ axle2();


}

translate([100+xoff,100+yoff,0])
cube([200,200,200],center=true);
}


//======================================================================

