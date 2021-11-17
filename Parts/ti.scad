//=================================================================================
// ti.scad
//
// TI LaunchpadXL and BoostXL GaN inverter
//
// Dr Tom Flint, 17 Nov 2021
//=================================================================================


use <../Parts/rounder.scad>

//---------------------------------------------------------------------
module launch(tol=0,usb=1){


  // pcb
  difference(){
    color("DarkMagenta")
    translate([0,0,8.4])
    cube([129.8,58.5,1.7]);
    
    // mounting holes
    translate([2.5,2.5,0])
    cylinder(r=1.5,h=20,$fn=22);
    translate([129.8-2.5,2.5,0])
    cylinder(r=1.5,h=20,$fn=22);
    translate([2.5,58.5-2.5,0])
    cylinder(r=1.5,h=20,$fn=22);
    translate([129.8-2.5,58.5-2.5,0])
    cylinder(r=1.5,h=20,$fn=22);

  }
  
  // bottom side headers, from measurement not drawings
  color("black")
  translate([30,5,0])
  cube([25.9,5.0,8.4]);
  color("black")
  translate([30,48.5,0])
  cube([25.9,5.0,8.4]);
  color("black")
  translate([93.75,5,0])
  cube([25.9,5.0,8.4]);
  color("black")
  translate([93.75,48.5,0])
  cube([25.9,5.0,8.4]);

  // top side headers, from measurement not drawings
  color("gray")
  translate([30,5,8.4+1.7])
  cube([25.9,5.0,8.4]);
  color("gray")
  translate([30,48.5,8.4+1.7])
  cube([25.9,5.0,8.4]);
  color("gray")
  translate([93.75,5,8.4+1.7])
  cube([25.9,5.0,8.4]);
  color("gray")
  translate([93.75,48.5,8.4+1.7])
  cube([25.9,5.0,8.4]);

  // end row of pins
  color("gray")
  translate([121.7,5,8.4+1.7])
  cube([7.3,48.2,8.4]);

  // usb plug
  color("silver")
  translate([-1,6.5,8.4+1.7])
  cube([9.6,7.8,4.0]);

  // reset button
  color("black")
  translate([63.3,52.7,8.4+1.7])
  cube([7.4,8.5,7.0]);
  
  // usb cable
  if(usb==1){
    color("black")
    translate([-28,5.2,8.4])
    cube([28,10.5,7.8]);
    translate([-28,5.2+10.5/2,8.4+7.8/2])
    rotate([0,-90,0])
    cylinder(r=2.4,h=20,$fn=22);
  }
    
}


//=================================================================================
  
launch();

//=================================================================================
