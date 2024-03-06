// headband.scad
// Scale a 100 mm radius sphere to model a head.
// Make it hollow, thickness ~ 1 mm.
// Slice out a headband with a zlow and zhigh cut mark.

//-----------------------------------------------------------
module headband(
gain=1.1,
thick=1.0,
zlow=50,
zhi=60,
r0=100,
tol=0
){
F1=150;

// set base of loop to z=0
translate([0,0,-zlow])

difference(){
//  scale([1,0.85,1.25])
  scale([1,0.80,1.33])
  sphere(r=r0*gain+thick,$fn=F1);
//  scale([1,0.85,1.25])
  scale([1,0.80,1.33])
  sphere(r=r0*gain,$fn=F1);
 
  // lower cut  
  translate([0,0,-2*r0+zlow])
  cube([3*r0,3*r0,4*r0],center=true);

  // upper cut  
  translate([0,0,2*r0+zhi])
  cube([3*r0,3*r0,4*r0],center=true);

}

}
//-----------------------------------------------------
module hatband(
gain=1.1,
thick=1.2,
zlow=50,
zhi=60,
r0=105,
tol=0,

rx=10,
ry=116
){

F1=150;
  xx=gain*rx;
  t2=thick/2;

difference(){
    scale([1,0.78,1])
    rotate_extrude($fn=100)
    translate([ry,0,0])
    rotate([0,0,180])
    translate([-gain*rx/2,gain*rx/2,0])

    intersection(){
      difference(){
        circle(r=rx*gain+thick);
        translate([0,1.5])
        circle(r=rx*gain);
      }
      
      translate([-0*gain*rx,-3*gain*rx])
      square([3*gain*rx,3*gain*rx]);
    }

  // slice off a bit to make printable without support
    translate([0,0,20+rx/2+thick-1])
    cube([4*ry,4*ry,40],center=true);
}  

  // brim
  scale([1,0.78,1])
  translate([0,0,rx/2+thick/2-1])
  difference(){
    scale([1,1.07,1])
    cylinder(r=ry+8,h=thick,center=true,$fn=100);
    cylinder(r=ry+5,h=thick+3,center=true,$fn=100);
  }

}

//==================================================

//~ headband(zlow=62,zhi=68,thick=1.5,gain=1.105);

    //~ headband(zlow=50,zhi=65,thick=0.8);

rotate([0,180,0])
  hatband();

// from crown4:
if(0){
    // base channel
    translate([0,0,0])
    headband(zlow=50,zhi=54,thick=3.5);

    // top channel
    translate([0,0,10])
    headband(zlow=58,zhi=59,thick=3.0);

    // main band
    headband(zlow=50,zhi=74);
}


//====================================================
