// shells.scad
// scanner part

use <./towers.scad>
F1=200;
TowerHigh=104;

rlip=95;
alip=18.4;
xlip=rlip*cos(alip);
ylip=rlip*sin(alip);

rlip2=92;
alip2=7.6;
xlip2=rlip2*cos(alip2);
ylip2=rlip2*sin(alip2);

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
      tower5(tol=0.2,holes=0);
      
      // cut for shell2 and the azimuth belt
      translate([93,0,10])
      cube([60,90,20],center=true);
      
    }
    // add a lip near tower 3
    color("red")
    translate([-xlip,ylip,0])
    cube([3+tol,1+tol,TowerHigh+10+tol]);  
    color("green")
    translate([-xlip,-ylip-1,0])
    cube([3+tol,1+tol,TowerHigh+10+tol]);  

    // add a lip near tower 5
    color("red")
    translate([xlip2,ylip2,21])
    cube([3+tol,1+tol,TowerHigh-11]);  
    color("green")
    translate([xlip2,-ylip2-1,21])
    cube([3+tol,1+tol,TowerHigh-11]);  
  }


} // end shell  

//---------------------------------------------------------------
module shellF(tol=0){
  
  difference(){
    shell();
    translate([0,100,0])
    cube([200,200,300],center=true);
  }
}
//---------------------------------------------------------------
module shellR(tol=0){
  
  difference(){
    shell();
    translate([0,-100,0])
    cube([200,200,300],center=true);
  }
}

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
    translate([-ax1+31/2+2,ay1+31/2,z8])
    cylinder(r=9+tol,h=hi8,$fn=88);
    translate([-ax1-31/2-9,ay1+31/2+24,z8])
    cylinder(r=11+tol,h=hi8,$fn=88);
    translate([-ax1-31/2-9,ay1-31/2-24,z8])
    cylinder(r=11+tol,h=hi8,$fn=88);
    translate([-ax1+31/2+2,ay1-31/2,z8])
    cylinder(r=9+tol,h=hi8,$fn=88);
  }
  translate([0,0,-0.01])
  hull(){
    translate([-ax1+31/2+2,ay1+31/2,z8])
    cylinder(r=9-thick8-tol,h=hi8-thick8,$fn=88);
    translate([-ax1-31/2-9,ay1+31/2+24,z8])
    cylinder(r=11-thick8-tol,h=hi8-thick8,$fn=88);
    translate([-ax1-31/2-9,ay1-31/2-24,z8])
    cylinder(r=11-thick8-tol,h=hi8-thick8,$fn=88);
    translate([-ax1+31/2+2,ay1-31/2,z8])
    cylinder(r=9-thick8-tol,h=hi8-thick8,$fn=88);
  }
  // cut for the main shell
  translate([0,0,-20])
  cylinder(r=92+tol/2,h=TowerHigh+10+tol,$fn=F1);
  
  // cuts for the shell lip near tower 5
  translate([xlip2-1,ylip2,10])
  cube([4+tol,1+tol,TowerHigh-11]);  
  translate([xlip2-1,-ylip2-1,10])
  cube([4+tol,1.5+tol,TowerHigh-10]);  

  
  // cut for the tower
  translate([0,0,0])
  mirror([1,0,0])
  tower5(tol=0.2);

}

}
//=============================================

//shell();
//shell2();
shellF();
shellR();

//===================================================
