//======================================================================
// DesertFursB.scad
//
//
// DrTomFlint, 5 Sept 2024
//======================================================================


use <./DesertFurs.scad>

// This set for the large embossed version:
//~ mag=30;
//~ thick=2.7;    // the text
//~ thin=0.9;     // the backside

//~ mid = 4;    // midstripe
//~ a1 = 20;
//~ a2 = 30;
//~ xx = 0;
//~ yy = -7;

// Adjust to make earrings:
mag=30;
layer = 0.24;

thick=4*layer;    // the text
thin=4*layer;     // the backside

mid = 2;    // midstripe
a1 = 10;
a2 = 30;
xx = 0;
yy = -4;

F1=200;

//----------------------------------------------------------------------
module furs(){
  
  scale([mag,mag,thick])
  DesertFurs();
  
}


//----------------------------------------------------------------------
module fursBack(){

  difference(){
    linear_extrude(height=thin)
    offset(r=0.5)
    projection(cut = false) 
    hull(){
      //~ scale([mag,mag,thin])
      //~ DesertFurs();
      translate([0,0,thin/2])
      cylinder(r=mag/2+0.5,h=thin,$fn=F1,center=true);
      
      translate([0,mag/2+2,0])
      cylinder(r=1,h=thin,$fn=44);
    }
    translate([0,0,-1])
    scale([mag,mag,thin+2])
    DesertFurs();
    
    translate([0,mag/2+1.5,-1])
    cylinder(r=0.8,h=thin+2,$fn=44);
  }
  
}

//----------------------------------------------------------------------
module fursBackBlack(){
  intersection(){
    fursBack();
    translate([0,0,-50+1*layer])
    cube([100,100,100],center=true);
  }
}
//----------------------------------------------------------------------
module fursBackSparkle(){
  difference(){
    fursBack();
    translate([0,0,-50+1*layer])
    cube([100,100,100],center=true);
  }
}

//----------------------------------------------------------------------
module furs1(){

  intersection(){
    scale([mag,mag,thick])
    DesertFurs();

    translate([xx,yy,-5-mid/2])
    rotate([0,0,a2])
    rotate([a1,0,0])
    cube([2*mag,2*mag,10],center=true);
  }
  
}
//----------------------------------------------------------------------
module furs2(){
  
  intersection(){
    scale([mag,mag,thick])
    DesertFurs();

    translate([xx,yy,0])
    rotate([0,0,a2])
    rotate([a1,0,0])
    cube([2*mag,2*mag,mid],center=true);
  }
  
}
//----------------------------------------------------------------------
module furs3(){
  
  intersection(){
    scale([mag,mag,thick])
    DesertFurs();

    translate([xx,yy,5+mid/2])
    rotate([0,0,a2])
    rotate([a1,0,0])
    cube([2*mag,2*mag,10],center=true);
  }
  
}


//======================================================================

//~ translate([0,0,2*0.9])
//~ furs();
//~ translate([50,0,0])
//~ fursBack();
//~ fursBackBlack();
//~ translate([-50,0,0])
fursBackSparkle();

//~ furs1();
//~ furs2();
//~ furs3();

//======================================================================

