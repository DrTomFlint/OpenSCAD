//======================================================================
// whirlypoi.scad
//
//
// DrTomFlint 14 March 2026
//======================================================================


thick=1.2;    // thickness of holder walls

rshaft = 7/2;
zshaft = 40;
//~ ywing = 200;
ywing = 270;

F1=299;
F2=55;

Version="B";

//----------------------------------------------------------------------
module wing1(tol=0){

  difference(){
    union(){
      translate([rshaft+thick,0,-zshaft/2])
      cube([1*thick,ywing,1.5*thick]);
      translate([0,0,0])
      cylinder(r=rshaft+thick+tol,h=zshaft,$fn=F1,center=true);
      // ring
      translate([rshaft+thick,25,-zshaft/2])
      rotate([0,90,0])
      cylinder(r=24.5/2+thick,h=2*thick,$fn=F1,center=true);
      // wing
      hull(){
        translate([rshaft+tol,0,-zshaft/2])
        cube([thick,rshaft,zshaft]);
        difference(){
          translate([rshaft+tol,ywing,-zshaft/2])
          rotate([0,90,0])
          cylinder(r=4,h=thick,$fn=F1);
          translate([rshaft+tol,ywing-20,-zshaft/2-40])
          cube([40,40,40]);
        }
      }
    }
    // cut for shaft
    cylinder(r=rshaft+tol,h=zshaft+100,$fn=F1,center=true);      
    // main slot
    translate([-0.4*rshaft,0,-zshaft/2-10/2])
    cube([1.2*rshaft,ywing,zshaft+20]);
    // remove lower lip
    translate([0,0,-zshaft/2-20])
    cube([60,60,20]);


    translate([0,ywing,18])
    scale([1,5.75,1])
    rotate([0,90,0])
    cylinder(r=34,h=5*rshaft,$fn=F1,center=true);

    translate([0,25,-zshaft/2])
    rotate([0,90,0])
    cylinder(r=24.5/2,h=5*rshaft,$fn=F1,center=true);
  }
  
}

//----------------------------------------------------------------------
module wing2(tol=0){

  difference(){
    union(){
      // add a manual raft
      translate([-7,-8,-zshaft/2])
      cube([20,16,2*0.24]);
      
      // footer
      hull(){
        translate([rshaft+0,0,-zshaft/2])
        sphere(r=3,$fn=F2);
        translate([rshaft+0,ywing+1,-zshaft/2])
        sphere(r=3,$fn=F2);
      }
      
      // vertical pipe
      translate([0,0,0])
      cylinder(r=rshaft+thick+tol,h=zshaft,$fn=F1,center=true);
      // coin hole ring
      translate([rshaft+thick,20,-zshaft/2])
      scale([1,1,1.1])
      rotate([0,90,0])
      cylinder(r=24.5/2+2*thick,h=4*thick,$fn=F1,center=true);
      // wing
      hull(){
        translate([rshaft+tol-thick,0,-zshaft/2])
        cube([2*thick,rshaft,zshaft]);
        difference(){
          translate([rshaft+tol-1,ywing,-zshaft/2])
          rotate([0,90,0])
          cylinder(r=4,h=thick,$fn=F1);
          translate([rshaft+tol,ywing-20,-zshaft/2-40])
          cube([40,40,40]);
        }
      }
    }
    // cut for shaft
    cylinder(r=rshaft+tol,h=zshaft+100,$fn=F1,center=true);      
    // main slot
    translate([-0.4*rshaft,0,-zshaft/2-10/2])
    cube([1.2*rshaft,ywing+5,zshaft+20]);
    // remove lower lip
    translate([-20,-20,-zshaft/2-20])
    cube([60,350,20]);

    // top cut
    //~ translate([0,ywing,18])
    //~ scale([1,5.75,1])
    //~ rotate([0,90,0])
    //~ cylinder(r=34,h=5*rshaft,$fn=F1,center=true);
    translate([0,ywing,20])
    scale([1,7.8,1])
    rotate([0,90,0])
    cylinder(r=34,h=5*rshaft,$fn=F1,center=true);

    // coin hole
    translate([0,20,-zshaft/2])
    scale([1,1,1.1])
    rotate([0,90,0])
    cylinder(r=24.5/2,h=5*rshaft,$fn=F1,center=true);
  }
  
   
}

//======================================================================

//~ wing1();
//~ translate([15,0,0])
//~ mirror([1,0,0])
//~ wing1();

wing2();
translate([rshaft+thick-0.6,56,-10])
rotate([0,90,0])
rotate([0,0,90])
linear_extrude(height=0.8)
text("Flint's", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.1);


translate([18,0,0])
mirror([1,0,0])
wing2();
mirror([1,0,0])
translate([rshaft+thick+0.2-18,56,-10])
rotate([0,-90,0])
rotate([0,0,90])
linear_extrude(height=0.8)
text("Finest", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.1);


//======================================================================
