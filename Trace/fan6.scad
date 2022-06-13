//====================================================================
// fan6.scad
// 
// folding fans
// fan 6 makes blades and base independent.
// adds bumps to make open and closed positions have detent.
//
//====================================================================


use <../Parts/threads.scad>
use <./fan6white.scad>
use <./fan6black.scad>
use <./fan6orange.scad>
use <./fan6purple.scad>
use <./fan6notblack.scad>


layer = 0.3;          // thickness of 1 layer
thick = 6*layer;    // thickness of the hub
thin = thick/2;     // thinness of the blade

tall = 140;     // distance between hub and center of tip circle
stub = 15;      // distance hub to base circle
mid = 50;       // out to end of the hub, start of the blades

//cut12=41;     // cut between blades 1 and 2
cut12=56;     // cut between blades 1 and 2

edge = 0.8;     // width of clear edge on blades
rbase = 11;      // radius of the base circle
rbasehole = 7;
rmid1=16;

x2=14.5-2*edge;   // width of blade2 base, subtract edge
pega=0.25;      // offset of the 2 pegs

rfinger=3;

rtip = 17;      // radius of the tip circle
tipscale = 1.45;

Nblade=9;          // number of blades
full = 160;
folded = 5;

delta=full/Nblade;   // angle between blades when open
deltaFold=folded/Nblade;   // angle between blades when open

doff = (180-full)-1;
//doff = 0.866*(180-full);
//doff = full/Nblade/2;

spread = 40;    // distance between blades when unfan
yfix = 65;

smagx = 310;    // image magnification, scales on x and y
smagy = 310;    // image magnification, scales on x and y
soff = 70;    // image offset in X

ribbonx = 1.2;
ribbony = 10;
ribbond = 5;
ribbont = 48;    // height along blade to place ribbon 

detent = 1.6;   // size of the detent in blade1
dplus = 0.5;    // tolerance around the detent cut vs boss


//------------------------------------------------------------------
module blade1(){

$fn = 89;

  difference(){
       // main blade
    intersection(){
    // cut off bottom section that should be black
    cylinder(r=cut12,h=3*thick,center=true);

    union(){
      
      // at the pivot
      hull(){
        cylinder(r=rbase,h=thick);
        translate([0,0.5*mid,0])
        cylinder(r=1.2,h=thick);
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
      translate([0,0,thick-0.5]){
        rotate([0,0,delta/2])
        translate([0,0.75*mid,0])
        rotate([-90,30,0])
        cylinder(r=detent-dplus,h=5,$fn=6,center=true);
        rotate([0,0,-delta/2])
        translate([0,0.75*mid,0])
        rotate([-90,30,0])
        cylinder(r=detent-dplus,h=5,$fn=6,center=true);
      }      
        
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
    
    blade1edge();

    // detents to hold it open or closed
    // cut on bottom side
    translate([0,0,-0.6]){
      rotate([0,0,delta/2])
      translate([0,0.75*mid,0])
      rotate([-90,30,0])
      cylinder(r=detent+dplus,h=7,$fn=6,center=true);
      rotate([0,0,-delta/2])
      translate([0,0.75*mid,0])
      rotate([-90,30,0])
      cylinder(r=detent+dplus,h=7,$fn=6,center=true);
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
    
    // ribbon topside clearance
    for(i=[-15:6]){
      rotate([0,0,1.0*i])
      translate([0,ribbont,5*layer])     
      cube([2,ribbony+4,2*layer],center=true);
    }

    // ribbon bottom side clearance
    for(i=[-6:15]){
      rotate([0,0,1.0*i])
      translate([0,ribbont,layer])     
      cube([2,ribbony+4,2*layer],center=true);
    }

    // material reduction 
    hull(){
      translate([0,0.45*mid,0])
      cylinder(r=0.75,h=thick*3,center=true);
    
      translate([0,0.6*mid,0])
      cylinder(r=2.0,h=thick*3,center=true);
    }
      
    // holes in tail stub
    translate([0,-stub,0])
    cylinder(r=1.5,h=thick*3,center=true);
      
    // side cut to make smooth waist
    rotate([0,0,2.4*delta])
    translate([0,18.5,0])
    cylinder(r=7,h=thick*3,center=true);

    rotate([0,0,-2.4*delta])
    translate([0,18.5,0])
    cylinder(r=7,h=thick*3,center=true);
    
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

/*        
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
    for(i=[-15:6]){
      rotate([0,0,1.0*i])
      translate([0,ribbont,0.75*thick+0.125*thick])     
      cube([2,ribbony+4,0.25*thick],center=true);
    }

    // ribbon bottom side clearance
    for(i=[-6:15]){
      rotate([0,0,1.0*i])
      translate([0,ribbont,0.125*thick])     
      cube([2,ribbony+4,0.25*thick],center=true);
    }
*/
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
    for(i=[-15:6]){
      rotate([0,0,1.0*i])
      translate([0,ribbont,0.75*thick+0.125*thick])     
      cube([2,ribbony+4,0.25*thick],center=true);
    }

    // ribbon bottom side clearance
    for(i=[-6:15]){
      rotate([0,0,1.0*i])
      translate([0,ribbont,0.125*thick])     
      cube([2,ribbony+4,0.25*thick],center=true);
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
    translate([0,-15,0])     
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
module fan1edge(){

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
module fanwhite(first=0,last=Nblade-1){
    
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
    fan6white();
  }
    
}

//------------------------------------------------------------------
module fanorange(first=0,last=Nblade-1){
    
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
    fan6orange();
  }
    
}

//------------------------------------------------------------------
module fanpurple(first=0,last=Nblade-1){
    
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
    fan6purple();
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
    scale([smagx,smagy,40])
    fan6black();
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
module unfanwhite(first=0,last=Nblade-1){

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
      fan6white();
    }
  }
}

//------------------------------------------------------------------
module unfanpurple(first=0,last=Nblade-1){

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
      fan6purple();
      //  fan6black();
      //  fan6white();
      //  fan6orange();
      }
    }
  }
}

//------------------------------------------------------------------
module unfanorange(first=0,last=Nblade-1){

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
      fan6orange();
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
        fan6black();
        //fan6white();
        //fan6purple();
        //fan6orange();
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
    cylinder(r=rbasehole-0.3,h=21.0);

    cylinder(r=2,h=60,center=true);
    metric_thread (diameter=10, pitch=2, length=20, internal=true);
  }

  difference(){
    translate([0,0,21.0])
    cylinder(r1=rbasehole+2,r2=rbasehole+1,h=thick);
    translate([0,0,21.0])
    cylinder(r1=2,r2=3,h=thick);
    
    translate([0,0,21.0])
    rotate([90,0,0])
    cylinder(r=7,h=2,center=true);
  }
}

//---------------------------------------------------------
module pivotb(){

$fn=89;

  difference(){
    metric_thread (diameter=9.25, pitch=2, length=5*thick, internal=false, leadin=1);
    cylinder(r=2,h=20,center=true);
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


//fan5notblack();

//pivota();
//pivotb();


//    translate([-soff,0,-1])
//    rotate([0,0,90])
//    scale([smagx,smagy,40])
//    fan6notblack();

//fan1edge();
//fanwhite();
//fanblack();
//fanorange();
//fanpurple();
   
//unfanwhite(0,2);
//unfanwhite(3,5);
//unfanwhite(6,8);

//unfanblack(0,2);
//unfanblack(3,5);
//unfanblack(6,8);

//unfanblack2(0,2);
//unfanblack2(3,5);
//unfanblack2(6,8);

//unfanorange(0,2);
//unfanorange(3,5);
//unfanorange(6,8);

//unfanpurple(0,2);
//unfanpurple(3,5);
//unfanpurple(6,8);

//color("cyan")
//unfan1edge(0,2);
//unfan1edge(3,5);
unfan1edge(6,8);

//blade1();
//translate([0,0,10])
//color("blue")
//translate([0,0,5])
//blade1edge();
//color("cyan")
//translate([0,0,10])
//blade2();
//translate([0,0,10])
//color("red")
//blade2edge();
//rotate([0,0,-90])
//translate([0,0,-10])
//fan1();
//translate([0,0,40])
//fan1Folded();
//unfan1();
//translate([0,0,30])
//fan5white();

//blade1edge();
//fan1edge();

//====================================================================
