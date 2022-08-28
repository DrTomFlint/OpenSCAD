//=================================================================================
// DcBus.scad
// 
// Switches and resistors for the dual DC bus of the B2B
//
// Dr Tom Flint,  28 Aug 2022
//=================================================================================


use <../Parts/rounder.scad>

//---------------------------------------------------------------------------------
module tube(){

  translate([0,0,-51.5/2])
  rotate([0,90,0])
  rotate([0,0,90])
  difference(){
    linear_extrude(height=220)
    offset(r=5)
    square([101.5-10,51.5-10],center=true);

    translate([0,0,-1])
    linear_extrude(height=222)
    offset(r=2)
    square([94.5-4,44.4-4],center=true);
  }

}

//---------------------------------------------------------------------------------
module threeWay(){
 
  translate([0,-21.5/2,0])
  cube([21.9,21.5,33.7]); 

  translate([0,21.5/2-1,0])
  cube([2,2,33.7]); 
  translate([0,-21.5/2-1,0])
  cube([2,2,33.7]); 

  translate([0,0,33.7/2])
  rotate([0,-90,0])
  cylinder(r=12/2,h=9.8,$fn=99);
  
}

//---------------------------------------------------------------------------------
module bracket(){

  difference(){
    translate([1.5,0,20-5])  
    cube([3,101.5+0,46],center=true); 

    translate([-2,0,-51.5/2])
    rotate([0,90,0])
    rotate([0,0,90])
    linear_extrude(height=220)
    offset(r=5)
    square([101.5-10,51.5-10],center=true);
    
    translate([3,37,4])
    threeWay();
    translate([3,13,4])
    threeWay();
    translate([3,-37,4])
    threeWay();
    translate([3,-13,4])
    threeWay();

    translate([0.6,0,0]){
      color("red")
      translate([0,37,32])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.9,scale=1)
      text("PRE", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,37,8])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.9,scale=1)
      text("CHG", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,13,32])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.9,scale=1)
      text("A", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,13,8])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.9,scale=1)
      text("B", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,-13,32])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.9,scale=1)
      text("A", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,-13,8])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.9,scale=1)
      text("B", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,-37,32])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.9,scale=1)
      text("A", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,-37,8])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.9,scale=1)
      text("B", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }
  }
  
  // inner fillets
  translate([3,-101.5/2,0])  
  rounder(r=3,h=38,f=33);
  translate([3,101.5/2,0])  
  rotate([0,0,-90])
  rounder(r=3,h=38,f=33);
    
  // base  
  difference(){
    translate([15,0,1.5])  
    cube([30,101.5,3],center=true); 

    translate([30,28,0])  
    scale([1,1.5,1])
    cylinder(r=15,h=10,center=true,$fn=89);

    translate([30,-28,0])  
    scale([1,1.5,1])
    cylinder(r=15,h=10,center=true,$fn=89);

    translate([30,0,1.5])  
    cylinder(r=1.7,h=7,center=true,$fn=89);
  }
  
  // sides
  difference(){
    translate([20,-105.5/2,20-5-5])  
    cube([40,4,46+10],center=true); 

    // cut 40 degree
    translate([60,-105.5/2,36])  
    rotate([0,-40,0])
    cube([80,6,100],center=true); 

    // M3 side mounts
    translate([10,-105.5/2,-10])  
    rotate([90,0,0])
    cylinder(r=1.7,h=10,center=true,$fn=22);
    translate([30,-105.5/2,-10])  
    rotate([90,0,0])
    cylinder(r=1.7,h=10,center=true,$fn=22);

    // round outer corners
    translate([0,-101.5/2-4,-20])  
    rounder(r=5,h=38+20,f=99);

    // back corner
    translate([40,-101.5/2+4,-18])  
    rotate([90,0,0])
    rotate([0,0,90])
    rounder(r=8,h=10,f=99);

  }
  
  // side  
  difference(){
    translate([20,105.5/2,20-5-5])  
    cube([40,4,46+10],center=true); 

    // cut 40 degree
    translate([60,105.5/2,36])  
    rotate([0,-40,0])
    cube([80,6,100],center=true); 

    // M3 side mounts
    translate([10,105.5/2,-10])  
    rotate([90,0,0])
    cylinder(r=1.7,h=10,center=true,$fn=22);
    translate([30,105.5/2,-10])  
    rotate([90,0,0])
    cylinder(r=1.7,h=10,center=true,$fn=22);

    // round outer corners
    translate([0,101.5/2+4,-20])  
    rotate([0,0,-90])
    rounder(r=5,h=38+20,f=99);

    // back corner
    translate([40,101.5/2+6,-18])  
    rotate([90,0,0])
    rotate([0,0,90])
    rounder(r=8,h=10,f=99);

  }

  // center support
  difference(){
    translate([13,0,38/2])  
    cube([26,2,38],center=true); 

    // cut 40 degree
    translate([60,0,36])  
    rotate([0,-40,0])
    cube([80,6,100],center=true); 
  }
  
  difference(){
    translate([30,0,1.5])  
    cylinder(r=5.5,h=3,center=true,$fn=89);
    translate([30,0,1.5])  
    cylinder(r=1.7,h=7,center=true,$fn=89);
  }
  
}


//---------------------------------------------------------------------------------
module labels(){
  
      translate([0.6,0,0]){
      color("red")
      translate([0,37,32])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.6,scale=1)
      text("PRE", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,37,8])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.6,scale=1)
      text("CHG", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,13,32])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.6,scale=1)
      text("A", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,13,8])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.6,scale=1)
      text("B", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,-13,32])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.6,scale=1)
      text("A", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,-13,8])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.6,scale=1)
      text("B", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,-37,32])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.6,scale=1)
      text("A", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

      color("red")
      translate([0,-37,8])
      rotate([0,-90,0])
      rotate([0,0,-90])
      linear_extrude(height=0.6,scale=1)
      text("B", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }
}
//=================================================================================
if(0){
  color("gray")
  tube();
}

bracket();

//labels();

if(0){
  translate([3,37,4])
  threeWay();
  translate([3,13,4])
  threeWay();
  translate([3,-37,4])
  threeWay();
  translate([3,-13,4])
  threeWay();
}


//threeWay();

//=================================================================================
