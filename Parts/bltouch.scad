// bltouch.scad
// This is for a BLTouch SMART V3.1 from Antclabs
// in the retracted position (up=1) the tip should be 2.3 to 4.3 mm
// above the tip of the nozzle of the extruder

//------------------------------------------
module bltip(){

// probe tip
cylinder(r1=1.4/2,r2=2.05/2,h=3.13,$fn=17);
translate([0,0,3.12])
cylinder(r=1.56/2,h=3.71,$fn=17);
translate([0,0,3.13+3.7])
cylinder(r=2.05/2,h=3.5,$fn=17);

}
//------------------------------------------
module blbody(tol=0){

// main body
hull(){
  cylinder(r=7.25/2,h=0.01);
  translate([0,0.05,26.25-22.0+11.0])
  intersection(){
    cube([13.10,11.5,22.0],center=true);
    translate([0,-0.5,0])
    cylinder(r=6.5,h=22,center=true,$fn=77);
  }
color("red")
translate([0,3,26.25-22.0+11.0])
cube([13.10,5,22.0],center=true);
}

// pcb
color("green")
translate([0,5.2,5.5+19.5/2])
cube([13.2,1.5,19.5],center=true);

// connector
color("gray")
translate([0,5.25+3.8/2,16.9])
cube([11.5,3.8,6.7],center=true);

// upper cylinder
translate([0,0,26.24])
cylinder(r=11.5/2,h=8.4,$fn=77);

// top flange
difference(){
  hull(){
    translate([0,0,36.45-2.4/2])
    cube([6.25+tol,11.65+tol,2.4+tol],center=true);
    translate([0,0,36.45-2.4]){
      translate([9.0,0,0])
      cylinder(r=3.85+tol/2,h=2.4+tol,$fn=22);
      translate([-9.0,0,0])
      cylinder(r=3.85+tol/2,h=2.4+tol,$fn=22);
    }
  }

  translate([0,0,36.45-2.5]){
    translate([9.0,0,0])
    cylinder(r=3.2/2,h=2.6,$fn=22);
    translate([-9.0,0,0])
    cylinder(r=3.2/2,h=2.6,$fn=22);
  }
}

}
//-------------------------------------------
module bltouch(
tol=0,
up=0
){

if(up==1){  
  translate([0,0,-3.25])   // up position
  bltip();
}
if(up==0){
  translate([0,0,-9.7])   // down position
  bltip();
}
blbody();
}

//============================================

bltouch(up=1,tol=0);

//=============================================





