// towers.scad
// scanner part

TowerHigh=104;  // adjusts hub height, 92 min
BearingsOn=0;   // show bearings in the towers
Tower2X=-110;   // offset for elevation and left tower
F2=88;
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
    rotate([0,90,0])
    cylinder(r=17,h=Tthick+2,$fn=88);


  }
  
} // end tower  

//---------------------------------------------------------------------
module tower2in(tol=0,holes=1){

TowerLow=52+tol;
TowerXoff=Tower2X-12;
TowerWide=70+tol;
Tower2High=0+tol;
Tthick=8+tol;
Tthick2=4+tol;
  translate([30,0,0]){
    
        // *********************************************************************************************
  
  // sleeve
  //color("cyan")
  difference(){
    union(){
      translate([TowerXoff+4,0,TowerHigh])
      rotate([0,90,0])
      cylinder(r=28,h=7,$fn=88);

//      translate([TowerXoff+4,-28,-58])
//      cube([7,28*2,166]);
    }
    
    if(holes){
      translate([TowerXoff+3,0,TowerHigh])
      rotate([0,90,0])
      cylinder(r=26,h=10,$fn=88);
    }    
  }
}
  
} // end tower  

//===========================================

tower2out();
tower2in();

mirror([1,0,0])
tower();

//===================================================
