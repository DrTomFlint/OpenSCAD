//=================================================================================
// FlyingPig4.scad
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
    surface(file="./FlyingPigBlack4.png", center = true, invert=true);
  
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
  
  // hanger loop
    translate([-10,241,0])
    difference(){
      cylinder(r=20,h=thick,$fn=F2);
      cylinder(r=10,h=thick,$fn=F2);
    }
}  

//-----------------------------------------------------------------------------------
module blackA(){
  
  render()
  intersection(){
    translate([0,0,80])
    scale([1,1,1])
    surface(file="./FlyingPigBlack4.png", center = true, invert=true);
  
    translate([0,0,0.9/2])
    cube([800,800,0.9],center=true);
  }
  
  // hanger loop
    translate([-10,241,0])
    difference(){
      cylinder(r=20,h=0.9,$fn=F2);
      cylinder(r=10,h=0.9,$fn=F2);
    }
}  

//-----------------------------------------------------------------------------------
module blackB(){
  
  render()
  intersection(){
    translate([0,0,80])
    scale([1,1,1])
    surface(file="./FlyingPigBlack4.png", center = true, invert=true);
  
    translate([0,0,0.9+0.3/2])
    cube([800,800,0.3],center=true);
  }
  
  // hanger loop
    translate([-10,241,0.9])
    difference(){
      cylinder(r=20,h=0.3,$fn=F2);
      cylinder(r=10,h=0.3,$fn=F2);
    }
}  

//-----------------------------------------------------------------------------------
module pink(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPigPink4.png", center = true, invert=true);
    
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
    surface(file="./FlyingPigPink4.png", center = true, invert=true);
    
    translate([0,0,0.9/2])
    cube([800,800,0.9],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module pinkB(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPigPink4.png", center = true, invert=true);
    
    translate([0,0,0.9+0.3/2])
    cube([800,800,0.3],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module wings(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPigWings4.png", center = true, invert=true);
    
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
    surface(file="./FlyingPigWings4.png", center = true, invert=true);
    
    translate([0,0,0.9/2])
    cube([800,800,0.9],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module wingsB(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPigWings4.png", center = true, invert=true);
    
    translate([0,0,0.9+0.3/2])
    cube([800,800,0.3],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module hooves(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPigHooves4.png", center = true, invert=true);
    
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module stuff(){
  scale([0.1,0.1,1]){

  //~ black();
  //~ blackA();
  //~ blackB();
  //~ pink();
  //~ pinkA();
  //~ pinkB();
  //~ wings();
  //~ wingsA();
  //~ wingsB();
  hooves();
}

}
//=================================================================================

stuff();
translate([60,0,0])
mirror([1,0,0])
stuff();

//=================================================================================
