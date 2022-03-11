//====================================================================
// fan.scad
// 
// folding fans
//====================================================================


use <./Stealie4disk.scad>
use <./Stealie4red.scad>
use <./Stealie4blue.scad>
use <./Stealie4white.scad>

thick = 0.9;    // thickness of the blades
tall = 80;     // distance between hub and center of tip circle
stub = 8;      // distance hub to base circle

edge = 1.2;     // width of clear edge on blades
rbase = 5;      // radius of the base circle
rtip = 14;      // radius of the tip circle

Nblade=9;          // number of blades
full = 160;
delta=full/Nblade;   // angle between blades when open
doff = (180-full);

spread = 18;    // distance between blades when unfan
yfix = 15;

smag = 80;    // stealie magnification, scales on x and y
soff = 45;    // stealie offset in X

//------------------------------------------------------------------
module blade1(){

$fn = 89;

  difference(){
    hull(){
      translate([0,-stub,0])
      cylinder(r=rbase,h=thick);
      translate([0,tall,0])
      cylinder(r=rtip,h=thick);
    }

    // pivot hole
    cylinder(r=2,h=3*thick,center=true);
    
    // ribbon cuts
    translate([0,tall,0])
    cube([0.6,4.5,20]);
    translate([4,tall,0])
    cube([0.6,4.5,20]);
    translate([-4,tall,0])
    cube([0.6,4.5,20]);
  
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
      cylinder(r=rtip+edge,h=thick);
    }

    hull(){
      translate([0,-stub,-1])
      cylinder(r=rbase,h=thick+2);
      translate([0,tall,-1])
      cylinder(r=rtip,h=thick+2);
    }
  
  }
}



//------------------------------------------------------------------
module fan1(){

  for(i=[0:Nblade-1]){
    translate([0,0,i*thick])
    rotate([0,0,i*delta+doff])
    color([i/Nblade,i/Nblade,i/Nblade])
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
module unfan1edge(){

  for(i=[0:Nblade-1]){
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
module unfan1(){

  for(i=[0:Nblade-1]){
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
module S4blue(){

  intersection(){
      translate([-soff,0,-1])
      scale([smag,smag,10])
      rotate([0,0,90])
      Stealie4blue();

      translate([-soff,0,-2])
      cylinder(r=smag/2+10,h=12);
    }
    // add some color on right side
    translate([-soff+10,40,-1])
    cylinder(r=10,h=10);
}
//------------------------------------------------------------------
module S4red(){

  intersection(){
      translate([-soff,0,-1])
      scale([smag,smag,10])
      rotate([0,0,90])
      Stealie4red();

      translate([-soff,0,-2])
      cylinder(r=smag/2+10,h=12);
    }
    
    // add some color on left side
    translate([-soff+10,-40,-1])
    cylinder(r=10,h=10);
    
}
//------------------------------------------------------------------
module S4white(){

  intersection(){
      translate([-soff,0,-1])
      scale([smag,smag,10])
      rotate([0,0,90])
      Stealie4white();

      translate([-soff,0,-2])
      cylinder(r=smag/2+10,h=12);
    }
}

//------------------------------------------------------------------
module S4disk(){

  intersection(){
      translate([-soff,0,-1])
      scale([smag,smag,10])
      rotate([0,0,90])
      Stealie4disk();

      translate([-soff,0,-2])
      cylinder(r=smag/2+10,h=12);
    }
}

//------------------------------------------------------------------
module fanDisk(){

  for(i=[0:Nblade-1]){
    
    intersection(){
      translate([0,0,i*thick])
      rotate([0,0,i*delta+doff])
      color([i/Nblade,i/Nblade,i/Nblade])
      blade1();

      S4disk();
    }
  }
}
//------------------------------------------------------------------
module fanBlue(){

  for(i=[0:Nblade-1]){
    intersection(){
      translate([0,0,i*thick])
      rotate([0,0,i*delta+doff])
      color([i/Nblade,i/Nblade,i/Nblade])
      blade1();

      S4blue();
    }
  }
}
//------------------------------------------------------------------
module unfanBlue(){

  for(i=[0:Nblade-1]){
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

      S4blue();
    }
  }
}
//------------------------------------------------------------------
module fanRed(){

  for(i=[0:Nblade-1]){
    
    intersection(){
      translate([0,0,i*thick])
      rotate([0,0,i*delta+doff])
      color([i/Nblade,i/Nblade,i/Nblade])
      blade1();

      S4red();
    }
  }
}
//------------------------------------------------------------------
module unfanRed(){

  for(i=[0:Nblade-1]){
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

      S4red();
    }
  }
}
//------------------------------------------------------------------
module fanWhite(){

  for(i=[0:Nblade-1]){
    
    intersection(){
      translate([0,0,i*thick])
      rotate([0,0,i*delta+doff])
      color([i/Nblade,i/Nblade,i/Nblade])
      blade1();

      S4white();
    }
  }
}

//------------------------------------------------------------------
module unfanWhite(){

  for(i=[0:Nblade-1]){
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

      S4white();
    }
  }
}

//------------------------------------------------------------------
module fanBlack(){

  for(i=[0:Nblade-1]){
    
    difference(){
      translate([0,0,i*thick])
      rotate([0,0,i*delta+doff])
      color([i/Nblade,i/Nblade,i/Nblade])
      blade1();

      S4blue();
      S4red();
      S4white();
    }
  }
}

//------------------------------------------------------------------
module unfanBlack(){

  for(i=[0:Nblade-1]){
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

      S4blue();
      S4red();
      S4white();
    }
  }
}

//====================================================================

//fanDisk();

//fanBlue();
//fanRed();
//fanWhite();
//fanBlack();

//unfanBlue();
//unfanRed();
//unfanWhite();
unfanBlack();

//blade1();
//fan1();
//unfan1();

//blade1edge();
//fan1edge();
//unfan1edge();



//====================================================================
