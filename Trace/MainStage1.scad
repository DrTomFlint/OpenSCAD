//====================================================================
// MainStage1.scad
//
// MainStage logo for coins or disks
// 
//====================================================================


use <./mainstageGold.scad>

layer = 0.3;
//~ thick = 7*layer;    // thickness not including top and bottom
thick = 4*layer;    // thickness not including top and bottom

mag=32;   // scaling
R0=2;     // rounding of corners

//------------------------------------------------------------
module Main1gold(){
  
    intersection(){
      translate([0,0,0])
      scale([mag,mag,10])
      mainstageGold();
      
      linear_extrude(height=thick)
      offset(r=R0)
      square([mag,mag],center=true);
  }
}

//------------------------------------------------------------
module Main1black(){
  
  difference(){
      linear_extrude(height=thick)
      offset(r=R0,$fn=99)
      square([mag,mag],center=true);
    
      translate([0,0,-1])
      scale([mag,mag,10])
      mainstageGold();
  
  }

}
//------------------------------------------------------------
module Main1top(){
  
  translate([0,0,thick])
  linear_extrude(height=layer)
  offset(r=R0,$fn=99)
  square([mag,mag],center=true);
    

}
//------------------------------------------------------------
module Main1bottom(){
  
  translate([0,0,-layer])
  linear_extrude(height=layer)
  offset(r=R0,$fn=99)
  square([mag,mag],center=true);
    

}

//-------------------------------------------------------------
module Main1sand(){
tol=0.25;
  
  // main boss
  difference(){
    translate([0,0,2*layer])
    cube([mag+14,mag+14,4*layer],center=true);
    
    // cut for part
    translate([0,0,-0.5*layer])
    linear_extrude(height=5*layer)
    offset(r=R0+tol,$fn=99)
    square([mag+tol,mag+tol],center=true);    

  }
  
  // corners to hang over glass
  translate([0.5*(mag+14)-2,0,4*layer])
  cube([2,23,8*layer]);
  
  translate([0,0.5*(mag+14)-2,4*layer])
  cube([23,2,8*layer]);

  translate([-0.5*(mag+18),-0.5*(mag+18),2*layer])
  rotate([0,0,-45])
  cube([6,20,4*layer],center=true);
      
  difference(){
    translate([-0.5*(mag+42),-0.5*(mag+42),0])    
    cylinder(r=10,h=4*layer,$fn=99);

    // finger grip
    translate([-0.5*(mag+42),-0.5*(mag+42),0])    
    cylinder(r1=8,r2=6,h=9*layer,center=true,$fn=99);
  }
  
}

//---------------------------------------------------------------
module MainLoop(){

  translate([-0.5*mag-R0,0.5*mag+R0,0])
  difference(){
    cylinder(r=R0,h=thick,$fn=22);
    cylinder(r=R0/2,h=3*thick,center=true,$fn=22);
  }
}

//===============================================================

//~ Main1gold();

//~ Main1black();
//~ Main1top();
//~ Main1bottom();
MainLoop();

//~ Main1sand();

//===============================================================


