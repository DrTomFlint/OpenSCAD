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

use <../Parts/rounder.scad>
use <../Fractals/Lsystem.scad>

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
        
    //    translate([-120,-120,thick*z-80])cube([240,240,80]);
    //    translate([-120,-120,thick*z+thick])cube([240,240,80]);

        if(0){
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

//----------------------------------------------------
// single solid, same size
module s7cut(tol=0.2){
    
//    size2=size*14+tol;  // for order 4
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

//--------------------------------------------------------------
module lip9(tol=0.25){

rout=30;    
hi0=3;

// overlap section
intersection(){
    cylinder(r=rout+1.5,h=hi0,$fn=5);

difference(){
    union(){
        difference(){    
            cylinder(r=rout+1.5,h=hi0,$fn=5);
            translate([0,0,-1])
            cylinder(r=rout+tol,h=hi0+2,$fn=5);
        }    
        
        for(i=[0:4]){
            // outside round cut
            rotate([0,0,72*i])
            translate([rout-1.5,0,0])
            scale([1,1.5,1])
            cylinder(r=4.8-tol,h=hi0,$fn=99);
        }
    }    
    for(i=[0:4]){
        // outside round cut
        rotate([0,0,72*i])
        translate([rout-1.5,0,-1])
        scale([1,1.5,1])
        cylinder(r=4.8-1.2,h=hi0+2,$fn=99);
    }

    for(i=[0:4]){
        // cut for windows
        rotate([0,0,72*i+72/2])
        translate([0,0,-0.5])
        rotate([0,90,0])
        translate([0,0,10])
        //cylinder(r=18,h=30,$fn=99);
        linear_extrude(height=30)
        offset(r=3,$fn=88)
        square([7.5,7.5],center=true);
    }
}
}

// attachment section
translate([0,0,-3])
intersection(){
    cylinder(r=rout+1.5,h=hi0,$fn=5);

difference(){
    union(){
        difference(){    
            cylinder(r=rout+1.5,h=hi0,$fn=5);
            translate([0,0,-1])
            cylinder(r=rout-tol,h=hi0+2,$fn=5);
        }    
        
        for(i=[0:4]){
            // outside round cut
            rotate([0,0,72*i])
            translate([rout-1.5,0,0])
            scale([1,1.5,1]){
                cylinder(r=4.8+tol,h=hi0,$fn=99);
                translate([0,0,0])
                cylinder(r1=4.8,r2=4.8-2,h=2,$fn=99);
            }
        }
    }    
    for(i=[0:4]){
        // outside round cut
        rotate([0,0,72*i])
        translate([rout-1.5,0,-1])
        scale([1,1.5,1])
        cylinder(r=4.8-1.2,h=hi0+2,$fn=99);
    }
    for(i=[0:4]){
        // cut for windows
        rotate([0,0,72*i+72/2])
        translate([0,0,-0.5])
        rotate([0,90,0])
        translate([0,0,10])
        //cylinder(r=18,h=30,$fn=99);
        linear_extrude(height=30)
        offset(r=3,$fn=88)
        square([7.5,7.5],center=true);
    }
    for(i=[0:4]){
        // cut for bevel
        rotate([0,0,72*i])
        translate([-27,0,0])
        rotate([0,45,0])
        cube([4,60,4],center=true);
    }
    for(i=[0:4]){
        // outside round cut
        rotate([0,0,72*i])
        translate([rout-1.5,0,-0.01])
        scale([1,1.5,1]){
//            cylinder(r=4.8+tol,h=hi0,$fn=99);
            translate([0,0,0])
            cylinder(r1=4.8,r2=4.8-2,h=2,$fn=99);
        }
    }
}
}


}

//----------------------------------------------------------------
// tray to hold 5 pyramids in s7small shape
module tray9(tol=0.3,z0=-12,lip=1,tdeep=1.2){
    
hi0=-z0;
rout=30;

if(lip>0){
    lip9();
}
    
difference(){    
    translate([0,0,z0])
    union(){
        cylinder(r=rout,h=hi0,$fn=5);
        translate([0,0,-2])
        cylinder(r1=rout-2,r2=rout,h=2,$fn=5);
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
    }
    

    for(i=[0:4]){
        // cut for windows
        rotate([0,0,72*i+72/2])
        translate([0,0,-0.5])
        rotate([0,90,0])
        translate([0,0,10])
        //cylinder(r=18,h=30,$fn=99);
        linear_extrude(height=30)
        offset(r=3,$fn=88)
        square([7.5,7.5],center=true);

        // material reduction
        rotate([0,0,72*i+72/2])
        translate([rout-10,0,-6.8])
        cube([4,14,10],center=true);
    }

if(lip==0){
    // cut center bore LID
    translate([0,0,-0.1])
    cylinder(r=rout-12,h=60,center=true,$fn=5);
    translate([0,0,z0-2.01])
    cylinder(r1=rout-10,r2=rout-12,h=2,$fn=5);
}
if(lip==1){
    // cut center bore BASE
    translate([0,0,-0.1])
    cylinder(r=rout-14,h=60,center=true,$fn=5);
    translate([0,0,z0-2.01])
    cylinder(r1=rout-12,r2=rout-12,h=2,$fn=5);
}


Roff=-19.4;

if(tdeep>0){
    color("red")
    rotate([0,0,72*0])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=2,scale=1)
    text("EARTH", font = "Open Sans:style=Bold", size=3,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*1])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=2,scale=1)
    text("AIR", font = "Open Sans:style=Bold", size=3,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*2])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=2,scale=1)
    text("FIRE", font = "Open Sans:style=Bold", size=3,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*3])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=2,scale=1)
    text("WATER", font = "Open Sans:style=Bold", size=3,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*4])
    translate([Roff,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=2,scale=1)
    text("SPIRIT", font = "Open Sans:style=Bold", size=3,halign="center",valign="center",spacing=1.2);
}


}


}
//--------------------------------------------------------------
module lipB(wide=1.7){
// 1.5 wide for outer cut

rout=31.7;    
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

rout=31.5-wide;    
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
            cylinder(r=rout-wide-1,h=hi0+2,$fn=5);
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


//----------------------------------------------------------------
// tray to hold 5 pyramids in s7small shape
module trayB(tol=0.3,z0=-13,lip=1,tdeep=1.5){
    
hi0=-z0+2.49;
rout=31.5;
    
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
    }
    

    for(i=[0:4]){
        // cut for windows
        rotate([0,0,72*i+72/2])
        translate([0,0,-0.5])
        rotate([0,90,0])
        translate([0,0,20])
        linear_extrude(height=8,scale=1.5)
        offset(r=3,$fn=88)
        square([8,8],center=true);

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
module rack3(){

    difference(){
//        linear_extrude(height=6,scale=[0.96,0.915])
//        square([225,175],center=true);
        linear_extrude(height=6,scale=[0.96,0.96])
        square([218,164],center=true);
        
        translate([-218/2,-164/2,0]){
            for(xi=[0:7]){
                for(yi=[0:5]){
                    translate([18+26.0*xi,17+26.0*yi,5.9])
                    s7cut(tol=0.4);
                }
            }
        }
    }
    
}

//---------------------------------------------------------------------
module rack3b(){


        linear_extrude(height=6,scale=[0.96,0.96])
        square([218,164],center=true);
        
        translate([-218/2,-164/2,0]){
            for(xi=[0,7]){
                for(yi=[0,5]){
                    translate([18+26.0*xi,17+26.0*yi,5.9])
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
zpad=3;
    
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
        cube([x1-20,y1-20,zpad],center=true);
    }
    
}

//-------------------------------------------------------------------
module bigTray(){

x1=226;
y1=172;
z1=20;
zpad=1.5;
    
    translate([0,0,z1/2])
    difference(){
        cube([x1,y1,z1],center=true);
        translate([0,0,trayz])
        cube([x1-2*trayz,y1-2*trayz,z1-trayz],center=true);
    }
    // bottom pad for dimensions
    if(1){
        color("red")
        translate([0,0,zpad/2-zpad])
        cube([x1-20,y1-20,zpad],center=true);
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

    // bottom pad for dimensions
    if(0){
        color("red")
        translate([0,0,zpad/2-zpad])
        cube([x1-20,y1-20,zpad],center=true);
    }

}

//-------------------------------------------------------------------
// @TODO add some taper on the interlocking parts, round off that 
// square outer corner.  Make the bottom side tab larger and add a 
// hole.  Shorter walls and taller feet would be nice.  10 mm feet 
// was a bit low on the bar.
module bigTrayFoot2(){

x1=226;
y1=172;
z1=22;

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
        translate([x2/2-trayz,y2/2,-zfoot-7])
        rotate([90,0,0])
        rotate([0,0,90])
        bevel(x=lip,y=0.5*lip,h=x2);
        translate([x2/2,y2/2-trayz,-zfoot-7])
        rotate([0,-90,0])
        rotate([0,0,-90])
        bevel(x=0.5*lip,y=lip,h=x2);


        // rounder on base support
        translate([-x2/2,-y2/2,-5*trayz])
        rounder(r=x2,h=60,f=200);
    
        // main corner bevel
        translate([x2/2,y2/2,-20])
        rotate([0,0,180])
        bevel(x=0.7*trayz,y=0.7*trayz,h=60);

        // end bevels
        translate([-x2/2,y2/2,-20])
        rotate([0,0,-90])
        bevel(x=trayz/2,y=trayz/2,h=60);

        translate([x2/2,-y2/2,-20])
        rotate([0,0,90])
        bevel(x=trayz/2,y=trayz/2,h=60);
        
        // Lettering
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
        translate([0,0,-2.5*trayz])
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
    translate([x2/2-trayz+tol,y2/2-trayz+tol,-zfoot+2])
    rotate([0,0,180])
    rounder(r=4,h=21,f=88);
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


//=====================================================================

//rack1();
//rack3();

//translate([0,60,0])
//bigTrayFoot();
//bigTrayFoot2();

if(1){
    difference(){
        union(){
            translate([0,0,zfoot]){
                translate([0,0,1.5*trayz+0.2])
                color("gray")
                rack3b();
                bigTray();
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
                translate([0,0,zfoot+30.1]){
                    translate([0,0,1.5*trayz])
                    color("gray")
                    rack3b();
                    bigTray();
                    bigTrayFoot2();
                }
                translate([0,0,zfoot+2*30.1]){
                    translate([0,0,1.5*trayz])
                    color("gray")
                    rack3b();
                    bigTray();
                    bigTrayFoot2();
                }
            }
            if(1){
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


if(0){
    difference(){
        union(){
            color("cyan")
            trayB(lip=0);
            translate([0,0,0.1])
            rotate([180,0,0])
            trayB(lip=1);
        }
        translate([50,0,0])
        cube([100,100,100],center=true);
        //translate([0,0,50])
        //cube([100,100,100],center=true);
        
    }
}

//color("cyan")
//insert1();

//tray7();

//tray8();
//rotate([180,0,0])
//tray8();
//labels(z0=z0);

//trayPins8();

//trayPin();

if(0){
    trayB(lip=0);
    //translate([0,0,0.1])
    //rotate([180,0,0])
    //trayB(lip=1);
}

//Letters();

if(0){
// slice to print in multi colors
// be sure slice offset and thickness are multiples of layer height
difference(){
//intersection(){
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

//s7();

//color("cyan")
//translate([0,0,0])
//s7cut(tol=0);

//=====================================================================

