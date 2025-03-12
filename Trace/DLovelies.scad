//=================================================================================
// DLovelies.scad
//
//
// Dr Tom Flint, 12 March 2025
//=================================================================================


thick=1.2;
r1=65;
F2=99;

//-----------------------------------------------------------------------------------
module rim(){
  
  render()
  intersection(){
    translate([0,0,-0.3])
    scale([1,1,0.02])
    surface(file="./DLoveRim.png", center = true);
  
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
  
  // hanger loop
    translate([10,340,0])
    difference(){
      cylinder(r=20,h=thick,$fn=F2);
      cylinder(r=10,h=3*thick,center=true,$fn=F2);
    }
}  

//-----------------------------------------------------------------------------------
module center(){
  
  render()
  intersection(){
    translate([0,0,-0.3])
    scale([1,1,0.02])
    surface(file="./DLoveCenter.png", center = true);
    
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module petals(){
  
  render()
  intersection(){
    translate([0,0,-0.3])
    scale([1,1,0.02])
    surface(file="./DLovePetals.png", center = true);
    
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module black(){
  
  render()
  intersection(){
    translate([0,0,-0.3])
    scale([1,1,0.02])
    surface(file="./DLoveBlack.png", center = true);
    
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
}  


//=================================================================================
scale([0.1,0.1,1])
//~ black();
//~ petals();
center();
//~ rim();

//=================================================================================
