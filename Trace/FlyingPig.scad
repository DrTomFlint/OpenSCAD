//=================================================================================
// FlyingPig.scad
//
//
// Dr Tom Flint, 3 April 2025
//=================================================================================


thick=1.2;
r1=65;
F2=99;

//-----------------------------------------------------------------------------------
module black(){
  
  render()
  intersection(){
    translate([0,0,80])
    scale([1,1,1])
    surface(file="./FlyingPigBlack.png", center = true, invert=true);
  
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
  
  // hanger loop
    translate([0,210,0])
    difference(){
      cylinder(r=20,h=thick,$fn=F2);
      cylinder(r=10,h=thick,$fn=F2);
    }
}  

//-----------------------------------------------------------------------------------
module pink(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPigPink.png", center = true, invert=true);
    
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module pinkA(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPigPink.png", center = true, invert=true);
    
    translate([0,0,0.6/2])
    cube([800,800,0.6],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module pinkB(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPigPink.png", center = true, invert=true);
    
    translate([0,0,0.6/2+0.6])
    cube([800,800,0.6],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module wings(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPigWings.png", center = true, invert=true);
    
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module wingsA(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPigWings.png", center = true, invert=true);
    
    translate([0,0,thick/4])
    cube([800,800,thick/2],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module wingsB(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPigWings.png", center = true, invert=true);
    
    translate([0,0,thick/2+thick/4])
    cube([800,800,thick/2],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module hooves(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPigHooves.png", center = true, invert=true);
    
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
}  

//=================================================================================

scale([0.1,0.1,1]){

black();
//~ pink();
//~ pinkA();
//~ pinkB();
//~ wings();
//~ wingsA();
//~ wingsB();
//~ hooves();

}

//=================================================================================
