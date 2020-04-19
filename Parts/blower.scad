// blower.scad
// Delta blowers BFB0512VHD-SP01, datasheet in /Docs/Duet3
// 24.1 grams after cutting off the extra mounting tabs




//----------------------------------------
module blower(tol=0,hole=1){
  
  difference(){
    union(){
      // top side body
      difference(){
        translate([51.2/2+1,0,51.2/2])
        rotate([90,0,0])
        cylinder(r=51.2/2,h=21.5,$fn=88);
        translate([0,-22,0])
        cube([52,23,23]);
      }
      // lower side body
      translate([21,0,25.5])
      rotate([90,0,0])
      cylinder(r=20,h=21.5,$fn=88);
      // back plate - original
//      translate([0,-1.5,0])
//      cube([52,1.5,27]);
      // back plate - trimmed off
      translate([21,-1.5,0])
      cube([15,1.5,27]);
      // lip top
      difference(){
        translate([51.2/2+1,0,51.2/2])
        rotate([90,0,0])
        cylinder(r=51.2/2+1,h=8,$fn=88);
        translate([0,-22,-1])
        cube([52,23,24]);
      }
      // lip lower
      translate([21,0,25.5])
      rotate([90,0,0])
      cylinder(r=21,h=8,$fn=88);
      // lip by outlet
      translate([52,-8,0])
      cube([1,8,24]);
      translate([32,-8,0])
      cube([1,8,24]);

      
      // outlet
      translate([51.2+1-19.5,-21.5,0])
      cube([19.5,21.5,25]);
      
      // screw lump upper
      translate([6,0,42])
      rotate([90,0,0])
      cylinder(r=3.4,h=8,$fn=88);
      // screw lump lower
      translate([24.6,0,4.6])
      rotate([90,0,0])
      cylinder(r=3.4,h=8,$fn=88);
    }
    // outlet hole
    translate([51.2+2-19.5,-21.5+1,-1])
    cube([17.5,19.5,10]);
    
    // center air hole
    if(hole==1){
      translate([22.5,1,25.5])
      rotate([90,0,0])
      cylinder(r=31/2,h=30,$fn=88);
    }
  }
  
  // lower attachment
  difference(){
    hull(){
      translate([4.0,-8.2,6.8])
      rotate([90,0,0])
      cylinder(r=6.5/2,h=6,$fn=88);
      translate([4.0+5,-8.2,6.8+5])
      rotate([90,0,0])
      cylinder(r=6.5/2,h=6,$fn=88);
    }
    translate([4.0,-8.0,6.8])
    rotate([90,0,0])
    cylinder(r=2.1,h=7,$fn=44);
  }

  // upper attachment
  difference(){
    hull(){
      translate([47.4,-8.2,45.8])
      rotate([90,0,0])
      cylinder(r=6.5/2,h=6,$fn=88);
      translate([47.4-5,-8.2,45.8-5])
      rotate([90,0,0])
      cylinder(r=6.5/2,h=6,$fn=88);
    }
    translate([47.4,-8.0,45.8])
    rotate([90,0,0])
    cylinder(r=2.1,h=7,$fn=44);
  }


}

//==========================================

blower();

//===========================================
