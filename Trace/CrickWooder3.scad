// CrickWooder.scad
//
//------------------------------------------------


use <./C3purple.scad>
use <./C3white.scad>
use <./C3text.scad>
use <./C3text2.scad>

//=====================================================

if(1){
intersection(){
  cylinder(r=36,h=1.2,$fn=300);

  scale([80,80,1.2]){
    
    //color("white")
    //C3white();
    //color("purple")
    //C3purple();
    //color("white")
    //C3text();
    C3text2();

    }
  }
}

// get black by subtraction so no voids between parts
if(0){
  color("black")
difference(){
  cylinder(r=36,h=1.2,$fn=300);

  translate([0,0,-1])
  scale([80,80,4]){
  
  C3purple();
  C3white();
//  C3text();
  C3text2();
  
  }
  
}
}

// clear disk bottom
if(0){
  color("cyan",alpha=0.4)
  translate([0,0,-0.3])  
  cylinder(r=36,h=0.3,$fn=300);
}

// clear top bottom
if(0){
  color("cyan",alpha=0.4)
  translate([0,0,1.2])  
  cylinder(r=36,h=0.3,$fn=300);
}


//=====================================================

