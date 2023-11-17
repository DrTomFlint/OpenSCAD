// copyright aeropic 2017
// A1 order 3 size 3
// A2 order 3 size 2.5 bottom 6.0

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

//----------------------------------------------------------
// sierpinsky recursive code 
module ss2(ord, make){
    k = pow(2,ord);
    w = size *k;
    
    if (k<1){  // end of recursive function
        rotate([0,0,45])cylinder(r1=size,r2 = epsr, h = 1.0*size, $fn=4);
    }
    else {
      difference() {
        union () {
            // 4 corners
            translate([-k*eps+w/sq2,-k*eps+w/sq2,0]) ss(ord-1);  
            translate([k*eps-w/sq2,k*eps-w/sq2,0]) ss(ord-1); 
            translate([k*eps-w/sq2,-k*eps+w/sq2,0]) ss(ord-1); 
            translate([-k*eps+w/sq2,k*eps-w/sq2,0]) ss(ord-1); 
            // upper 
            translate([0,0,-sq2*k*eps+1.01*w]) rotate([180,0,0]) ss(ord-1);
            // inverted
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
      rotate([0,0,45])
      difference(){
          ss(order-1);
          // remove bottom spikes
          translate([-120,-120,-3])
          cube([240,240,3]);
      }
      //cylinder(r=3,h=1.2,$fn=77);
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

//-----------------------------------------------------------------
module sC(sides=6,peak=1.2){

hi=3.0;

  intersection(){
    //~ translate([0,0,-63])
    //~ scale([1,1,1])
    //~ sphere(r=80,$fn=99);
    translate([0,0,-50+hi])
    cube([200,200,100],center=true);
    
    translate([0.01,0,0])
    //scale([1,1,0.5])
    sA(n=sides,k=peak);
  }

}

//-----------------------------------------------------------------
// some values of k will result in many independent pieces
module sD(sides=6,peak=1.2){

ang1=360/sides;

  for (i=[0:sides-1]){
    rotate([0,0,i*ang1])
    translate([0.01+0,0,0])         // used +1 for purple tests?
    sC(sides=sides,peak=peak);
  }
}

//--------------------------------------------------------------------
module sE(sides=6,peak=1.73){

//x1=21.5;   // good for order 3, peak 1.73, 6 sides
//x1=22.25+30;   // good for order 4

//x1=25;   // good for order 3, peak 2.0
//x1=25+34;   // good for order 4, peak 2.0

x1=-18;   // good for order 3, peak 1.37, 5 sides

  difference(){
    sD(sides=sides,peak=peak);
    translate([x1,0,0])
    cylinder(r=0.8,h=100,center=true,$fn=22);
  }
  difference(){
    translate([0,0,0.01])
    rotate([180,0,0])
    sD(sides=sides,peak=peak);
    translate([x1,0,0])
    cylinder(r=0.8,h=100,center=true,$fn=22);
  }
}

//=====================================================================

//half();

//sA(n=6,k=1.73);
//sC(sides=6,peak=1.73);
//sD(sides=6,peak=1.73);

//sA(n=6,k=1.73);
//sA(n=6,k=1.9);

//scale([1,1,0.5])
//sB(sides=6,peak=1.73);
//sC(sides=6,peak=1.73);


//~ sD(sides=6,peak=1.73);

//~ translate([0,0,0.01])
//~ rotate([180,0,0])
//~ sD(sides=6,peak=1.73);

// This is the small good one
//sE();


//sA(n=6,k=1.9);
//sB(sides=6,peak=2);
//sC(sides=6,peak=2);
//sD(sides=6,peak=2);

//sE(peak=2);

// FIVE

//sA(n=5,k=1.37);
//sB(sides=5,peak=1.37);
//sC(sides=5,peak=1.37);
//sD(sides=5,peak=1.37);
sE(sides=5,peak=1.37);

//=====================================================================

