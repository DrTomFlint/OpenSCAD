// Hedwig2.scad
//
//------------------------------------------------


use <./Hedwig2blue.scad>
use <./Hedwig2green.scad>
use <./Hedwig2blue2.scad>
use <./Hedwig2green2.scad>
use <./Hedwig2white.scad>
use <./Hedwig2black.scad>
use <./Hedwig2yellow.scad>

//=====================================================

if(0){
intersection(){
  cylinder(r=50,h=2.1,$fn=300);

scale([100,100,2.1]){
  
//  Hedwig2blue();  
//  Hedwig2green();  
//  Hedwig2white();  
  Hedwig2yellow();
}
}
}

// get black by subtraction so no voids between parts
if(1){
intersection(){
  cylinder(r=50,h=2.1,$fn=300);

difference(){

  scale([100,100,2.1])
  color("black")
  Hedwig2black();

  translate([0,0,-1])
  scale([100,100,4]){

    
    color("blue")
    Hedwig2blue2();
    
    color("green")
    Hedwig2green2();
        
    color("white")
    Hedwig2white();
    
    color("yellow")
    Hedwig2yellow();
  }
  
}
}
}


//=====================================================

