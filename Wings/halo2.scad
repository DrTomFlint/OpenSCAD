//======================================================================
// halo2.scad
//
// Posts that support the ring of fibers
//
// DrTomFlint 19 Nov 2023
//======================================================================


//r0=80;
r0=60;
z0=30;
ang0=15;

rpost=1.5;
rball=5;
hball=5;

F1=600;
F2=44;

//----------------------------------------------------------------------
module ring(){

//a=195/2;
//b=165/2;

$fn=F2;

      translate([0,0,z0])
      rotate([0,-ang0,0])
      
      rotate_extrude($fn=199){
        translate([r0,0,0])
        scale([0.3,1])
        circle(r=3.5);
      }

        
}

//----------------------------------------------------------------------
module ringOld(){

//a=195/2;
//b=165/2;

$fn=F1;

      translate([0,0,z0])
      rotate([0,-ang0,0])
      difference(){
        union(){
          cylinder(r=r0+0.75, h=6, center=true);
          //cylinder(r=r0+2, h=2.2, center=true);
        }
        cylinder(r=r0-0.75, h=7, center=true);
      }
        
}

//----------------------------------------------------------------------
module halo2(hi=30,ang1=90,ang2=10){

$fn=F2;

  difference(){
    union(){
      // post
      rotate([0,0,ang1])
      translate([r0+0,0,0])
      cylinder(r1=rpost+1,r2=rpost,h=hi);
      // foot
      rotate([0,0,ang1])
      translate([r0+0,0,0])
      cylinder(r1=rpost+6,r2=rpost+5,h=1.5);  
      // top  
      rotate([0,0,ang1])
      translate([r0,0,hi+rball/2])
      scale([0.6,1,1])
      rotate([90+ang2,0,0])
      cylinder(r=rball,h=hball,$fn=F2,center=true);
    }
    // cut for ring of fibers
    ring();
    
    // cut outside edges off, makes printable
    rotate([0,0,ang1])
    translate([r0+10.6,0,25])
    cube([18,18,52],center=true);

    // holes to sew down
    rotate([0,0,ang1+3])
    translate([r0-1.5,0,0])
    cylinder(r=0.6,h=10,center=true);
    rotate([0,0,ang1-3])
    translate([r0-1.5,0,0])
    cylinder(r=0.6,h=10,center=true);
      rotate([0,0,ang1])
    translate([r0-4.,0,0])
    cylinder(r=0.6,h=10,center=true);
}
}

//======================================================================

//~ ring();

//~ halo2(hi=30.5,ang1=80,ang2=-15);
//~ halo2(hi=22,ang1=110,ang2=-15);
//~ halo2(hi=30,ang1=-80,ang2=15);
halo2(hi=23,ang1=-110,ang2=15);

//======================================================================
