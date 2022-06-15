//====================================================================
// hummer1.scad
// 
// Humming bird feeder
// Tray style not inverted, fewer ports, small volume, ant moat.
//
// Material reduction on the perch does not scale with parameters.
// will need to adjust it manually and check 
// Also bevels on lid don't scale right
//
// Dr Tom Flint, 13 June 2022
//====================================================================


use <../Parts/threads.scad>


rbase=45;   // radius of the base cup
rmoat=25;   // radius of the ant moat
rdrain=2;   // radius of the moat drains
rport=37;   // radius to the feeding ports
port=0.6;  // radius of ports
pscale=5;   // scaling for ports to make ovals

rpost=4;    // radius of the center post
hpost=80;   // height of center post

rring=rport+35;   // radius of the perch ring
zring=8;    // height of perch ring
ring=2;     // radius of perch

thick=2.1;    // thickness all walls
tall=15;    // total height of the base cup

lidoff=0.4;   // offset between base and lid for fitting

F=400;       // $fn for major parts


//--------------------------------------------------------------------

module base(){

  difference(){
    union(){
      // main dish
      difference(){
        cylinder(r=rbase+thick,h=tall,$fn=F);
        translate([0,0,thick])
//        cylinder(r1=rbase-thick,r2=rbase,h=tall,$fn=F);
        cylinder(r1=rbase,r2=rbase,h=tall,$fn=F);
        
      }

      // moat
      difference(){
//        cylinder(r1=rmoat+2*thick,r2=rmoat+thick,h=tall,$fn=F);
        cylinder(r1=rmoat+thick,r2=rmoat+thick,h=tall,$fn=F);
        translate([0,0,thick])
        cylinder(r=rmoat,h=tall,$fn=F);
        
      }

      // center post attachment
      difference(){
        cylinder(r1=rpost+thick+2,r2=rpost+thick,h=tall,$fn=89);
        translate([0,0,thick])
        //cylinder(r=rpost,h=tall,$fn=23);
        metric_thread (diameter=rpost*2, pitch=2, length=tall, internal=true);

        
      }
      
      // post for drain holes in moat
      translate([2*rpost+rdrain-2,0,0])
      cylinder(r=rdrain+thick,h=0.66*tall,$fn=23);

      // lip for perch
      cylinder(r=rbase+thick+3,h=thick,$fn=F);
    }
    
    // cut for drain holes in moat
    translate([2*rpost+rdrain-2,0,0])
    cylinder(r=rdrain,h=3*tall,center=true,$fn=23);
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
  translate([0,0,thick])
  difference(){
    cylinder(r=rbase+thick+3,h=zring-thick+ring,$fn=F);
    cylinder(r=rbase+thick+0.25,h=3*zring,$fn=F,center=true);
    // material reduction
    for(i=[0:5]){
      rotate([0,0,60*i+30])
      translate([0.5*rbase,0,0])
      rotate([0,90,0])
      scale([1,3.25,1])
      cylinder(r=6,h=50,$fn=88);
    }
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
    intersection(){
      translate([0,0,-2*tall-10])
      cylinder(r1=2*rbase,r2=0.1,h=2*rbase,$fn=F);
      
      difference(){
        cylinder(r=rbase+2*thick,h=2*thick,$fn=F);
        cylinder(r=rmoat-thick,h=3*thick,center=true,$fn=F);
        // cuts for feeding ports
        for(i=[0:5]){
          rotate([0,0,60*i+30])
          translate([rport,0,0])
          scale([pscale,1,1])
          cylinder(r=port,h=6*thick,center=true,$fn=89);
        }
        // bevel inner corner
        translate([0,0,-tall-thick-5])
        cylinder(r2=2*rbase,r1=0.1,h=2*rbase,$fn=F);
      }
    }
    
    // outer lip
    translate([0,0,-tall+zring+ring])
    difference(){
      cylinder(r=rbase+2*thick,h=tall-zring-ring,$fn=F);
      cylinder(r=rbase+thick+lidoff,h=3*tall,center=true,$fn=F);      
    }

    // inner lip
    translate([0,0,-2*thick])
    difference(){
      cylinder(r=rmoat-lidoff,h=2*thick,$fn=F);
      cylinder(r=rmoat-thick,h=5*thick,center=true,$fn=F);      
    }
    
  }
}

//--------------------------------------------------------------------
module post(){

  translate([0,0,2*thick])
  metric_thread (diameter=rpost*2-0.25, pitch=2, length=tall-2*thick, internal=false, leadin=3);
  //cylinder(r=rpost-0.125, h=tall-2*thick, $fn=22);
  
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
      translate([0,0,0.1])
      color("cyan")
      lid();
      //post();
    }
    translate([0,100,0])
    cube([200,200,50],center=true);
  }
}


//base();
//perch();
lid();
//post();

//====================================================================
