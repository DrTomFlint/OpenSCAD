// CrickWooder.scad
//
//------------------------------------------------


use <./C1purple.scad>
use <./C1purple2.scad>
use <./C1white1.scad>
use <./C1white2.scad>

//=====================================================

if(1){
intersection(){
  translate([0.6,-1,0])
  cylinder(r=40,h=1.5,$fn=300);

  scale([80,80,1.5]){
    
    //color("white")
    //C1white1();
    //C1white2();
    //color("purple")
    //C1purple();
    C1purple2();

    }
  }
}

// get black by subtraction so no voids between parts
if(0){
  color("black")
difference(){
  cylinder(r=37,h=1.5,$fn=300);

  translate([0,0,-1])
  scale([80,80,4]){
  
//  C1purple();
  C1purple2();
  //C1white1();
  C1white2();
  
  }
  
}
}



//=====================================================

