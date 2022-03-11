// CrickWooder.scad
//
//------------------------------------------------


use <./CrickCoin3purple.scad>
use <./CrickCoin3white.scad>
use <./CrickCoin3text.scad>

//=====================================================

if(1){
intersection(){
  cylinder(r=37,h=1.5,$fn=300);

  scale([80,80,1.5]){
    
    //color("white")
    CrickCoin3white();
    //color("purple")
    //CrickCoin3purple();
    //color("white")
    //CrickCoin3text();

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
  
  CrickCoin3purple();
  CrickCoin3white();
  CrickCoin3text();
  
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

