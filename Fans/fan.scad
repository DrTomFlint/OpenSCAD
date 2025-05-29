//====================================================================
// fan.scad
// 
// folding fans
//====================================================================


thick = 0.6;
tall = 180;
stub = 20;

Nblade=13;
delta=160/Nblade;

//------------------------------------------------------------------
module blade1(){

$fn = 89;

  difference(){
    hull(){
      translate([0,-stub,0])
      cylinder(r=8,h=thick);
      translate([0,tall,0])
      cylinder(r=22,h=thick);
    }

    // pivot hole
    cylinder(r=2.5,h=3*thick,center=true);
  
  }
}



//------------------------------------------------------------------
module fan1(){

  for(i=[0:Nblade-1]){
    translate([0,0,i*thick])
    rotate([0,0,i*delta])
    color([i/Nblade,i/Nblade,i/Nblade])
    blade1();
  }
}


//====================================================================


fan1();

//====================================================================
