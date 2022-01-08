// ms1.scad
//
//------------------------------------------------


use <./ms2blue.scad>
use <./ms2green.scad>
use <./ms2orange.scad>
use <./ms2purple.scad>
use <./ms2yellow.scad>

//=====================================================

if(0){
intersection(){
  translate([0.6,-1,0])
  cylinder(r=50,h=1.8,$fn=300);

scale([100,100,2.1]){
  
//  color("blue")
//  ms2blue();
  
//  color("green")
//  ms2green();
  
  
//  color("purple")
//  ms2purple();
  
  color("yellow")
  ms2yellow();
  color("orange")
  ms2orange();
  
}
}
}


if(1){
difference(){
  translate([0.3,-1,0])
  cylinder(r=49,h=1.8,$fn=300);

  translate([0,0,-1])
  scale([100,100,4]){
  
    color("blue")
    ms2blue();
    
    color("green")
    ms2green();
    
    color("orange")
    ms2orange();
    
    color("purple")
    ms2purple();
    
    color("yellow")
    ms2yellow();
  }
  
}
}



//=====================================================

