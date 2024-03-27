//======================================================================
// A-size "Fairy Crystals" with 7 sides
//
// The original sierpinski pyramid code is copyright aeropic 2017
// Adapted to make a low base that displays the "crusaders cross"
// and recut, scaled, and rotated to get 7 sides instead of 4
//
// Note: these shapes take a long time to render in OpenSCAD, don't 
// give up too quickly!  On my laptop this took almost 4 minutes.
//
// DrTomFlint 25 March 2024
//======================================================================

// order of sierpinski fractal
order = 3; 
// size of smallest pyramid
size = 2.5; 

/* [Hidden] */
eps = 0.25;         // translate for pyramids
epsr = 0.05;

epsh = 2.5*eps;
sq2 = 1.41421356;       
epsl = 0.5;         // translate for cube cuts
epsy = 0.12;        // translate for cube cuts

//----------------------------------------------------------
// original sierpinsky pyramid recursive code 
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

if(1){

  lower=6.0;    // sB 7
  


//  scale([1,1,1.18])
//  sB(sides=5,peak=1.37);

//  scale([1,1,1.5])
//  sB(sides=6,peak=1.74);

  scale([1,1,1.6])
  sB(sides=7,peak=2.075);

  difference(){
    translate([0,0,0.01])
    rotate([180,0,0])
//    scale([1,1,1.18])
//    sB(sides=5,peak=1.37);

//    scale([1,1,1.5])
//    sB(sides=6,peak=1.74);

    scale([1,1,1.6])
    sB(sides=7,peak=2.075);

    translate([0,0,-20-lower])
    cube([80,80,40],center=true);
  }
}


//=====================================================================

