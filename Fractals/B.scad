// copyright aeropic 2017
// A1 order 3 size 3
// A2 order 3 size 2.5 bottom 6.0

// order of sierpinski fractal
order = 4; //[0,1,2,3,4,5,6,7]
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
layer = 0.3;
thick = 17.5;
z=3;

//tdeep = 1.5;    // text depth
tdeep = 0;    // text depth
z0=-26;         // top of lid before bevel
//bottom=7.0;     // for size 5
//bottom=6.0;     // for size 4
//bottom=6.4;     // for size 3

bottom=5.8;     // size 5 order 3

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

//--------------------------------------------------------------
module lipB(wide=1.6){
// 1.5 wide for outer cut

//rout=31.6; // for scale 2.5 order 3   
//rout=56.1;    // for scale 5 order 3
rout=53;          // for size 2.5 order 4
hi0=5;

translate([0,0,-2.5])
// overlap section
intersection(){
    cylinder(r=rout,h=hi0,$fn=5);

difference(){
    union(){
        difference(){    
            cylinder(r=rout,h=hi0,$fn=5);
            translate([0,0,-1])
            cylinder(r=rout-wide,h=hi0+2,$fn=5);
        }    
        
        for(i=[0:4]){
            // outside round cut
            rotate([0,0,72*i])
            translate([rout-wide,0,0])
            scale([1,1.3,1])
            cylinder(r=4.8+wide-0.2,h=hi0,$fn=99);
        }
    }    

}
}

}

//--------------------------------------------------------------
module lipC(wide=1.4){
// 1.5 wide for outer cut

// rout=31.5-wide;      // for scale 2.5 order 3
//rout=56-wide;         // for scale 5 order 3
rout=53-wide;          // for size 2.5 order 4
hi0=5;


translate([0,0,-2.5])
// overlap section
intersection(){
    cylinder(r=rout,h=hi0,$fn=5);

difference(){
    union(){
        difference(){    
            cylinder(r=rout,h=hi0,$fn=5);
            translate([0,0,-1])
            cylinder(r=rout-wide-1.1,h=hi0+2,$fn=5);
        }    
        
        for(i=[0:4]){
            // outside round cut
            rotate([0,0,72*i])
            translate([rout-wide,0,0])
            scale([1,1.5,1])
            cylinder(r=4.8+wide+2,h=hi0,$fn=99);
        }
    }    
    for(i=[0:4]){
        // outside round cut
        rotate([0,0,72*i])
        translate([rout-wide,0,-1])
        scale([1,1.5,1])
        cylinder(r=4.8,h=hi0+2,$fn=99);
    }

}
}

}


//----------------------------------------------------------------
// tray to hold 5 pyramids in s7small shape
//module trayB(tol=0.4,z0=-29,lip=1,tdeep=1.5){
module trayB(tol=0.2,z0=-26,lip=1,tdeep=1.5){
    
hi0=-z0+2.49;
//  rout=31.5;      // for size 2.5 order 3
//rout=56;          // for size 5 order 3
rout=53;          // for size 2.5 order 4
    
difference(){    
    translate([0,0,z0+2])
    union(){
        cylinder(r=rout,h=hi0-2,$fn=5);
        translate([0,0,-4])
        cylinder(r1=rout-4,r2=rout,h=4,$fn=5);
    }
    

    if(lip>0){
        lipB();
    }else{
        lipC();
    }
    

    for(i=[0:4]){
        // cut for crystals
        rotate([0,0,72*i])
        rotate([0,90,0])
    //    translate([0,0,-17.25])       // for size 2.5 order 3 = A size
//        translate([0,0,-37])         // for size 5 order 3
//        translate([0,0,-34.8])         // for size 2.5 order 4 = B size, tol=0.4
        translate([0,0,-34.4])         // for size 2.5 order 4 = B size, tol=0.2
        s7cut(tol=tol);

        // outside round cut
        rotate([0,0,72*i])
        translate([rout-1.5,0,-34])
        scale([1,1.5,1])
        cylinder(r=4.8,h=40,$fn=99);
    }
    

    for(i=[0:4]){
        // cut for windows
        rotate([0,0,72*i+72/2])
        translate([0,0,0])
        rotate([0,90,0])
        translate([0,0,40])
        linear_extrude(height=8,scale=1.2)
        offset(r=3,$fn=88)
        square([26,26],center=true);

    }

    // cut center bore
    translate([0,0,-0.1])
    cylinder(r=rout-20,h=60,center=true,$fn=5);
    translate([0,0,z0-2.01])
    cylinder(r1=rout-16,r2=rout-20,h=4,$fn=5);

Roff=-35.0;
Rsize=5;

if(tdeep>0){
    color("red")
    rotate([0,0,72*0])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("EARTH", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*1])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("AIR", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*2])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("FIRE", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*3])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("WATER", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*4])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("SPIRIT", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);
}


}


}

//----------------------------------------------------------------------
module words(tdeep=1.5){
  

Roff=-35.0;
Rsize=5;

    color("red")
    rotate([0,0,72*0])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("EARTH", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*1])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("AIR", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*2])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("FIRE", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*3])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("WATER", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*4])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("SPIRIT", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

}


//=====================================================================

if(0){
    difference(){
        union(){
            color("cyan")
            trayB(lip=0,tdeep=0);
            translate([0,0,0.1])
            rotate([180,0,0])
            trayB(lip=1,tdeep=0);
        }
        translate([100,0,0])
        cube([200,200,200],center=true);
        //translate([0,0,50])
        //cube([100,100,100],center=true);
        
    }
}


//trayB(lip=1,tdeep=1.2);


if(0){
    trayB(lip=1,tdeep=0);
    translate([0,0,0.1])
    rotate([180,0,0])
    trayB(lip=0,tdeep=0);
}

// Slice into layers so that text can be filled in
// 28 mm -z total, lip=1 for lower
if(1){
  intersection(){
  //difference(){
    trayB(lip=1,tdeep=1.2);

    union(){
      translate([0,0,-24])
      cube([200,200,2],center=true);
      translate([0,0,-20])
      cube([200,200,2],center=true);
      translate([0,0,-1.49])
      cube([200,200,2],center=true);
      translate([0,0,2])
      cube([200,200,2],center=true);
    }
  }
}
//translate([0,0,-1])  
//words(tdeep=1.2);

//trayB(lip=0,tdeep=1.5);
//color("cyan")
//lipB();

//lip9();

if(0){
    for(i=[0:0]){
    rotate([0,0,72*i])
    rotate([0,90,0])
//    translate([0,0,-17.25])       // for size 2.5 order 3
//    translate([0,0,-37])         // for size 5 order 3
    translate([0,0,-34.8])         // for size 2.5 order 4 = B size
    color([1,0.3+0.1*i,0.3+0.1*i],alpha=0.6)
    s7cut(tol=0);
    //s7();
 }
}

//s7();


//color("cyan")
//translate([0,0,0])
//scale(0.99)
//s7cut(tol=0);

//=====================================================================

