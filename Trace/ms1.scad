// ms1.scad
//
//------------------------------------------------


use <./ms1black.scad>
use <./ms1blue.scad>
use <./ms1green.scad>
use <./ms1orange.scad>
use <./ms1purple.scad>
use <./ms1yellow.scad>

//=====================================================

/*
intersection(){
  translate([0.6,-1,0])
  cylinder(r=50,h=2.1,$fn=300);

scale([100,100,2.1]){
  
//  color("black")
//  ms1black();
  
//  color("blue")
//  ms1blue();
  
//  color("green")
//  ms1green();
  
//  color("orange")
//  ms1orange();
  
//  color("purple")
//  ms1purple();
  
//  color("yellow")
//  ms1yellow();
  
}
}

*/
if(1){
difference(){
  translate([0.6,-1,0])
  cylinder(r=50,h=2.1,$fn=300);

  translate([0,0,-1])
  scale([100,100,4]){
  
    color("blue")
    ms1blue();
    
    color("green")
    ms1green();
    
    color("orange")
    ms1orange();
    
    color("purple")
    ms1purple();
    
    color("yellow")
    ms1yellow();
  }
  
}
}



//=====================================================

