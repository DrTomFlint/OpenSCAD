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
    
    CrickCoin3white();
    CrickCoin3text();

    //~ CrickCoin3purple();

    }
  }
}
// for white add an earring loop
if(1){
  difference(){
    hull(){
      cylinder(r=37,h=1.5,$fn=300);
      translate([0,40,0])
      cylinder(r=2.5,h=1.5,$fn=300);
    }
    // cut loop hole
    translate([0,38.5,0])
    cylinder(r=1.5,h=5,$fn=30,center=true);
    // recut center area
    cylinder(r=37-0.5,h=5,$fn=300,center=true);
  }
}

// get black by subtraction so no voids between parts
if(0){
  //color("black")
difference(){
  cylinder(r=37,h=1.5,$fn=300);

  translate([0,0,-1])
  scale([80,80,4]){  
    CrickCoin3purple();
    CrickCoin3white();
    CrickCoin3text();  
  }
  // trim border scrum
  translate([-24,-40.3,0])
  cube([40,40,6],center=true);
  
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

