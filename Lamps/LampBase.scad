//======================================================================
// LampBase.scad
//
// Base for an LED lamp.  Should hold 4x AA or AAA batteries, a LDO6AJSA
// current controller board, and a 100k pot with on/off switch
//
// DrTomFlint 2 July 2025
//======================================================================

// for aaa
aaa=1;
Rout=10.25/2;
Len=44.35;
button=3.5/2;
delta=1.2;

// for aa
//~ aaa=0;
//~ Rout=14.0/2;
//~ Len=50.35;
//~ button=5.0/2;
//~ delta=1.4;

thick=1.2;    // thickness of holder walls
Al=0.25;      // thickness of AL flashing used for end contacts

F1=299;
F2=55;

Version="B";

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
      translate([-thick/2,-Rout+thick,thick])
      scale([0.6,1,1])
      rotate([-90,0,0])
      cylinder(r=2*thick,h=4*2*Rout-2*thick,$fn=F2);
      
      //~ translate([-thick,-Rout-thick,-thick])
      //~ #cube([thick,4*2*Rout+2*thick,2*Rout+2*thick]);

      translate([-thick*0.5,-Rout+thick,-thick])
      cube([thick,4*2*Rout-2*thick,thick]);
      
      translate([-thick*0.5,-Rout+thick,-thick])
      rotate([0,-7,0])
      cube([thick,4*2*Rout-2*thick,Rout+thick]);
      
      if(aaa==0){
        translate([-1.4*thick,-Rout+thick,Rout-0.1])
        rotate([0,7,0])
        cube([thick,4*2*Rout-2*thick,Rout+thick]);
      }else{
        translate([-1.1*thick,-Rout+thick,Rout-0.1])
        rotate([0,7,0])
        cube([thick,4*2*Rout-2*thick,Rout+thick]);
      }
    }
    // long cut
    hull(){
      translate([-0.3*thick,-Rout,thick])
      rotate([0,15,0])
      scale([0.5,1,1])
      rotate([-90,0,0])
      cylinder(r=thick,h=4*2*Rout,$fn=F2);
      translate([thick,-Rout,thick])
      scale([0.5,1,1])
      rotate([-90,0,0])
      cylinder(r=thick,h=4*2*Rout,$fn=F2);
    }
    // trim extra bit
    translate([-thick*0.3,-Rout-thick,thick])
    rotate([0,5,0])
    cube([thick,4*2*Rout+2*thick,4*thick]);
    
    
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
    cube([Len,4*2*Rout+2*thick+2*tol,2*Rout+2*thick]);
    
    // cuts for the batteries
    for(i=[0:3])
    translate([0,i*2*Rout+tol,0])
    hull(){
      translate([0,0,Rout])
      rotate([0,90,0])
      cylinder(r=Rout+2*tol,h=Len+tol+2*Al,$fn=F2);
      translate([0,0,Rout+10])
      rotate([0,90,0])
      cylinder(r=Rout+2*tol,h=Len+tol+2*Al,$fn=F2);
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
  
  // version number
  translate([Len/2,-Rout-thick,Rout])
  rotate([90,0,0])
  linear_extrude(height=0.2)
  text(Version, font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);

  
}


//======================================================================

//~ batt();
//~ batt4();

//~ hold1();

hold4();
//~ end4();

//======================================================================
