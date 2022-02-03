// CrickWooder.scad
//
//------------------------------------------------


use <./C1purple.scad>
use <./C2purple2.scad>
use <./C1white1.scad>
use <./C2white2.scad>

//=====================================================

if(0){
intersection(){
  cylinder(r=37.5,h=1.2,$fn=300);

  scale([80,80,1.2]){
    
    //color("white")
    //C1white1();
    //C2white2();
    //color("purple")
    //C1purple();
    C2purple2();

    }
  }
}

// get black by subtraction so no voids between parts
if(1){
  color("black")
difference(){
  cylinder(r=37,h=1.2,$fn=300);

  translate([0,0,-1])
  scale([80,80,4]){
  
//  C1purple();
  C2purple2();
  //C1white1();
  C2white2();
  
  }
  
}
}

// clear disk bottom
if(0){
  color("cyan",alpha=0.4)
  translate([0,0,-0.3])  
  cylinder(r=37.5,h=0.3,$fn=300);
}

// clear top bottom
if(0){
  color("cyan",alpha=0.4)
  translate([0,0,1.2])  
  cylinder(r=37.5,h=0.3,$fn=300);
}


//=====================================================

