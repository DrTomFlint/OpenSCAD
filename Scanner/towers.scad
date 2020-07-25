// towers.scad
// scanner part

TowerHigh=104;  // adjusts hub height, 92 min
BearingsOn=0;   // show bearings in the towers
Tower2X=-110;   // offset for elevation and left tower
F2=88;

use <../Fractals/Lsystem.scad>

//---------------------------------------------------------------------
module tower(tol=0,holes=1){

TowerLow=10;
TowerXoff=95;
TowerWide=14;

  difference(){
    union(){
      // left tower
      translate([-TowerXoff,-TowerWide/2,-TowerLow])
      cube([4+tol,TowerWide+tol,TowerHigh+TowerLow+tol]);
      // make I beams
      translate([-TowerXoff-3,-TowerWide/2,-TowerLow])
      cube([4+tol,3+tol,TowerHigh+TowerLow+tol]);
      translate([-TowerXoff-3,TowerWide/2-3,-TowerLow])
      cube([4+tol,3+tol,TowerHigh+TowerLow+tol]);
    
      // left bearing housing
      translate([-TowerXoff+5,0,TowerHigh])  
      rotate([0,-90,0])
      cylinder(r=12,h=8,$fn=F2);
      
      // left bearing light shield
      translate([-TowerXoff+2.5,0,TowerHigh])  
      rotate([0,-90,0])
      cylinder(r=16,h=4,$fn=F2);
      
      
    }
    if(holes){
      // cut left bearing insert
      translate([-TowerXoff+2,0,TowerHigh])  
      rotate([0,-90,0])
      cylinder(r=11+0.15,h=9,$fn=F2);

      // cut left bearing shaft 
      translate([-TowerXoff+6,0,TowerHigh])  
      rotate([0,-90,0])
      cylinder(r=7,h=9,$fn=F2);
    }
  }
  
} // end tower  

//---------------------------------------------------------------------
module tower2out(tol=0,holes=1){

TowerLow=52+tol;
TowerXoff=Tower2X-12;
TowerWide=54+tol;
Tower2High=0+tol;
Tthick=8+tol;
Tthick2=4+tol;

  difference(){
    hull(){
      // left tower
      color("pink")
      translate([TowerXoff,-TowerWide/2+4,-TowerLow])
      rotate([0,90,0])
      cylinder(r=8,h=Tthick,$fn=88);
      color("pink")
      translate([TowerXoff,TowerWide/2-4,-TowerLow])
      rotate([0,90,0])
      cylinder(r=8,h=Tthick,$fn=88);

      translate([TowerXoff,0,TowerHigh])
      rotate([0,90,0])
//      cylinder(r=56,h=Tthick,$fn=88);
      cylinder(r=30,h=Tthick,$fn=88);
      
    }
    // bore hole
    translate([TowerXoff-1,0,TowerHigh])
    rotate([0,90,0]){
      scale([1.5,0.8,1])
      cylinder(r=17,h=Tthick+2,$fn=88);
      scale([0.8,1.5,1])
      cylinder(r=17,h=Tthick+2,$fn=88);
    }
    
    // decorative hole
    translate([TowerXoff-1,0,TowerHigh-60])
    rotate([0,90,0])
    cylinder(r=24,h=Tthick+2,$fn=88);

    // bolt hole
    translate([TowerXoff-1,10,0])
    rotate([0,90,0])
    cylinder(r=1.7,h=Tthick+2,$fn=88);
    translate([TowerXoff-1,-10,0])
    rotate([0,90,0])
    cylinder(r=1.7,h=Tthick+2,$fn=88);
  }
  
  // tiling in the decorative hole
  translate([TowerXoff-1,0,TowerHigh-60])
  rotate([0,90,0])
  linear_extrude(height=9,convexity=10)
  scale([9,9])
  penrose_tiling(n=2, w=0.2);

  
} // end tower  


//===========================================

tower2out();

mirror([1,0,0])
tower();

//===================================================
