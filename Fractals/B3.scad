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

//--------------------------------------------------------------
module lipB(wide=1.3){
// 1.5 wide for outer cut

//rout=31.6; // for scale 2.5 order 3   
//rout=56.1;    // for scale 5 order 3
rout=52;          // for size 2.5 order 4
hi0=10;

translate([0,0,-hi0/2])
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
module lipC(wide=1.2){
// 1.5 wide for outer cut

// rout=31.5-wide;      // for scale 2.5 order 3
//rout=56-wide;         // for scale 5 order 3
rout=52-wide;          // for size 2.5 order 4

hi0=10;


translate([0,0,-hi0/2])
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
    
//hi0=-z0+2.49;
hi0=-z0+4.49+0.1;
//  rout=31.5;      // for size 2.5 order 3
//rout=56;          // for size 5 order 3
rout=52;          // for size 2.5 order 4
    
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
        // outside round bevel
        rotate([0,0,72*i])
        translate([rout-1.5,0,-28.01])
        scale([1,1.5,1])
        cylinder(r1=4.8+4,r2=4.8,h=4,$fn=99);
    }
    

    for(i=[0:4]){
        // cut for windows
        rotate([0,0,72*i+72/2])
        translate([0,0,0])
        rotate([0,90,0])
        translate([0,0,39])
        linear_extrude(height=8,scale=1.3)
        offset(r=3,$fn=88)
        square([25,25],center=true);

    }

    // cut center bore
    translate([0,0,-0.1])
    cylinder(r=rout-20,h=60,center=true,$fn=5);
    translate([0,0,z0-2.01])
    cylinder(r1=rout-16,r2=rout-20,h=4,$fn=5);

    words(tdeep=tdeep);

}


}

//----------------------------------------------------------------------
module words2(tdeep=1.2){
  

Roff=-34.0;
Rsize=6;

    color("red")
    rotate([0,0,72*0])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("Flint's", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*1])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("Finest", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*2])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("Fairy", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*3])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("Crystals", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

    //~ color("red")
    //~ rotate([0,0,72*4])
    //~ translate([Roff,0,z0-2+tdeep])
    //~ rotate([180,0,0])
    //~ rotate([0,0,90])
    //~ linear_extrude(height=tdeep,scale=1)
    //~ text("Five", font = "Open Sans:style=Bold", size=Rsize,halign="center",valign="center",spacing=1.2);

}

//----------------------------------------------------------------------
module words(tdeep=1.2){
  

Roff=-34.0;
Rsize=6;

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

//---------------------------------------------------------------------
module rack1(){

    difference(){
        linear_extrude(height=6,scale=[0.97,0.93])
        square([135,85],center=true);
        //cube([135,85,6]);
        
        translate([-135/2,-85/2,0]){
            for(xi=[0:4]){
                    translate([15+26.2*xi,16.25+0,5.9])
                    s7cut(tol=0.4);
            }
            for(xi=[0:4]){
                    translate([15+26.2*xi,16.25+26.2,5.9])
                    s7cut(tol=0.4);
            }
            for(xi=[0:4]){
                    translate([15+26.2*xi,16.25+2*26.2,5.9])
                    s7cut(tol=0.4);
            }
        }
    }
    
}

//---------------------------------------------------------------------
module rack3(show=0){

  difference(){
    linear_extrude(height=bottom,scale=[0.96,0.96])
    square([218,164],center=true);

    union(){
      for(xi=[-1:2]){
          for(yi=[-1:1]){
              translate([52.0*xi-26,0+52*yi,bottom-0.01])
              s7cut(tol=0.4);
          }
      }
    }
  }
  // option to display the crystals
  if(show==1){
    for(xi=[-1:2]){
        for(yi=[-1:1]){
            translate([52.0*xi-26,0+52*yi,bottom-0.01])
            s7cut(tol=0.4);
        }
    }
  }
  
}

//-------------------------------------------------------------------
module bigBox(){
    
    translate([0,0,85/2-6])
    difference(){
        cube([250,200,85],center=true);
        translate([0,0,6])
        cube([236,185,85],center=true);
    }
}

//-------------------------------------------------------------------
module bigLid(){

x1=226;
y1=172;
zpad=1;
    
    translate([0,0,85+26/2-5.8])
    difference(){
        cube([250,200,26],center=true);
        translate([0,0,-6])
        cube([236,185,26],center=true);
    }
    // bottom pad for dimensions
    if(1){
        translate([0,0,85+26/2-5.8])
        translate([0,0,-zpad/2+7])
        cube([x1,y1,zpad],center=true);
    }
    
}

//-------------------------------------------------------------------
module bigTray(){

x1=226;
y1=172;
z1=20;
zpad=3;
    
    translate([0,0,z1/2])
    difference(){
        cube([x1,y1,z1],center=true);
        translate([0,0,trayz])
        cube([x1-2*trayz,y1-2*trayz,z1],center=true);
    }
    // bottom pad for dimensions
    if(1){
        color("red")
        translate([0,0,zpad/2-zpad])
        cube([x1-25,y1-25,zpad],center=true);
    }
    
}

//-------------------------------

//-------------------------------------------------------------------
module bigTray2(){

x1=226;
y1=172;
z1=20;
zpad=1;
    
    // base
    color("cyan")
    translate([0,0,trayz/2])
    cube([x1-6,y1-6,trayz],center=true);
    
    // front back
    translate([0,y1/2-trayz/2,trayz+wall/2])
    bigFront2();

    translate([0,-y1/2+trayz/2,trayz+wall/2])
    rotate([0,0,180])
    bigFront2();
    
    // sides
    translate([x1/2-trayz/2,0,trayz+wall/2])
    bigSide2();
    
    translate([-x1/2+trayz/2,0,trayz+wall/2])
    rotate([0,0,180])
    bigSide2();

    // bottom pad for dimensions
    if(1){
        color("red")
        translate([0,0,zpad/2-zpad])
        cube([x1-25,y1-25,zpad],center=true);
    }
    
}
//-------------------------------------------------------------------
module bigFront2(){

x1=226;
y1=172;
z1=20;
zpad=1.5;

    difference(){
        translate([0,0,-3])
        cube([x1,trayz,wall],center=true);
        
        translate([x1/2,1.5,-wall/2-3])
        rotate([0,0,180])
        bevel(x=3,y=3,h=wall);
        translate([-x1/2,1.5,-wall/2-3])
        rotate([0,0,-90])
        bevel(x=3,y=3,h=wall);
        
        translate([0,0,1])
        hull(){
            translate([x1/2-35,1.5,wall/2])
            rotate([90,0,0])
            cylinder(r=12,h=10,center=true,$fn=99);
            translate([-x1/2+35,1.5,wall/2])
            rotate([90,0,0])
            cylinder(r=12,h=10,center=true,$fn=99);
        }

        color("red")
        translate([0,0.9,-7.0])
        rotate([0,0,180])
        rotate([90,0,0])
        linear_extrude(height=0.9)
        text("Flint's  Finest  Fairy  Crystals", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.2);
    }


}

//-------------------------------------------------------------------
module bigSide2(){

x1=226;
y1=172;
z1=20;
zpad=1.5;

    difference(){
       translate([0,0,-3])
        cube([trayz,y1-6,wall],center=true);

        translate([0,0,1]){
        hull(){
            translate([1.5,y1/2-35,wall/2])
            rotate([0,90,0])
            cylinder(r=12,h=10,center=true,$fn=99);
            translate([1.5,y1/2-50,wall/2])
            rotate([0,90,0])
            cylinder(r=12,h=10,center=true,$fn=99);
        }
        hull(){
            translate([1.5,-y1/2+35,wall/2])
            rotate([0,90,0])
            cylinder(r=12,h=10,center=true,$fn=99);
            translate([1.5,-y1/2+50,wall/2])
            rotate([0,90,0])
            cylinder(r=12,h=10,center=true,$fn=99);
        }
        }
        translate([0,0,-4])
        hull(){
            translate([1.5,10,wall/2-5])
            rotate([0,90,0])
            cylinder(r=3,h=10,center=true,$fn=99);
            translate([1.5,-10,wall/2-5])
            rotate([0,90,0])
            cylinder(r=3,h=10,center=true,$fn=99);
        }
        translate([-4,y1/2-30+7.5,wall/2])
        rotate([0,90,0])
        rotate([0,0,0])
        rounder(r=2.5,h=10,f=99);

        translate([-4,y1/2-65+7.5,wall/2])
        rotate([0,90,0])
        rotate([0,0,-90])
        rounder(r=2.5,h=10,f=99);

        translate([-4,-y1/2+30-7.5,wall/2])
        rotate([0,90,0])
        rotate([0,0,-90])
        rounder(r=2.5,h=10,f=99);

        translate([-4,-y1/2+65-7.5,wall/2])
        rotate([0,90,0])
        rotate([0,0,0])
        rounder(r=2.5,h=10,f=99);

        color("red")
        translate([0.9,0,-6.0])
        rotate([0,0,90])
        rotate([90,0,0])
        linear_extrude(height=0.9)
        text("One Dozen", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.2);
    }

    
}
//-------------------------------------------------------------------
module bigTrayFoot(){

x1=226;
y1=172;
z1=20;

x2=20;
y2=20;
zfoot=8;
zrise=2;
zpad=1.5;

z2=z1+zfoot;
tol=0.2;
    
translate([x1/2-x2/2+trayz,y1/2-y2/2+trayz,z2/2-zfoot]){
    difference(){
        union(){
            translate([0,0,zrise/2])
            cube([x2,y2,z2+zrise],center=true);
            translate([-0.15*trayz,-0.15*trayz,zrise/2+trayz])
            cube([x2-2*trayz,y2-2*trayz,z2+zrise],center=true);
        }
        translate([-trayz+tol,-trayz+tol,0])
        cube([x2,y2,z2+2*tol],center=true);
        translate([-2*trayz-tol,-2*trayz-tol,trayz])
        cube([x2,y2,z2+2*tol+2*trayz],center=true);
        
        translate([x2/2,y2/2,-20])
        rotate([0,0,180])
        bevel(x=0.7*trayz,y=0.7*trayz,h=60);

        translate([-x2/2,y2/2,-20])
        rotate([0,0,-90])
        bevel(x=trayz/2,y=trayz/2,h=60);
        translate([-x2/2,y2/2-2*trayz-tol,-20])
        rotate([0,0,0])
        bevel(x=trayz/2,y=trayz/2,h=60);

        translate([x2/2,-y2/2,-20])
        rotate([0,0,90])
        bevel(x=trayz/2,y=trayz/2,h=60);
        translate([x2/2-2*trayz-tol,-y2/2,-20])
        rotate([0,0,0])
        bevel(x=trayz/2,y=trayz/2,h=60);

        translate([x2/2-0.2,0,5])
        rotate([0,0,90])
        rotate([90,0,0])
        linear_extrude(height=2)
        text("F", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.2);
        
        translate([-1.5,y2/2-0.2,5])
        rotate([0,0,180])
        rotate([90,0,0])
        linear_extrude(height=2)
        text("F", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.2);
        
    }
    // add a foot for the tray corner
    difference(){
        translate([trayz,trayz,-2.5*trayz])
        cube([x2/2,y2/2,trayz],center=true);
        translate([-x2/4+trayz,-y2/4+trayz,-5*trayz])
        rotate([0,0,0])
        rounder(r=x2/3,h=60,f=88);
    }
    translate([x2/2-trayz+tol,y2/2-trayz+tol,-zfoot-6])
    rotate([0,0,180])
    rounder(r=4,h=30,f=88);
}

}

//-------------------------------------------------------------------
module bigTrayFoot2(){

x1=226;
y1=172;
z1=22+16-0.1;

x2=20;
y2=20;
zfoot=8;
zrise=2;
zpad=1.5;
lip=2;

z2=z1+zfoot;
tol=0.2;
    
translate([x1/2-x2/2+trayz,y1/2-y2/2+trayz,z2/2-zfoot]){
    difference(){
        union(){
            translate([0,0,zrise/2+0.5*lip])
            cube([x2,y2,z2+zrise-lip],center=true);
            translate([-0.5*trayz,-0.5*trayz,0])
            cube([x2-trayz,y2-trayz,z2],center=true);
            translate([0,0,-2.5*trayz])
            cube([x2,y2,trayz],center=true);
        }
        // cut above lip
        translate([-trayz,-trayz,zrise+6])
        cube([x2,y2,z2],center=true);

        // extra clearance on top for lip
        translate([-trayz,-trayz,z1/2+4])
        linear_extrude(height=3,scale=1.1)
        square([x2,y2],center=true);
        
        translate([-2*trayz-tol,-2*trayz-tol,trayz])
        cube([x2,y2,z2+2*tol+2*trayz],center=true);

        // slot in top surface for the lip
        translate([-2*trayz-tol,-2*trayz-tol,z1-5])
        cube([x2,y2,10],center=true);

        // rounder on lip
        translate([x2/2-1*trayz,y2/2-1*trayz,-zfoot-7])
        rotate([0,0,180])
        rounder(r=5,h=lip,f=88);

        // bevel on lip
        translate([x2/2-trayz,y2/2,-zfoot-15])
        rotate([90,0,0])
        rotate([0,0,90])
        bevel(x=lip,y=0.5*lip,h=x2);
        translate([x2/2,y2/2-trayz,-zfoot-15])
        rotate([0,-90,0])
        rotate([0,0,-90])
        bevel(x=0.5*lip,y=lip,h=x2);


        // rounder on base support
        translate([-x2/2,-y2/2,-5*trayz])
        rounder(r=x2,h=60,f=200);
    
        // main corner bevel
        translate([x2/2,y2/2,-25])
        rotate([0,0,180])
        bevel(x=0.7*trayz,y=0.7*trayz,h=60);

        // end bevels
        translate([-x2/2,y2/2,-25])
        rotate([0,0,-90])
        bevel(x=trayz/2,y=trayz/2,h=60);

        translate([x2/2,-y2/2,-25])
        rotate([0,0,90])
        bevel(x=trayz/2,y=trayz/2,h=60);
        
        // Lettering
        if(0){
            translate([x2/2-0.2,0,5])
            rotate([0,0,90])
            rotate([90,0,0])
            linear_extrude(height=2)
            text("F", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.2);
            
            translate([-1.5,y2/2-0.2,5])
            rotate([0,0,180])
            rotate([90,0,0])
            linear_extrude(height=2)
            text("F", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.2);
        }
    }
    // add a foot for the tray corner
    difference(){
        translate([0,0,-8.5])
        cube([x2,y2,trayz],center=true);
        translate([-x2/2,-y2/2,-5*trayz])
        rounder(r=x2,h=60,f=200);
        translate([0,0,-6])
        cylinder(r=1,h=10,center=true,$fn=55);

        // end bevels
        translate([-x2/2,y2/2,-20])
        rotate([0,0,-90])
        bevel(x=trayz/2,y=trayz/2,h=60);

        translate([x2/2,-y2/2,-20])
        rotate([0,0,90])
        bevel(x=trayz/2,y=trayz/2,h=60);
        
        // main corner bevel
        translate([x2/2,y2/2,-20])
        rotate([0,0,180])
        bevel(x=0.7*trayz,y=0.7*trayz,h=60);
    }

    // fillet upper section
    translate([x2/2-trayz+tol,y2/2-trayz+tol,-zfoot+0])
    rotate([0,0,180])
    rounder(r=4,h=25,f=88);
    //fillet lower section
    translate([x2/2-2*trayz,y2/2-2*trayz,-zfoot-7])
    rotate([0,0,180])
    rounder(r=4,h=6,f=88);
}

    // bottom pad for dimensions
    if(0){
        color("red")
        translate([0,0,zpad/2-zpad])
        cube([x1-20,y1-20,zpad],center=true);
    }

}

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

//s8(n=5,k=1);
//sA(n=6,k=1.5);

//scale([1,1,1.6])
//sB(sides=7,peak=2.075);

//scale([1,1,1.5])
//sB(sides=6,peak=1.74);

//scale([1,1,1.18])
//sB(sides=5,peak=1.37);

if(0){
    difference(){
        union(){
            color("cyan")
            trayB(lip=0,tdeep=0);
            translate([0,0,0])
            rotate([180,0,0])
            trayB(lip=1,tdeep=0);
        }
        translate([100,0,0])
        cube([200,200,200],center=true);
        //translate([0,0,50])
        //cube([100,100,100],center=true);
        
    }
}


//trayB(lip=1,tdeep=0);


if(0){
    trayB(lip=1,tdeep=1.2);
    translate([0,0,0.1])
    rotate([180,0,0])
    trayB(lip=0,tdeep=0);
}

// Slice into layers so that text can be filled in
// 28 mm -z total, lip=1 for lower
if(0){
  intersection(){
  //difference(){
    trayB(lip=1,tdeep=1.2);

    union(){
      translate([0,0,-24-2.5+5.8+0.4])
      cube([200,200,3],center=true);

      translate([0,0,-3.49])
      cube([200,200,3],center=true);
      translate([0,0,-3.49+6.6])
      cube([200,200,3],center=true);
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


// This is the crystal 
//~ s7();


//color("cyan")
//translate([0,0,0])
//scale(0.99)
//s7cut(tol=0);



//rack1();
//color("red")
//s7cut(tol=0.4);
//color("blue")
//s7cut2(tol=0.4);

//rack3();



//translate([0,60,0])
//bigTrayFoot();
//bigTrayFoot2();

//bigTray2();
//bigTray();
//bigFront2();
//bigSide2();


if(1){
    difference(){
        union(){
            translate([0,0,zfoot]){
                translate([0,0,1.0*trayz+0.1])
                color("gray")
                rack3(show=1);
                translate([0,0,0])
                bigTray2();
                //bigTrayFoot();                
                bigTrayFoot2();                
                //rotate([0,0,180])
                //bigTrayFoot();
                //mirror([1,0,0]){
                //    bigTrayFoot();                
                //    rotate([0,0,180])
                //    bigTrayFoot();
                //}

            }
            if(1){
                translate([0,0,zfoot+46]){
                    translate([0,0,1.0*trayz+0.1])
                    color("gray")
                    rack3(show=1);
                    bigTray2();
                    bigTrayFoot2();
                }
            }
            if(0){
                color("silver",alpha=0.3)
                bigBox();
                color("silver",alpha=0.3)
                bigLid();
            }
        }
        if(1){
            // side cut
            translate([-150,0,0])
            cube([300,300,300],center=true);
            // front cut
            translate([0,-150,0])
            cube([300,300,300],center=true);
        }
    }
}



//=====================================================================

