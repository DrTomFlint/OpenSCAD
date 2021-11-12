//=================================================================================
// flexCoupler.scad
//
// McMaster-Carr PN 2464K25 8 mm to 3/8" spiral cut with 10k rpm rating
//
// Dr Tom Flint, 11 Nov 2021
//=================================================================================



//---------------------------------------------------------------------
module flexCoupler(){
  
  difference(){
    // main barrel
    rotate([0,90,0])
    cylinder(r=25/2,h=30,center=true,$fn=99);
  
    // 8 mm end
    translate([15-7.2/2,0,0])
    rotate([0,90,0])
    cylinder(r=8/2,h=7.3,center=true,$fn=99);

    // 3/8 inch end
    translate([-15+7.2/2,0,0])
    rotate([0,90,0])
    cylinder(r=3/8*25.4/2,h=7.3,center=true,$fn=99);
    
    // screw holes approximate M3x10
    translate([15.7/2+7.2/2, (25-8)/2, 0]){
      cylinder(r=1.5,h=25,center=true,$fn=99);
      cylinder(r=5.5/2,h=20,$fn=99);
    }
  
    // screw holes approximate M3x10
    translate([-15.7/2-7.2/2, (25-8)/2, 0]){
      cylinder(r=1.5,h=25,center=true,$fn=99);
      cylinder(r=5.5/2,h=20,$fn=99);
    }
    
    // slot
    translate([0,10,0])
    cube([40,20,1],center=true);
  }
}


//=================================================================================

flexCoupler();

//=================================================================================
