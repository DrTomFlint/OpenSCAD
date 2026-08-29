//=================================================================================
// feeder.scad
//
// Plans for new bird feeder
//
// Dr Tom Flint, 21 Aug 2026
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>

// p = planter stuff
pr1 = 600;				// base outer radius
pr2 = pr1 + 50;			// top outer radius
pz1 = 20;				// height off ground
pz2 = 400;				// height ground to lip
pthick = 80;			// thickness


// t = tree stuff
tr1 = 50;
tr2 = 20;
tz1 = 1000;
tz2 = 2000;
tbranch = 5;

// a = bench A stuff
ar1 = 650;    // radius of feet on-center
az1 = 500;    // height ground to top surface
athick = 20;  // thickness of the top
aleg = 50;    // square leg dimension

ar2 = 700;    // outer radius top
ar3 = 400;    // inner radius top
acut = 300;   // width of trunk cut

F1=200;
F2=55;

//-----------------------------------------------------------------------------------
module benchA(){

  // legs
  for(i=[1:4]){
    rotate([0,0,15+i*90])
    translate([ar1,0,az1/2])
    cube([aleg,aleg,az1],center=true);
  }
  
  // top
  translate([0,0,az1-athick])
  difference(){
    cylinder(r=ar2,h=athick,$fn=F2);
    cylinder(r=ar3,h=5*athick,center=true,$fn=F1);
    rotate([0,0,-30])
    translate([(ar2+ar3)/2,0,0])
    cube([ar1,acut,5*athick],center=true);
  }

}

//-----------------------------------------------------------------------------------
module planter(){

	translate([0,0,pz1])
	difference(){
		cylinder(r1=pr1, r2=pr2, h= pz2-pz1, $fn=6);
		translate([0,0,pthick])		
		cylinder(r1=pr1-pthick, r2=pr2-pthick, h= pz2-pz1-pthick+0.1, $fn=6);
	}

}
 
//-----------------------------------------------------------------------------------
module tree(){

	translate([0,0,pz1])
  cylinder(r1=tr1, r2=tr2, h=tz1, $fn=F2);

  translate([0,0,tz1])
  for(i=[1:tbranch]){
    rotate([0,0,i*360/tbranch])
    rotate([30,0,0])
    cylinder(r1=tr2,r2=2,h=tz2-tz1,$fn=F2);
  }

}

 
 
//=================================================================================

planter();
tree();
benchA();

//=================================================================================
