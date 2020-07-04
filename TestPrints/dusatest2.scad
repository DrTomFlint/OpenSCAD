// dusatest1.scad
// a series of test prints for calibrating the Prusa Dusa

difference(){
//intersection(){  

  union(){
    // chimney
    difference(){
      minkowski(){
      cube([12,8,9]);
      cylinder(r=2,h=3,$fn=200);
      }
      minkowski(){
      cube([12,8,11]);
      cylinder(r=1,h=4,$fn=200);
      }
    }
  
    translate([5,-1,0])
    minkowski(){
      cube([2,1,9]);
      cylinder(r=1,h=3,$fn=200);
      }
  }
  
  // cutting planes
  union(){
    translate([-5,-5,0])
    cube([20,20,3]);  

    translate([-5,-5,6])
    cube([20,20,3]);  

  }
}
