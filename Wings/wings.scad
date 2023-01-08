//=========================================================
// wings.scad
//
// parts for folding wings
//
// Dr Tom Flint, 6 Jan 2023
//=========================================================

use <../Parts/threads.scad>


layer = 0.3;        // thickness of 1 layer
thick = 4*layer;    // thickness of the hub

rbasehole = 7;
rflange = 10;
rwasher = 15;
space = 11;

rlever = 30.2/2;
rinner = 24.8/2;

zlever = 9;

hi = space+2*thick;
F=200;

//---------------------------------------------------------
module pivota(){

  difference(){
    union(){
      cylinder(r=rbasehole-0.3,h=hi,$fn=F);
      translate([0,0,hi])
      cylinder(r1=rflange,r2=rflange+1,h=thick,$fn=F);
    }
    
    
    //metric_thread (diameter=10, pitch=2, length=hi-1, internal=true);
    translate([0,0,hi+thick])
    cube([2,7,10],center=true);
  }
}

//---------------------------------------------------------
module pivotb(){

$fn=89;

  difference(){
    metric_thread (diameter=9.25, pitch=2, length=hi-2, internal=false, leadin=1);
    cylinder(r=2,h=2*hi,center=true,$fn=22);
  }
  difference(){
    translate([0,0,-thick])
    cylinder(r1=rflange+1,r2=rflange,h=thick,$fn=F);
    translate([0,0,-thick])

    cube([2,4,10],center=true);
  }

}

//---------------------------------------------------------
module pivotc(extra=8){


$fn=89;
  difference(){
    union(){
      translate([0,0,extra])
      metric_thread (diameter=9.25, pitch=2, length=hi-2, internal=false, leadin=1);
      cylinder(r=rbasehole-0.3,h=extra,$fn=F);
      translate([0,0,-thick])
      cylinder(r1=rflange+1,r2=rflange,h=thick,$fn=F);
    }
    
    translate([0,0,extra])
    cylinder(r=2,h=2*hi,center=true,$fn=22);
    translate([0,0,-thick])
    cube([2,4,10],center=true);
  }

}

//--------------------------------------------------------------
module washer(){

    difference(){
      cylinder(r1=rwasher,r2=rwasher+2*thick,h=2*thick,$fn=F);
      cylinder(r1=rflange+1,r2=rflange,h=thick,$fn=F);
      cylinder(r=rbasehole,h=hi,$fn=F);
    }
      
}
//--------------------------------------------------------------
module levera(){


    difference(){
      union(){
        cylinder(r=rlever+thick,h=zlever,$fn=F);
        cylinder(r1=rlever+thick+10,r2=rlever+10,h=thick,$fn=F);
        translate([0,0,thick])
        cylinder(r1=rlever+thick+2,r2=rlever+thick,h=2,$fn=F);
      }
      translate([0,0,-1])
      cylinder(r=rlever,h=zlever+2,$fn=F);
      translate([0,0,0.5*zlever])
      rotate([90,0,0])
      cylinder(r=2,h=50,center=true,$fn=45);
    }
      
}

//--------------------------------------------------------------
module leverb(){


    difference(){
      union(){
        cylinder(r=rinner,h=zlever,$fn=F);
      }
      translate([0,0,thick])
      cylinder(r=rinner-thick,h=zlever+2,$fn=F);
      cylinder(r1=rinner-2*thick,r2=rinner-thick,h=thick,$fn=F);

      translate([0,0,zlever/2])
      rotate([90,0,0])
      cylinder(r=2,h=50,center=true,$fn=45);
    }
    difference(){
      hull(){
        translate([0,0,-thick])
        cylinder(r=rinner+2*thick,h=thick,$fn=F);
        translate([0,30,-thick])
        cylinder(r=rinner/2,h=thick,$fn=F);
      }
      translate([0,0,-thick])
      cylinder(r=rinner-3*thick,h=20,center=true,$fn=F);
      translate([0,30,-thick])
      cylinder(r=rinner/4,h=20,center=true,$fn=F);
    }
}


//=========================================================

if(1){
  difference(){
    union(){
      //pivota();
      color("red")
//      pivotb();
      pivotc();
      //color("cyan")
      //washer();
    }
    translate([20,0,8])
    cube([40,40,40],center=true);
  }
}

//pivota();
//pivotb();
//washer();

//translate([60,0,0])
//levera();

//leverb();

//=========================================================
