//======================================================================
// CX.scad
// 
// C size fractals with 5,6,7 sides
//
// DrTomFlint 1 April 2024
//======================================================================

// order of sierpinski fractal
order = 5; //[0,1,2,3,4,5,6,7]
// size of smallest pyramid
size = 2.5; //[2:50]

/* [Hidden] */
eps = 0.25;         // translate for pyramids
//epsr = 0.1;
epsr = 0.05;

epsh = 2.5*eps;
sq2 = 1.41421356;       
epsl = 0.5;         // translate for cube cuts
epsy = 0.12;        // translate for cube cuts

use <../Parts/rounder.scad>
use <../Fractals/Lsystem.scad>

//----------------------
// CX5:
//~ sides=5;
//~ rescale = 1.0;
//~ peak1=1.375;
//~ bottom=5.25;

// CX6:
//~ sides=6;
//~ rescale = 1.3;
//~ peak1=1.73;
//~ bottom=6.5;

// CX7:
sides=7;
rescale = 1.5;
peak1=2.075;
bottom=7.8;

//----------------------------------------------------------
// sierpinsky recursive code 
module ss(ord){
    k = pow(2,ord);
    w = size *k;
    
    if (k<1){  // end of recursive function
        rotate([0,0,45])cylinder(r1=size,r2 = epsr, h = 1.0*size, $fn=4);
    }
    else {
      difference() {
        union () { // set the five smaller sierpinski pyramids
            // they are shifted so that there is an intersection for spiral vase
            translate([-k*eps+w/sq2,-k*eps+w/sq2,0]) ss(ord-1);  
            translate([k*eps-w/sq2,k*eps-w/sq2,0]) ss(ord-1); 
            translate([k*eps-w/sq2,-k*eps+w/sq2,0]) ss(ord-1); 
            translate([-k*eps+w/sq2,k*eps-w/sq2,0]) ss(ord-1); 
            translate([0,0,-sq2*k*eps+1.01*w]) rotate([180,0,0]) ss(ord-1);
            translate([0,0,-sq2*k*eps+1.01*w]) rotate([0,0,0]) ss(ord-1);    
          
            // petit carré au centre
            //cube([0.3,0.3,2], center = true);
             } // end union
        
        // remove 4 small cubes to allow a sierpinski curve
        translate([epsl,-epsy/2,0])  cube([sq2*w,epsy,epsh]);
        rotate([0,0,90]) translate([epsl,-epsy/2,0])  cube([sq2*w,epsy,epsh]);
        rotate([0,0,180]) translate([epsl,-epsy/2,0])  cube([sq2*w,epsy,epsh]);
        rotate([0,0,270]) translate([epsl,-epsy/2,0])  cube([sq2*w,epsy,epsh]);
     
    } // end diff    
   } // end else
 } // end module ss


//-----------------------------------------------------------------
module sA(cut=0){

ang1=360/sides;
ang2=45;

  scale([peak1,1,1])    
  difference(){
      rotate([0,0,0])   // rotate z 45 for pointy version
      if(cut==0){
        difference(){
            ss(order-1);
            // remove bottom spikes
            translate([-120,-120,-3])
            cube([240,240,3]);
        }
      }else{
        rotate([0,0,45])
        cylinder(r1=size*3.33*order*cos(45),r2=0.01,h=size*3.33*order*cos(45),$fn=4);
      }
    
    // slice out a pie wedge
    rotate([0,0,ang2])
    translate([0,-100,-100])    
    cube([200,200,200]);
    rotate([0,0,-ang2])
    translate([0,-100,-100])    
    cube([200,200,200]);
  }

}

//-----------------------------------------------------------------
module sD(){

ang1=360/sides;

  scale([1,1,rescale])
  for (i=[0:sides-1]){
    rotate([0,0,i*ang1])
    translate([0,0,0])         // may need -x to get solid join
    sA();
  }
}

//--------------------------------------------------------------------
module sE(cut=0){

x1=22;

  sD();
  difference(){
    translate([0,0,0.01])
    rotate([180,0,0])
    sD();
    
    translate([0,0,-100-bottom])
    cube([300,300,200],center=true);
  }

}


//=====================================================================

// FIVE

//~ sA();
//~ sD();
sE();



//=====================================================================

