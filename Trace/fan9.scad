//====================================================================
// fan9.scad  "Cats under the stars" smaller version, ditch detents
// 
// Fan redux after a long break
// Dr Tom Flint, 17 July 2023
//
//====================================================================


use <../Parts/threads.scad>
use <./fan9red.scad>
use <./fan9yellow.scad>
use <./fan9blue.scad>
use <./fan9black.scad>


layer = 0.3;          // thickness of 1 layer
thick = 5*layer;    // thickness of the hub

tall = 90;     // distance between hub and center of tip circle
stub = 10;      // distance hub to base circle
mid = 50;       // out to end of the hub, start of the blades

cut12=11;     // cut between blades 1 and 2

edge = 0.4;     // width of clear edge on blades
rbase = 8;      // radius of the base circle
rbasehole = 4;
//rmid1=16;

x2=14.5-2*edge;   // width of blade2 base, subtract edge
pega=0.25;      // offset of the 2 pegs

rfinger=3;

rtip = 9;      // radius of the tip circle
tipscale = 1.45;

Nblade=7;          // number of blades
full = 110;
folded = 5;

delta=full/Nblade;   // angle between blades when open
deltaFold=folded/Nblade;   // angle between blades when open

doff = 42.8;      // angle offset to center blades on y axis

spread = 24;    // distance between blades when unfan
yfix = 42;

smagx = 220;    // image magnification, scales on x and y
smagy = 220;    // image magnification, scales on x and y
soff = 52;    // image offset in X

ribbonx = 1.2;
ribbony = 5.5;
ribbond = 5;
ribbont = 90;    // height along blade to place ribbon 

//~ detent = 1.6;   // size of the detent in blade1
//~ dplus = 0.5;    // tolerance around the detent cut vs boss


//------------------------------------------------------------------
module blade1(){

$fn = 89;

  difference(){
       // main blade
    intersection(){
    // cut off bottom section that should be black
    translate([0,-cut12,0])
    cylinder(r=2*cut12,h=3*thick,center=true);

    union(){
      
      // at the pivot
      hull(){
        cylinder(r=rbase,h=thick);
        translate([0,0.25*mid,0])
        cylinder(r=3,h=thick);
      }
            
      // tail section
      hull(){
        translate([0,0,0])
        cylinder(r=rbasehole-1,h=thick);

        translate([0,-stub,0])
        cylinder(r=3,h=thick);
      }
            
       // main blade    
      hull(){
        translate([0,tall,0])
        scale([tipscale,1,1])
        cylinder(r=rtip-edge,h=thick);

        translate([0,-stub,0])
        cylinder(r=1.0-edge,h=thick);
      }
    
    
    }  // end of the union
  }
        
    // pivot hole
    cylinder(r=rbasehole,h=3*thick,center=true);
    
    // cut clear edge off
    blade1edge();
      
    // holes in tail stub
    translate([0,-stub,0])
    cylinder(r=1.5,h=thick*3,center=true);
      
    // side cut to make smooth waist
    rotate([0,0,2.3*delta])
    translate([0,14,0])
    cylinder(r=5,h=thick*3,center=true);

    rotate([0,0,-2.3*delta])
    translate([0,14,0])
    cylinder(r=5,h=thick*3,center=true);
    
  }


}
//------------------------------------------------------------------
module blade2(){

$fn = 89;

  difference(){
    union(){
      
     // main blade
      hull(){
        translate([0,tall,0])
        scale([tipscale,1,1])
        cylinder(r=rtip-edge,h=thick);

        translate([0,-stub,0])
        cylinder(r=1.0-edge,h=thick);
      }
        
    }  // end of the union

    
    // cut off bottom section that should be black
    cylinder(r=cut12,h=3*thick,center=true);

        
    // ribbon cuts
    translate([0,ribbont,0])     
    hull(){
      translate([0,ribbony/2,0])     
      cylinder(r=ribbonx/2,h=10,center=true);
      translate([0,-ribbony/2,0])     
      cylinder(r=ribbonx/2,h=10,center=true);
    }
    rotate([0,0,delta/4])
    translate([0,ribbont,0])     
    hull(){
      translate([0,ribbony/2,0])     
      cylinder(r=ribbonx/2,h=10,center=true);
      translate([0,-ribbony/2,0])     
      cylinder(r=ribbonx/2,h=10,center=true);
    }
    rotate([0,0,-delta/4])
    translate([0,ribbont,0])     
    hull(){
      translate([0,ribbony/2,0])     
      cylinder(r=ribbonx/2,h=10,center=true);
      translate([0,-ribbony/2,0])     
      cylinder(r=ribbonx/2,h=10,center=true);
    }
    
    // ribbon topside clearance
    //~ for(i=[-6:15]){
      //~ rotate([0,0,1.0*i])
      //~ translate([0,ribbont,0.75*thick+0.125*thick])     
      //~ cube([3,ribbony+4,0.25*thick],center=true);
    //~ }

    // ribbon bottom side clearance
    for(i=[-15:15]){
      rotate([0,0,1.0*i])
      translate([0,ribbont,layer])     
      cube([3,ribbony+4,2*layer],center=true);
    }

  }
  

}

//------------------------------------------------------------------
module blade1edge(){

$fn = 89;

  difference(){
    union(){
      
     // main blade
      hull(){
        translate([0,tall,0])
        scale([tipscale,1,1])
        cylinder(r=rtip,h=thick);

        translate([0,-stub,0])
        cylinder(r=1.0,h=thick);
      }        
    }  // end of the union
        
    // pivot hole
    cylinder(r=rbasehole,h=3*thick,center=true);

    
    // ribbon topside clearance
    //~ for(i=[-6:15]){
      //~ rotate([0,0,1.0*i])
      //~ translate([0,ribbont,0.75*thick+0.125*thick])     
      //~ cube([2,ribbony+4,0.25*thick],center=true);
    //~ }

    // ribbon bottom side clearance
    for(i=[-15:15]){
      rotate([0,0,1.0*i])
      translate([0,ribbont,layer])     
      cube([3,ribbony+4,2*layer],center=true);
    }

    // central cut
    hull(){
      translate([0,tall,0])
      scale([tipscale,1,1])
      cylinder(r=rtip-edge,h=3*thick,center=true);

      translate([0,-stub+6,0])
      cylinder(r=1.0-edge,h=3*thick,center=true);
    }        
      
    // cut off tail section
    translate([0,-20,0])     
    cube([40,60,3*thick],center=true);
    
    
  }
  

}


//------------------------------------------------------------------
module fan1(){

  for(i=[0:Nblade-1]){
    translate([0,0,i*thick])
    rotate([0,0,i*delta+doff]){
    color([i/Nblade*0.5+0.5, i/Nblade*0.5+0.5, i/Nblade*0.5+0.5])
      blade1();
    color([i/Nblade*0.5+0.5, i/Nblade*0.5+0.5, 0.5])
      blade2();
    color([i/Nblade*0.5+0.5, i/Nblade*0.5+0.5, i/Nblade*0.5+0.5])
    blade1edge();
    }
  }
}

//------------------------------------------------------------------
module fan1Folded(){

  for(i=[0:Nblade-1]){
    translate([0,0,i*thick])
    //rotate([0,0,i*deltaFold+doff])
    color([i/Nblade, i/Nblade, i/Nblade])
    blade1();
    translate([0,0,i*thick])
    //rotate([0,0,i*deltaFold+doff])
    color([i/Nblade, i/Nblade, i/Nblade])
    blade2();
    translate([0,0,i*thick])
    //rotate([0,0,i*deltaFold+doff])
    color([i/Nblade, i/Nblade, i/Nblade])
    blade1edge();
  }
}


//------------------------------------------------------------------
module fan1edge(first=0,last=Nblade-1){

  for(i=[first:last]){
    translate([0,0,i*thick])
    rotate([0,0,i*delta+doff])
    color([i/Nblade,i/Nblade,i/Nblade])
    blade1edge();
  }
}

//------------------------------------------------------------------
module unfan1edge(first=0,last=Nblade-1){

  for(i=[first:last]){
    // unform the fan
    translate([spread*i,0,-i*thick])
    rotate([0,0,180*i])
    translate([0,-yfix,0])
    rotate([0,0,-i*delta-doff])

    translate([0,0,i*thick])
    rotate([0,0,i*delta+doff])
    color([i/Nblade,i/Nblade,i/Nblade])
    blade1edge();
  }
}

//------------------------------------------------------------------
module unfan1(first=0,last=Nblade-1){

  for(i=[first:last]){
    // unform the fan
    translate([spread*i,0,-i*thick])
    rotate([0,0,180*i])
    translate([0,-yfix,0])
    rotate([0,0,-i*delta-doff])
    
    // form the fan
    translate([0,0,i*thick])
    rotate([0,0,i*delta+doff])
    color([i/Nblade,i/Nblade,i/Nblade])
    blade1();
    translate([0,0,i*thick])
    rotate([0,0,i*delta+doff])
    color([i/Nblade,i/Nblade,i/Nblade])
    blade1edge();
    translate([0,0,i*thick])
    rotate([0,0,i*delta+doff])
    color([i/Nblade,i/Nblade,i/Nblade])
    blade2();
  }
}

//------------------------------------------------------------------
module fanred(first=0,last=Nblade-1){
    
  intersection(){
      for(i=[first:last]){
        translate([0,0,i*thick])
        rotate([0,0,i*delta+doff])
        color([i/Nblade,i/Nblade,i/Nblade])
        blade2();
    }

    translate([-soff,0,-1])
    rotate([0,0,90])
    scale([smagx,smagy,40])
    fan9red();
  }
    
}

//------------------------------------------------------------------
module fanyellow(first=0,last=Nblade-1){
    
  intersection(){
      for(i=[first:last]){
        translate([0,0,i*thick])
        rotate([0,0,i*delta+doff])
        color([i/Nblade,i/Nblade,i/Nblade])
        blade2();
    }

    translate([-soff,0,-1])
    rotate([0,0,90])
    scale([smagx,smagy,40])
    fan9yellow();
  }
    
}

//------------------------------------------------------------------
module fanblue(first=0,last=Nblade-1){
    
  intersection(){
      for(i=[first:last]){
        translate([0,0,i*thick])
        rotate([0,0,i*delta+doff])
        color([i/Nblade,i/Nblade,i/Nblade])
        blade2();
    }

    translate([-soff,0,-1])
    rotate([0,0,90])
    scale([smagx,smagy,40])
    fan9blue();
  }
    
}

//------------------------------------------------------------------
module fanblack(first=0,last=Nblade-1){
    
//  difference(){
    intersection(){
    union(){
      for(i=[first:last]){
          translate([0,0,i*thick])
          rotate([0,0,i*delta+doff])
          color([i/Nblade,i/Nblade,i/Nblade])
          blade2();
      }
    }

    translate([-soff,0,-1])
    rotate([0,0,90])
    scale([smagx,smagy,40]){
      fan9black();
    }
  }
    
}

//------------------------------------------------------------------
module fanblack2(first=0,last=Nblade-1){
    
      for(i=[first:last]){
          translate([0,0,i*thick])
          rotate([0,0,i*delta+doff])
          color([i/Nblade,i/Nblade,i/Nblade])
          blade1();
      }
    
}

//------------------------------------------------------------------
module unfanred(first=0,last=Nblade-1){

  for(i=[first:last]){
    // unform the fan
    translate([spread*i,0,-i*thick])
    rotate([0,0,180*i])
    translate([0,-yfix,0])
    rotate([0,0,-i*delta-doff])
    
    intersection(){
      translate([0,0,i*thick])
      rotate([0,0,i*delta+doff])
      color([i/Nblade,i/Nblade,i/Nblade])
      blade2();

      translate([-soff,0,-1])
      rotate([0,0,90])
      scale([smagx,smagy,40])
      fan9red();
    }
  }
}

//------------------------------------------------------------------
module unfanyellow(first=0,last=Nblade-1){

  for(i=[first:last]){
    // unform the fan
    translate([spread*i,0,-i*thick])
    rotate([0,0,180*i])
    translate([0,-yfix,0])
    rotate([0,0,-i*delta-doff])
    
    intersection(){
    //difference(){
      translate([0,0,i*thick])
      rotate([0,0,i*delta+doff])
      color([i/Nblade,i/Nblade,i/Nblade])
      blade2();

      translate([-soff,0,-1])
      rotate([0,0,90])
      scale([smagx,smagy,40]){      
      fan9yellow();
      }
    }
  }
}

//------------------------------------------------------------------
module unfanblue(first=0,last=Nblade-1){

  for(i=[first:last]){
    // unform the fan
    translate([spread*i,0,-i*thick])
    rotate([0,0,180*i])
    translate([0,-yfix,0])
    rotate([0,0,-i*delta-doff])
    
    intersection(){
      translate([0,0,i*thick])
      rotate([0,0,i*delta+doff])
      color([i/Nblade,i/Nblade,i/Nblade])
      blade2();

      translate([-soff,0,-1])
      rotate([0,0,90])
      scale([smagx,smagy,40])
      fan9blue();
    }
  }
}


//------------------------------------------------------------------
module unfanblack(first=0,last=Nblade-1){

  for(i=[first:last]){
    // unform the fan
    translate([spread*i,0,-i*thick])
    rotate([0,0,180*i])
    translate([0,-yfix,0])
    rotate([0,0,-i*delta-doff])
    
    intersection(){
    //difference(){
      translate([0,0,i*thick])
      rotate([0,0,i*delta+doff])
      color([i/Nblade,i/Nblade,i/Nblade])
      blade2();

      translate([-soff,0,-1])
      rotate([0,0,90])
      scale([smagx,smagy,40]){
        fan9black();
      }
    }
  }
}

//------------------------------------------------------------------
module unfanblack2(first=0,last=Nblade-1){

  for(i=[first:last]){
    // unform the fan
    translate([spread*i,0,-i*thick])
    rotate([0,0,180*i])
    translate([0,-yfix,0])
    rotate([0,0,-i*delta-doff])
    
    translate([0,0,i*thick])
    rotate([0,0,i*delta+doff])
    color([i/Nblade,i/Nblade,i/Nblade])
    blade1();

  }
}

//---------------------------------------------------------
module pivota(){

$fn=89;
  difference(){
    translate([0,0,0.5])
    cylinder(r=rbasehole-0.3,h=10.0);

    cylinder(r=0.7,h=60,center=true);
    metric_thread (diameter=5, pitch=1, length=9.5, internal=true);
  }

  difference(){
    translate([0,0,10.5])
    cylinder(r1=rbasehole+2,r2=rbasehole+1,h=thick);
    
    translate([0,0,14.0])
    cube([3,1.4,10],center=true);
  }
}

//---------------------------------------------------------
module pivotb(){

$fn=89;

  difference(){
    metric_thread (diameter=5-0.4, pitch=1, length=5*thick, internal=false, leadin=1);
    cylinder(r=0.7,h=20,center=true);
  }
  difference(){
    translate([0,0,-thick])
    cylinder(r1=rbasehole+1,r2=rbasehole+2,h=thick);
    translate([0,0,-3])
    cube([3,1.4,10],center=true);
    //~ rotate([90,0,0])
    //~ cylinder(r=2,h=1.4,center=true);
  }

}

//====================================================================

if(0){
  difference(){
    union(){
      pivota();
      color("red")
      pivotb();
    }
    translate([10,0,8])
    cube([20,20,40],center=true);
  }
}


//fan5notblack();

pivota();
pivotb();


//    translate([-soff,0,-1])
//    rotate([0,0,90])
//    scale([smagx,smagy,40])
//    fan6notblack();

//fan1edge();
//fanred();
//fanyellow();
//fanblue();
//fanblack();
//fanblack2();
   
//unfanblack(0,6);

//unfanblack2(0,6);

//unfanred(0,6);

//unfanyellow(0,6);

//unfanblue(0,6);

//unfan1edge(0,6);


if(0){
  blade1();
  translate([0,0,5])
  blade1edge();
  translate([0,0,10])
  blade2();
}

//rotate([0,0,-90])
//translate([0,0,-10])
fan1();
//translate([0,0,40])
//fan1Folded();
//unfan1();
//translate([0,0,30])
//fan5white();

//blade1edge();
//fan1edge();

//====================================================================
