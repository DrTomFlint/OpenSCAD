//======================================================================
// Box to hold 5 A-size "Fairy Crystals" with 4 sides
//
// This should fit the FairyCrystalA4 prints
//
// The original sierpinski pyramid code is copyright aeropic 2017
// Adapted to make a low base that displays the "crusaders cross"
//
// Note: these shapes take a long time to render in OpenSCAD, don't 
// give up too quickly!  On my laptop this took about 5 minutes.
// 
// Go to the bottom of the file, uncomment 1 of the 4 parts, generate an
// STL file.  Then repeat the process until you have A and B parts for 
// the upper and lower sections of the box.  
//
// DrTomFlint 25 March 2024
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

// make multiple objects for multi color print
layer = 0.3;
thick = 17.5;
z=3;

tdeep = 1.5;    // text depth
z0=-26;         // top of lid before bevel
//bottom=7.0;     // for size 5
bottom=6.0;     // for size 4
//bottom=6.4;     // for size 3

trayz=3;
zfoot=8;
zrise=2;

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
      mirror([0,0,1])
      difference() {
          ss(order-1);
          translate([-120,-120,bottom])
          cube([240,240,80]);
      }
    }
  }

}

//----------------------------------------------------
// single solid, same size
module s7cut(tol=0.2){
    
    size2=size*7.1;  // for order 3
    
        
    translate([0,0,-0.01])
    //scale([1,1,0.98])
    rotate([0,0,45])cylinder(r1=size2+1*tol,r2 = epsr+1*tol, h = 1.0*size2+tol, $fn=4);
    
    mirror([0,0,1])
    difference() {
    rotate([0,0,45])cylinder(r1=size2+1*tol,r2 = epsr+1*tol, h = 1.0*size2+tol, $fn=4);
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


//----------------------------------------------------------------
// tray to hold 5 pyramids in s7small shape
module trayB(tol=0.2,z0=-13,lip=1,tdeep=1.5){
    
hi0=-z0+2.49+1;
rout=31.5;
//rout=30.5;
    
difference(){    
    translate([0,0,z0])
    union(){
        cylinder(r=rout,h=hi0,$fn=5);
        translate([0,0,-2])
        cylinder(r1=rout-2,r2=rout,h=2,$fn=5);
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
        translate([0,0,-17.25])
        s7cut(tol=tol);

        // outside round cut
        rotate([0,0,72*i])
        translate([rout-1.5,0,-34])
        scale([1,1.5,1])
        cylinder(r=4.8,h=40,$fn=99);
        
        // outside round bevel
        rotate([0,0,72*i])
        translate([rout-1.5,0,-15.01])
        scale([1,1.5,1])
        cylinder(r1=4.8+2,r2=4.8,h=2,$fn=99);
    }
    

    for(i=[0:4]){
        // cut for windows
        rotate([0,0,72*i+72/2])
        translate([0,0,-0.5])
        rotate([0,90,0])
        translate([0,0,20])
        linear_extrude(height=8,scale=1.5)
        offset(r=3,$fn=88)
        square([8-1,8-1],center=true);

    }

    // cut center bore
    translate([0,0,-0.1])
    cylinder(r=rout-16,h=60,center=true,$fn=5);
    translate([0,0,z0-2.01])
    cylinder(r1=rout-14,r2=rout-16,h=2,$fn=5);


Roff=-18.5;
tsize=4.5;
tspace=1.1;

if(1){
    if(tdeep>0){
        color("red")
        rotate([0,0,72*0])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=2,scale=1)
        text("Earth", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*1])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=2,scale=1)
        text("Air", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*2])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=2,scale=1)
        text("Fire", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*3])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=2,scale=1)
        text("Water", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*4])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=2,scale=1)
        text("Spirit", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);
    //    text("Soul", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);
    }
}

// Here is some alternative text
if(0){
    if(tdeep>0){
        color("red")
        rotate([0,0,72*0])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=2,scale=1)
        text("Dark", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*1])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=2,scale=1)
        text("Moon", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*2])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=2,scale=1)
        text("Dark", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*3])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=2,scale=1)
        text("Crystal", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

    }
}


}   // end difference()


}

//--------------------------------------------------------------
module lipB(wide=1.7){
// 1.5 wide for outer cut

rout=31.7;    
//rout=30.7;    
hi0=5+2;

translate([0,0,-2.5-1])
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

rout=31.5-wide;    
//rout=30.5-wide;    
hi0=7;


translate([0,0,-2.5-1])
// overlap section
intersection(){
    cylinder(r=rout,h=hi0,$fn=5);

difference(){
    union(){
        difference(){    
            cylinder(r=rout,h=hi0,$fn=5);
            //translate([0,0,-1])
            //cylinder(r=rout-wide-1,h=hi0+2,$fn=5);
        }    
        
        for(i=[0:4]){
            // outside round cut
            rotate([0,0,72*i])
            translate([rout-wide,0,0])
            scale([1,1.5,1])
            cylinder(r=4.8+wide+1,h=hi0,$fn=99);
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




//-----------------------------------------------------------------------
module Letters(z0=-13,tdeep=1.5){
    
Roff=-18.5;
tsize=4.5;
tspace=1.1;

if(1){
    if(tdeep>0){
        color("red")
        rotate([0,0,72*0])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=tdeep,scale=1)
        text("Earth", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*1])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=tdeep,scale=1)
        text("Air", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*2])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=tdeep,scale=1)
        text("Fire", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*3])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=tdeep,scale=1)
        text("Water", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*4])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=tdeep,scale=1)
        text("Spirit", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);
    //    text("Soul", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);
    }
}

if(0){
    if(tdeep>0){
        color("red")
        rotate([0,0,72*0])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=tdeep,scale=1)
        text("Dark", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*1])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=tdeep,scale=1)
        text("Moon", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*2])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=tdeep,scale=1)
        text("Dark", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

        color("red")
        rotate([0,0,72*3])
        translate([Roff,0,z0-2+tdeep])
        rotate([180,0,0])
        rotate([0,0,90])
        linear_extrude(height=tdeep,scale=1)
        text("Crystal", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=tspace);

    }
}

}

//---------------------------------------------------------------------
module boxUpperA(){
  
  difference(){
    trayB(lip=0);
    
    union(){
      translate([0,0,-11.4])
      cube([100,100,5*0.3],center=true);

      translate([0,0,-1.5])
      cube([100,100,5*0.3],center=true);

      translate([0,0,1.8])
      cube([100,100,5*0.3],center=true);
    }
  }    
  
}

//---------------------------------------------------------------------
module boxUpperB(){
  
  intersection(){
    trayB(lip=0);
    
    union(){
      translate([0,0,-11.4])
      cube([100,100,5*0.3],center=true);

      translate([0,0,-1.5])
      cube([100,100,5*0.3],center=true);

      translate([0,0,1.8])
      cube([100,100,5*0.3],center=true);
    }
  }    
  
  Letters();
  
}

//---------------------------------------------------------------------
module boxLowerA(){
  
  difference(){
    trayB(lip=1);
    
    union(){
      translate([0,0,-11.4])
      cube([100,100,5*0.3],center=true);

      translate([0,0,-1.5])
      cube([100,100,5*0.3],center=true);

      translate([0,0,1.8])
      cube([100,100,5*0.3],center=true);
    }
  }    
}

//---------------------------------------------------------------------
module boxLowerB(){
  
  intersection(){
    trayB(lip=1);
    
    union(){
      translate([0,0,-11.4])
      cube([100,100,5*0.3],center=true);

      translate([0,0,-1.5])
      cube([100,100,5*0.3],center=true);

      translate([0,0,1.8])
      cube([100,100,5*0.3],center=true);
    }
  }    
  
  Letters();
}

//=====================================================================

// For Printing:
// Select ONE of the following 4 parts to generate an STL for printing
// A parts are the main bulk, B parts are the highlighted stripes and 
// text.  Assign different colors to the A and B parts in the Slicer.
if(1){
  boxUpperA();
  //~ boxUpperB();
  //~ boxLowerA();
  //~ boxLowerB();
}

// Just show the lettering
if(0){
  Letters();
}

// Turn this on to see the entire box, not cut for multi-color, not for printing
if(0){
    trayB(lip=0);
    translate([0,0,0.1])
    rotate([180,0,0])
    trayB(lip=1);
}

// Turn this on to see the crystals in the box, not for printing
if(0){
    for(i=[0:4]){
    rotate([0,0,72*i])
    rotate([0,90,0])
    translate([0,0,-17.25])
    color([1,0.3+0.1*i,0.3+0.1*i],alpha=0.6)
    s7cut(tol=0);
    //s7();
 }
}


//=====================================================================

