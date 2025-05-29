//=================================================================================
// Washers.scad
//
// Washers to use with GripRight PrimeGuard Exterior screws
//
// Dr Tom Flint, 10 April 2025
//=================================================================================


thick=3;
rx=16;

rows=4;
cols=5;
rowWide=35;
colWide=35;

F1=99;
F2=99;


//-----------------------------------------------------------------------------------
module washer(){


  difference(){
    cylinder(r1=rx,r2=rx-thick-3,h=thick,$fn=F2);
    cylinder(r=6,h=4*thick,center=true,$fn=F2);
  }
  
  difference(){
    translate([0,0,-5+thick])
    rotate_extrude($fn=F2){
      translate([6.5,0])
      circle(r=5,$fn=F2);
    }
    translate([0,0,-20])
    cube([40,40,40],center=true);
  }
}

//=================================================================================

if(0){
  difference(){
    washer();
    translate([0,-20,0])
    cube([40,40,40],center=true);
  }
}else{  
  for (i=[0:cols-1]){
    for (j=[0:rows-1]){
      translate([i*rowWide,j*colWide,0])
      washer();
    }
  }
}  
  
//=================================================================================
