//====================================================================
// hummer1.scad
// 
// Humming bird feeder
// Tray style not inverted, fewer ports, small volume, ant moat.
//
// Dr Tom Flint, 13 June 2022
//====================================================================


use <../Parts/threads.scad>

/*
rbase=56;   // radius of the base cup
rmoat=24;   // radius of the ant moat
rdrain=2;   // radius of the moat drains
rport=42;   // radius of the feeding ports
port=0.75;  // radius of ports
pscale=5;    // scaling for ports to make ovals

rpost=4;    // radius of the center post
hpost=70;   // height of center post

rring=75;   // radius of the perch ring
zring=6;    // height of perch ring
ring=2;     // radius of perch

thick=1.2;    // thickness all walls
tall=15;    // total height of the base cup

lidoff=0.2;   // offset between base and lid for fitting
*/

// Try a smaller radius overall

rbase=40;   // radius of the base cup
rmoat=20;   // radius of the ant moat
rdrain=2;   // radius of the moat drains
rport=30;   // radius of the feeding ports
port=0.75;  // radius of ports
pscale=5;    // scaling for ports to make ovals

rpost=4;    // radius of the center post
hpost=70;   // height of center post

rring=rport+35;   // radius of the perch ring
zring=6;    // height of perch ring
ring=2;     // radius of perch

thick=1.2;    // thickness all walls
tall=15;    // total height of the base cup

lidoff=0.2;   // offset between base and lid for fitting



//--------------------------------------------------------------------

module base(){

  difference(){
    union(){
      // main dish
      difference(){
        cylinder(r=rbase+thick,h=tall,$fn=89);
        translate([0,0,thick])
        cylinder(r1=rbase-thick,r2=rbase,h=tall,$fn=89);
        
      }

      // moat
      difference(){
        cylinder(r1=rmoat+2*thick,r2=rmoat+thick,h=tall,$fn=89);
        translate([0,0,thick])
        cylinder(r=rmoat,h=tall,$fn=89);
        
      }

      // center post attachment
      difference(){
        cylinder(r1=rpost+thick+2,r2=rpost+thick,h=tall,$fn=89);
        translate([0,0,thick])
        //cylinder(r=rpost,h=tall,$fn=89);
        metric_thread (diameter=rpost*2, pitch=2, length=tall, internal=true);

        
      }
      
      // posts for drain holes in moat
      for(i=[0:2]){
        rotate([0,0,120*i])
        translate([rmoat-2*thick,0,0])
        cylinder(r=rdrain+thick,h=0.75*tall,$fn=89);
      }
    }
    
    // cuts for drain holes in moat
    for(i=[0:2]){
      rotate([0,0,120*i])
      translate([rmoat-2*thick,0,0])
      cylinder(r=rdrain,h=3*tall,center=true,$fn=89);
    }
  }
  
  // perch attach to base
  for(i=[0:5]){
    rotate([0,0,60*i])
    translate([rbase,0,zring])
    rotate([0,90,0])
    difference(){
      cylinder(r1=3.0*ring,r2=2*ring,h=3*thick,$fn=88);
      hull(){
        cylinder(r=ring,h=rring-rbase,$fn=88);
        translate([-6,0,0])
        cylinder(r=ring,h=rring-rbase,$fn=88);
      }
    }
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
  // perch attach to base
  for(i=[0:5]){
    rotate([0,0,60*i])
    translate([rbase,0,zring])
    rotate([0,90,0])
    cylinder(r=ring,h=rring-rbase,$fn=88);
  }
    
}

//--------------------------------------------------------------------
module lid(){
  
  translate([0,0,tall]){
    // main top plate
    difference(){
      cylinder(r=rbase+2*thick,h=thick,$fn=89);
      cylinder(r=rmoat-thick,h=3*thick,center=true,$fn=89);
      // cuts for feeding ports
      for(i=[0:5]){
        rotate([0,0,60*i+30])
        translate([rport,0,0])
        scale([pscale,1,1])
        cylinder(r=port,h=3*thick,center=true,$fn=89);
      }
      
    }
    
    // outer lip
    translate([0,0,-2*thick])
    difference(){
      cylinder(r=rbase+2*thick,h=2*thick,$fn=89);
      cylinder(r=rbase+thick+lidoff,h=5*thick,center=true,$fn=89);      
    }

    // inner lip
    translate([0,0,-2*thick])
    difference(){
      cylinder(r=rmoat-lidoff,h=2*thick,$fn=89);
      cylinder(r=rmoat-thick,h=5*thick,center=true,$fn=89);      
    }
    
  }
}

//--------------------------------------------------------------------
module post(){

  translate([0,0,2*thick])
  metric_thread (diameter=rpost*2-0.25, pitch=2, length=tall-2*thick, internal=false, leadin=3);
  
  translate([0,0,thick+tall-2*thick])
  difference(){
    rotate([0,0,30])
    cylinder(r=rpost+1,h=hpost,$fn=6);
    
    translate([0,0,hpost-rpost])
    rotate([0,90,0])
    cylinder(r=rpost/3,h=9*thick,center=true,$fn=89);
    
    }
}

//====================================================================

if(0){
  difference(){
    union(){
      color("gray")
      base();
      perch();
      //translate([0,0,1])
      lid();
      post();
    }
    translate([100,0,0])
    cube([200,200,50],center=true);
  }
}


//base();
//perch();
//lid();
post();

//====================================================================
