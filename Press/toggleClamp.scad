//====================================================
// toggleClamp.scad
//
// Drill press using T-slot
//
// Dr Tom Flint, 11 July 2023
//====================================================

use <../Parts/tslot.scad>

zbase=6;
xbase=24;
ybase=24;
yaisle=9;
zwing=16;

rwing=6;
rlink=(xbase-2*rwing)/2;

rbolt1=1.7;
rbolt2=1.7;

xarm=40;
rtip=3;

zlink=30;

zhandle=20;
yhandle=xbase+10;
offhandle=3;

F2=30;

angle=20;
angle1=angle;
angle2=0;

ax0=xbase/2-rlink;
az0=zbase+rbolt1+offhandle;
bx0=xbase/2+rwing;
bz0=zbase+zwing;
ax1=0;
az1=0;
bx1=bx0-ax0;
bz1=bz0-az0;

na0=zbase+zwing+zlink - az0;
dx0=-na0*sin(angle)+ax0;
dz0=na0*cos(angle)+az0;


// length of ground link A-B
ng0=sqrt((ax0-bx0)*(ax0-bx0)+(az0-bz0)*(az0-bz0));
ng1=sqrt((ax1-bx1)*(ax1-bx1)+(az1-bz1)*(az1-bz1));

delta0=atan2(bz0-az0,bx0-ax0);
delta1=atan2(bz1-az1,bx1-ax1);

echo("------------------");
echo(ng0=ng0);
echo(ng1=ng1);
echo(na0=na0);
echo(delta0=delta0);
echo(delta1=delta1);
echo("------------------");


//-----------------------------------------------------
module base(bolt=0){

  // flat bottom and M6 nut
  difference(){
    //cylinder(r=15,h=zbase,$fn=33);
    translate([0,0,zbase/2])
    cube([xbase,ybase,zbase],center=true);
    cylinder(r=5.9/2,h=3*zbase,center=true,$fn=F2);
  }

  // wings
  difference(){
    union(){
      translate([0,0,zbase+zwing/2])
      cube([xbase,ybase,zwing],center=true);
      translate([-xbase/2+rwing,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rwing,h=ybase,center=true,$fn=F2);
    }
    
    // cut for link
    translate([xbase/2-rlink,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rlink,h=ybase+1,center=true,$fn=F2);

    // bolt holes for handle
    translate([xbase/2-rlink,0,zbase+rbolt1+offhandle])
    rotate([90,0,0])
    cylinder(r=rbolt1,h=ybase+1,center=true,$fn=F2);

    // bolt holes for arm
    translate([-xbase/2+rwing,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=ybase+1,center=true,$fn=F2);
    
    // center aisle
    translate([0,0,20+zbase])
    cube([40,yaisle,40],center=true);

    // trim link pocket
    translate([xbase/2-rlink+5,0,zbase+zwing+1.5])
    cube([10,ybase+1,10],center=true);

  }

  // M4 bolts to T-slot
  if(bolt==1){
    translate([0,0,zbase])
    cylinder(r=8.75/2,h=0.8,$fn=F2);
    translate([0,0,zbase+0.8])
    cylinder(r=6.88/2,h=4.0,$fn=F2);
  }
  
}

//-----------------------------------------------------
module arm(){

  difference(){
    hull(){
      translate([-xbase/2+rwing,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rwing,h=yaisle-0.4,center=true,$fn=F2);

      translate([-xbase/2+rwing+xarm,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rwing,h=yaisle-0.4,center=true,$fn=F2);
    }
    
    // bolt holes to base
    translate([-xbase/2+rwing,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=xbase+1,center=true,$fn=F2);
    
    // bolt holes for link
    translate([xbase/2-rlink,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=xbase+1,center=true,$fn=F2);
  }

    hull(){
      translate([-xbase/2+rwing+xarm,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rwing,h=yaisle-0.4,center=true,$fn=F2);

      translate([-xbase/2+rwing+xarm+zwing/2,0,rtip])
      rotate([90,0,0])
      cylinder(r=rtip,h=yaisle-0.4,center=true,$fn=F2);
    }
}

//-----------------------------------------------------
module link(){

  difference(){
    hull(){
      // boss
      translate([xbase/2-rlink,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rlink-0.2,h=ybase,center=true,$fn=F2);

      translate([xbase/2-rlink,0,zbase+zwing+zlink])
      rotate([90,0,0])
      cylinder(r=rlink-0.2,h=ybase,center=true,$fn=F2);
    }
    
    // bolt holes for link
    translate([xbase/2-rlink,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=ybase+2,center=true,$fn=F2);

    translate([xbase/2-rlink,0,zbase+zwing+zlink])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=ybase+2,center=true,$fn=F2);

    // center aisle
    translate([0,0,zbase+zwing/2+rwing+zlink/2])
    cube([40,yaisle,zwing+rwing+zlink],center=true);
  }

}

//-----------------------------------------------------
module handle(){

  difference(){
    hull(){
      translate([xbase/2-rlink,0,zbase+rbolt1+3])
      rotate([90,0,0])
      cylinder(r=rlink-0.2,h=yhandle,center=true,$fn=F2);

      translate([xbase/2-rlink,0,zbase+zwing+zlink+zhandle])
      rotate([90,0,0])
      cylinder(r=rlink-0.2,h=yhandle,center=true,$fn=F2);
    }
    
    // bolt holes for link
    translate([xbase/2-rlink,0,zbase+zwing+zlink])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=yhandle+1,center=true,$fn=F2);

    // bolt holes for base
    translate([xbase/2-rlink,0,zbase+rbolt1+3])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=yhandle+1,center=true,$fn=F2);

    // center aisle
    translate([0,0,zbase+zwing/2+rwing+zlink/2])
    cube([40,ybase+0.5,zwing+rwing+zlink+10],center=true);
  }

}

//-----------------------------------------------------
module clamp1(angle=0){

    // base does not move
    base(bolt=1);
  
    link();
  
    // handle rotates by angle1
    translate([ax0,0,az0])
    rotate([0,-angle1,0])
    translate([-ax0,0,-az0])
    handle();

    // arm rotates by angle2
    translate([-xbase/2+rwing,0,zbase+zwing])
    rotate([0,-angle2,0])
    translate([-(-xbase/2+rwing),0,-(zbase+zwing)])
    arm();
  
}

//======================================================

//rotate([0,-delta0,0])
//translate([-ax0,0,-az0])
clamp1(angle=angle);

translate([dx0,0,dz0])
rotate([90,0,0])
#cylinder(r=rbolt2,h=yhandle+1,center=true,$fn=F2);


if(0){
  translate([15,-75,-15])
    rotate([0,0,90])
    rotate([0,90,0])
    tslot1(type=2,len=150);
}

//======================================================
