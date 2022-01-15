// ms3.scad
//
//------------------------------------------------


use <./ms3blue.scad>
use <./ms3green.scad>
use <./ms3orange.scad>
use <./ms3purple.scad>
use <./ms3yellow.scad>

//=====================================================

if(0){
intersection(){
  translate([0.6,-1,0])
  cylinder(r=50,h=2.1,$fn=300);

scale([100,100,2.1]){
  
  ms3blue();  
//  ms3green();  
//  ms3purple();  
//  ms3yellow();
  
}
}
}

// get black by subtraction so no voids between parts
if(1){
difference(){
  translate([0.3,-1,0])
  cylinder(r=49,h=2.1,$fn=300);

  translate([0,0,-1])
  scale([100,100,4]){
  
    color("blue")
    ms3blue();
    
    color("green")
    ms3green();
        
    color("purple")
    ms3purple();
    
    color("yellow")
    ms3yellow();
  }
  
}
}



//=====================================================

