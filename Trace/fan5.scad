//====================================================================
// fan5.scad
// 
// folding fans
// fan 5 makes blades and base independent.
// adds bumps to make open and closed positions have detent.
//
//====================================================================


use <../Parts/threads.scad>


layer = 0.2;          // thickness of 1 layer
thick = 12*layer;    // thickness of the hub
thin = thick/3;     // thinness of the blade

tall = 170;     // distance between hub and center of tip circle
stub = 15;      // distance hub to base circle
mid = 70;       // out to end of the hub, start of the blades

edge = 1.2;     // width of clear edge on blades
rbase = 11;      // radius of the base circle
rbasehole = 7;
rmid1=16;
//rmid2=14;

rfinger=5;

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

detent = 0.6;   // size of the detent in blade1
dplus = 0.1;    // tolerance around the detent cut vs boss


//------------------------------------------------------------------
module blade1(){

$fn = 89;

  difference(){
    union(){
      // at the pivot
      hull(){
        cylinder(r=rbase,h=thick);
        translate([0,0.35*mid,0])
        cylinder(r=0.1,h=thick);
      }
            
      // tail section
      hull(){
        translate([0,0,0])
        cylinder(r=rbasehole-2,h=thick);

        translate([0,-stub,0])
        cylinder(r=3,h=thick);
      }
      
      // detents to hold it open or closed
      // bumps on top side
      translate([0,0,thick]){
        rotate([0,0,delta/2])
        translate([0,0.7*mid,0])
        rotate([-90,0,0])
        cylinder(r=detent-dplus,h=5,$fn=6,center=true);
        rotate([0,0,-delta/2])
        translate([0,0.7*mid,0])
        rotate([-90,0,0])
        cylinder(r=detent-dplus,h=5,$fn=6,center=true);
      }
    
      // fingers center
      hull(){
        translate([0,mid-10,0])
        cylinder(r=rfinger,h=thick);

        translate([0,-stub,0])
        cylinder(r=0.1,h=thick);
      }
    
      // fingers top
      translate([0,0,0])
      rotate([0,0,delta/2-delta/7])
      hull(){
        translate([0,mid-10,0])
        cylinder(r=rfinger,h=thick);

        translate([0,-stub,0])
        cylinder(r=0.1,h=thick);
      }
    
      // fingers top
      translate([0,0,0])
      rotate([0,0,-delta/2+delta/7])
      hull(){
        translate([0,mid-10,0])
        cylinder(r=rfinger,h=thick);

        translate([0,-stub,0])
        cylinder(r=0.1,h=thick);
      }
    
    }  // end of the union
    
    
    // pivot hole
    cylinder(r=rbasehole,h=3*thick,center=true);

    // detents to hold it open or closed
    // cut on bottom side
    rotate([0,0,delta/2])
    translate([0,0.7*mid,0])
    rotate([-90,0,0])
    cylinder(r=detent+dplus,h=6,$fn=6,center=true);
    rotate([0,0,-delta/2])
    translate([0,0.7*mid,0])
    rotate([-90,0,0])
    cylinder(r=detent+dplus,h=6,$fn=6,center=true);
    
/*
    // cuts on bottom edges, prevent detent catching on edge
    rotate([0,0,delta*0.63])
    translate([0,0.7*mid,0])
    rotate([0,45,0])
    cube([2,7,2],center=true);
    rotate([0,0,-delta*0.63])
    translate([0,0.7*mid,0])
    rotate([0,45,0])
    cube([2,7,2],center=true);
*/

    // finger cuts for blade insert
    translate([0,mid-10,1/3*thick])
    cylinder(r=rfinger-1,h=2/3*thick+0.1);

  
    // finger cuts top
    translate([0,0,0])
    rotate([0,0,delta/2-delta/7])
    translate([0,mid-10,-0.1])
    cylinder(r=rfinger-1,h=2/3*thick+0.1);
  
    // finger cuts top
    translate([0,0,0])
    rotate([0,0,-delta/2+delta/7])
    translate([0,mid-10,-0.1])
    cylinder(r=rfinger-1,h=2/3*thick+0.1);

    // more cuts to make nice fingers
    translate([0,mid+4,thick/2])
    cube([40,40,thin],center=true);
  
    translate([14.5,mid-6,thin])
    cube([20,20,2/3*thick],center=true);
  
    translate([-14.5,mid-6,thin])
    cube([20,20,2/3*thick],center=true);
  
    translate([-1,mid-5,thick])
    rotate([0,0,20])
    cube([8.5,8.5,2/3*thick],center=true);
    translate([1,mid-5,thick])
    rotate([0,0,-20])
    cube([8.5,8.5,2/3*thick],center=true);
  
  
    // finger holes top
    translate([0,0,thick*2/3])
    rotate([0,0,delta/2-delta/7])
    translate([0,mid-10,0])
    cylinder(r=2,h=thick*3,center=true);
  
    // finger holes top
    translate([0,0,thick*2/3])
    rotate([0,0,-delta/2+delta/7])
    translate([0,mid-10,0])
    cylinder(r=2,h=thick*3,center=true);

    // material reduction 
    hull(){
      translate([0,mid-46,0])
      cylinder(r=1,h=thick*3,center=true);
    
      translate([0,mid-32,0])
      cylinder(r=4,h=thick*3,center=true);
    }
      
    // holes in tail stub
    translate([0,-stub,0])
    cylinder(r=1.5,h=thick*3,center=true);
      
    // side cut to make smooth waiste
    rotate([0,0,1.75*delta])
    translate([0,19.5,0])
    cylinder(r=8.15,h=thick*3,center=true);

    rotate([0,0,-1.75*delta])
    translate([0,19.5,0])
    cylinder(r=8.15,h=thick*3,center=true);
  }
}


//------------------------------------------------------------------
module blade2(){

$fn=99;

  difference(){
    // main blade does not include edge
    hull(){
      translate([-12.5+edge,mid-15.85,thin])
      cube([25-2*edge,0.1,thin]);
 
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

    // finger holes top
    translate([0,0,thick*2/3])
    rotate([0,0,delta/2-delta/7])
    translate([0,mid-10,0])
    cylinder(r1=2-0.1,r2=2-0.3,h=thin);
  
    // finger holes top
    translate([0,0,thick*2/3])
    rotate([0,0,-delta/2+delta/7])
    translate([0,mid-10,0])
    cylinder(r1=2-0.1,r2=2-0.3,h=thin);
  
    translate([0,mid-10,2/3*thick])
    cylinder(r1=rfinger-1.1,r2=rfinger-1.3,h=thin);
  
}  

//------------------------------------------------------------------
module blade2edge(){

$fn=99;

  difference(convexity=8){
    
    // shape of blade2 add edge
    hull(){
      translate([-12.5,mid-15.85,thin])
      cube([25,0.1,thin]);
 
      translate([0,tall,thick/2])
      scale([tipscale,1,1])
      cylinder(r=rtip,h=thin,center=true);
    }
          
    // shape of blade2 without edge
    hull(){
      translate([-12.5+edge,mid-15.85,thin])
      cube([25-2*edge,0.1,thick]);
 
      translate([0,tall,thick/2])
      scale([tipscale,1,1])
      cylinder(r=rtip-edge,h=thick,center=true);
    }
   
    // trim bottom off so it does not extend into the slot
    translate([-20,mid-17,0])
    cube([rmid1*2+10,edge+0.2,thick]);
       
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
    blade2edge();
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
//unfanRed(0,2);
//unfanRed(3,5);
//unfanRed(6,8);

//blade1();
//translate([0,0,thick+0.5])
//color("blue")
blade1();
//color("cyan")
//blade2();
//translate([0,0,10])
//color("red")
//blade2edge();
//rotate([0,0,-90])
//fan1();
//translate([0,0,40])
//fan1Folded();
//unfan1();


//blade1edge();
//fan1edge();

//====================================================================
