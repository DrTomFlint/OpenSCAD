//=================================================================================
// switch3.scad
// Model for metal toggle switches on globes and bike
//
// Dr Tom Flint, 26 Dec 2021
//=================================================================================

//-------------------------------------------------------
module switch3(pos=1,nut=0,washer=0){

  // stack
  cylinder(r=6.15/2,h=8.8,$fn=88);
  translate([0,0,8.8])
  rotate([10*pos,0,0])
  cylinder(r1=2.4/2,r2=3.1/2,h=10.2,$fn=88);

  // body
  translate([0,0,-9.5/2])
  cube([7,12.75,9.5],center=true);

  // wiring tabs
  color("red")
  translate([0,0,-13]){
    translate([0,0,4/2])
    cube([2.2,0.75,4],center=true);
    translate([0,4.3,4/2])
    cube([2.2,0.75,4],center=true);
    translate([0,-4.3,4/2])
    cube([2.2,0.75,4],center=true);
    
  }

  if(nut>0){
    translate([0,0,nut])
    cylinder(r=9.2/2,h=1.6,$fn=6);
  }
  if(washer>0){
    translate([0,0,washer]){
      cylinder(r=11.9/2,h=0.7,$fn=67);
      translate([0,5.8,-.1])
      cube([2.15,1.3,1.8],center=true);
    }
  }

}

//==================================================================================


switch3(pos=-1,nut=2,washer=1);


//==================================================================================




