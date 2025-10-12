//=================================================================================
// HeaterKnob.scad
//
// Extend the thermostat and make it visible.
//
// DrTomFlint, 11 Oct 2025
//=================================================================================


F2=99;

//----------------------------------------------------------------------------------
module knob(tol=0){
	difference(){
    union(){
      cylinder(r=33/2+2,h=11,$fn=F2);
      translate([0,0,11])
      cylinder(r1=33/2+2,r2=10-2,h=6+2);
      translate([0,0,11+6])
      cylinder(r=10,h=40,$fn=6);
    }
    
    // knob
    cylinder(r1=32/2,r2=33/2,h=9.5,$fn=F2);
    cylinder(r1=34/2,r2=32/2,h=1,$fn=F2);
    
    // shaft cut
    cylinder(r=8,h=64,$fn=6);
    
    cube([1,50,18],center=true);
    cube([50,1,18],center=true);
    
	}
  
}
  
//----------------------------------------------------------------------------------
module lock(){
    translate([0,0,9.5])
    cylinder(r=8-0.25,h=10,$fn=6);
    translate([0,0,5])
    linear_extrude(scale=1.3,height=10)
    offset(r=1,$fn=22)
    square([4,4],center=true);
}
  
//----------------------------------------------------------------------------------
module dial(){
  
  difference(){
    union(){
      cylinder(r1=8-0.1,r2=8-0.2,h=10,$fn=6);
      hull(){
        cylinder(r=10,h=2,$fn=F2);
        translate([30,0,0])
        cylinder(r=3,h=2,$fn=F2);
      }
    }
    cylinder(r=3,h=20,$fn=F2);
  }
}
  
//=================================================================================

//~ difference(){
//~ union(){
//~ knob();

//~ lock();

//~ }
//~ cube([100,100,100]);
//~ }



//~ lock();
//~ knob();
dial();

//=================================================================================
