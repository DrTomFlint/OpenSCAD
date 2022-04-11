//====================================================================
// fan.scad
// 
// folding fans
//====================================================================


use <./fan2green.scad>
use <./fan2red.scad>
use <./fan2white.scad>

thick = 1.2;    // thickness of the blades
tall = 190;     // distance between hub and center of tip circle
stub = 0;      // distance hub to base circle

edge = 1.2;     // width of clear edge on blades
rbase = 8;      // radius of the base circle
rbasehole = 5;
rtip = 23;      // radius of the tip circle
tipscale = 1.3;

Nblade=9;          // number of blades
full = 160;
delta=full/Nblade;   // angle between blades when open
doff = 0.866*(180-full);
//doff = full/Nblade/2;

spread = 44;    // distance between blades when unfan
yfix = 100;

smag = 420;    // stealie magnification, scales on x and y
soff = 100;    // stealie offset in X

ribbonx = 0.80;
ribbony = 5;
ribbond = 8;
ribbont = 185;    // height along blade to place ribbon 

//------------------------------------------------------------------
module tip1(){

      translate([0,tall,0])
      scale([tipscale,1,1])
      cylinder(r=rtip,h=thick);
}
  
//------------------------------------------------------------------
module blade1(){

$fn = 89;

  difference(){
    hull(){
      translate([0,-stub,0])
      cylinder(r=rbase,h=thick);
      translate([0,tall,0])
      scale([tipscale,1,1])
      cylinder(r=rtip,h=thick);
    }

    // pivot hole
    cylinder(r=rbasehole,h=3*thick,center=true);
    
    // ribbon cuts
    translate([0,ribbont,-1])
    cube([ribbonx,ribbony,20]);
    translate([ribbond,ribbont,-1])
    cube([ribbonx,ribbony,20]);
    translate([-ribbond,ribbont,-1])
    cube([ribbonx,ribbony,20]);
  
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
    rotate([0,0,i*delta+doff])
    color([i/Nblade, i/Nblade, i/Nblade])
    blade1();
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

//====================================================================


//fanred();
//fanwhite();
//fangreen();
fanblack();

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

//blade1();
//fan1();
//unfan1();

//color("red")
//tips1();


//blade1edge();
fan1edge();
//unfan1edge(0,2);
//unfan1edge(3,5);
//unfan1edge(6,8);

//====================================================================
