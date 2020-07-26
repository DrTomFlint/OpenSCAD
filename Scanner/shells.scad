// shells.scad
// scanner part

use <./towers.scad>
F1=200;
TowerHigh=104;

//---------------------------------------------------------------------
module shell(tol=0){

  translate([0,0,-10]){
    difference(){
      // hollow cylinder
      cylinder(r=93+tol/2,h=TowerHigh+10+tol,$fn=F1);
      translate([0,0,-1])
      cylinder(r=92-tol/2,h=TowerHigh+12+tol,$fn=F1);
      
      // cuts for the towers
      translate([0,0,10])
      tower4(tol=0.2,holes=0);
      
      mirror([1,0,0])
      translate([0,0,10])
      tower(tol=0.2,holes=0);
      
    }
  }


} // end shell  
//--------------------------------------------------------------------
module shell2(tol=0){
  // azimuth motor
  rm=112;   // azimuth motor radius
  phi=180;
  phi2=phi+4.35;
  ax1=rm*cos(phi);
  ay1=rm*sin(phi);
  ax2=102.9*cos(phi2);
  ay2=102.9*sin(phi2);
  echo(AX1 = ax1);
  echo(AY1 = ay1);
  echo(AX2 = ax2);
  echo(AY2 = ay2);

z8=-10;
hi8=22;
thick8=1;

difference(){
  hull(){
  // corners of the shell
    translate([-ax1+31/2,ay1+31/2,z8])
    cylinder(r=9+tol,h=hi8,$fn=88);
    translate([-ax1-31/2-10,ay1+31/2+26,z8])
    cylinder(r=11+tol,h=hi8,$fn=88);
    translate([-ax1-31/2-10,ay1-31/2-26,z8])
    cylinder(r=11+tol,h=hi8,$fn=88);
    translate([-ax1+31/2,ay1-31/2,z8])
    cylinder(r=9+tol,h=hi8,$fn=88);
  }
  translate([0,0,-0.01])
  hull(){
    translate([-ax1+31/2,ay1+31/2,z8])
    cylinder(r=9-thick8-tol,h=hi8-thick8,$fn=88);
    translate([-ax1-31/2-10,ay1+31/2+26,z8])
    cylinder(r=11-thick8-tol,h=hi8-thick8,$fn=88);
    translate([-ax1-31/2-10,ay1-31/2-26,z8])
    cylinder(r=11-thick8-tol,h=hi8-thick8,$fn=88);
    translate([-ax1+31/2,ay1-31/2,z8])
    cylinder(r=9-thick8-tol,h=hi8-thick8,$fn=88);
  }
  // cut for the main shell
  translate([0,0,-20])
  cylinder(r=92+tol/2,h=TowerHigh+10+tol,$fn=F1);
  // cut for the tower
  translate([0,0,-20])
  mirror([1,0,0])
  tower(tol=0.2);

}

}
//=============================================

shell();
shell2();

//===================================================
