//======================================================================
// A-size "Fairy Crystals" with 4 sides
//
// The original sierpinski pyramid code is copyright aeropic 2017
// Adapted to make a low base that displays the "crusaders cross"
//
// Note: these shapes take a long time to render in OpenSCAD, don't 
// give up too quickly!  On my laptop this took about 3 minutes.
// 
// If you make changes, check that after "Rendering finished" message
// appears there are only 2 Volumes.  
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

bottom=6.0;     // for size 4

//-----------------------------------------------------------------
module s7(){

    scale([1,1,0.97])
    difference(){
        union(){
        difference() {
            ss(order-1);
            // remove bottom spikes
            translate([-120,-120,-3])cube([240,240,3]);
        }
        //~ mirror([0,0,1])
        //~ difference() {
            //~ ss(order-1);
            //~ translate([-120,-120,bottom])
            //~ cube([240,240,80]);
        //~ }
        }
        
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


//=====================================================================

s7();

//=====================================================================

