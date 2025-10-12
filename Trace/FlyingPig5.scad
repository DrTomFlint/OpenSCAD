//=================================================================================
// FlyingPig5.scad
//
//
// Dr Tom Flint, 10 Sept 2025
//=================================================================================


layer=0.24;
thick=4*layer;  
r1=65;
F2=99;

//-----------------------------------------------------------------------------------
module black(){
  
  render()
  intersection(){
    translate([0,0,80])
    scale([1,1,1])
    surface(file="./FlyingPig5black.png", center = true, invert=true);
  
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
// A side is bottom 
module blackA(){
  
  render()
  intersection(){
    translate([0,0,80])
    scale([1,1,1])
    surface(file="./FlyingPig5black.png", center = true, invert=true);
  
    translate([0,0,3*layer/2])
    cube([800,800,3*layer],center=true);
  }
  
  // hanger loop
    translate([-10,241,0])
    difference(){
      cylinder(r=20,h=3*layer,$fn=F2);
      cylinder(r=10,h=3*layer,$fn=F2);
    }
}  

//-----------------------------------------------------------------------------------
// B side is top
module blackB(){
  
  render()
  intersection(){
    translate([0,0,80])
    scale([1,1,1])
    surface(file="./FlyingPig5black.png", center = true, invert=true);
  
    translate([0,0,3*layer+layer/2])
    cube([800,800,layer],center=true);
  }
  
  // hanger loop
    translate([-10,241,3*layer])
    difference(){
      cylinder(r=20,h=layer,$fn=F2);
      cylinder(r=10,h=layer,$fn=F2);
    }
}  

//-----------------------------------------------------------------------------------
module pink(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPig5pink.png", center = true, invert=true);
    
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
}  

//-----------------------------------------------------------------------------------
// A is bottom side, pink 3 layers thick
module pinkA(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPig5pink.png", center = true, invert=true);
    
    translate([0,0,3*layer/2])
    cube([800,800,3*layer],center=true);
  }
}  

//-----------------------------------------------------------------------------------
// B is top, sparkles 1 layer thick
module pinkB(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPig5pink.png", center = true, invert=true);
    
    translate([0,0,3*layer+layer/2])
    cube([800,800,layer],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module wings(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPig5wings.png", center = true, invert=true);
    
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
}  

//-----------------------------------------------------------------------------------
// A is bottom side, clear 3 layers thick
module wingsA(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPig5wings.png", center = true, invert=true);
    
    translate([0,0,3*layer/2])
    cube([800,800,3*layer],center=true);
  }
}  

//-----------------------------------------------------------------------------------
// B is top side, sparkles 1 layer thick
module wingsB(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPig5wings.png", center = true, invert=true);
    
    translate([0,0,3*layer+layer/2])
    cube([800,800,layer],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module hooves(){
  
  render()
  intersection(){
    translate([0,0,50])
    scale([1,1,1])
    surface(file="./FlyingPig5hooves.png", center = true, invert=true);
    
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
  wingsB();
  //~ hooves();
}

}
//=================================================================================

stuff();
translate([60,0,0])
mirror([1,0,0])
stuff();

//=================================================================================
