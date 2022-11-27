// Atop.scad
//
// Upper section



//-----------------------------------------------------------------
module top(order = 2,size = 2.5){

/* [Hidden] */
eps = 0.25;         // translate for pyramids
//epsr = 0.1;
epsr = 0.05;

epsh = 2.5*eps;
sq2 = 1.41421356;       
epsl = 0.5;         // translate for cube cuts
epsy = 0.12;        // translate for cube cuts

    scale([1,1,0.98])
    difference(){
        union(){
        difference() {
            ss(order-1,size);
            // remove bottom spikes
            translate([-120,-120,-3])cube([240,240,3]);
        }
        mirror([0,0,1])
        difference() {
            ss(order-1,size);
            translate([-120,-120,6])
            cube([240,240,80]);
        }
        }
        
    //    translate([-120,-120,thick*z-80])cube([240,240,80]);
    //    translate([-120,-120,thick*z+thick])cube([240,240,80]);

        if(1){
            // cut out top section
            size2=7.2*size;
            translate([0,0,17.2]){
                rotate([0,0,45])cylinder(r1=size2,r2 = epsr, h = 1.0*size2, $fn=4);
                mirror([0,0,1])
                rotate([0,0,45])cylinder(r1=size2,r2 = epsr, h = 1.0*size2, $fn=4);
            }
        }
    }

}

if(0){
mirror([0,0,1])
difference() {
    ss(order-1,size);
    //remove bottom spikes
    translate([-120,-120,6])
    cube([240,240,80]);
    //translate([-120,-120,3])
    //cube([240,240,-3]);
}
}

//----------------------------------------------------------
// sierpinsky recursive code 
module ss(ord,size){

/* [Hidden] */
eps = 0.25;         // translate for pyramids
//epsr = 0.1;
epsr = 0.05;

epsh = 2.5*eps;
sq2 = 1.41421356;       
epsl = 0.5;         // translate for cube cuts
epsy = 0.12;        // translate for cube cuts

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


//======================================================================

top();

//======================================================================



