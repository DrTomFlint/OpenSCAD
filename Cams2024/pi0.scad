//======================================================================
// pi0.scad
//
// This is a Raspberry Pi Zero W 2
// Beware that heat sinks may be slightly misplaced, leave extra space!
//
// DrTomFlint, 19 Oct 2024
//======================================================================



//----------------------------------------------------------------------
module pi0pegs(zBase=2,zPeg=3,one=1,two=1,three=1,four=1){

r0=3.0;       // radius of pcb corners
thick=1.4;    // pcb thickness
x0=65.0;
y0=30.0;  

F2=33;
  
    // mounting pegs  
    translate([r0,r0,0]){
      if(one==1){
        translate([0.5,0.5,zBase])
        cylinder(r1=1.15,r2=1.0,h=zPeg,$fn=F2);
        translate([0.5,0.5,0])
        cylinder(r1=3.5,r2=3,h=zBase,$fn=F2);
      }
      if(two==1){
        translate([0.5,y0-2*r0-0.5,zBase])      
        cylinder(r1=1.15,r2=1.0,h=zPeg,$fn=F2);
        translate([0.5,y0-2*r0-0.5,0])      
        cylinder(r1=3.5,r2=3,h=zBase,$fn=F2);
      }
      if(three==1){
        translate([x0-2*r0-0.5,0.5,zBase])
        cylinder(r1=1.15,r2=1.0,h=zPeg,$fn=F2);
        translate([x0-2*r0-0.5,0.5,0])
        cylinder(r1=3.5,r2=3,h=zBase,$fn=F2);
      }
      if(four==1){
        translate([x0-2*r0-0.5,y0-2*r0-0.5,zBase])
        cylinder(r1=1.15,r2=1.0,h=zPeg,$fn=F2);
        translate([x0-2*r0-0.5,y0-2*r0-0.5,0])
        cylinder(r1=3.5,r2=3,h=zBase,$fn=F2);
      }
    }
}

//----------------------------------------------------------------------
module pi0(cam=10,heatsink=1){

r0=3.0;       // radius of pcb corners
thick=1.4;    // pcb thickness
x0=65.0;
y0=30.0;  

F2=33;
  
  // pcb
  translate([r0,r0,0])
  difference(){
    linear_extrude(height=thick)
    offset(r=r0,$fn=F2)
    square([x0-2*r0,y0-2*r0]);

    // mounting holes  
    translate([0.5,0.5,0])
    cylinder(r=1.3,h=4*thick,center=true,$fn=F2);
    translate([0.5,y0-2*r0-0.5,0])
    cylinder(r=1.3,h=4*thick,center=true,$fn=F2);
    translate([x0-2*r0-0.5,0.5,0])
    cylinder(r=1.3,h=4*thick,center=true,$fn=F2);
    translate([x0-2*r0-0.5,y0-2*r0-0.5,0])
    cylinder(r=1.3,h=4*thick,center=true,$fn=F2);
  }
  
  // SD card
  translate([-3,11,thick])
  cube([16,12,1.5]);
  
  // HDMI
  translate([6.5,-2,thick])
  cube([12,8.5,4]);
  
  // RP3A0-AU Processor
  translate([20,6.5,thick])
  cube([15,15,1.5]);
  
  // RF chip
  translate([38,7.5,thick])
  cube([12,12,1.8]);
  
  // USB OTG
  translate([37.5,-2,thick])
  cube([8,6,3]);
  
  // USB Power
  translate([50,-2,thick])
  cube([8,6,3]);
  
  // CSI 
  translate([61.5,6.5,thick])
  cube([4.5,17,1.4]);
  
  // Camera cable
  if(cam>0){
    // narrow section
    translate([x0,9,thick])
    cube([6.5,12,1]);    
    // wider section
    translate([x0+6.5,7,thick])
    cube([cam,16,1]);    
  }
  
  // 
  if(heatsink==1){
    // Processor heatsink
    translate([20,6.5,thick+1.5])
    cube([14.5,14.5,6]);    
    // RF heatsink
    translate([38+1,7.5-2,thick+1.8])
    cube([10,14.5,6]);    
  }
  
}

//======================================================================

translate([0,0,2])
pi0();
pi0pegs();

//======================================================================
