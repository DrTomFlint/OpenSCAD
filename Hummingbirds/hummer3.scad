//====================================================================
// hummer3.scad
// 
// Humming bird feeder
// Tray style, not inverted, fewer ports, smaller volume.
// Ant moat is seperate part to hang above, keeps bees who drink
// from it away from the nectar.
//
// Material reduction on the perch does not scale with parameters.
// will need to adjust it manually and check 
// Also bevels on lid don't scale right
//
// Dr Tom Flint, 17 June 2022
//====================================================================


use <../Parts/threads.scad>


rbase=40;   // radius of the base cup
thick=2.1;    // thickness all walls
tall=12;    // total height of the base cup

rport=25;   // radius to the feeding ports
xport=16;    // x for port cut
yport=6;   // y for port cut
scroff=0.4;  // offset clearance for screen inserts

rpost=4;    // radius of the center post
hpost=80;   // height of center post

rring=rport+35;   // radius of the perch ring
zring=8;    // height of perch ring
ring=2;     // radius of perch

lidoff=0.4;   // offset between base and lid for fitting

rtrap=20;   // radius inside trap basin
tthick=2.1;  // trap thickness
qtrap=1.5;

F=400;       // $fn for major parts

screw=1;

//--------------------------------------------------------------------

module base(){

  // main dish
  difference(){
    cylinder(r=rbase+thick,h=tall,$fn=F);
    translate([0,0,thick])
    cylinder(r1=rbase,r2=rbase,h=tall,$fn=F);
    
  }

  // center post attachment
  difference(){
    cylinder(r=rpost+3*thick,h=tall,$fn=89);
    translate([0,0,tall-3*thick])
    if(screw==1){
      $fn=0;
      metric_thread (diameter=rpost*2, pitch=2, length=tall+4*thick, internal=true);
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
      metric_thread (diameter=rpost*2, pitch=2, length=tall+4*thick, internal=true);
    }else{
      cylinder(r=rpost,h=tall+4*thick,$fn=23);
    }
  }
      
  // lip over perch
  translate([0,0,zring+2*thick])
  difference(){
    cylinder(r=rbase+3*thick,h=tall-zring-thick,$fn=F);
    cylinder(r=rbase+thick,h=3*tall,center=true,$fn=F);
  }
  // lip over perch
  translate([0,0,zring])
  difference(){
    cylinder(r1=rbase+thick,r2=rbase+3*thick,h=2*thick,$fn=F);
    cylinder(r=rbase+thick,h=3*tall,center=true,$fn=F);
  }
  
}

//--------------------------------------------------------------------
module perch(){
  
  // add perch ring
  translate([0,0,zring])
  rotate_extrude($fn=99){
    translate([rring,0,0])
    circle(r=ring,$fn=77);
  }
  // inner ring
  translate([0,0,zring-ring])
  difference(){
    cylinder(r=rbase+thick+3,h=2*ring,$fn=F);
    cylinder(r=rbase+thick+0.25,h=5*ring,$fn=F,center=true);
    translate([0,0,ring])
    cylinder(r1=rbase+thick+0.25,r2=rbase+thick+0.25+2*ring,h=2*ring,$fn=F);
  }
      
  // perch attach to inner ring
  for(i=[0:5]){
    rotate([0,0,60*i])
    translate([rbase+2*thick,0,zring])
    rotate([0,90,0])
    cylinder(r=ring,h=rring-rbase-2*thick,$fn=88);
  }
    
}

//--------------------------------------------------------------------
module lid(){
  
  translate([0,0,tall]){
    // main top plate
      difference(){
        cylinder(r=rbase+thick-lidoff,h=1*thick,$fn=F);
        cylinder(r=rpost+2*thick+lidoff,h=5*thick,center=true,$fn=F);
        
        // cuts for feeding ports
        for(i=[0:2]){
          rotate([0,0,120*i])
          translate([rport,0,thick])
          cube([xport,yport,thick*3],center=true);
        }
      }

    }
    

}

//--------------------------------------------------------------------
module post(){

  translate([0,0,tall-2*thick])
  if(screw==1){
    $fn=0;
    metric_thread (diameter=rpost*2-0.3, pitch=2, length=tall, internal=false, leadin=3);
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
      sphere(r=rtrap+tthick,$fn=99);
      sphere(r=rtrap,$fn=99);
      
      // slice off top
      translate([0,0,50])
      cube([100,100,100],center=true);
    }
    
    // post
    translate([0,0,-rtrap*qtrap])
    cylinder(r1=6,r2=4,h=rtrap*qtrap,$fn=77);
  }
  // bore hole
  cylinder(r=2.2,h=80,center=true,$fn=66);
}

}

//-----------------------------------------------------------------------
module screen2(){
  
rflow1=1;
rflow2=4;
aflow=80;
  
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
      // boss
      translate([0,0,3.5])
      rotate([0,aflow,0])
      cylinder(r1=rflow1,r2=rflow2,h=xport+10,center=true,$fn=F);

    }

    // cut inside boss
    translate([0,0,3.5])
    rotate([0,aflow,0])
    cylinder(r1=rflow1-1,r2=rflow2-1,h=xport+10+0.1,center=true,$fn=F);
    
    // trim bottom off
    translate([0,0,-10])
    cube([3*xport,3*yport,thick*0+20],center=true);

    // cut for the main slot, must be <3.0 mm to keep out bees
//    translate([0,0,10+thick])
//    cube([40,2.5,20],center=true);

    // cut for thru port
//    translate([0,0,2*thick])
//    cube([xport-2*thick,2.5,20],center=true);

    // bevel for thru port
//    translate([0,0,thick+0.5])
//    rotate([0,45,0])
//    cube([11,2.5,11],center=true);
  }
    
}

//====================================================================

if(0){
  difference(){
    union(){
      color("gray")
      base();
      perch();
      //translate([0,0,0.1])
      //color("cyan")
      lid();
      post();
      translate([0,0,tall]){
        // screens
        for(i=[0:2]){
          rotate([0,0,120*i])
          translate([rport,0,thick])
          screen();
          //screen2();
        }
      }

    }
    translate([0,100,0])
    cube([200,200,100],center=true);
  }
}

if(0){
  difference(){
    trap();
    
    translate([0,100,0])
    cube([200,200,100],center=true);
  }
}


//base();
//perch();
//lid();
//post();
screen();

//trap();

//====================================================================
