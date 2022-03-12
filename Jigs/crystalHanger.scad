// crystalHanger.scad
// 25 Feb 2021, Tom Flint
//-------------------------


module crystalHanger(){

difference(){
    translate([0,0,4])
    cube([12.6+2.4, 11.2+2.4, 8],center=true);
    
  translate([0,0,21.2])
  cube([12.6, 11.2, 40],center=true);

  translate([8,0,4+1.2])
  rotate([0,60,0])
  cube([12.6+2.4, 11.2+2.4+2, 8],center=true);
  
}
  difference(){

    translate([6,0,0])
    cylinder(r=6.75,h=1.2,$fn=89);

    translate([9,0,0])
  cylinder(r=1.7,h=10,center=true,$fn=23);
}
}

//==========================================

crystalHanger();

//==========================================
