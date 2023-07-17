//====================================================================
// fan.scad
// 
// folding fans
// fan 4 makes blades and base independent.
// adds bumps to make open and closed positions have detent.
//
//====================================================================


use <./fan2green.scad>
use <./fan2red.scad>
use <./fan2white.scad>
use <../Parts/threads.scad>



layer = 0.2;          // thickness of 1 layer
thick = 12*layer;    // thickness of the hub
thin = thick/3;     // thinness of the blade

tall = 170;     // distance between hub and center of tip circle
stub = 25;      // distance hub to base circle
mid = 70;       // out to end of the hub, start of the blades

edge = 1.2;     // width of clear edge on blades
rbase = 13;      // radius of the base circle
rbasehole = 7;
rmid1=16;
rmid2=14;

rtip = 26;      // radius of the tip circle
tipscale = 1.4;

Nblade=7;          // number of blades
full = 160;
folded = 5;

delta=full/Nblade;   // angle between blades when open
deltaFold=folded/Nblade;   // angle between blades when open

doff = (180-full);
//doff = 0.866*(180-full);
//doff = full/Nblade/2;

spread = 44;    // distance between blades when unfan
yfix = 100;

smag = 420;    // stealie magnification, scales on x and y
soff = 100;    // stealie offset in X

ribbonx = 1.2;
ribbony = 7;
ribbond = 5;
ribbont = 72;    // height along blade to place ribbon 
//ribbont = 170;    // height along blade to place ribbon 

detent = 1.0;   // size of the detent in blade1
dplus = 0.2;    // tolerance around the detent cut vs boss


//------------------------------------------------------------------
module blade1b(){

$fn = 89;

  difference(){
    union(){
      // at the pivot
      translate([0,0,0])
      cylinder(r=rbase,h=thick);
      
      // first section
      hull(){
        translate([0,0,0])
        cylinder(r=4,h=thick);

        translate([-rmid1,mid-20,0])
        cube([rmid1*2,2,thick]);
      }
      
      // tail section
      hull(){
        translate([0,0,0])
        cylinder(r=rbasehole,h=thick);

        translate([0,-stub,0])
        cylinder(r=4,h=thick);
      }
      
      // detents to hold it open or closed
      // bumps on top side
      translate([0,0,thick]){
        rotate([0,0,delta/2])
        translate([0,0.54*mid,0])
        rotate([-90,0,0])
        cylinder(r=detent-dplus,h=0.25*mid);
        rotate([0,0,-delta/2])
        translate([0,0.54*mid,0])
        rotate([-90,0,0])
        cylinder(r=detent-dplus,h=0.25*mid);
      }
    
      // fingers center
      hull(){
        translate([0,mid-10,0])
        cylinder(r=5.5,h=thick/3);

        translate([0,0,0])
        cylinder(r=3,h=thick/3);
      }
    
      // fingers top
      translate([0,0,thick*2/3])
      rotate([0,0,delta/2])
      hull(){
        translate([0,mid-10,0])
        cylinder(r=5.5,h=thick/3);

        translate([0,0,0])
        cylinder(r=3,h=thick/3);
      }
    
      // fingers top
      translate([0,0,thick*2/3])
      rotate([0,0,-delta/2])
      hull(){
        translate([0,mid-10,0])
        cylinder(r=5.5,h=thick/3);

        translate([0,0,0])
        cylinder(r=3,h=thick/3);
      }
    
    }  // end of the union
    
    
    // pivot hole
    cylinder(r=rbasehole,h=3*thick,center=true);

    // detents to hold it open or closed
    // cut on bottom side
        rotate([0,0,delta/2])
        translate([0,0.52*mid,0])
        rotate([-90,0,0])
        cylinder(r=detent+dplus,h=0.25*mid);
        rotate([0,0,-delta/2])
        translate([0,0.52*mid,0])
        rotate([-90,0,0])
        cylinder(r=detent+dplus,h=0.25*mid);
    
      // finger hole center
//      translate([0,mid-10,0])
//      cylinder(r=2,h=thick*3,center=true);
    
      // finger holes top
      translate([0,0,thick*2/3])
      rotate([0,0,delta/2])
      translate([0,mid-10,0])
      cylinder(r=2,h=thick*3,center=true);
    
      // finger holes top
      translate([0,0,thick*2/3])
      rotate([0,0,-delta/2])
      translate([0,mid-10,0])
      cylinder(r=2,h=thick*3,center=true);

      // material reduction 
      hull(){
        translate([0,mid-38,0])
        cylinder(r=1,h=thick*3,center=true);
      
        translate([0,mid-26,0])
        cylinder(r=3,h=thick*3,center=true);
      }
      
      // holes in tail stub
      translate([0,-stub+2,0])
      cylinder(r=1.5,h=thick*3,center=true);
      
  }
}


//------------------------------------------------------------------
module blade2(){

    hull(){
      translate([0,0.63*mid,thick/2])
      cylinder(r=0.5*rmid1,h=thin,center=true);
      translate([0,0.866*mid,thick/2])
      cylinder(r=rmid1,h=thin,center=true);
    }

    // topside bumps fit into material reduction holes
    translate([0,0.866*mid,thick-0.6])
    rotate([0,0,30])
    cylinder(r=0.35*rmid1,h=0.6,$fn=6,center=true);
      
    translate([0,0.63*mid,thick-0.6])
    rotate([0,0,30])
    cylinder(r=0.25*rmid1,h=0.6,$fn=6, center=true);
    
    hull(){
      translate([0,tall,thick/2])
      cylinder(r=rtip,h=thin,center=true);
      translate([0,0.866*mid,thick/2])
      cylinder(r=rmid1,h=thin,center=true);
    }
    
  
}  

//------------------------------------------------------------------
module blade2b(){

$fn=99;

  difference(){
    // main blade does not include edge
    hull(){
      translate([-rmid1+edge,mid-20+2,thin])
      cube([rmid1*2-2*edge,2,thin]);
 
      translate([0,tall,thick/2])
      scale([tipscale,1,1])
      cylinder(r=rtip-edge,h=thin,center=true);
    }
    
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
  }

  // finger bumps top
  translate([0,0,thin*2])
  rotate([0,0,delta/2])
  translate([0,mid-10,0])
  cylinder(r1=2-0.1,r2=2-0.3,h=thin);

  // finger bumps top
  translate([0,0,thin*2])
  rotate([0,0,-delta/2])
  translate([0,mid-10,0])
  cylinder(r1=2-0.1,r2=2-0.3,h=thin);


  
}  

//------------------------------------------------------------------
module blade2bedge(){

$fn=99;

  difference(convexity=8){
    hull(){
      translate([-rmid1,mid-20+2-edge,thin])
      cube([rmid1*2,edge,thin]);
 
      translate([0,tall,thick/2])
      scale([tipscale,1,1])
      cylinder(r=rtip,h=thin,center=true);
    }
    
    hull(){
      translate([-rmid1+edge,mid-20+2,thin-1])
      cube([rmid1*2-2*edge,2,thin+2]);
 
      translate([0,tall,thick/2-1])
      scale([tipscale,1,1])
      cylinder(r=rtip-edge,h=thin+2,center=true);
    }
   
      // trim bottom off so it does not extend into the slot
      translate([-rmid1-5,mid-19.25,thin-1])
      cube([rmid1*2+10,edge+0.2,thin+2]);
 
      
  }
    


  
}  

//------------------------------------------------------------------
module blade1edge(){

$fn = 89;

  difference(){
    hull(){
      translate([0,-stub,0])
      cylinder(r=rbase+edge,h=thick);
      translate([0,tall,0])
      scale([tipscale,1,1])
      cylinder(r=rtip+edge,h=thick);
    }

    hull(){
      translate([0,-stub,-1])
      cylinder(r=rbase,h=thick+2);
      translate([0,tall,-1])
      scale([tipscale,1,1])
      cylinder(r=rtip,h=thick+2);
    }
  
  }
}



//------------------------------------------------------------------
module fan1(){

  for(i=[0:Nblade-1]){
    translate([0,0,i*thick])
    rotate([0,0,i*delta+doff]){
    color([i/Nblade*0.5+0.5, i/Nblade*0.5+0.5, i/Nblade*0.5+0.5])
      blade1b();
    color([i/Nblade*0.5+0.5, i/Nblade*0.5+0.5, 0.5])
      blade2b();
    color([i/Nblade*0.5+0.5, i/Nblade*0.5+0.5, i/Nblade*0.5+0.5])
    blade2bedge();
    }
  }
}

//------------------------------------------------------------------
module fan1Folded(){

  for(i=[0:Nblade-1]){
    translate([0,0,i*thick])
    //rotate([0,0,i*deltaFold+doff])
    color([i/Nblade, i/Nblade, i/Nblade])
    blade1b();
  }
}

//------------------------------------------------------------------
module tips1(){

  for(i=[0:Nblade-1]){
    translate([0,0,i*thick])
    rotate([0,0,i*delta+doff])
    color([i/Nblade, i/Nblade, i/Nblade])
    tip1();
  }
}

//------------------------------------------------------------------
module fan1edge(){

  for(i=[0:Nblade-1]){
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
  }
}

//------------------------------------------------------------------
module fanwhite(){
    
  intersection(){
    for(i=[0:Nblade-1]){
        translate([0,0,i*thick])
        rotate([0,0,i*delta+doff])
        color([i/Nblade,i/Nblade,i/Nblade])
        blade1();
    }

    translate([-soff,0,-1])
    rotate([0,0,90])
    scale([smag,smag,20])
    fan2white();
  }
    
}

//------------------------------------------------------------------
module unfanWhite(first=0,last=Nblade-1){

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
      blade1();

      translate([-soff,0,-1])
      rotate([0,0,90])
      scale([smag,smag,20])
      fan2white();
    }
  }
}



//------------------------------------------------------------------
module fanred(){
    
  intersection(){
    for(i=[0:Nblade-1]){
        translate([0,0,i*thick])
        rotate([0,0,i*delta+doff])
        color([i/Nblade,i/Nblade,i/Nblade])
        blade1();
    }

    translate([-soff,0,-1])
    rotate([0,0,90])
    scale([smag,smag,20])
    fan2red();
  }
    
}
//------------------------------------------------------------------
module unfanRed(first=0,last=Nblade-1){

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
      blade1();

      translate([-soff,0,-1])
      rotate([0,0,90])
      scale([smag,smag,20])
      fan2red();
    }
  }
}


//------------------------------------------------------------------
module fangreen(){
    
  intersection(){
    for(i=[0:Nblade-1]){
        translate([0,0,i*thick])
        rotate([0,0,i*delta+doff])
        color([i/Nblade,i/Nblade,i/Nblade])
        blade1();
    }

    translate([-soff,0,-1])
    rotate([0,0,90])
    scale([smag,smag,20])
    fan2green();
  }
    
}

//------------------------------------------------------------------
module unfanGreen(first=0,last=Nblade-1){

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
      blade1();

      translate([-soff,0,-1])
      rotate([0,0,90])
      scale([smag,smag,20])
      fan2green();
    }
  }
}


//------------------------------------------------------------------
module fanblack(){

    
  difference(){
    union(){
      for(i=[0:Nblade-1]){
   
        translate([0,0,i*thick])
        rotate([0,0,i*delta+doff])
        color([i/Nblade,i/Nblade,i/Nblade])
        blade1();
      }
    }

    translate([-soff,0,-1])
    rotate([0,0,90])
    scale([smag,smag,20]){
      fan2white();
      fan2red();
      fan2green();
    }

    
  }
}

//------------------------------------------------------------------
module unfanBlack(first=0,last=Nblade-1){

  for(i=[first:last]){
    // unform the fan
    translate([spread*i,0,-i*thick])
    rotate([0,0,180*i])
    translate([0,-yfix,0])
    rotate([0,0,-i*delta-doff])
    
    
    difference(){
      translate([0,0,i*thick])
      rotate([0,0,i*delta+doff])
      color([i/Nblade,i/Nblade,i/Nblade])
      blade1();

    translate([-soff,0,-1])
    rotate([0,0,90])
    scale([smag,smag,20]){
      fan2white();
      fan2red();
      fan2green();
    }
    }
  }
}

//---------------------------------------------------------
module pivot(){

$fn=89;

  difference(){
    union(){
      cylinder(r=6.5/2,h=7.7);
      translate([0,0,7.7])
      cylinder(r1=11/2,r2=9/2,h=1.2);
      translate([0,0,-1.2])
      cylinder(r2=11/2,r1=9/2,h=1.2);
    }
    
    // main bore
    cylinder(r=1.6,h=20,center=true);
    
    // clearance for bolt head
    translate([0,0,7.7+1.2-2.9])
    cylinder(r=5.5/2,h=3);

    // clearance for nylock
    translate([0,0,-1.3])
    cylinder(r=5.5/2,h=3);
    translate([-1,-10,-1.3])
    cube([2,20,3]);

  }

}


//---------------------------------------------------------
module pivota(){

$fn=89;
  difference(){
    cylinder(r=rbasehole-0.3,h=7*thick+0.25);

    cylinder(r=2,h=20*thick,center=true);
    metric_thread (diameter=10, pitch=2, length=6*thick, internal=true);
  }

  difference(){
    translate([0,0,7*thick+0.25])
    cylinder(r1=rbasehole+2,r2=rbasehole+1,h=thick);
    translate([0,0,7*thick+0.25])
    cylinder(r1=2,r2=3,h=thick);
    
    translate([0,0,7*thick+0.25+6])
    rotate([90,0,0])
    cylinder(r=7,h=2,center=true);
  }
}

//---------------------------------------------------------
module pivotb(){

$fn=89;

  difference(){
    metric_thread (diameter=9.25, pitch=2, length=5*thick, internal=false, leadin=1);
    cylinder(r=2,h=20*thick,center=true);
  }
  difference(){
    translate([0,0,-thick])
    cylinder(r1=rbasehole+1,r2=rbasehole+2,h=thick);
    translate([0,0,-thick])
    cylinder(r1=3,r2=2,h=thick+0.1);
    translate([0,0,-7])
    rotate([90,0,0])
    cylinder(r=7,h=2,center=true);
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

//pivota();
//pivotb();

//fanred();
//fanwhite();
//fangreen();
//fanblack();

//unfanRed(0,2);
//unfanRed(3,5);
//unfanRed(6,8);

//unfanWhite(0,2);
//unfanWhite(3,5);
//unfanWhite(6,8);

//unfanGreen(0,2);
//unfanGreen(3,5);
//unfanGreen(6,8);

//unfanBlack(0,2);
//unfanBlack(3,5);
//unfanBlack(6,8);
//blade1b();
//translate([0,0,thick+0.5])
//color("blue")
//blade1b();
//color("cyan")
//blade2b();
//translate([0,0,10])
//color("red")
//blade2bedge();
//rotate([0,0,-90])
fan1();
//translate([0,0,40])
//fan1Folded();
//unfan1();

//color("red")
//tips1();


//blade1edge();
//fan1edge();
//unfan1edge(0,2);
//unfan1edge(3,5);
//unfan1edge(6,8);

//====================================================================
