//=================================================================================
// LadderLock.scad
//
// Jamming wedge so ladder lock on pack does not slip
//
// Dr Tom Flint, 18 Feb 2023
//=================================================================================


use <../Parts/rounder.scad>

inner = 40;     // curve of the top
thick = 3;      // thickness
ang = 12;       // angle of the wedge
tab = 12;     // length of the tab

wide = 25;      // width of the whole part
slot = 18;      // width of the webbing slot

f1= 250;        // curve of the top

//---------------------------------------------------------------------------------
module lock(){
  
difference(){  
  // boss is drawn in 2D and extruded
  linear_extrude(height=wide){  
    // main arc of the top
    difference(){
      circle(r=inner,$fn=f1);
      circle(r=inner-thick,$fn=f1);
      
      rotate(-ang)
      translate([0,-1.5*inner])
      square([2*inner,3*inner]);

      rotate(180+ang)
      translate([0,-1.5*inner])
      square([2*inner,3*inner]);
    }
    
    // add rounding to ends
    rotate(-ang)
    translate([0,inner-thick/2])
    circle(r=thick/2,$fn=f1);
    rotate(ang)
    translate([0,inner-thick/2])
    circle(r=thick/2,$fn=f1);

    // tab
    hull(){
      rotate(-ang/2)
      translate([0,inner-thick/2])
      scale([1.8,1])
      circle(r=thick/2,$fn=f1);
      rotate(-ang/2)
      translate([0,inner-thick/2-tab])
      circle(r=1.5,$fn=f1);
    }

    // 3 small teeth (does not scale parametric)
    rotate(-ang/2-2.9)
    translate([0,inner-thick/2-5])
    rotate(35)
    circle(r=1.5,$fn=3);
    rotate(-ang/2-2.5)
    translate([0,inner-thick/2-8])
    rotate(35)
    circle(r=1.5,$fn=3);
    rotate(-ang/2-2.3)
    translate([0,inner-thick/2-11])
    rotate(35)
    circle(r=1.5,$fn=3);
  }

  // trim tab to slot size
  translate([0,0,0])
  cylinder(r=inner-thick,h=(wide-slot)/2,$fn=f1);
  translate([0,0,wide-(wide-slot)/2])
  cylinder(r=inner-thick,h=(wide-slot)/2,$fn=f1);
  
  // hole for stap
  rotate([0,0,4])
  translate([0,inner,wide/2])
  cube([6,10,slot+1],center=true);
  rotate([0,0,10])
  translate([0,inner,wide/2])
  cube([7,10,slot-7],center=true);
}

}
  
  
  
  



//=================================================================================

lock();

//=================================================================================
