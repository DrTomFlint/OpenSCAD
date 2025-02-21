//=================================================================================
// tearHalf.scad
//
// Dr Tom Flint, 20 Feb 2025
//=================================================================================

include <./tearConstants.scad>

//-----------------------------------------------------------------------------------
// pattern for the upper grip
module tearUpper(){
  
  render()
  intersection(){
    translate([0,0,-0.3])
    scale([1,1,0.02])
    surface(file="./tearUpper.png", center = true);
    translate([0,0,0.5])
    cube([800,800,1],center=true);
  }
}  

//-----------------------------------------------------------------------------------
// pattern for the lower grip
module tearLower(){
  
  render()
  intersection(){
    translate([0,0,-0.3])
    scale([1,1,0.02])
    surface(file="./tearLower.png", center = true);
    translate([0,0,0.5])
    cube([800,800,1],center=true);
  }
}  

//-----------------------------------------------------------------------------------
// half of the pick, side 0 is upper, side 1 is lower
module tearhalf(side=0){
  
  scale([1.1,1.1,1]){

    hull(){
      translate([1.45*X,0,0])
      scale([0.95,1.4,1])
      cylinder(r1=R,r2=1.02*R+dz,h=T/2,$fn=F);
      
      rotate([0,0,115])
      translate([X,0,0])
      scale([0.7,1.95,1])
      cylinder(r1=0.85*R,r2=0.87*R+dz,h=T/2,$fn=F);
      
      rotate([0,0,-115])
      translate([X,0,0])
      scale([0.7,1.95,1])
      cylinder(r1=0.85*R,r2=0.87*R+dz,h=T/2,$fn=F);
    }
    
    if(side==0){
      translate([1,0.5,0])
      rotate([180,0,0])
      scale([0.037,0.037,Z])
      tearUpper();
    }else{
      translate([1,0.5,0])
      rotate([180,0,0])
      scale([0.037,0.037,Z])
      tearLower();
      
      translate([2.5,0,0])
      rotate([0,0,90])
      rotate([180,0,0])
      linear_extrude(height=Z)
      text(Label, font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
      
    }
  }
}

//===================================================================================

tearhalf();

//===================================================================================
