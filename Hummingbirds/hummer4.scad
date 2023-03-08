//====================================================================
// hummer4.scad
// 
// Humming bird feeder, revision 4
// Tray style, not inverted so changes in temp and pressure don't make
// the nectar overflow.
//
// Single part base, single part lid.  Thicker than rev3 which slowly
// leaks.  Joints between lid and base made wider so bee tongue cannot
// reach through it.
//
// Ant moat is a seperate part to hang above, keeps bees who drink
// from it away from the nectar.
//
// Dr Tom Flint, 7 August 2022
//====================================================================


use <../Parts/threads.scad>


rbase=40;   // radius of the base cup
thick=2.1;    // thickness all walls
tall=12;    // total height of the base cup

rport=25;   // radius to the feeding ports
xport=16;    // x for port cut
yport=6;   // y for port cut
scroff=0;  // offset clearance for screen inserts

rpost=4;    // radius of the center post
hpost=80;   // height of center post

rring=rport+35;   // radius of the perch ring
zring=2;    // height of perch ring
ring=2;     // radius of perch

lidoff=0.4;   // offset between base and lid for fitting

rtrap=20;   // radius inside trap basin
tthick=2.1;  // trap thickness
qtrap=1.5;

rtrap2=30;   // radius inside trap basin
tthick2=2.1;  // trap thickness
qtrap2=1.5;

F=400;       // $fn for major parts

screw=1;

//--------------------------------------------------------------------

module base(){

  // main dish
  difference(){
    cylinder(r=rbase+2*thick,h=tall,$fn=F);
    translate([0,0,2*thick])
    cylinder(r1=rbase,r2=rbase,h=tall+0.1,$fn=F);
    translate([0,0,1*thick])
    cylinder(r1=rbase-thick,r2=rbase,h=thick+0.01,$fn=F);
  }
  
   // center post attachment
  translate([0,0,thick])
  cylinder(r1=rpost+4*thick,r2=rpost+3*thick,h=thick,$fn=89);
  difference(){
    translate([0,0,2*thick])
    cylinder(r=rpost+3*thick,h=tall-2*thick,$fn=89);
    translate([0,0,tall-3*thick])
    if(screw==1){
      $fn=0;
      metric_thread (diameter=rpost*2+1.5, pitch=2, length=tall+4*thick, internal=true);
    }else{
      cylinder(r=rpost,h=tall+4*thick,$fn=23);
    }
  }
    
  // center lip
  translate([0,0,tall])
  difference(){
    cylinder(r1=rpost+2*thick,r2=rpost+1.5*thick,h=3*thick,$fn=89);
    translate([0,0,-3*thick])
    if(screw==1){
      metric_thread (diameter=rpost*2+1.5, pitch=2, length=tall+4*thick, internal=true);
    }else{
      cylinder(r=rpost,h=tall+4*thick,$fn=23);
    }
  }

  // outer lip around lid
  translate([0,0,tall-0.1])
  difference(){
    cylinder(r=rbase+3*thick,h=thick+0.1,$fn=F);
    cylinder(r=rbase+2*thick,h=3*thick,center=true,$fn=F);
  }
  
  // bevel below outer lip
  translate([0,0,tall-3*thick])
  difference(){
    cylinder(r1=rbase+thick,r2=rbase+3*thick,h=3*thick,$fn=F);
    translate([0,0,thick])
    cylinder(r=rbase,h=4*thick+0.1,center=true,$fn=F);
  }
  
  // add perch ring
  translate([0,0,zring])
  rotate_extrude($fn=99){
    translate([rring,0,0])
    circle(r=ring,$fn=77);
  }

  // perch attach to inner ring
  for(i=[0:5]){
    rotate([0,0,60*i])
    translate([rbase-0.1,0,zring])
    rotate([0,90,0])
    cylinder(r=ring,h=rring-rbase,$fn=88);
  }

}

//--------------------------------------------------------------------
module lid(){
  
  translate([0,0,tall]){
    // main top plate
      difference(){
        cylinder(r=rbase+2*thick-lidoff,h=1*thick,$fn=F);
        cylinder(r=rpost+2*thick+lidoff,h=5*thick,center=true,$fn=F);
        
        // cuts for feeding ports
        for(i=[0:2]){
          rotate([0,0,120*i])
          translate([rport,0,thick])
          cube([xport,yport,thick*3],center=true);
        }
      }

    }
    translate([0,0,tall+thick])
    difference(){
      cylinder(r1=rpost+3*thick,r2=rpost+2.5*thick,h=2*thick,$fn=F);
      translate([0,0,-0.1])
      cylinder(r1=rpost+2*thick+lidoff,r2=rpost+1.5*thick+lidoff,h=2*thick+0.2,$fn=F);
    }    
    
    // direct attach the screens, not seperate parts now
    translate([0,0,tall]){
      // screens
      for(i=[0:2]){
        rotate([0,0,120*i])
        translate([rport,0,thick])
        screen();
      }
    }

}

//--------------------------------------------------------------------
module post(){

  translate([0,0,tall-2*thick])
  if(screw==1){
    $fn=0;
    metric_thread (diameter=rpost*2-0.4+1.5, pitch=2, length=tall, internal=false, leadin=3);
  }else{
    cylinder(r=rpost-0.125, h=tall, $fn=22);
  }  
  
  translate([0,0,tall+3*thick])
  difference(){
    rotate([0,0,30])
    cylinder(r=rpost+2,h=hpost,$fn=6);
    
    translate([0,0,hpost-rpost])
    rotate([0,90,0])
    cylinder(r=rpost/3,h=9*thick,center=true,$fn=89);
    
    }
}

//-----------------------------------------------------------------------
module screen(){
  
  difference(){
    // insert section
    translate([0,0,-thick/2])
    cube([xport-scroff,yport-scroff,thick*1],center=true);

    // cut for thru port
    translate([0,0,2*thick])
    cube([xport-2*thick,2.5,20],center=true);
  }
  
  difference(){
    union(){
      rotate([90,0,0])
      scale([1.5,1,1])
      cylinder(r=10,h=yport,center=true,$fn=F);

      translate([0,yport/3,0])
      scale([1.5,1,1])
      sphere(r=5,$fn=66);

      translate([0,-yport/3,0])
      scale([1.5,1,1])
      sphere(r=5,$fn=66);
    }
    
    // trim bottom off
    translate([0,0,-10])
    cube([3*xport,3*yport,thick*0+20],center=true);

    // cut for the main slot, must be <3.0 mm to keep out bees
    translate([0,0,10+thick])
    cube([40,2.5,20],center=true);

    // cut for thru port
    translate([0,0,2*thick])
    cube([xport-2*thick,2.5,20],center=true);

    // bevel for thru port
    translate([0,0,thick+0.5])
    rotate([0,45,0])
    cube([11,2.5,11],center=true);
  }
    
}

//--------------------------------------------------------------------
module trap(){

difference(){
  union(){
    scale([1,1,qtrap])
    difference(){
      // hollow basin
      sphere(r=rtrap+tthick,$fn=300);
      sphere(r=rtrap,$fn=300);
      
      // slice off top
      translate([0,0,50])
      cube([100,100,100],center=true);
    }
    
    // post
    translate([0,0,-rtrap*qtrap])
    cylinder(r1=6,r2=5,h=rtrap*qtrap,$fn=77);
  }
  // bore hole
  cylinder(r=2.2,h=80,center=true,$fn=66);
}

  // rounded lip outer
  rotate_extrude($fn=200)
  translate([22,0])
  circle(r=2,$fn=89);

  // rounded lip inner
  rotate_extrude($fn=89)
  translate([4,0])
  circle(r=2,$fn=89);

  // rounded lip base
  translate([0,0,-32.2])
  rotate_extrude($fn=89)
  translate([4,0])
  circle(r=2,$fn=89);

}

//--------------------------------------------------------------------
module trap2(){

difference(){
  union(){
    scale([1,1,qtrap2])
    difference(){
      // hollow basin
      sphere(r=rtrap2+tthick2,$fn=300);
      sphere(r=rtrap2,$fn=300);
      
      // slice off top
      translate([0,0,50])
      cube([100,100,100],center=true);
    }
    
    // post
    translate([0,0,-rtrap2*qtrap2])
    cylinder(r1=6,r2=5,h=rtrap2*qtrap2,$fn=77);

    // post fillet
    translate([0,0,-rtrap2*qtrap2+0.8])
    cylinder(r1=12,r2=5.5,h=8,$fn=77);
  }
  // bore hole
  cylinder(r=2.2,h=rtrap*qtrap*5,center=true,$fn=66);
}

  // rounded lip outer
  rotate_extrude($fn=200)
  translate([rtrap2+2,0])
  circle(r=2,$fn=89);

  // rounded lip inner
  rotate_extrude($fn=89)
  translate([4,0])
  circle(r=2,$fn=89);

  // rounded lip base
  translate([0,0,-rtrap2*qtrap2-tthick2])
  rotate_extrude($fn=89)
  translate([4,0])
  circle(r=2,$fn=89);

}


//====================================================================

if(0){
  difference(){
    union(){
      color("gray")
      base();
      translate([0,0,0.1])
      lid();
      translate([0,0,0])
      rotate([0,0,20])
      post();
      translate([0,0,tall]){
        // screens
        for(i=[0:2]){
          rotate([0,0,120*i])
          translate([rport,0,thick])
          screen();
        }
      }

    }
    translate([0,100,0])
    cube([200,200,100],center=true);
  }
}

if(0){
  difference(){
    trap2();
    
    translate([0,100,0])
    cube([200,200,100],center=true);
  }
}

//base();
//lid();
//post();


//trap();
trap2();

//====================================================================
