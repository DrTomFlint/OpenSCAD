// table.scad
// scanner part

F2=88;

// --------------------------------------------------------------------
module table(type=1){
  
  // plain flat base
  color("gray")
  translate([0,0,11.5])
  cylinder(r=90,h=2,$fn=F2);
  
  // add the support pillar in the center
  if(type==2){
    color("gray")
    translate([0,0,11.5])
    cylinder(r=6,h=100-11.5-10,$fn=F2);
  }
  
}
//=======================================

table(type=1);

//==============================================
