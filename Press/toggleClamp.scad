//====================================================
// toggleClamp.scad
//
// Drill press using T-slot
//
// Dr Tom Flint, 11 July 2023
//====================================================

use <../Parts/tslot.scad>

zbase=4;
xbase=21;
zwing=16;
rwing=6;
rlink=4.5;

rbolt1=1.7;
rbolt2=1.7;

xarm=40;
rtip=3;

zlink=20;
zhandle=20;
yhandle=21+8;


//-----------------------------------------------------
module base(bolt=0){

  // flat bottom and M6 nut
  difference(){
    //cylinder(r=15,h=zbase,$fn=33);
    translate([0,0,zbase/2])
    cube([xbase,xbase,zbase],center=true);
    cylinder(r=5.9/2,h=3*zbase,center=true,$fn=33);
  }
  if(bolt==1){
    translate([0,0,zbase])
    cylinder(r=5,h=6,$fn=22);
  }
  
  // wings
  difference(){
    union(){
      translate([0,0,zbase+zwing/2])
      cube([21,21,zwing],center=true);
      translate([-21/2+rwing,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rwing,h=21,center=true,$fn=22);
    }
    // cut for link
    translate([21/2-rlink,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rlink,h=22,center=true,$fn=22);

    // bolt holes for handle
    translate([21/2-rlink,0,zbase+rbolt1+3])
    rotate([90,0,0])
    cylinder(r=rbolt1,h=22,center=true,$fn=22);

    // bolt holes for arm
    translate([-21/2+rwing,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=22,center=true,$fn=22);
    
    // center aisle
    translate([0,0,zbase+zwing/2+rwing])
    cube([40,11,zwing+rwing],center=true);

  }

}

//-----------------------------------------------------
module arm(){

  difference(){
    hull(){
      translate([-21/2+rwing,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rwing,h=11-0.4,center=true,$fn=22);

      translate([-21/2+rwing+xarm,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rwing,h=11-0.4,center=true,$fn=22);
    }
    
    // bolt holes for arm
    translate([-21/2+rwing,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=22,center=true,$fn=22);
    
    // bolt holes for link
    translate([21/2-rlink,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=22,center=true,$fn=22);
  }

    hull(){
      translate([-21/2+rwing+xarm,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rwing,h=11-0.4,center=true,$fn=22);

      translate([-21/2+rwing+xarm+zwing/2,0,rtip])
      rotate([90,0,0])
      cylinder(r=rtip,h=11-0.4,center=true,$fn=22);
    }
}

//-----------------------------------------------------
module link(){

  difference(){
    hull(){
      // bolt holes for link
      translate([21/2-rlink,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rlink-0.2,h=22,center=true,$fn=22);

      translate([21/2-rlink,0,zbase+zwing+zlink])
      rotate([90,0,0])
      cylinder(r=rlink-0.2,h=22,center=true,$fn=22);
    }
    
    // bolt holes for link
    translate([21/2-rlink,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=24,center=true,$fn=22);

    translate([21/2-rlink,0,zbase+zwing+zlink])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=24,center=true,$fn=22);

    // center aisle
    translate([0,0,zbase+zwing/2+rwing+zlink/2])
    cube([40,11,zwing+rwing+zlink],center=true);
  }

}

//-----------------------------------------------------
module handle(){

  difference(){
    hull(){
      translate([21/2-rlink,0,zbase+rbolt1+3])
      rotate([90,0,0])
      cylinder(r=rlink-0.2,h=yhandle,center=true,$fn=22);

      translate([21/2-rlink,0,zbase+zwing+zlink+zhandle])
      rotate([90,0,0])
      cylinder(r=rlink-0.2,h=yhandle,center=true,$fn=22);
    }
    
    // bolt holes for link
    translate([21/2-rlink,0,zbase+zwing+zlink])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=yhandle+1,center=true,$fn=22);

    // bolt holes for base
    translate([21/2-rlink,0,zbase+rbolt1+3])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=yhandle+1,center=true,$fn=22);

    // center aisle
    translate([0,0,zbase+zwing/2+rwing+zlink/2])
    cube([40,21.4,zwing+rwing+zlink+10],center=true);
  }

}

//-----------------------------------------------------
module clamp1(){

  base(bolt=1);
  arm();
  link();
  handle();
}

//======================================================

clamp1();

if(1){
  translate([15,-75,-15])
    rotate([0,0,90])
    rotate([0,90,0])
    tslot1(type=2,len=150);
}

//======================================================
