//=================================================================================
// micarm.scad
//
// Microphone arm for tripod or gimbal mounting a Sony ECM-XYST1M 
//
// Dr Tom Flint, 29 Dec 2020
//=================================================================================


use <../Parts/rounder.scad>

//-----------------------------------------------
// block for mounting the hot-foot, but it is passive with no wiring so
// call it a coldfoot?
module coldfoot(tol=0){

            
tol2=0.2;   // between ECM foot 2and slot

  difference(){
    translate([0,0,2.1])
    cube([22,25,4.2],center=true);
    
    // main slot
    translate([1.25,0,2.25])
    cube([19.5+tol2,18.6+tol2,2.0+tol2],center=true);

    // extra wide at opening
    translate([9.75,0,3.25])
    cube([2.5+tol2,18.6+tol2,4],center=true);

    // bevel at opening
    translate([11.75,0,1.8])
    rotate([0,45,0])
    cube([3,18.8+tol2,3],center=true);

    // cut for ankle
    translate([1,0,3.25])
    cube([16,12.5+tol2,4],center=true);
    
    // spring lock holes
    translate([5.6,4.4,-0.5])
    cylinder(r=1.5,h=2,$fn=12);
    translate([5.6,-4.4,-0.5])
    cylinder(r=1.5,h=2,$fn=12);

    // inner rail rounders
    translate([8.4,6.3,3.25])
    rotate([0,0,90])
    rounder(r=2,h=4,f=33);
    translate([8.4,-6.3,3.25])
    rotate([0,0,180])
    rounder(r=2,h=4,f=33);

    // outer rail rounders
    translate([11,9.4,1.15])
    rotate([0,0,90])
    rounder(r=2,h=4,f=33);
    translate([11,-9.4,1.15])
    rotate([0,0,180])
    rounder(r=2,h=4,f=33);
    
  }

    // inner rail fillets
    translate([-7,6.35,3.36])
    rotate([0,0,-90])
    rounder(r=2,h=0.83,f=88);
    translate([-7,-6.35,3.36])
    rotate([0,0,0])
    rounder(r=2,h=0.83,f=88);


}


//-------------------------------------------------------
module micarm(){

// vertical post
difference(){
  union(){
  // base arm
  translate([-11,-12.5,0])
  cube([22,46,6]);

  // vertical post
  hull(){
    translate([-11,-12.5+46-6,0])
    cube([22,6,5]);

    translate([0,-12.5+46,50])
    rotate([90,0,0])
    cylinder(r=11,h=6,$fn=123);
  }

  translate([0,-12.5+48,50])
  rotate([90,0,0])
  cylinder(r=8,h=6,$fn=99);

  translate([0,-12.5+48+1.2,50])
  rotate([90,0,0])
  cylinder(r=6.5,h=6,$fn=99);
  
  }  // end union

  // cut for bolt
  translate([0,-12.5+55,50])
  rotate([90,0,0])
  cylinder(r=4,h=20,$fn=99);
  
  // cut for washer
  translate([0,-12.5+43.9,50])
  rotate([90,0,0])
  cylinder(r=8.2,h=4,$fn=99);
  
  // rounder at elbow
  translate([-11,46-12.5,0])
  rotate([0,90,0])
  rotate([0,0,180])
  rounder(r=15,h=22,f=123);
  
  // rounder at elbow
  translate([-11,-12.5,0])
  rotate([0,90,0])
  rotate([0,0,90])
  rounder(r=4,h=22,f=123);

} // end diff

  // fillet at elbow
  translate([-11,46-12.5-6,6])
  rotate([0,90,0])
  rotate([0,0,180])
  rounder(r=10,h=22,f=123);

  translate([0,0,6])
  coldfoot(tol=0);
  
  color("red")
  translate([0,28,26.5])
  rotate([90,0,0])
  rotate([0,0,-64])
  linear_extrude(height=0.7,scale=1)
  text("FLINT", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);


}

//==================================================================================


micarm();

//==================================================================================
