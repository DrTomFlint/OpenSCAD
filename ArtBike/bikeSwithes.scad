//=================================================================================
// bikeSwitches.scad
//
// switch plate for the ArtBike
//
// Dr Tom Flint, 26 Dec 2021
//=================================================================================


use <../Parts/rounder.scad>
use <../Parts/switch3.scad>


//---------------------------------------------------------------------------------
module plate(switches=0){
  
  difference(){
    union(){
      translate([-35,-80+16,15])
      cube([40,80,3]);

      translate([-10,-80+16,11.1-5])
      cube([15,80-16,3.9+5]);

      //color("red")
      translate([-20,-80+19,11.1])
      cube([20,6,10],center=true);

      //color("green")
      translate([-20,13,11.1])
      cube([20,6,10],center=true);

      //color("blue")
      translate([-32,-24,11.1])
      cube([6,76,10],center=true);

      // rounders
      translate([-35+6,16-6,6])
      rotate([0,0,-90])
      rounder(r=10,h=12,f=89);
      translate([-35+6,16-80+6,6])
      rotate([0,0,0])
      rounder(r=10,h=12,f=89);
    }
    // cut for loops
    loops(tol=0.2,cut=1);
    
    // cuts for switches left to right
    translate([-20,-4,14.8])
    rotate([0,0,90])
    cylinder(r=6.3/2,h=10,center=true,$fn=33);
  
    translate([-20,-4-22,14.8])
    rotate([0,0,90])
    cylinder(r=6.3/2,h=10,center=true,$fn=33);
  
    translate([-20,-4-44,14.8])
    rotate([0,0,90])
    cylinder(r=6.3/2,h=10,center=true,$fn=33);
    
    // cuts for washers
    translate([-20,-4,17.4]){
      rotate([0,0,90])
      translate([0,5.8,-.1])
      cube([2.5,2,2.5],center=true);
    }
    translate([-20,-4-22,17.4]){
      rotate([0,0,90])
      translate([0,5.8,-.1])
      cube([2.5,2,2.5],center=true);
    }
  
    translate([-20,-4-44,17.4]){
      rotate([0,0,90])
      translate([0,5.8,-.1])
      cube([2.5,2,2.5],center=true);
    }
  
  
    // cut for handlebars
    translate([0,-45-47,-50*sin(10)])
    rotate([-80,0,0])
    cylinder(r=22.8/2,h=50,$fn=89);

    translate([0,-45,0])
    rotate([-90,0,0])
    cylinder(r=22.8/2,h=45,$fn=89);
    
    // rounders
    translate([-35,16,0])
    rotate([0,0,-90])
    rounder(r=15,h=30,f=189);
    translate([-35,16-80,0])
    rotate([0,0,0])
    rounder(r=15,h=30,f=189);

    translate([5,16-80,0])
    rotate([0,0,90])
    rounder(r=15,h=30,f=189);
    translate([5,16,0])
    rotate([0,0,180])
    rounder(r=15,h=30,f=189);
    
    color("red")
    translate([-7,-26,18-0.3])
    rotate([0,0,-90])
    linear_extrude(height=1,scale=1)
    text("HEDWIG", font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);

  }
  
  if(switches>0){
//    color("cyan")
    translate([-20,-4,14.8])
    rotate([0,0,90])
    switch3(pos=0,nut=4.5,washer=3.5);
//    color("cyan")
    translate([-20,-4-22,14.8])
    rotate([0,0,90])
    switch3(pos=0,nut=4.5,washer=3.5);
//    color("cyan")
    translate([-20,-4-44,14.8])
    rotate([0,0,90])
    switch3(pos=0,nut=4.5,washer=3.5);
  }

}
//---------------------------------------------------------------------------------
module loops(tol=0,cut=0){

  difference(){
    union(){
      translate([0,-16,0])
      rotate([-90,0,0])
      cylinder(r=30/2+tol/2,h=10+tol,center=true,$fn=99);
  
      translate([-11,-16,8])
      cube([8+tol,10+tol,18+tol],center=true);
      
      translate([-13,-16,20-8])
      cube([24+tol,10+tol,10],center=true);

      translate([0,-16-20,0])
      rotate([-90,0,0])
      cylinder(r=30/2+tol/2,h=10+tol,center=true,$fn=99);

      translate([-11,-16-20,8])
      cube([8+tol,10+tol,18+tol],center=true);

      translate([-13,-16-20,20-8])
      cube([24+tol,10+tol,10],center=true);
      
      // rounders
      color("red")
      translate([-15,-11,7])
      rotate([0,0,180])
      rotate([-90,0,0])
      rounder(r=4,h=10,f=89);
      translate([-15,-11-20,7])
      rotate([0,0,180])
      rotate([-90,0,0])
      rounder(r=4,h=10,f=89);


      if(cut==1){
        // bolt positions for M3x?? 
        translate([-21,-16,10])
        cylinder(r=3.2/2,h=20,center=true,$fn=99);
        translate([-21,-16-20,10])
        cylinder(r=3.2/2,h=20,center=true,$fn=99);
      }
    }
    
     // cuts for handlebars 
    translate([0,-45-47,-50*sin(10)])
    rotate([-80,0,0])
    cylinder(r=22.5/2,h=50,$fn=89);

    translate([0,-45,0])
    rotate([-90,0,0])
    cylinder(r=22.5/2,h=45,$fn=89);
    
    if(cut==0){
      // bolt positions for M3x?? 
      translate([-21,-16,10])
      cylinder(r=3.2/2,h=20,center=true,$fn=99);
      translate([-21,-16-20,10])
      cylinder(r=3.2/2,h=20,center=true,$fn=99);

      // cut to allow install and tighten
      translate([-20,-16,10.5])
      cube([40,12,2],center=true);
      translate([-20,-16-20,10.5])
      cube([40,12,2],center=true);
    
    }
    
  }
}

//---------------------------------------------------------------------------------
module handleBars(){

$fn=89;

color("lightgray"){

translate([0,-45-47,-50*sin(10)])
rotate([-80,0,0])
cylinder(r=22.5/2,h=50);

translate([0,-45,0])
rotate([-90,0,0])
cylinder(r=22.2/2,h=45);

rotate([-90,0,0])
cylinder(r=30/2,h=16);

translate([0,16,0])
rotate([-90,0,0])
cylinder(r1=44.5/2,r2=51.8/2,h=6);

translate([0,16+6,0])
rotate([-90,0,0])
cylinder(r=51.8/2,h=20);

rotate([0,40,0])
translate([0,0,-28/2])
cube([100,16,28]);

}

}
//---------------------------------------------------------------------------------
module cableGland(){
  
$fn=123;

difference(){
  union(){
    translate([-28,-41,-1])
    cube([10,10,8]);

    translate([-30,-41,0])
    rotate([-90,0,0])
    cylinder(r=6,h=10);

  }
  translate([-30,-41,0])
  rotate([-90,0,0])
  cylinder(r=4,h=10);

  translate([-30,-41,2])
  cube([13,10,2]);

  translate([-21,-16-20,10])
  cylinder(r=3.2/2,h=40,center=true,$fn=99);

  }
}

//==================================================================================

//plate(switches=0);

//handleBars();

//color("cyan",alpha=0.5)
//difference(){
//loops(tol=0);
//cube([80,60,80],center=true);
//}

color("cyan")
cableGland();

//==================================================================================
