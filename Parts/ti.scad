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
//---------------------------------------------------------------------
module gan(tol=0,wires=1){

// for placement on launch()
translate([28.0,0,20.5]){


  // pcb
  difference(){
    color("Green")
    cube([79.0,58.5,1.6]);

  }

  // top side headers, from measurement not drawings
  color("gray")
  translate([2,5,1.6])
  cube([25.9,5.0,8.4]);
  color("gray")
  translate([2,48.5,1.6])
  cube([25.9,5.0,8.4]);

  // power lines
  color("DeepSkyBlue")
  translate([32.3,48.5,1.6])
  cube([16.5,7.6,10.2]);

  color("DeepSkyBlue")
  translate([53.0,48.5,1.6])
  cube([11,7.6,10.2]);
  
  // big stupid cap
  color("brown")
  translate([73,49.5,1.6])
  cylinder(r=12.8/2,h=25.7,$fn=42);
  
  // inductor
  color("DarkSlateGray")
  translate([66,3,1.6])
  cube([12,12,9.5]);
  
  // wires
  if(wires==1){
    color("black")
    translate([35,48.5,1.6+3])
    rotate([-90,0,0])
    cylinder(r=1.0,h=20,$fn=22);
    color("red")
    translate([40,48.5,1.6+3])
    rotate([-90,0,0])
    cylinder(r=1.0,h=20,$fn=22);
    color("white")
    translate([45,48.5,1.6+3])
    rotate([-90,0,0])
    cylinder(r=1.0,h=20,$fn=22);

    color("black")
    translate([56,48.5,1.6+3])
    rotate([-90,0,0])
    cylinder(r=1.0,h=20,$fn=22);
    color("red")
    translate([61,48.5,1.6+3])
    rotate([-90,0,0])
    cylinder(r=1.0,h=20,$fn=22);
  }
  
}

}

//=================================================================================
  
launch();
gan();

//=================================================================================
