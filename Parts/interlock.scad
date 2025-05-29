//======================================================================
// interlock.scad
//
// Parametric interlocking tabs
//
// DrTomFlint, 19 Oct 2024
//======================================================================


//----------------------------------------------------------------------
module lockRing(rout=10,rin=6,thick=2,upper=1,lower=1,f=33){

$fn=f;

if(upper==1){
  // boss
  difference(){
    cylinder(r=rout,h=thick/2);
    cylinder(r=rin,h=thick+1,center=true);
  }
}


if(lower==1){

  difference(){
    // boss
    difference(){
      translate([0,0,-thick/2])
      cylinder(r=rout,h=thick/2);
      cylinder(r=rin,h=thick+1,center=true);
    }
  }

}



}



//======================================================================

pan=0;

//~ lockRing(rout=10,rin=6,thick=2,lower=0);

rotate([0,0,pan])
lockRing(rout=10,rin=6,thick=2,upper=0);

//======================================================================
