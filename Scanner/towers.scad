// towers.scad
// scanner part

TowerHigh=104;  // adjusts hub height, 92 min
BearingsOn=0;   // show bearings in the towers
Tower2X=-110;   // offset for elevation and left tower
Tower3X=-110;   // offset for elevation and left tower
F2=88;

use <../Fractals/Lsystem.scad>
use <../Parts/motors.scad>

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

//---------------------------------------------------------------------
module tower3(tol=0,holes=1){

TowerLow=52+tol;
TowerXoff=Tower3X;
TowerWide=54+tol;
Tower2High=0+tol;
Tthick=9.5+tol;
Tthick2=4+tol;

  difference(){
    // boss is a hull
    hull(){
      // bottom is 2 cylinders
      color("pink")
      translate([TowerXoff,-TowerWide/2+4,-TowerLow])
      rotate([0,90,0])
      cylinder(r=8,h=Tthick,$fn=88);
      color("pink")
      translate([TowerXoff,TowerWide/2-4,-TowerLow])
      rotate([0,90,0])
      cylinder(r=8,h=Tthick,$fn=88);
      // upper tower is 1 big cylinder
      translate([TowerXoff,0,TowerHigh])
      rotate([0,90,0])
      cylinder(r=56,h=Tthick,$fn=88);
      // top peak for bolting on the slew13
      color("pink")
      translate([TowerXoff,0,TowerHigh+54])
      rotate([0,90,0])
      cylinder(r=8,h=Tthick,$fn=88);
      
    }
    if(holes){
      // bore hole
      translate([TowerXoff-1,0,TowerHigh])
      rotate([0,90,0])
      cylinder(r=50+0.2,h=Tthick+2,$fn=88);
      
      // bolt holes for outer tabs
      if(1){
      Ntabo=3;
      ood=50;        // outer race outer rad
      //oid=ood-25;         // outer race inner rad
      ohi=15;         // outer race height
      translate([Tower3X+10,0,TowerHigh])
      rotate([0,90,0])
      rotate([0,0,-30])
      for(i=[0:Ntabo-1]){
        rotate([0,0,i*360/Ntabo]){
            translate([0,ood+4,-ohi/2-4])
            cylinder(r=1.7,h=20,$fn=22);
        }
      }
    }
  }

    // elevation motor
    y1=0;
    z1=143;
    color("red")
    translate([Tower3X+54,y1,TowerHigh-z1])  
    rotate([0,-90,0])
    rotate([0,0,90])
    xymotor(tol=0.2);
    // elevation motor shaft extra clearance
    translate([Tower3X,y1,TowerHigh-z1])  
    rotate([0,-90,0])
    cylinder(r=10,h=20,center=true);

    // elevation motor bolt holes
    translate([0,31/2,31/2])
    translate([Tower3X,y1,TowerHigh-z1])  
    rotate([0,-90,0])
    cylinder(r=1.7,h=20,center=true,$fn=22);
    
    translate([0,-31/2,31/2])
    translate([Tower3X,y1,TowerHigh-z1])  
    rotate([0,-90,0])
    cylinder(r=1.7,h=20,center=true,$fn=22);
    
    translate([0,-31/2,-31/2])
    translate([Tower3X,y1,TowerHigh-z1])  
    rotate([0,-90,0])
    cylinder(r=1.7,h=20,center=true,$fn=22);
    
    translate([0,31/2,-31/2])
    translate([Tower3X,y1,TowerHigh-z1])  
    rotate([0,-90,0])
    cylinder(r=1.7,h=20,center=true,$fn=22);


/*    
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
    
*/    
  }
/*  
  // tiling in the decorative hole
  translate([TowerXoff-1,0,TowerHigh-60])
  rotate([0,90,0])
  linear_extrude(height=9,convexity=10)
  scale([9,9])
  penrose_tiling(n=2, w=0.2);
*/
  
} // end tower  

//-----------------
module tower4(tol=0,holes=1){
TowerLow=52+tol;
TowerXoff=Tower3X+13;
TowerWide=54+tol;
Tower2High=0+tol;
Tthick=4+tol;
Tthick2=4+tol;

  difference(){
    union(){
      // boss is a hull
      hull(){
        // upper tower is 1 big cylinder
        translate([TowerXoff,0,TowerHigh])
        rotate([0,90,0])
        cylinder(r=56,h=Tthick,$fn=88);
        // top peak for bolting on the slew13
        color("pink")
        translate([TowerXoff,0,TowerHigh+54])
        rotate([0,90,0])
        cylinder(r=8,h=Tthick,$fn=88);
        // 2nd peak for bolting on the slew13
        color("pink")
        translate([TowerXoff,0,TowerHigh])
        rotate([120,0,0])
        translate([0,0,54])
        rotate([0,90,0])
        cylinder(r=8,h=Tthick,$fn=88);
        // 3rd peak for bolting on the slew13
        color("pink")
        translate([TowerXoff,0,TowerHigh])
        rotate([-120,0,0])
        translate([0,0,54])
        rotate([0,90,0])
        cylinder(r=8,h=Tthick,$fn=88);
        
        
      }
      
      // shoulder for the shell to rest ontop
      // upper tower is 1 big cylinder
      translate([TowerXoff,0,TowerHigh])
      rotate([0,90,0])
      cylinder(r=30,h=Tthick+7.5,$fn=88);   //*****************************************
      
      // vertical post to break the shell into front/back
      difference(){
        // post
        translate([TowerXoff,-30,TowerHigh-121.8])
        cube([Tthick+8,60,121.8]);
        
        // cut away to match the shell circle
        translate([0,0,-20])
        cylinder(r=91-0.5-tol,h=TowerHigh+12+tol+10,$fn=200);

      }      
    }
    
    
    if(holes){
      // bore hole
      translate([TowerXoff-1,0,TowerHigh])
      rotate([0,90,0])
      cylinder(r=28+0.2,h=Tthick+20,$fn=88);
      
      // bolt holes for outer tabs
      if(1){
      Ntabo=3;
      ood=50;        // outer race outer rad
      //oid=ood-25;         // outer race inner rad
      ohi=15;         // outer race height
      translate([Tower3X+10,0,TowerHigh])
      rotate([0,90,0])
      rotate([0,0,-30])
      for(i=[0:Ntabo-1]){
        rotate([0,0,i*360/Ntabo]){
            translate([0,ood+4,-ohi/2-4])
            cylinder(r=1.7,h=20,$fn=22);
        }
      }
    }
  }
}

}


//===========================================

tower3(holes=1);
//tower4(holes=1);

//mirror([1,0,0])
//tower();

//===================================================
