// bikespeaker1.scad
//

//---------------------------
module crossbar(tol=0){

thick=4;
wide=40;

  //
  difference(){
    hull(){
      translate([0,wide,0])
      cylinder(r=20,h=thick,$fn=88);
      translate([0,-wide,0])
      cylinder(r=20,h=thick,$fn=88);
      // third point
      translate([wide,0,0])
      cylinder(r=20,h=thick,$fn=88);      
    }  
    translate([0,wide,-1])
    cylinder(r=2.5,h=thick+2,$fn=88);
    translate([0,-wide,-1])
    cylinder(r=2.5,h=thick+2,$fn=88);
    hull(){
      translate([wide,0,-1])
      cylinder(r=6,h=thick+2,$fn=88);
      translate([wide/2,0,-1])
      cylinder(r=18,h=thick+2,$fn=88);
    }
  }
}

//=========================================

crossbar();

//=======================================
