// s9 for folding pyramids

use <../Gears/gears.scad>

// Fold angle
//ang1 = 0;      //[0:90]

/* [Hidden] */

// order of sierpinski fractal
order = 4; //[0,1,2,3,4,5,6,7]
// size of smallest pyramid
size = 2.5; //[2:50]

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

//------------------------------------------------------------------
function undulate(t) = abs((t - .5) * 2);

//-----------------------------------------------------------------
module s7(){

    scale([1,1,0.98])
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
            translate([-120,-120,6])
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

if(0){
mirror([0,0,1])
difference() {
    ss(order-1);
    //remove bottom spikes
    translate([-120,-120,6])
    cube([240,240,80]);
    //translate([-120,-120,3])
    //cube([240,240,-3]);
}
}

//----------------------------------------------------
// single solid, same size
module s7cut(tol=0.2){
    
    size2=size*14+tol;
        
    scale([1,1,0.98]){

        translate([0,0,-0.01])
        rotate([0,0,45])cylinder(r1=size2,r2 = epsr, h = 1.0*size2, $fn=4);
        
        mirror([0,0,1])
        difference() {
        rotate([0,0,45])cylinder(r1=size2,r2 = epsr, h = 1.0*size2, $fn=4);
            translate([-120,-120,6])
            cube([240,240,80]);
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

//----------------------------------------------------------------
// tray to hold 5 pyramids in s7small shape
module tray8(tol=1.4,z0=-26,tdeep=tdeep){
    
//z0=-26;
hi0=-z0;
    
difference(){    
    translate([0,0,z0])
    union(){
        cylinder(r1=53,r2=53,h=hi0,$fn=5);
        translate([0,0,-2])
        cylinder(r1=51,r2=53,h=2,$fn=5);
    }
    
    for(i=[0:4]){
        rotate([0,0,72*i])

        rotate([0,90,0])
        translate([0,0,-35.4])
        s7cut(tol=tol);

        rotate([0,0,72*i])
        translate([51,0,-28])
        scale([1,1.5,1])
        cylinder(r=4.8,h=30,$fn=99);
    }
    

    for(i=[0:4]){
        rotate([0,0,72*i+72/2])
        translate([0,0,0])
        rotate([0,90,0])
        translate([0,0,30])
        //cylinder(r=18,h=30,$fn=99);
        linear_extrude(height=30)
        offset(r=6,$fn=88)
        square([22,22],center=true);
    }


// round tops of the wall
if(0){    
    difference(){
        translate([0,0,-8])
        cylinder(r=70,h=30,$fn=99);

        for(i=[0:4]){
            rotate([0,0,72*i])
            translate([0,0,-12])
            rotate([0,90,0])
            translate([0,0,30])
            cylinder(r=12,h=30,$fn=99);
        }
    }
}

    translate([0,0,z0-0.1])
    cylinder(r=35,h=25.2,$fn=5);
    translate([0,0,z0-2.01])
    cylinder(r1=37,r2=35,h=2,$fn=5);

    color("red")
    rotate([0,0,72*0])
    translate([-35,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=2,scale=1)
    text("EARTH", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*1])
    translate([-35,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=2,scale=1)
    text("AIR", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*2])
    translate([-35,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=2,scale=1)
    text("FIRE", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*3])
    translate([-35,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=2,scale=1)
    text("WATER", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*4])
    translate([-35,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=2,scale=1)
    text("SPIRIT", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);



}

    
}

//------------------------------------------------------------------------------------
module labels(z0=-26,tdeep=tdeep){
    
    color("red")
    rotate([0,0,72*0])
    translate([-35,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("EARTH", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*1])
    translate([-35,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("AIR", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*2])
    translate([-35,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("FIRE", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*3])
    translate([-35,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("WATER", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

    color("red")
    rotate([0,0,72*4])
    translate([-35,0,z0-2+tdeep])
    rotate([180,0,0])
    rotate([0,0,90])
    linear_extrude(height=tdeep,scale=1)
    text("SPIRIT", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

    
}    

//--------------------------------------------------------------------
module hinge1(ang1=90,fold=0.5){

    for(i=[0:0]){
        rotate([0,0,72*i])
        translate([0,34+fold,0])
        rotate([ang1,0,0])
        translate([0,25,0])
        s7cut(tol=0);
    }

}

//--------------------------------------------------------------------
module gear1(){
    bevel_gear(modul=1, tooth_number=8,  partial_cone_angle=72/2, tooth_width=3, bore=2, pressure_angle=20, helix_angle=20);
}

//--------------------------------------------------------------------
module hinge2(ang1=0,fold=0.5){

zoff=-2;

    for(i=[0:4]){
        rotate([0,0,72*i])
        translate([0,40+fold+zoff,-zoff]){
        
            rotate([ang1,0,0]){        
                translate([0,25-0,6+zoff])
                s7cut(tol=0);
                
                
                rotate([0,90,0])
                cylinder(r=1,h=54,$fn=22,center=true);
                
                translate([24,0,0])
                rotate([0,90,0])
                gear1();

                translate([-24,0,0])
                rotate([0,-90,0])
                rotate([0,0,180/8])
                gear1();
            }
        }
    }


}

//=====================================================================

hinge2(ang1=undulate($t)*90);
//rotate([0,180,0])
//hinge2(ang1=ang1);



if(0){
    difference(){
        tray8(z0=z0);
        translate([48,0,0])
        cube([100,100,100],center=true);
        
    }
}


//tray7();

//tray8();
//rotate([180,0,0])
//tray8();
//labels(z0=z0);

//trayPins8();

//trayPin();


if(0){
    for(i=[0:4]){
    rotate([0,0,72*i])
    rotate([0,90,0])
    translate([0,0,-35.4])
    color([1,0.3+0.1*i,0.3+0.1*i],alpha=0.6)
    s7cut(tol=0);
 }
}

//s7();


//translate([50,0,0])
//s7cut();

//=====================================================================

