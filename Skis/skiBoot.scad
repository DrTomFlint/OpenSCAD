//--------------------------------------------------------------------
// skiBoot.scad
// 
// PetG and NinjaFlex boot for ski pole tips

//--------------------------------------------------------------------


use <../Parts/rounder.scad>


//--------------------------------------------------------------------
module skiBootPetG(){
  
$fn=89;
  
  difference(){
    // around the carbide tip
    union(){
      cylinder(r1=13/2,r2=15/2,h=11);
      translate([0,0,11])
      cylinder(r=12/2,h=2.1);
    }
    
    translate([0,0,2.1])
    cylinder(r=9.2/2,h=12);
    
    // include a drain hole
    cylinder(r=1,h=30,center=true);
    
    
  }

}

//--------------------------------------------------------------------
module skiBootFlex(){

$fn=89;
  
  
  // B section taper
  translate([0,0,11]){
    difference(){
      cylinder(r1=15/2,r2=13/2+3,h=12);
      translate([0,0,-0.01])
      cylinder(r1=9.2/2,r2=14/2,h=12.02);

      cylinder(r=12/2,h=2.1);
    }
  }
  
  // C secton upper shaft
  translate([0,0,11+12]){
    difference(){
      cylinder(r1=13/2+3,r2=15/2+2,h=25);
      translate([0,0,-0.01])
      cylinder(r1=14/2,r2=15/2,h=25.02);
      
      // diagonal cut
      translate([0,20,33])
      rotate([45,0,0])
      cube([50,50,50],center=true);

    // hole for cord
    translate([0,-8,16]){
      translate([0,0,4])
      rotate([90,0,0])
      rotate([0,0,30])
      cylinder(r=2,h=8,center=true,$fn=6);
    }

    }

  }
  
}


//====================================================================

//color("cyan")
//skiBootPetG();

color("pink",alpha=0.7)
skiBootFlex();

//====================================================================
