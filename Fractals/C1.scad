//======================================================================
// C-size "Fairy Crystals"
//
// The original sierpinski code is copyright aeropic 2017
// Adapted to make a low base that displays the "crusaders cross"
//
// DrTomFlint 25 March 2024
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

// try to make multiple objects for multi color print
//~ layer = 0.3;
//~ thick = 17.5;
//~ z=3;

//tdeep = 1.5;    // text depth
tdeep = 0;    // text depth
z0=-26;         // top of lid before bevel
//bottom=7.0;     // for size 5
//bottom=6.0;     // for size 4
//bottom=6.4;     // for size 3

bottom=5.8;     // size 5 order 3

trayz=3;
zfoot=8;
zrise=2;

wall=22+8;



use <../Parts/rounder.scad>
use <../Fractals/Lsystem.scad>


//-----------------------------------------------------------------
module s7(){

  scale([1,1,0.97])
  difference() {
      ss(order-1);
      // remove bottom spikes
      translate([-120,-120,-3])cube([240,240,3]);
  }

  difference() {
    translate([0,0,0.01])
    mirror([0,0,1])
    ss(order-1);
    translate([-120,-120,-80-bottom])
    cube([240,240,80]);
  }

}
//-----------------------------------------------------
module half(){
  scale([1,1,0.97])
  difference() {
      ss(order-1);
      // remove bottom spikes
      translate([-120,-120,-3])cube([240,240,3]);
  }
  
}

//----------------------------------------------------
// single solid, same size
module s7cut(tol=0.2){
    
    size2=size*14+tol;  // for order 4
//    size2=size*7.1;  // for order 3, size 2.5
//    size2=size*7.6;  // for order 3, size 5
    
        
    translate([0,0,-0.01])
    //scale([1,1,0.98])
    rotate([0,0,45])cylinder(r1=size2+1*tol,r2 = epsr+1*tol, h = 0.97*size2+tol, $fn=4);
    
    mirror([0,0,1])
    difference() {
    rotate([0,0,45])cylinder(r1=size2+1*tol,r2 = epsr+1*tol, h = 0.97*size2+tol, $fn=4);
        translate([-120,-120,bottom])
        cube([240,240,80]);
    }
}

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
module sA(n=6,k=1.2){

ang1=360/n;
//ang2=ang1*0.75; // for n=5 and k=1
//ang2=ang1*0.99; // for n=6 and k=1, 8 volumes?
//ang2=ang1*1.24; // for n=7 and k=1
//ang2=ang1*1.49; // for n=8 and k=1

ang2=45;

echo(n,k);

  scale([k,1,1])    
  difference(){
    union(){
//      rotate([0,0,45])
      difference(){
          ss(order-1);
          // remove bottom spikes
          translate([-120,-120,-3])
          cube([240,240,3]);
      }
      cylinder(r=3,h=1.2);
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
// some values of k will result in many independent pieces
module sB(sides=6,peak=1.2){

ang1=360/sides;

  for (i=[0:sides-1]){
    rotate([0,0,i*ang1])
    translate([0.01,0,0])
    sA(n=sides,k=peak);
  }
}

//=====================================================================

s7();

if(0){
//  lower=5;    // for s9
  //lower=6.5;    // sB 5
  //lower=7;      // sB 6
  lower=7.2;    // sB 7

  //~ scale([1,1,1.18])
  //~ sB(sides=5,peak=1.37);
  scale([1,1,1.4])
  sB(sides=6,peak=1.72);
  //~ scale([1,1,1.6])
  //~ sB(sides=7,peak=2.075);
  

  difference(){
    translate([0,0,0.001])
    rotate([180,0,0])
    
    //~ scale([1,1,1.18])
    //~ sB(sides=5,peak=1.37);
    scale([1,1,1.4])
    sB(sides=6,peak=1.72);
    //~ scale([1,1,1.6])
    //~ sB(sides=7,peak=2.075);
    
    translate([0,0,-40-lower])
    cube([180,180,80],center=true);
  }
}

//=====================================================================

