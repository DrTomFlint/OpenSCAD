//======================================================================
// toggleClamp.scad
//
// Toggle clamp that mounts on aluminum T-slot extrusions
//
// Dr Tom Flint, 11 July 2023
//======================================================================

use <./tslot.scad>
use <./rounder.scad>
use <./threads.scad>


draft=0;  // draft=0 for prints, draft=1 removes threads which are slow

zbase=6;
xbase=28;
ybase=24;
yaisle=9;
zwing=16;

rwing=5;
rlink=5;

rbolt1=1.55;
rbolt2=1.55;

xarm=45;
rarm=6;
rtip=3;

zlink=30;

zhandle=20;
yhandle=44;
offhandle=5;

F2=200;

// ---- select a pair of angle1, angle2 to see the clamp in different 
// positions from fully open to fully closed, does not alter print

// open
angle1=60;
angle2=40;

// mostly open
//~ angle1=45;
//~ angle2=18;

// mostly closed
//~ angle1=30;
//~ angle2=8;

// closed
//~ angle1=0;
//~ angle2=0;

// derived values, don't alter these
ax0=xbase/2-rlink;
az0=zbase+rbolt1+offhandle;
bx0=xbase/2+rwing;
bz0=zbase+zwing;
ax1=0;
az1=0;
bx1=bx0-ax0;
bz1=bz0-az0;

na0=zbase+zwing+zlink - az0;
dx0=-na0*sin(angle1)+ax0;
dz0=na0*cos(angle1)+az0;


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
      translate([-0.1*xbase,0,zbase+zwing/2+rwing])
      cube([0.4*xbase,ybase,zwing],center=true);
      // front stop
      translate([xbase/2+2,0,(zbase+zwing+rwing)/2])
      cube([4,yhandle,zbase+zwing+rwing],center=true);
    }
    
    // cut for link
    hull(){
      translate([xbase/2-rlink,0,zbase+zwing])
      rotate([90,0,0])
      cylinder(r=rlink,h=ybase+1,center=true,$fn=F2);
      translate([-xbase/4,0,zbase+zwing+rlink+3])
      rotate([90,0,0])
      cylinder(r=2,h=ybase+1,center=true,$fn=F2);
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
    cube([10.5,3.2,3],center=true);

    
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
  
  // text
  translate([0,-ybase/2,zbase-2])
  rotate([90,0,0])
  rotate([0,0,0])
  linear_extrude(height=0.2,scale=1)
  text("2023v3", font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.1);

  translate([0,ybase/2,zbase-2])
  rotate([-90,0,0])
  rotate([0,0,180])
  linear_extrude(height=0.2,scale=1)
  text("FLINT", font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.1);
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
    cube([10,3.2,3],center=true);

    translate([xbase/2-rlink,-ybase/2+1.5,zbase+zwing])
    rotate([90,0,0])
    cylinder(r=7/2,h=3.2,center=true,$fn=F2);

    // bolt holes to handle
    translate([xbase/2-rlink,0,zbase+zwing+zlink])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=ybase+2,center=true,$fn=F2);

    // center aisle
    translate([0,0,zbase+zwing/2+rwing+zlink/2-14])
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
    cube([3,3.2,10],center=true);
    translate([xbase/2-rlink,-yhandle/2+1.5,zbase+zwing+zlink])
    rotate([90,0,0])
    cylinder(r=7/2,h=3.2,center=true,$fn=F2);

    // bolt holes for base
    translate([xbase/2-rlink,0,zbase+rbolt1+offhandle])
    rotate([90,0,0])
    cylinder(r=rbolt2,h=yhandle+1,center=true,$fn=F2);
    // countersink
    translate([xbase/2-rlink,yhandle/2-1.5,zbase+rbolt1+offhandle])
    rotate([90,0,0])
    cylinder(r=7/2,h=3.2,center=true,$fn=F2);
    translate([xbase/2-rlink,yhandle/2-1.5,zbase+rbolt1+offhandle])
    cube([3,3.2,10],center=true);
    translate([xbase/2-rlink,-yhandle/2+1.5,zbase+rbolt1+offhandle])
    rotate([90,0,0])
    cylinder(r=7/2,h=3.2,center=true,$fn=F2);

    // center aisle
    translate([0,0,zbase+zwing/2+rwing+zlink/2])
    cube([40,ybase+0.5,zwing+rwing+zlink+11],center=true);
  }

}

//----------------------------------------------------------------------
module clamp1(){

    // base does not move
    base(bolt=0);
  
    // did not do the math to move the link properly
    // so it just sits in place
    #link();
  
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
      post();
    }
}

//======================================================================

// for printing select ONE of the following parts at a time
// generate STL or 3MF files individually and then add them to
// your slicer

base();
//~ link();
//~ handle();
//~ arm();
//~ post();

//----------------------------------------------------------------------
// below this line is for seeing the model only, NOT for printing
// note that the angles don't really work for animation and the link
// does not move properly

if(0){
  rotate([0,0,45])
  translate([-ax0,0,-az0])
  clamp1();
}

if(0){
  translate([-40,0,-28])
    rotate([0,0,0])
    rotate([0,90,0])
    tslot1(type=2,len=100);
}



//======================================================
