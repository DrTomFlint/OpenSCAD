// diskClip.scad
//
// clip-on hanger loop for the Mountain Sun / Longs Peak disks
//====================================================================







//---------------------------------------------------------------------
module diskClip(){

$fn=99;

thick=1.5+1.8;

difference(){
  
  hull(){
    translate([1.5,41,0])
    cylinder(r=2,h=thick,center=true);
    translate([-1.5,41,0])
    cylinder(r=2,h=thick,center=true);
    translate([0,37,0])
    cube([14,3,thick],center=true);
  }
  
  // disk
  translate([0,0,0])
  cylinder(r=39,h=1.5+0.2,$fn=300,center=true);

  // trim boss to match disk
  translate([0,0,-0.75])
  cylinder(r=39-2,h=thick*3,$fn=300,center=true);
  

  // loop holes
  translate([1.5,41,0])
  cylinder(r=1,h=10,center=true);
  translate([-1.5,41,0])
  cylinder(r=1,h=10,center=true);
  
}

}

//=====================================================================

diskClip();


//=====================================================================
