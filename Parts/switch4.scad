//=================================================================================
// switch4.scad
// Small slide switch on Poi
//
// Dr Tom Flint, 15 June 2023
//=================================================================================

//-------------------------------------------------------
module switch4(pos=1,holes=1,tol=0){

  // body
  if(holes>0){
    difference(){
      translate([0,0,-0.2])
      cube([19.2+tol,5.3+tol,0.4+tol],center=true);
      translate([7.3,0,0])
      cylinder(r=1,h=3,center=true,$fn=22);
      translate([-7.3,0,0])
      cylinder(r=1,h=3,center=true,$fn=22);
    }
  }else{
    translate([0,0,-0.2])
    cube([19.2+tol,5.3+tol,0.4+tol],center=true);
  }
  translate([0,0,-0.4-4.85/2])
  cube([11.2+tol,5.3+tol,4.85+tol],center=true);

  // wiring tabs
  color("red")
  translate([0,0,-5.25]){
    translate([0,0,-3.4/2])
    cube([0.5+tol,1.5+tol,3.4+tol],center=true);
    translate([3.8,0,-3.4/2])
    cube([0.5+tol,1.5+tol,3.4+tol],center=true);
    translate([-3.8,0,-3.4/2])
    cube([0.5+tol,1.5+tol,3.4+tol],center=true);
    
  }

  if(pos>0){
    translate([1.5,0,4.2/2])
    cube([3+tol,3+tol,4.2+tol],center=true);
  }else{
    translate([-1.5,0,4.2/2])
    cube([3+tol,3+tol,4.2+tol],center=true);
  }
}

//==================================================================================


switch4(pos=1,holes=0,tol=0.25);


//==================================================================================




