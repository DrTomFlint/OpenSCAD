//---------------------------------------------------------------------
// Makita1.scad
//
// Dock for a Makita 18v LXT battery pack
//
// @TODO figure out how to retain the 1mm copper contacts
// Is a tight fit good enough?
//
// DrTomFlint 30 Aug 2023
//---------------------------------------------------------------------

use <../Parts/rounder.scad>
use <../Parts/hexcut.scad>

F1=44;
F2=6;
thick=2.1;
z0=17;
tab=1;

// ---------------------------------------------------------
module baseCut(tol=0,side=2){

  difference(){
    union(){
      // boss
      translate([-1.5,0,z0/2])
      cube([87+tol,78+tol,z0+tol],center=true);
      // foot
      translate([-87/2-1.5-6,0,z0/2])
      cube([12+tol,78+tol,z0+tol],center=true);
      translate([-87/2-1.5-12+1.5,0,z0/2-5])
      cube([3+tol,60+tol,z0+10+tol],center=true);
      translate([-87/2-1.5-12+3,30,z0/2-11])
      rotate([90,0,0])
      rotate([0,0,-90])
      rounder(r=3+tol,h=60,f=44);
      // extra cut in center
      translate([-87/2-1.5-12+1.5,0,z0/2+10])
      cube([3+tol,78+tol,z0+tol],center=true);
      // foot holes
      translate([-55,22,-6])
      rotate([0,90,0])
      cylinder(r=1.7+0.2,h=10,center=true,$fn=F1);
      translate([-55,-22,-6])
      rotate([0,90,0])
      cylinder(r=1.7+0.2,h=10,center=true,$fn=F1);
    
    }

    // side rounders
    if(side==1){
      translate([-60,78/2+tol,-tol])
      rotate([0,90,0])
      rotate([0,0,180])
      rounder(r=5+tol,h=120,f=F1);
    }
    if(side==2){
      translate([-60,-78/2-tol,0-tol])
      rotate([0,90,0])
      rotate([0,0,90])
      rounder(r=5,h=120,f=F1);
    }
    
    // front rounders
    if(side==1){
      translate([42,78/2,4])
      rotate([0,0,180])
      rounder(r=8,h=30,f=F1);
    }
    if(side==2){
      translate([42,-78/2,4])
      rotate([0,0,90])
      rounder(r=8,h=30,f=F1);
    }
    // back air vent cut
    translate([-50,0,6/2-10])
    cube([20-tol,27-tol,6.1+20-tol],center=true);    
    
}
}
    
//---------------------------------------------------------------------
module makita1(tab=1,side=0,label="1",flip=0)
{
  difference(){
    union(){
      // boss
      translate([-1.5,0,z0/2])
      cube([87,78,z0],center=true);
      // foot
      translate([-87/2-1.5-6-1.5,0,z0/2])
      cube([12+3,78,z0],center=true);
      translate([-87/2-1.5-12+1.5-3,0,z0/2-5])
      cube([3,60,z0+10],center=true);
      translate([-87/2-1.5-12+3-3,30,z0/2-8.5])
      rotate([90,0,0])
      rotate([0,0,-90])
      rounder(r=3,h=60,f=44);
      
      // mate on sides
      translate([-1.5,78/2-2.5,z0+5])
      cube([87,5,12],center=true);
      translate([-1.5,-78/2+2.5,z0+5])
      cube([87,5,12],center=true);
      // top rail needs support
      hull(){
        translate([87/2-13.5,0,z0+5])
        cube([24,78,12],center=true);
        translate([12,0,z0+5-4.5])
        cube([5,78,3],center=true);
      }
    } // end of union

    // numbers
    if(label!="0"){
      translate([40.8,0,21.5])
        if(flip==1){
          //translate([2.4,0,0])
          rotate([180,0,0])
          rotate([0,0,90])
          rotate([90,0,0])
          linear_extrude(height=1.2,scale=1)
          text(label, font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.0);
        }else{
          rotate([0,0,90])
          rotate([90,0,0])
          linear_extrude(height=1.2,scale=1)
          text(label, font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.0);
        }
    }

    // AeroAmp Logo
    translate([9,0,15.3])
    rotate([0,0,90])
    rotate([180,0,0])
    linear_extrude(height=0.6,scale=1)
    text("AeroAmp", font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.1);
 
    // Version number
    translate([33,0,28-0.3])
    rotate([0,0,-90])
    //rotate([180,0,0])
    linear_extrude(height=0.6,scale=1)
    text("Ver 2.4", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
    translate([24,0,28-0.3])
    rotate([0,0,-90])
    //rotate([180,0,0])
    linear_extrude(height=0.6,scale=1)
    text("Oct 2023", font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.1);
    
    // foot holes
    translate([-55,22,-6])
    rotate([0,90,0])
    cylinder(r=1.7,h=10,center=true,$fn=F1);
    translate([-55,-22,-6])
    rotate([0,90,0])
    cylinder(r=1.7,h=10,center=true,$fn=F1);
    
    // top bolt holes
    translate([44,34,18])
    cube([20,20,12],center=true);
    translate([38,31,18])
    cylinder(r=1.7,h=40,center=true,$fn=F1);

    translate([44,-34,18])
    cube([20,20,12],center=true);
    translate([38,-31,18])
    rotate([0,0,0])
    cylinder(r=1.7,h=40,center=true,$fn=F1);
    
    // upper cut  
    translate([13,0,9/2+6])
    cube([80,63.7,9],center=true);
    
    // lower cut
    translate([3+15,0,6/2+0])
    cube([90,54.2,6.1],center=true);
    translate([3,0,6/2-3])
    cube([90,54.2,6.1],center=true);
    
    // back air vent cut
    translate([-50,0,6/2-10])
    cube([26,27,6.1+20],center=true);    

    // wiring pass-through
    hull(){
      translate([-55,0,6/2+16])
      cube([30,90,14.1],center=true);    
      translate([-30,0,6/2+24+9])
      cube([12,90,10.1],center=true);    
    }
    
    // front cuts
    translate([37,0,9.25-0.6])
    rotate([90,0,0])
    cylinder(r=7,h=90,center=true,$fn=F1);
    translate([44,0,8.75-0.6])
    cube([15,90,15],center=true);    
    translate([36.2,0,-0.6])
    rotate([0,25,0])
    cube([20,90,20],center=true);  
      
    // trim rails
    translate([24,0,9/2])
    cube([10,63.7,10],center=true);

    // latching cut
    hull(){
      translate([38.0,0,5/2+15])
      cube([2.5,34,5],center=true);    
      translate([38.0-8,0,-5/2+15])
      cube([2.5,34,5],center=true);    
    }
    // RECUT front air vent cut
    translate([22,0,17])
    cube([10,20,12],center=true);   
     
    translate([22.5,0,21])
    scale([1.5,1,1])
    rotate([90,0,0])
    cylinder(r=5.5,h=90,center=true,$fn=6);
    translate([22.5,37.1,21])
    scale([1.5,1,1])
    rotate([90,0,0])
    cylinder(r=6.5,h=4,center=true,$fn=6);
    translate([22.5,-37.1,21])
    scale([1.5,1,1])
    rotate([90,0,0])
    cylinder(r=6.5,h=4,center=true,$fn=6);

     // cut for blades
    blades(tol=0.2,tab=0,wires=0);
    
    // side rounders
    if(side==1){
      translate([-60,78/2,0])
      rotate([0,90,0])
      rotate([0,0,180])
      rounder(r=5,h=120,f=F1);
    }
    if(side==2){
      translate([-60,-78/2,0])
      rotate([0,90,0])
      rotate([0,0,90])
      rounder(r=5,h=120,f=F1);
    }
    
    // front rounders
    if(side==1){
      translate([42,78/2,4])
      rotate([0,0,180])
      rounder(r=8,h=30,f=F1);
    }
    if(side==2){
      translate([42,-78/2,4])
      rotate([0,0,90])
      rounder(r=8,h=30,f=F1);
    }
        
    // cut for the +/- signs
    translate([0,-29,z0-0.6])
    cylinder(r=5,h=1.2,$fn=22)  ;
    translate([0,29,z0-0.6])
    cylinder(r=5,h=1.2,$fn=22)  ;
  }

  // polarity
  translate([0.5-0,29,z0-0.6])
  rotate([0,0,90])
  linear_extrude(height=0.6,scale=1)
  text("+", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.0);
  
  translate([1.75-0,-29,z0-0.6])
  rotate([0,0,90])
  linear_extrude(height=0.6,scale=1)
  text("-", font = "Open Sans:style=Bold", size=12,halign="center",valign="center",spacing=1.0);

  difference(){
    union(){
      // blade bases
      hull(){
        translate([14,39/2,15-2.2])
        cylinder(r=2,h=2.2,$fn=F2);
        translate([-20,39/2,15-2.2])
        cylinder(r=2,h=2.2,$fn=F2);
      }
      // blade bases
      hull(){
        translate([14,-39/2,15-2.2])
        cylinder(r=2,h=2.2,$fn=F2);
        translate([-20,-39/2,15-2.2])
        cylinder(r=2,h=2.2,$fn=F2);
      }
      // blades back block
      translate([-21+3.5,0,15/2+4])
      cube([12+7,43.5,11],center=true);    
    }
    // cut for blades
    blades(tol=0.2);
  }
    
  // tabs reinforce blades
  difference(){
    union(){
      hull(){
        translate([8-11,39/2-2,z0+10])
        cube([18+22,3,1],center=true);
        translate([8-5-11,39/2-2,z0-0.5])
        cube([26+22,3,1],center=true);
      }
      hull(){
        translate([8-11,-39/2+2,z0+10])
        cube([18+22,3,1],center=true);
        translate([8-5-11,-39/2+2,z0-0.5])
        cube([26+22,3,1],center=true);
      }
      hull(){
        translate([-5,39/2-7-2,z0+10])
        cube([6,3,1],center=true);
        translate([-5-5,39/2-7-2,z0-0.5])
        cube([14,3,1],center=true);
      }
    }
  // bolt holes in tabs
  translate([3,0,z0+6])
  rotate([90,0,0])
  cylinder(r=1.7,h=60,center=true, $fn=22);   
  translate([3-20,0,z0+6])
  rotate([90,0,0])
  cylinder(r=1.7,h=60,center=true, $fn=22);   
  translate([-6,39/2-7,z0+6])
  rotate([90,0,0])
  cylinder(r=1.7,h=12,center=true, $fn=22);
  translate([-6,39/2,z0+6-1])
  rotate([90,0,0])
  cylinder(r=4,h=12,center=true, $fn=6);
  
  // RECUT front air vent cut
    translate([22,0,17])
    cube([10,20,12],center=true);    
     
    translate([22.5,0,21])
    scale([1.5,1,1])
    rotate([90,0,0])
    cylinder(r=5.5,h=90,center=true,$fn=6);
   
  }    

  // back foot
  difference(){
    translate([-87/2-1.5-12+1.5-3,0,z0/2+9-1])
    cube([3,78,z0],center=true);
    translate([-87/2-1.5-12+1.5-3,0,z0+10])
    scale([1,2.25,1])
    rotate([0,90,0])
    cylinder(r=13,h=12,center=true,$fn=F1);
  }
  
  translate([-87/2-1.5-12+3-3,78/2,z0/2+1])
  rotate([90,0,0])
  rounder(r=6,h=78,f=44);
  
  
}
//----------------------------------------------------------------------
module blades(tol=0.0,tab=1,wires=1,hi=20){

difference(){
  union(){
    //  power blades
    translate([-4.5,39/2,hi/2+6-0.1])
    cube([35+tol,1+tol,hi],center=true);    
    translate([-4.5,-39/2,hi/2+6-0.1])
    cube([35+tol,1.2+tol,hi],center=true);    
    // sense blade
    translate([-2-9,39/2-7,hi/2+6-0.1])
    cube([22+tol,1+tol,hi],center=true);    
  }

  // bolt holes in tabs
  // bolt holes in tabs
  translate([3,0,z0+6])
  rotate([90,0,0])
  cylinder(r=1.7,h=60,center=true, $fn=22);   
  translate([3-20,0,z0+6])
  rotate([90,0,0])
  cylinder(r=1.7,h=60,center=true, $fn=22);   
  translate([-6,39/2-7,z0+6])
  rotate([90,0,0])
  cylinder(r=1.7,h=12,center=true, $fn=22);

}

if(wires==1){
  translate([-18,39/2+2+2.5/2,10+16])
  rotate([0,90,0])
  cylinder(r=2.5,h=60,center=true, $fn=22);
  translate([-18,-39/2-2-2.5/2,10+16])
  rotate([0,90,0])
  cylinder(r=2.5,h=60,center=true, $fn=22);
  translate([-28,-39/2+2+2.5/2+7,10+16])
  rotate([0,90,0])
  cylinder(r=2.5,h=40,center=true, $fn=22);
}

    
}
//--------------------------------------------------------------------
module base(tol=0.8){
  difference(){

    translate([-59.1+2,78,0])
    cube([4,80*3,86],center=true);    

  
    translate([0,0,-dz])
    baseCut(side=2,tol=tol);

    translate([0,0,dz])
    rotate([180,0,0])
    baseCut(side=1,tol=tol);

    translate([0,78.1,0]){
      translate([0,0,-dz])
      baseCut(side=0,tol=tol);
      translate([0,0,dz])
      rotate([180,0,0])
      baseCut(side=0,tol=tol);
    }
    translate([0,2*78.1,0]){
      translate([0,0,-dz])
      baseCut(side=1,tol=tol);
      translate([0,0,dz])
      rotate([180,0,0])
      baseCut(side=2,tol=tol);
    }
    
    translate([-56,0,-34])
    rotate([0,0,90])
    rotate([90,0,0])
    linear_extrude(height=3,scale=1)
    text("1", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.0);

    translate([-56,0+78,-34])
    rotate([0,0,90])
    rotate([90,0,0])
    linear_extrude(height=3,scale=1)
    text("2", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.0);
    
    translate([-56,2*78,-34])
    rotate([0,0,90])
    rotate([90,0,0])
    linear_extrude(height=3,scale=1)
    text("3", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.0);
    
    translate([-56,0,-34+68])
    rotate([0,0,90])
    rotate([90,0,0])
    linear_extrude(height=3,scale=1)
    text("4", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.0);

    translate([-56,0+78,-34+68])
    rotate([0,0,90])
    rotate([90,0,0])
    linear_extrude(height=3,scale=1)
    text("5", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.0);
    
    translate([-56,2*78,-34+68])
    rotate([0,0,90])
    rotate([90,0,0])
    linear_extrude(height=3,scale=1)
    text("6", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.0);
    
    translate([-60,-30,0])
    rotate([0,90,0])
    hexcut1(R=8.25,x0=0,y0=0,h0=10,N0=14);

    translate([-62,-42,43])
    rotate([0,90,0])
    rounder(r=10,h=10,f=55);
    translate([-62,-42,-43])
    rotate([0,90,0])
    rotate([0,0,90])
    rounder(r=10,h=10,f=55);
    translate([-62,-42+80*3,-43])
    rotate([0,90,0])
    rotate([0,0,180])
    rounder(r=10,h=10,f=55);
    translate([-62,-42+80*3,43])
    rotate([0,90,0])
    rotate([0,0,-90])
    rounder(r=10,h=10,f=55);
  }
}
  

//---------------------------------------------------------------------
module support()  {
    
    hull(){
      translate([38.0,0,5/2+15])
      cube([2.5,34,5],center=true);    
      translate([38.0-8,0,-5/2+15])
      cube([2.5,34,5],center=true);    
    }
    
    // RECUT front air vent cut
    translate([22,0,17])
    cube([10,20,12],center=true);    
  
}
  
//=====================================================================

//translate([0,0,-dz])
//support();


//dz=32.5;
//dz=27.0+0.1;
dz=31.1;

showcut=0;
show1=1;
show2=0;
show6=0;
wires=0;
  
if(0){
  base();
}
//baseCut(tol=0.2);

//  makita1(side=2,label="1",flip=0);
//  makita1(side=1,label="4",flip=1);
//  makita1(side=0,label="2",flip=0);
//  makita1(side=0,label="5",flip=1);
//  makita1(side=1,label="3",flip=0);
//  makita1(side=2,label="6",flip=1);

if(showcut){
  difference(){
    union(){
      blades(wires=wires);
      makita1();
    }
    translate([0,-50,0])
    cube([200,100,100],center=true);    
  }
}

if(show1==1){
  translate([0,0,-dz])
  makita1(side=2,label="1",flip=0);
    translate([0,0,-dz])
    rotate([0,0,0])
    blades(wires=wires);
}

if(show2==1){
//  color("cyan")
  translate([0,0,dz])
  rotate([180,0,0])
  makita1(side=1,label="4",flip=1);
}

if(0){
  translate([0,0,-dz])
  blades(wires=wires);
  if(show2==1){
    color("cyan")
    translate([0,0,dz])
    rotate([180,0,0])
    blades(wires=wires);
  }
}


if(show6==1){
translate([0,78.1,0]){
  translate([0,0,-dz])
  makita1(side=0,label="2",flip=0);
  translate([0,0,-dz])
  blades(wires=wires);
//  color("cyan")
  translate([0,0,dz])
  rotate([180,0,0])
  makita1(side=0,label="5",flip=1);
  translate([0,0,dz])
  rotate([180,0,0])
  blades(tab=0,wires=wires);
}
translate([0,2*78.1,0]){
  translate([0,0,-dz])
  makita1(side=1,label="3",flip=0);
  translate([0,0,-dz])
  blades(tab=0,wires=wires);
//  color("cyan")
  translate([0,0,dz])
  rotate([180,0,0])
  makita1(side=2,label="6",flip=1);
  translate([0,0,dz])
  rotate([180,0,0])
  blades(tab=0,wires=wires);
}
  
}

//=====================================================================
