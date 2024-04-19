
//======================================================================
// F3.scad
//
// Christmas Stars, 6 point only
//
// DrTomFlint, Dec 2023
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

bottom2=3.0;
r7=82;



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

//----------------------------------------------------------------------
module pyramid(L=10){

  l=L/2;
  s=l/cos(45);
  ang=asin(s/L);
  h=L*sin(ang);

  points = [
      [l, l, 0],
      [l, -l, 0],
      [-l, -l, 0],
      [-l, l, 0],
      [0, 0, h],
  ];

  faces = [
      [0, 1, 2, 3],
      [0, 1, 4],
      [1, 2, 4],
      [2, 3, 4],
      [3, 0, 4]
  ];

  polyhedron(points, faces);

}

//-----------------------------------------------------------------
module sA(n=6,k=1.2,cut=0){

ang1=360/n;
//ang2=ang1*0.75; // for n=5 and k=1
//ang2=ang1*0.99; // for n=6 and k=1, 8 volumes?
//ang2=ang1*1.24; // for n=7 and k=1
//ang2=ang1*1.49; // for n=8 and k=1

ang2=45;

echo(n,k);

  scale([k,1,1])    
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
        //~ translate([-0.01,-0.01,0.01])
        //~ scale([1,1,1.01])
        //~ pyramid(L=size*3.33*order);
        //~ translate([-0.01,-0.01,0.01])
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
module sE(sides=6,peak=1.73,cut=0){

//x1=21.5;   // good for order 3, peak 1.73, 6 sides
x1=22;
//x1=22.25+30;   // good for order 4

//x1=25;   // good for order 3, peak 2.0
//x1=25+34;   // good for order 4, peak 2.0

//x1=-18;   // good for order 3, peak 1.37, 5 sides

if(cut==0){
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
}else{
    //~ sD(sides=sides,peak=peak);
    //~ translate([0,0,0.01])
    //~ rotate([180,0,0])
    //~ sD(sides=sides,peak=peak);
    
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
  
}

//---------------------------------------------------------------------
module rack6(show=0){

//~ bottom=3.0;
rt = 7;

  difference(){
    linear_extrude(height=bottom2,scale=[0.98,0.94])
    square([218,164],center=true);
    //~ translate([0,0,bottom2/2])
    //~ cube([218,164,bottom2],center=true);

    // center rows
    for(xi=[0:3]){
      translate([xi*53-80,0,2.99])
      rotate([0,0,30])
      sE(cut=1);
    }
    // upper row
    for(xi=[-1:3]){
      translate([xi*53-80+53/2,46,2.99])
      rotate([0,0,30])
      sE(cut=1);
    }
    // lower row
    for(xi=[-1:3]){
      translate([xi*53-80+53/2,-46,2.99])
      rotate([0,0,30])
      sE(cut=1);
    }
  
    // triangles, center
    for (k=[0:3]){
      for(i=[0:5]){
        hull(){
          translate([-80+53*k,0,0])
          rotate([0,0,60*i+19])
          translate([0,27.2,0])
          rotate([0,0,11])
          cylinder(r1=rt,r2=rt+bottom2,h=bottom2+0.1,$fn=3);

          translate([-80+53*k,0,0])
          rotate([0,0,60*i+19+22])
          translate([0,27.2,0])
          rotate([0,0,49])
          cylinder(r1=rt,r2=rt+bottom2,h=bottom2+0.1,$fn=3);
        }
      }
    }  

    // triangles, upper
    for (k=[-1:3]){
      for(i=[0:5]){
        hull(){
          translate([-80+53*k+53/2,46,0])
          rotate([0,0,60*i+19])
          translate([0,27.2,0])
          rotate([0,0,11])
          cylinder(r1=rt,r2=rt+bottom2,h=bottom2+0.1,$fn=3);

          translate([-80+53*k+53/2,46,0])
          rotate([0,0,60*i+19+22])
          translate([0,27.2,0])
          rotate([0,0,49])
          cylinder(r1=rt,r2=rt+bottom2,h=bottom2+0.1,$fn=3);
        }
      }
    }  

    // triangles, lower
    for (k=[-1:3]){
      for(i=[0:5]){
        hull(){
          translate([-80+53*k+53/2,-46,0])
          rotate([0,0,60*i+19])
          translate([0,27.2,0])
          rotate([0,0,11])
          cylinder(r1=rt,r2=rt+bottom2,h=bottom2+0.1,$fn=3);

          translate([-80+53*k+53/2,-46,0])
          rotate([0,0,60*i+19+22])
          translate([0,27.2,0])
          rotate([0,0,49])
          cylinder(r1=rt,r2=rt+bottom2,h=bottom2+0.1,$fn=3);
        }
      }
    }  

    // triangles, edge
    for (k=[0:3]){
      translate([-80+53*k,45+53/2,0])
      rotate([0,0,30])
        cylinder(r1=rt,r2=rt+bottom2,h=bottom2+0.1,$fn=3);

      translate([-80+53*k,-45-53/2,0])
      rotate([0,0,-30])
        cylinder(r1=rt,r2=rt+bottom2,h=bottom2+0.1,$fn=3);
    }
      
  }

  // restore the lip after cutting all the stars and triangles 
  difference(){
    linear_extrude(height=bottom2,scale=[0.98,0.94])
    square([218,164],center=true);

    linear_extrude(height=bottom2,scale=[1.02,1.01])
    square([218-4-2*bottom2,164-2*bottom2],center=true);
  }
}


//---------------------------------------------------------------------
module rack7a(show=0){

//~ bottom=3.0;
//~ r7=84;

  // outer ring
  difference(){
    cylinder(r1=r7+2,r2=r7+2,h=bottom2,$fn=100);
    cylinder(r=r7-0.1,h=4*bottom2,center=true,$fn=100);
  }

  // center grillwork
  difference(){
    //~ linear_extrude(height=bottom2,scale=[0.98,0.98])
    //~ square([218,164],center=true);
    rotate([0,0,23])
    cylinder(r1=r7,r2=r7,h=bottom2,$fn=100);

    // center
    translate([0,0,3.0])
    rotate([0,0,30])
    scale([1.01,1.01,1.01])
    sE(cut=1);

    // 6 surrounding
    for(i=[0:5]){
      rotate([0,0,60*i-11])
      translate([0,49,3.0])
      rotate([0,0,-19])
      sE(cut=1);
    }
    // 6 triangles
    for(i=[0:5]){
      rotate([0,0,60*i+19])
      translate([0,28.5,-0.1])
      rotate([0,0,11])
      cylinder(r1=6,r2=6+bottom2,h=bottom2+1,$fn=3);
    }
    

    // 6 first outer
    for(i=[0:5]){
      rotate([0,0,60*i-11])
      translate([0,49+49,3.0])
      rotate([0,0,-19])
      sE(cut=1);
    }
    // 6 second outer
    for(i=[0:5]){
      rotate([0,0,60*i-11+30])
      translate([0,49+49*0.75,3.0])
      rotate([0,0,-19-30])
      sE(cut=1);
    }

    // 6 outer triangles
    for(i=[0:5]){
      rotate([0,0,60*i+19])
      translate([0,28.5+49*0.58,-0.1])
      rotate([0,0,11+60])
      cylinder(r1=6,r2=6+bottom2,h=bottom2+1,$fn=3);
    }
    for(i=[0:5]){
      rotate([0,0,60*i+0])
      translate([0,28.5+46.5,-0.1])
      rotate([0,0,30])
      cylinder(r1=6,r2=6+bottom2,h=bottom2+1,$fn=3);
    }
    for(i=[0:5]){
      rotate([0,0,60*i-22.5])
      translate([0,28.5+46.5,-0.1])
      rotate([0,0,-7.5])
      cylinder(r1=6,r2=6+bottom2,h=bottom2+1,$fn=3);
    }

    translate([0,0,-bottom2/2])
    cube([300,300,bottom2],center=true);
  }
    
}


//---------------------------------------------------------------------
module rack7b(show=0){

//~ bottom2=3.0;
//~ r7=84;

  color("cyan")
  rack7a();
  
  translate([0,0,6.2])
  mirror([0,0,1])
  difference(){
    rack7a();
    translate([0,0,-20+3-1.2])
    cube([300,300,40],center=true);
  }
  
}

//---------------------------------------------------------------------
module rack7(show=0){

//~ bottom2=3.0;
//~ r7=84;

  color("cyan")
  rack7a();
  
    // 6 triangles, convert to retaining tabs
    for(i=[0:2]){
      rotate([0,0,60*2*i+19])
      translate([0,28.0,-0.1+2.9])
      rotate([0,0,11])
      difference(){
        intersection(){
          cylinder(r2=9+bottom2+2,r1=9+bottom2,h=2,$fn=3);
          cylinder(r=4+bottom2,h=2,$fn=99);
        }
        translate([0,0,-0.01])
        cylinder(r2=5+bottom2+1,r1=5+bottom2,h=2.1,$fn=3);
      }
    }


    // 6 outer triangles
    for(i=[0:2]){
      rotate([0,0,60*2*i+19+60])
      translate([0,28.0+49*0.58,-0.1+2.9])
      rotate([0,0,11+60])
      difference(){
        intersection(){
          cylinder(r2=9+bottom2+2,r1=9+bottom2,h=2,$fn=3);
          cylinder(r=4+bottom2,h=2,$fn=99);
        }
        translate([0,0,-0.01])
        cylinder(r2=5+bottom2+1,r1=5+bottom2,h=2.1,$fn=3);
      }
    }
    
    for(i=[0:2]){
      rotate([0,0,60*2*i+0])
      translate([0,28.5+46.0,-0.1+2.9])
      rotate([0,0,30])
      difference(){
        intersection(){
          cylinder(r2=9+bottom2+2,r1=9+bottom2,h=2,$fn=3);
          cylinder(r=4+bottom2,h=2,$fn=99);
        }
        translate([0,0,-0.01])
        cylinder(r2=5+bottom2+1,r1=5+bottom2,h=2.1,$fn=3);
      }
    }

    for(i=[0:2]){
      rotate([0,0,60*2*i-22.5+60])
      translate([0,28.5+46.5,-0.1+2.9])
      rotate([0,0,-7.5])
      difference(){
        intersection(){
          cylinder(r2=9+bottom2+2,r1=9+bottom2,h=2,$fn=3);
          cylinder(r=4+bottom2,h=2,$fn=99);
        }
        translate([0,0,-0.01])
        cylinder(r2=5+bottom2+1,r1=5+bottom2,h=2.1,$fn=3);
      }
    }
  
    translate([0,88,0])
    difference(){
      cylinder(r=4,h=3,$fn=99);
      translate([0,0,-0.01])
      cylinder(r=2,h=4,$fn=99);
    }
  
}

//---------------------------------------------------------------------
module rack7c(show=0){


z1 = -0.1;
z2 = -0.1;
z3 = 0.0;

  // outer ring
  difference(){
    cylinder(r1=r7+6,r2=r7+4,h=bottom2,$fn=100);
    translate([0,0,-0.05])
    cylinder(r1=r7-2,r2=r7-0.1,h=bottom2+0.1,$fn=100);
  }

  // center grillwork
  difference(){
    //~ linear_extrude(height=bottom2,scale=[0.98,0.98])
    //~ square([218,164],center=true);
    rotate([0,0,23])
    cylinder(r1=r7,r2=r7,h=bottom2,$fn=100);

    // center
    translate([0,0,3.0])
    rotate([0,0,30])
    sE(cut=1);

    // 6 surrounding
    for(i=[0:5]){
      rotate([0,0,60*i-11])
      translate([0,47,3.0])
      rotate([0,0,-19])
      sE(cut=1);
    }
    
    // 6 triangles
    for(i=[0:5]){
      rotate([0,0,60*i+19])
      translate([0,27.2,z1])
      rotate([0,0,11])
      cylinder(r1=7,r2=7+bottom2,h=bottom2+0.1,$fn=3);
    }
    
    // 6 first outer
    for(i=[0:5]){
      rotate([0,0,60*i-11])
      translate([0,47+47,3.0+z3])
      rotate([0,0,-19])
      sE(cut=1);
    }
    // 6 second outer
    for(i=[0:5]){
      rotate([0,0,60*i-11+30])
      translate([0,47+47*0.73,3.0+z3])
      rotate([0,0,-19-30])
      sE(cut=1);
    }

    // 6 outer triangles
    for(i=[0:5]){
      rotate([0,0,60*i+19])
      translate([0,27.2+47*0.575,z2])
      rotate([0,0,11+60])
      cylinder(r1=7,r2=7+bottom2,h=bottom2+0.1,$fn=3);
    }
    for(i=[0]){
      rotate([0,0,60*i+0])
      translate([0,27.2+45,z2])
      rotate([0,0,30])
      cylinder(r1=7,r2=7+bottom2,h=bottom2+0.1,$fn=3);
    }
    //~ for(i=[0:5]){
      //~ rotate([0,0,60*i-22.5])
      //~ translate([0,28.5+46.5,z2])
      //~ rotate([0,0,-7.5])
      //~ cylinder(r1=6,r2=6+bottom2,h=bottom2+1,$fn=3);
    //~ }

    translate([0,0,-bottom2/2])
    cube([300,300,bottom2],center=true);
  }
  
  //~ // hanger loop
  //~ translate([0,86,0])
  //~ difference(){
    //~ cylinder(r1=6,r2=4,h=3,$fn=99);
    //~ translate([0,0,-0.01])
    //~ cylinder(r=2,h=4,$fn=99);
  //~ }
  
    
}

//---------------------------------------------------------------------
module rack7d(){

//~ bottom2=3.0;
//~ r7=84;

  color("cyan")
  rack7c();
  
  translate([0,0,6.2])
  mirror([0,0,1])
  difference(){
    intersection(){
      rack7c();
      cylinder(r2=r7+4,r1=r7+4-bottom2,h=bottom2,$fn=100);
    }
    translate([0,0,-20+3-1.2])
    cube([300,300,40],center=true);
  }
  
}

//---------------------------------------------------------------------
module rack7e(){
//~ bottom2=3.0;
//~ r7=84;

  difference(){
    intersection(){
      rack7c();
      cylinder(r1=r7-2,r2=r7,h=bottom2,$fn=100);
    }
    translate([0,0,-20+3-1.2])
    cube([300,300,40],center=true);
  }
}


//=====================================================================

//half();

//~ difference(){
  //~ sA(n=6,k=1.73,cut=1);
  //~ sA(n=6,k=1.73,cut=0);
  //~ //translate([40,40,0])
//~ }

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
//~ translate([0,0,3.0])
//~ rotate([0,0,30])
sE(cut=0);

//~ rack6();

//~ rack7c();
//~ rack7d();
//~ rack7d();

// Test cuts for just the central star
if(0){
  difference(){
    intersection(){
      rack7e();
      cylinder(r=35,h=40,center=true);
    }
    for(i=[0:5]){
      rotate([0,0,i*60])
      translate([52,0,0])
      cylinder(r=30,h=40,center=true,$fn=6);
    }
  }
}

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
//sE(sides=5,peak=1.37);

//=====================================================================

