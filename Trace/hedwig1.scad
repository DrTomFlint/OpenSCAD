// hedwig1.scad
//
//------------------------------------------------


use <./h1black.scad>
use <./h1white.scad>
use <./h1green.scad>
use <./h1purple.scad>

//=====================================================

if(1){
intersection(){
  translate([0.6,5,0])
  cylinder(r=43,h=1.8,$fn=300);

scale([100,100,2.1]){
    
  //color("green")
  //h1green();  
  
  //color("purple")
  //h1purple();
  
  color("white")
  h1white();
  
//  color("black")
//  h1black();
  
}
}
}

// make black by subtraction to avoid voids
if(0){
difference(){
  translate([0.6,5,0])
  #cylinder(r=43,h=1.8,$fn=300);

  translate([0,0,-1])
  scale([100,100,4]){
  
    color("white")
    h1white();
    
    color("green")
    h1green();
    
//    color("black")
//    h1black();
    
    color("purple")
    h1purple();
    
  }
  
}

  translate([0.6,5,0])
difference(){
  #cylinder(r=44,h=1.8,$fn=300);
  #cylinder(r=43,h=5,$fn=300,center=true);
}

}



//=====================================================

