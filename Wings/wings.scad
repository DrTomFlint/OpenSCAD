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
rinner = 25.0/2;

zlever = 9;

hi = space+2*thick;
F=200;

//tall=26;    // original height of pivots
tall=26+5;      // added height for hdpe sheets

//---------------------------------------------------------
module pivota(){

  difference(){
    union(){
      cylinder(r=rbasehole-0.3,h=hi,$fn=F);
      translate([0,0,hi])
      cylinder(r1=rflange,r2=rflange+1,h=thick,$fn=F);
    }
    
    
    metric_thread (diameter=10, pitch=2, length=hi-1, internal=true);
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

//--------------------------------------------------------------
module levera(){


    difference(){
      union(){
        cylinder(r=rlever+thick,h=zlever,$fn=F);
        cylinder(r1=rlever+thick+8,r2=rlever+8,h=thick,$fn=F);
        translate([0,0,thick])
        cylinder(r1=rlever+thick+2,r2=rlever+thick,h=2,$fn=F);
      }
      translate([0,0,-1])
      cylinder(r=rlever,h=zlever+2,$fn=F);
      translate([0,0,0.5*zlever])
      rotate([90,0,0])
      cylinder(r=2,h=50,center=true,$fn=45);

        translate([0,0,0])
        cylinder(r1=rlever+1,r2=rlever,h=1,$fn=F);
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
        cylinder(r=rinner+4*thick,h=thick,$fn=F);
        translate([0,50,-thick])
        cylinder(r=rinner/2,h=thick,$fn=F);
      }
      translate([0,0,-thick])
      cylinder(r=rinner-3*thick,h=20,center=true,$fn=F);
      translate([0,50,-thick])
      cylinder(r=2.5,h=20,center=true,$fn=F);
      translate([0,37,-thick])
      cylinder(r=4,h=20,center=true,$fn=F);
      translate([0,22,-thick])
      cylinder(r=6,h=20,center=true,$fn=F);
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

//---------------------------------------------------------
module pivotc(extra=9){


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
    translate([0,0,0])
    cylinder(r1=4,r2=2,h=0.75*extra,$fn=22);
    translate([0,0,-thick])
    cube([2,8,2*thick],center=true);
  }

}

//--------------------------------------------------------------
module washer2(){

    difference(){
      cylinder(r1=rwasher,r2=rwasher+2*thick,h=3*thick,$fn=F);
      translate([0,0,-0.1])
      cylinder(r1=rflange+2*thick,r2=rflange,h=2*thick+0.1,$fn=F);
      cylinder(r=rbasehole,h=hi,$fn=F);
    }
      
}


//------------------------------------------------------------
module pivotd(){

  difference(){
    union(){
      cylinder(r=rbasehole-0.15,h=tall,$fn=F);
      translate([0,0,-2*thick])
      cylinder(r1=rflange+2*thick,r2=rflange,h=2*thick,$fn=F);
  
      
      translate([thick,0,tall])
      cylinder(r1=rbasehole,r2=rbasehole-thick,h=2*thick,$fn=F);
      translate([-thick,0,tall])
      cylinder(r1=rbasehole,r2=rbasehole-thick,h=2*thick,$fn=F);
    }
    
    // cut for compression
    translate([0,0,tall])
    cube([2*thick,20,tall],center=true);
    
    // round out compression cut for stress relief
    translate([0,0,0.5*tall])
    rotate([90,0,0])
    cylinder(r=thick,h=20,center=true,$fn=F);

    // side cut to make printable
    translate([0,10,0.5*tall])
    cube([30,10,2*tall],center=true);
    
    // divot to help install tabs
    translate([3.5,0,tall+1])
    cylinder(r=1,h=2*thick,$fn=F);

    // divot to help install tabs
    translate([-3.5,0,tall+1])
    cylinder(r=1,h=2*thick,$fn=F);

  }
}

//---------------------------------------------------------
module wedged(){

    translate([0,0,tall/2+5])
    //cube([2*thick-0.15,2*rbasehole-0.3,0.5*tall],center=true);
    linear_extrude(height=0.5*tall,scale=[1.3,1])
    square([2*thick-0.15-0.5,2*rbasehole-0.3-0.5],center=true);

    translate([0,0,tall+4])
    cube([2*thick-0.15,2*rbasehole+2*thick,2*thick],center=true);
}


//---------------------------------------------------------
module anchor(){
  
hi=24;
  
  difference(){
    union(){
      cylinder(r1=10,r2=11,h=1,$fn=44);
      translate([0,0,1])
      cylinder(r1=6,r2=4,h=2,$fn=44);
      translate([0,0,3])
      cylinder(r=4,h=hi,$fn=44);
      translate([0,0,hi+3])
      sphere(r=4,$fn=33);
    }
    translate([0,0,hi-1])
    rotate([0,90,0])
    scale([1.5,1,1])
    cylinder(r=2,h=10,center=true,$fn=22);

    translate([0,0,-1])
    cylinder(r=1,h=hi+10,$fn=22);
  }
}

//---------------------------------------------------------
module anchor2(){
  
hi=24;
  
  difference(){
    union(){
      cylinder(r1=10,r2=11,h=1,$fn=6);
      translate([0,0,1])
      cylinder(r1=6,r2=4,h=2,$fn=6);
      translate([0,0,3])
      cylinder(r=4,h=hi,$fn=6);
      translate([0,0,hi+3])
      sphere(r=4,$fn=6);
    }
    translate([0,0,hi-1])
    rotate([90,0,0])
    scale([1,3,1])
    cylinder(r=1,h=10,center=true,$fn=22);

    translate([-20,4*0.866,-1])
    cube([40,40,40]);
  }
}

//=========================================================

if(0){
  difference(){
    union(){
      translate([0,0,2*thick])
//      pivota();
      color("red")
//      pivotb();
      pivotd();
      color("cyan")
      wedged();
      washer2();
      translate([0,0,30.5])
      rotate([180,0,0])
      washer2();
      
    }
    translate([0,20,8])
    cube([40,40,80],center=true);
  }
}

//pivota();
//pivotb();
//translate([40,0,0])

//pivotc();

pivotd();
//~ washer2();
//~ wedged();

//translate([60,0,0])
//levera();

//leverb();

//~ anchor2();

//=========================================================
