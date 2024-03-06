//======================================================================
// Seeder.scad
// 
// A multi-row seeder for microgreens in a standard 10x20 inch tray.
//
// DrTomFlint 13 Jan 2024
//======================================================================

use <../Gears/gears.scad>

// Disk
r0 = 20;    // radius disk
x0 = 1.8;     // thickness of disks
z0 = 1.0;     // height of cups
N = 5;      // number of scoops
rs = 1.5;       // radius of seed holes
inset = 4;    // inset seed hole to edge of disk
collar = 6;    // length of axle collar

// Axle
r3 = 2.5;     // radius of axle
r3b = 2.5;     // radius of axle
r3c = 0.866*r3b;     // radius of axle
r3a = r3b+0.1;     // radius of axle

// Outlet
zout = 6;

// Reservoir
zres = 15;    // height of reservoir

r5 = 5;  // radius of popout

x1 = 25;    // thickness at top of tub
thick = 0.8;  // thickness of tub walls

d0 = 0.2;     // gap disk to well
d1 = 3;     // gap from front of disk to tub

F1 = 200;
F2 = 33;

//----------------------------------------------------------------------
module bin(){

  // disk well
  difference(){
    union(){
      // boss
      hull(){
        rotate([0,90,0])
        translate([0,0,-thick-d0])
        cylinder(r=r0+2+thick,h=x0+2*d0+2*thick+z0+d0,$fn=F1);
        
        translate([(x0+2*d0+2*thick+z0+d0)/2-thick-d0,0,r0+2+thick])
        cube([x0+2*d0+2*thick+z0+d0,2*(r0+2+thick),2],center=true);
      }
      
      // reinforce axle pass-throughs
      rotate([0,90,0])
      translate([0,0,-thick-d0-2+0.1])
      cylinder(r2=r3c+2,r1=r3c+1,h=2,$fn=F1);
    }
    

    // cut for disk
    hull(){
      rotate([0,90,0])
      translate([0,0,-d0])
      cylinder(r=r0+2,h=x0+2*d0,$fn=F2);

      translate([0,0,3*r0])
      rotate([0,90,0])
      translate([0,0,-d0])
      cylinder(r=r0+2,h=x0+2*d0,$fn=F2);
    }
        
    // cut to reservoir
    hull(){
      rotate([0,90,0])
      translate([0,0,x0+d0-0.1])
      cylinder(r=r0-inset/2,h=z0+d0+x0,$fn=F2);

      translate([0,0,3*r0])
      rotate([0,90,0])
      translate([0,0,x0+d0-0.1])
      cylinder(r=r0-inset/2,h=z0+d0+x0,$fn=F2);
    }
    
    // axle C cut
    translate([0,0,0])
    rotate([0,90,0])
    cylinder(r=r3c+0.15,h=10,center=true,$fn=F1);
    
    // outlet cut
    hull(){
      translate([-0.5,-0.6*r0,0.5*r0])
      rotate([0,90,0])
      cylinder(r1=8,r2=7,h=2*thick,center=true,$fn=F2);
      translate([-0.5,0,0.7*r0])
      rotate([0,90,0])
      cylinder(r1=4,r2=3,h=2*thick,center=true,$fn=F2);
    }

    // dump out anything caught at the bottom of the well
    translate([0,0,-1.25*r0])
    cube([20,30,10],center=true);

  }
  
  // Reservoir
  difference(){
    union(){
      hull(){
        rotate([0,90,0])
        translate([0,0,x0+d0+z0])
        cylinder(r1=r0-inset/2+thick,r2=0.9*(r0-inset/2+thick),h=zres,$fn=F1);
    
        translate([zres/2+x0+d0+z0,0,r0+2+thick])
        cube([zres,2*(r0+2+thick),2],center=true);
      }

      // reinforce axle pass-throughs
      rotate([0,90,0])
      translate([0,0,x0+d0+z0+zres-0.1])
      cylinder(r1=r3a+2,r2=r3a+1,h=2,$fn=F1);
      
    }
    
    // main cut
    hull(){
      rotate([0,90,0])
      translate([0,0,x0+d0+z0])
      cylinder(r1=r0-inset/2,r2=0.9*(r0-inset/2),h=zres-thick,$fn=F2);
  
      translate([zres/2+x0+d0+z0-thick/2,0,r0+2+thick])
      cube([zres-thick,2*(r0+2)-thick,3],center=true);
    }
    
    // axle A cut
    translate([zres,0,0])
    rotate([0,90,0])
    cylinder(r=r3a+0.15,h=12,center=true,$fn=F2);
    
  }

  // Outlet
  difference(){
    union(){
      // main shute
      hull(){
        translate([-thick-zout/2,-0.6*r0,0.5*r0])
        rotate([0,90,0])
        cylinder(r=8+thick,h=zout+thick,center=true,$fn=F1);
        translate([-thick-zout/2,0,0.7*r0])
        rotate([0,90,0])
        cylinder(r=4+thick,h=zout+thick,center=true,$fn=F1);

        translate([-thick-d0-zout/2,0,r0+2+thick])
        cube([zout,2*(r0+2+thick),2],center=true);
      }
      // down spout
      hull(){
        translate([-thick-zout/2,-0.6*r0,0.1*r0])
        scale([1,2,1])
        cylinder(r=zout/2+thick/2,h=2,$fn=F1);
        translate([-thick-zout/2,-0.6*r0,-1.2*r0])
        cylinder(r=zout/2+thick/2,h=2,$fn=F1);
      }
    }
    // shute cut
    hull(){
      translate([-thick-zout/2,-0.6*r0,0.5*r0])
      rotate([0,90,0])
      cylinder(r=8,h=zout-thick,center=true,$fn=F2);
      translate([-thick-zout/2,0,0.7*r0])
      rotate([0,90,0])
      cylinder(r=4,h=zout-thick,center=true,$fn=F2);

      translate([-thick/2-d0-zout/2,0,r0+2+2*thick])
      cube([zout-thick,2*(r0+2),3],center=true);
    }
  
    // down spout cut
    hull(){
      translate([-thick-zout/2,-0.6*r0,0.1*r0])
      scale([1,2,1])
      cylinder(r=zout/2+thick/2-thick,h=2.2,$fn=F2);
      translate([-thick-zout/2,-0.6*r0,-1.2*r0])
      cylinder(r=zout/2+thick/2-thick,h=2.2,$fn=F2);
    }
    hull(){
      translate([-0.5,-0.6*r0,0.5*r0])
      rotate([0,90,0])
      cylinder(r1=8,r2=7,h=2*thick,center=true,$fn=F2);
      translate([-0.5,0,0.7*r0])
      rotate([0,90,0])
      cylinder(r1=4,r2=3,h=2*thick,center=true,$fn=F2);
    }
    
  
  }
  
   
}


//----------------------------------------------------------------------
module disk(){

  //~ rotate([0,90,0])
  difference(){
    union(){
      // disk
      cylinder(r=r0,h=x0,$fn=F1);
      
      // collar, blocks disk against sides of reservoir
      cylinder(r1=r3+2*thick,r2=r3+thick,h=collar+x0,$fn=F1);
      cylinder(r1=r3+6*thick,r2=r3+1*thick,h=collar/2+x0,$fn=F1);
      
      // scoops 
      for(i=[0:N-1]){
        rotate([0,0,360/N*i])
        translate([r0-rs-inset,0,x0-0.01])
        difference(){
          cylinder(r1=rs+1.5,r2=rs+1,h=z0,$fn=F2);
          translate([1,-3,0])
          cylinder(r=1.5*rs,h=z0,$fn=F2);
          
          // tiny cut to prevent seed grinding
          translate([0,-rs,0])
          rotate([30,0,0])
          cube([2*rs,2*rs,2*rs]);
        }
      }
    }
    
    // axle cut
    cylinder(r=r3+0.2,h=2*x1,center=true,$fn=6);
  
    // scoop cuts
    for(i=[0:N-1]){
      rotate([0,0,360/N*i])
      translate([r0-rs-inset,0,x0/2])
      cylinder(r1=1.2*rs,r2=rs,h=4*x0,center=true,$fn=F2);
    }
    
    // mark with Rs
    t1 = str(rs);
    echo(t1);
    translate([-r0/2,0,x0-0.6])
    rotate([0,0,90])    
    linear_extrude(height=0.61,scale=1)
    text(text = t1, font = "Open Sans:style=Bold", size=4, halign="center", valign="center", spacing=1.0);

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

  translate([32,0,0])
  rotate([0,90,0])
  cylinder(r=r3a,h=30,center=true,$fn=F1);

  translate([9,0,0])
  rotate([0,90,0])
  cylinder(r=r3,h=zres+x0+z0,center=true,$fn=6);
   
  translate([0,0,0])
  rotate([0,90,0])
  cylinder(r=r3c,h=16,center=true,$fn=F1);
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

xoff=300;
yoff=0;

difference(){
  union(){
    
// gear for modeling
//~ rotate([ang1,0,0])
//~ translate([x0+1.4,0,0])
//~ rotate([0,90,0])
//~ bevel_gear_pair(modul=1, gear_teeth=12*2.5, pinion_teeth=12, axis_angle=90, tooth_width=5, gear_bore=r3*2+0.2, pinion_bore=r3*2+0.2, pressure_angle = 20, helix_angle=20, together_built=true);

// gear for printing
//~ bevel_gear_pair(modul=1, gear_teeth=12*2.5, pinion_teeth=12, axis_angle=90, tooth_width=5, gear_bore=r3*2+0.2, pinion_bore=r3*2+0.2, pressure_angle = 20, helix_angle=0, together_built=false);

//~ bin();

//~ cap();

//~ translate([-0.5,0,0])
disk();

//~ popout();

//~ axle();

//~ axle2();


}

  translate([100+xoff,100+yoff,0])
  cube([200,200,200],center=true);
}


//======================================================================

