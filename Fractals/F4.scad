//======================================================================
// F4.scad
// 
// 5 pointed small fractal stars for earrings.
//
// DrTomFlint 23 Dec 2023
//======================================================================

// order of sierpinski fractal
order = 3; //[0,1,2,3,4,5,6,7]
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

// F4a:
//~ sides=5;
//~ peak=1.4;
//~ hi=0.9;
//~ rescale = 1.0;

// F4bc:
//~ sides=5;
//~ peak=1.4;
//~ hi=1.5;
//~ rescale = 1.0;

// F4d:
//~ sides=6;
//~ peak=1.73;
//~ hi=0.9;
//~ rescale=0.8;

// F4e:
//~ sides=7;
//~ peak=2.075;
//~ hi=0.9;
//~ rescale=0.67;


// F4f:
//~ sides=5;
//~ peak=1.4;
//~ hi=1.5;
//~ rescale = 1.0;

// F4g:
//~ sides=6;
//~ peak=1.73;
//~ hi=1.5;
//~ rescale = 0.8;

// F4h:
sides=7;
peak=2.075;
hi=1.5;
rescale = 0.67;


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

  scale([peak,1,1])    
  difference(){
      rotate([0,0,45])
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
module sC(){


  intersection(){
    translate([0,0,-50+hi])
    cube([200,200,100],center=true);
    
    translate([0.01,0,0])
    sA(cut=0);
  }

}

//-----------------------------------------------------------------
module sD(){

ang1=360/sides;

  for (i=[0:sides-1]){
    rotate([0,0,i*ang1])
    translate([0,0,0])         // used +1 for purple tests?
    sC();
  }
}

//-----------------------------------------------------------------
module sD2(dimple=0){

ang1=360/sides;

difference(){
  union(){
    for (i=[0:sides-1]){
      rotate([0,0,i*ang1])
      translate([0,0,0])         // used +1 for purple tests?
      sC();
    }
  }
  // dimple for a sequin
  if(dimple==1){
    translate([0,0,hi-0.6])
    cylinder(r=3.8/rescale,h=1,$fn=33);
  }
}

}

//--------------------------------------------------------------------
module sE(cut=0,ring=1){

x1=22;

scale([rescale,rescale,1])
if(cut==0){
  // full detail shape
  difference(){
    sD2(dimple=1);
    //~ translate([x1,0,0])
    //~ cylinder(r=0.8,h=100,center=true,$fn=22);
  }
  difference(){
    translate([0,0,0.01])
    rotate([180,0,0])
    sD2();
    //~ translate([x1,0,0])
    //~ cylinder(r=0.8,h=100,center=true,$fn=22);
  }
}else{
  // simplified shape for cutting  
  difference(){
    union(){
      cylinder(r1=size*4.1*order,r2=0.01,h=size*2.5*order,$fn=3);
      rotate([0,0,60])
      cylinder(r1=size*4.1*order,r2=0.01,h=size*2.5*order,$fn=3);

      translate([0,0,-size*2.5*order])
      cylinder(r2=size*4.1*order,r1=0.01,h=size*2.5*order,$fn=3);
      translate([0,0,-size*2.5*order])
      rotate([0,0,60])
      cylinder(r2=size*4.1*order,r1=0.01,h=size*2.5*order,$fn=3);
    }
    
    translate([0,0,-50-3])
    cube([100,100,100],center=true);
    translate([0,0,50+3])
    cube([100,100,100],center=true);
  }
}  

if(ring==1){
  // outer ring
  difference(){
    cylinder(r=24.5,h=hi*2,center=true,$fn=99);
    cylinder(r=23.5,h=hi*3,center=true,$fn=99);
  }
 
}  

  // hanger loop
  translate([-25.5,0,0])
  difference(){
    cylinder(r=1.75,h=hi*2,center=true,$fn=99);
    cylinder(r=1,h=hi*3,center=true,$fn=99);
  }


}


//=====================================================================

// FIVE

//~ sA();
//~ sC();
//~ sD();
sE();

//=====================================================================

