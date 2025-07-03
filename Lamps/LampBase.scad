//======================================================================
// LampBase.scad
//
// Base for an LED lamp.  Should hold 4x AA or AAA batteries, a LDO6AJSA
// current controller board, and a 100k pot with on/off switch
//
// DrTomFlint 2 July 2025
//======================================================================

// for aaa
//~ Rout=10.25/2;
//~ Len=44.35;
//~ button=3.5/2;
//~ delta=1.2;

// for aa
Rout=14.0/2;
Len=50.35;
button=5.0/2;
delta=1.4;

thick=1.2;    // thickness of holder walls
Al=0.25;      // thickness of AL flashing used for end contacts

F1=299;
F2=55;

//----------------------------------------------------------------------
// a single battery
module batt(){

translate([0,0,Rout])
rotate([0,90,0]){
  cylinder(r=Rout,h=Len-delta,$fn=F2);
  translate([0,0,Len-delta])
  cylinder(r=button,h=delta,$fn=F2);
}
  
}

//----------------------------------------------------------------------
// 4 batteries setup in series
module batt4(){
  batt();
  translate([Len,2*Rout,0])
  rotate([0,0,180])
  batt();
  translate([0,4*Rout,0])
  batt();
  translate([Len,6*Rout,0])
  rotate([0,0,180])
  batt();

}

//----------------------------------------------------------------------
module hold1(tol=0.15){

  difference(){
    translate([0,-Rout-thick,-thick])
    cube([Len,2*Rout+2*thick,2*Rout+2*thick]);
    
    hull(){
      translate([0,0,Rout])
      rotate([0,90,0])
      cylinder(r=Rout+tol,h=Len+tol+2*Al,$fn=F2);
      translate([0,0,Rout+10])
      rotate([0,90,0])
      cylinder(r=Rout+tol,h=Len+tol+2*Al,$fn=F2);
    }
  }
  
}

//----------------------------------------------------------------------
module end4(tol=0.15){

  // end plate acts as spring
  difference(){
    union(){
      translate([-thick,-Rout-thick,thick])
      scale([0.6,1,1])
      rotate([-90,0,0])
      cylinder(r=2*thick,h=4*2*Rout+2*thick,$fn=F2);
      
      translate([-thick,-Rout-thick,-thick])
      cube([thick,4*2*Rout+2*thick,2*Rout+2*thick]);
    }
    // long cut
    hull(){
      translate([-thick,-Rout,thick])
      scale([0.5,1,1])
      rotate([-90,0,0])
      cylinder(r=thick,h=4*2*Rout,$fn=F2);
      translate([thick,-Rout,thick])
      scale([0.5,1,1])
      rotate([-90,0,0])
      cylinder(r=thick,h=4*2*Rout,$fn=F2);
    }
    // trim extra bit
    translate([0,-Rout-thick,thick])
    cube([thick,4*2*Rout+2*thick,2*Rout+2*thick]);
    
    
    // slots
    for(j=[0:4])
    translate([-2*thick,-Rout+0.5+j*2*Rout*0.98,Rout])
    cube([6*thick,1,2*Rout+2*thick],center=true);
  }  
}

//----------------------------------------------------------------------
module hold4(tol=0.15){

  // surround batteries 
  difference(){
    translate([0,-Rout-thick,-thick])
    cube([Len,4*2*Rout+2*thick,2*Rout+2*thick]);
    
    // cuts for the batteries
    for(i=[0:3])
    translate([0,i*2*Rout,0])
    hull(){
      translate([0,0,Rout])
      rotate([0,90,0])
      cylinder(r=Rout+tol,h=Len+tol+2*Al,$fn=F2);
      translate([0,0,Rout+10])
      rotate([0,90,0])
      cylinder(r=Rout+tol,h=Len+tol+2*Al,$fn=F2);
    }
    
    // trim a bit to free up the end plate springs
    translate([0,-Rout,thick])
    cube([thick/2,4*2*Rout,2*Rout+2*thick]);
    translate([Len-thick/2,-Rout,thick])
    cube([thick/2,4*2*Rout,2*Rout+2*thick]);
    
  }
  
  // end plates
  end4();
  translate([Len,6*Rout,0])
  rotate([0,0,180])
  end4();
  
}


//======================================================================

//~ batt();
//~ batt4();

//~ hold1();
hold4();

//~ end4();

//======================================================================
