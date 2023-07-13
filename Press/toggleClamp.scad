//====================================================
// toggleClamp.scad
//
// Drill press using T-slot
//
// Dr Tom Flint, 11 July 2023
//====================================================

use <../Parts/tslot.scad>
use <../Parts/rounder.scad>
use <../Parts/threads.scad>


draft=1;

zbase=6;
xbase=28;
ybase=22;
yaisle=9;
zwing=16;

rwing=5;
//rlink=(xbase-2*rwing)/2;
rlink=5;

rbolt1=1.7;
rbolt2=1.7;

xarm=45;
rarm=6;
rtip=3;

zlink=30;

zhandle=20;
yhandle=ybase+14;
offhandle=5;

F2=200;

//~ // open
//~ angle1=60;
//~ angle2=40;

//~ // part
//~ angle1=30;
//~ angle2=8;

// more
angle1=45;
angle2=18;

//~ // closed
//~ angle1=0;
//~ angle2=0;

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
    translate([1,0,zbase/2])
    cube([xbase+2,ybase,zbase],center=true);
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
      translate([xbase/2+1,0,zbase+zwing/2+2])
      cube([2,ybase,zwing+4],center=true);
    }
    
    // cut for link
    hull(){
      translate([xbase/2-rlink,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rlink,h=ybase+1,center=true,$fn=F2);
      translate([xbase/2-2*rlink,0,zbase+zwing+rlink])
      rotate([90,0,0])
      cylinder(r=rlink,h=ybase+1,center=true,$fn=F2);
    }

    // bolt holes for handle
    translate([xbase/2-rlink,0,zbase+rbolt1+offhandle])
    rotate([90,0,0])
    cylinder(r=rbolt1,h=ybase+1,center=true,$fn=F2);

    // bolt holes for arm
    translate([-xbase/2+rwing,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=ybase+1,center=true,$fn=F2);
    translate([-xbase/2+rwing,ybase/2-1.5,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=7/2,h=3.2,center=true,$fn=F2);
    translate([-xbase/2+rwing,ybase/2-1.5,zbase+zwing])
    cube([9,3.2,3],center=true);

    
    translate([-xbase/2+rwing,-ybase/2+1.5,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=7/2,h=3.2,center=true,$fn=F2);
    
    // center aisle
    translate([0,0,20+zbase])
    cube([40,yaisle,40],center=true);

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
    union(){
      // main arm
      hull(){
        translate([-xbase/2+rwing,0,zbase+zwing])
        rotate([90,0,0])
        cylinder(r=rwing,h=yaisle-0.4,center=true,$fn=F2);

        translate([-xbase/2+rwing+xarm,0,zbase+zwing])
        cube([2,yaisle-0.4,2*rwing],center=true);
      }
      
      // threaded tip
      translate([-xbase/2+rwing+xarm,0,zbase+zwing])
      rotate([0,0,0])
      cylinder(r=8,h=rwing*2,center=true,$fn=F2);
    }
    
    // cut for threaded post
    translate([-xbase/2+rwing+xarm,0,0])
    metric_thread (diameter=9.4, pitch=1, length=zbase+zwing+rwing+2, internal=true, n_starts=1, thread_size=-1, groove=false, square=false, rectangle=0, angle=30, taper=0, leadin=2, leadfac=1.0, test=draft);
    
    // bolt holes to base
    translate([-xbase/2+rwing,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=xbase+1,center=true,$fn=F2);
    
    // bolt holes for link
    translate([xbase/2-rlink,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=xbase+1,center=true,$fn=F2);
  }


}

//-----------------------------------------------------
module post(){

  difference(){
    translate([-xbase/2+rwing+xarm,0,0]){
      metric_thread (diameter=9, pitch=1, length=zbase+zwing+rwing+2, internal=false, n_starts=1, thread_size=-1, groove=false, square=false, rectangle=0, angle=30, taper=0, leadin=0, leadfac=1.0, test=draft);
      translate([0,0,zbase+zwing+rwing+2])
      cylinder(r1=9/2,r2=9/2+3,h=2,$fn=F2);
      translate([0,0,zbase+zwing+rwing+4])
      difference(){
        cylinder(r=11,h=3,$fn=F2);
        for(i=[0:11]){
          rotate([0,0,i*360/12])
          translate([12,0,0])
          cylinder(r=2,h=9,center=true,$fn=22);
        }
      }
    }
    translate([-xbase/2+rwing+xarm,0,-5])
    cylinder(r=1.5,h=50,$fn=22);
  }
  
}                      

//-----------------------------------------------------
module armOld(){

  difference(){
    hull(){
      translate([-xbase/2+rwing,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rwing,h=yaisle-0.4,center=true,$fn=F2);

      translate([-xbase/2+rwing+xarm,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rarm,h=yaisle-0.4,center=true,$fn=F2);
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
      cylinder(r=rarm,h=yaisle-0.4,center=true,$fn=F2);

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
    
    // bolt holes to arm
    translate([xbase/2-rlink,0,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=ybase+2,center=true,$fn=F2);
    translate([xbase/2-rlink,ybase/2-1.5,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=7/2,h=3.2,center=true,$fn=F2);
    translate([xbase/2-rlink,ybase/2-1.5,zbase+zwing])
    cube([9,3.2,3],center=true);

    translate([xbase/2-rlink,-ybase/2+1.5,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=7/2,h=3.2,center=true,$fn=F2);

    // bolt holes to handle
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
      translate([xbase/2-rlink,0,zbase+rbolt1+offhandle])
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
    translate([xbase/2-rlink,yhandle/2-1.5,zbase+zwing+zlink])
    rotate([90,0,0])
    cylinder(r=7/2,h=3.2,center=true,$fn=F2);
    translate([xbase/2-rlink,yhandle/2-1.5,zbase+zwing+zlink])
    cube([9,3.2,3],center=true);
    translate([xbase/2-rlink,-yhandle/2+1.5,zbase+zwing+zlink])
    rotate([90,0,0])
    cylinder(r=7/2,h=3.2,center=true,$fn=F2);

    //~ // Test
    //~ translate([xbase/2-rlink,0,zbase+zwing+zlink])
    //~ rotate([90,0,0])
    //~ #cylinder(r=zlink,h=1,center=true,$fn=F2);

    // bolt holes for base
    translate([xbase/2-rlink,0,zbase+rbolt1+offhandle])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=yhandle+1,center=true,$fn=F2);
    // countersink
    translate([xbase/2-rlink,yhandle/2-1.5,zbase+rbolt1+offhandle])
    rotate([90,0,0])
    cylinder(r=7/2,h=3.2,center=true,$fn=F2);
    translate([xbase/2-rlink,yhandle/2-1.5,zbase+rbolt1+offhandle])
    cube([9,3.2,3],center=true);
    translate([xbase/2-rlink,-yhandle/2+1.5,zbase+rbolt1+offhandle])
    rotate([90,0,0])
    cylinder(r=7/2,h=3.2,center=true,$fn=F2);

    // center aisle
    translate([0,0,zbase+zwing/2+rwing+zlink/2-3])
    cube([40,ybase+0.5,zwing+rwing+zlink+11],center=true);
  }

}

//-----------------------------------------------------
module clamp1(){

    // base does not move
    base(bolt=1);
  
    //~ link();
  
    // handle rotates by angle1
    translate([ax0,0,az0])
    rotate([0,-angle1,0])
    translate([-ax0,0,-az0])
    handle();

    // arm rotates by angle2
    translate([-xbase/2+rwing,0,zbase+zwing])
    rotate([0,-angle2,0])
    translate([-(-xbase/2+rwing),0,-(zbase+zwing)]){
      arm();
      //post();
    }
}

//======================================================

//rotate([0,-delta0,0])
//translate([-ax0,0,-az0])
clamp1();

//translate([dx0,0,dz0])
//rotate([90,0,0])
//#cylinder(r=rbolt2,h=yhandle+1,center=true,$fn=F2);


if(0){
  translate([15,-75,-15])
    rotate([0,0,90])
    rotate([0,90,0])
    tslot1(type=2,len=150);
}


// for printing
//base();
//link();
//handle();
//arm();
//post();

//======================================================
