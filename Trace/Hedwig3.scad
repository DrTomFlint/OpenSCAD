// Hedwig3.scad
//
//------------------------------------------------


use <./Hedwig3black.scad>
use <./Hedwig3green.scad>
use <./Hedwig3purple.scad>
use <./Hedwig3purple2.scad>
use <./Hedwig3yellow.scad>
use <./Hedwig3white.scad>
use <./Hedwig3white2.scad>

//=====================================================

S=45;

if(1){
  intersection(){
    cylinder(r=S/2,h=1.2,$fn=300);

    scale([S,S,1.2]){
      
    //  Hedwig3purple();  
    //  Hedwig3green();  
    //  Hedwig3white();  
      Hedwig3yellow();
    }
  }
}

// get black by subtraction so no voids between parts
if(0){
intersection(){
  cylinder(r=S/2,h=1.2,$fn=300);

difference(){

  scale([S,S,1.2])
  color("black")
  cylinder(r=S/2,h=1.2,$fn=300);
//  Hedwig3black();

  translate([0,0,-1])
  scale([S,S,4]){
    
    color("purple")
    Hedwig3purple2();
    
    color("green")
    Hedwig3green();
        
    color("white")
    Hedwig3white2();
    
    color("yellow")
    Hedwig3yellow();
  }
  
}
}
}


//=====================================================

