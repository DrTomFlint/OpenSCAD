// topshelf.scad
// all the stuff that attaches to the top shelf

use <../Parts/tslot.scad>
use <../Parts/rounder.scad>
use <duet3.scad>

// Length front, back, top rail
x1=480;         

// Length side rails
y1=330;      

// Length of towers 
z1=380;       

// Length of side rails
y5=120;

x2=x1/2;
y2=y1/2;
yoff=-62;       // tower and top offset from center

// fan and radiator
t1=4.25;   // thickness box intake side
t2=17.7;   // thickness of circular section
t3=4.0;    // thickness box outlet side
t4=t1+t2+t3;

tB=5.5;     // thickness radiator bracket

//--------------------------------
module topshelf(tol=0){

    // left tower
    translate([x2-30,yoff,15])
    rotate([0,0,0])
    tslot1(type=3,len=z1);

    // right tower
    translate([-x2+30,yoff,15])
    rotate([0,0,0])
    tslot1(type=3,len=z1);

    // top rail
    translate([-x2,yoff,15+z1+15])
    rotate([0,90,0])
    tslot1(type=2,len=x1);

    // left side rail
    translate([x2-15,yoff-30,15+z1+15])
    rotate([0,90,-90])
    tslot1(type=1,len=120);
    
    // left side rail
    translate([-x2+15,yoff-30,15+z1+15])
    rotate([0,90,-90])
    tslot1(type=1,len=120);
    
    // back rail
    translate([-x2,yoff-165,15+z1+15])
    rotate([0,90,0])
    tslot1(type=1,len=x1);

    //---------- triangle corners shelf ---------------

    // left shelf corner
    color("red")
    translate([x2-15,yoff-30,z1+15])
    rotate([-90,0,-90])
    tbrace();

    // right shelf corner
    color("green")
    translate([-x2+15,yoff-30,z1+15])
    rotate([-90,0,-90])
    tbrace();
    
    //---------- L braces shelf ------------------

    // tower to shelf left
    color("gray")
    translate([x2,yoff,z1+45])
    rotate([-90,0,-90])
    lbrace();
    
    // tower to shelf right
    color("gray")
    translate([-x2,yoff,z1+45])
    rotate([90,90,-90])
    lbrace();
    
    // left side rail to back rail
    color("gray")
    translate([x2,yoff-180,z1+15])
    rotate([0,180,0])
    lbrace();
    
    // right side rail to back rail
    color("gray")
    translate([-x2,yoff-180,z1+15])
    rotate([0,180,-90])
    lbrace();

}

//-------------------------------------------------------
module brace(){
  intersection(){
    rotate([0,-90,0])
    difference(){ 
      cylinder(r=7.8,h=t4,$fn=22);
      cylinder(r=5.5,h=t4,$fn=22);
    } 
    translate([-t4,-2,-2])
    cube([ t4,12,12]);
  }
}
  
//---------------------------------------------
module fan(tol=0){

 
  // Fan body
  translate([-t1,0,0])
  cube([t1+tol,121+tol,120+tol]);
  translate([-(t1+t2),60,60])
  rotate([0,90,0])
  cylinder(r=60,h=t2,$fn=88);  
  translate([-t4,0,0])
  cube([t3+tol,120+tol,120+tol]);

  // Corner screws
  translate([0,7,7])
  rotate([0,-90,0])
  cylinder(r=1.45,h=t4,$fn=22);

  translate([0,120-7,7])    // double up to tolerate offset errors
  rotate([0,-90,0])
  cylinder(r=1.6,h=t4,$fn=22);
  translate([0,120-7.5,7])
  rotate([0,-90,0])
  cylinder(r=1.6,h=t4,$fn=22);

  translate([0,7,120-7])
  rotate([0,-90,0])
  cylinder(r=1.45,h=t4,$fn=22);
  translate([0,120-7,120-7])
  rotate([0,-90,0])
  cylinder(r=1.45,h=t4,$fn=22);

  // Corner braces
  translate([0,7,7])
  brace();
  translate([0,120-7,7])
  rotate([90,0,0])
  brace();
  translate([0,120-7,120-7])
  rotate([180,0,0])
  brace();
  translate([0,7,120-7])
  rotate([-90,0,0])
  brace();

  // reminder for wiring
  color("red")
  translate([0,120-7,15.5])
  scale([1,4,1])
  rotate([0,90,0])
  cylinder(r=0.7,h=10,$fn=22);
}

//-------------------------------------------------
module radiator(tol=0){
  // fan
  fan(tol=tol);
  
  // radiator main box, holes on backside are accurate location
  difference(){
    translate([-(t4+32.5),-5.5,0])
    cube([32.5+tol,129+tol,120+tol]);

    translate([-t4-10,10.7-5.5,8])
    rotate([0,-90,0])
    cylinder(r=1.5,h=35,$fn=33);
    translate([-t4-10,116-5.5,8])
    rotate([0,-90,0])
    cylinder(r=1.5,h=35,$fn=33);
  }
    
  // short side
  color("cyan")
  translate([-(t4+29.5-4),-14+4,3+4])
  minkowski(){
    cube([26-8,20-8,114-8]);
    sphere(r=4,$fn=44);
  }
  
  // long side - actually more rounded than this model
  // also this side may stick out a bit more or less, not exact
  color("cyan")
  translate([-(t4+29.5-4),117,3+4])
  minkowski(){
    cube([26-8,30-8,114-8]);
    sphere(r=4,$fn=44);
  }
  
  // approximate locations only!
  translate([-t4-10,132,25])
  rotate([0,90,0])
  cylinder(r=5,h=35,$fn=33);
  translate([-t4-10,132,92])
  rotate([0,90,0])
  cylinder(r=5,h=35,$fn=33);
  
  
}

//-----------------------------------------------------------
module radiatorBracket1(){

  // main attach
  difference(){
    union(){
      translate([-(t4+32.5+6.2),-12,-tB])
      cube([t4+32.5+12,24,tB+2]);
      translate([-(t1+t2+-0.5),4,0])
      cube([t2-1,7,10]);
    }
    radiator(tol=0.2);
    
    // back rail
    translate([-70,0,-20])
    rotate([0,90,0])
    tslot1(type=1,len=x1,tol=0.2);
    
    // M4 screw for rail attach
    translate([-12,0,-20])
    cylinder(r=2,h=25,$fn=33);
    translate([-12,0,0])
    cylinder(r=7.2/2,h=4.3,$fn=33);

  }

  // backside screw attach
  difference(){
    translate([-(t4+32.5+6.2),-12,0])
    cube([6,24,14]);

    // trim corner
    translate([-(t4+32.5+6.5),-12,3])
    rotate([45,0,0])
    cube([8,16,12]);
    
    translate([-t4-10,10.7-5.5,8])
    rotate([0,-90,0])
    cylinder(r=1.5,h=35,$fn=33);
    // countersink
    translate([-t4-35,10.7-5.5,8])
    rotate([0,-90,0])
    cylinder(r=3.3,h=5,$fn=33);
  }
  
}    

//-----------------------------------------------------------
module radiatorBracket2(){

  // main attach
  difference(){
    union(){
      // main base
      translate([-(t4+32.5+6.2),104,-tB])
      cube([t4+32.5+12,116,tB+2]);
      // extra base under pump
      color("pink")
      translate([-(t4+32.5+6.2),144-5,-tB])
      cube([80,76+5,tB+16]);
      // tab for radiator front
      translate([-(t1+t2+-0.5),110,0])
      cube([t2-1,7,10]);
      // backside radiator screw attach
      translate([-(t4+32.5+6.2),104,0])
      cube([6,40,16]);
    }
    // cut for radiator
    radiator(tol=0.25);
  
    // cut for pump and foam anti-vibration pads
    translate([-62,147-5.1,0])
    cube([65+10.2,65+10.2,30]);

    // cut for radiator clearance
    translate([-58.65,140-5,2])
    cube([35,10,30]);
    
    // top rail
    translate([-70,120+45,-20])
    rotate([0,90,0])
    tslot1(type=2,len=x1,tol=0.2);
   
    // cut for side rail
    translate([-70,100,-tB-1.3])
    cube([80,40,2]);
       
    // round off pump corners
    translate([-64.8,220,-5.5])
    rotate([0,0,-90])
    rounder(r=2,h=30,f=88);
    translate([15.4,220,-5.5])
    rotate([0,0,180])
    rounder(r=2,h=30,f=88);
    translate([15.4,144-5,-5.5])
    rotate([0,0,90])
    rounder(r=2,h=30,f=88);
   
    // M4 screw for rail attach
    translate([-10,120+30,-20])
    cylinder(r=2,h=25,$fn=33);
    translate([-10,120+30,-1])
    cylinder(r=7.2/2,h=24.3,$fn=33);

    // M4 screw for rail attach
    translate([-50,120+60,-20])
    cylinder(r=2,h=25,$fn=33);
    translate([-50,120+60,-1])
    cylinder(r=7.2/2,h=4.3,$fn=33);

    // screw on back of radiator
    translate([-t4-10,116-5.5,8])
    rotate([0,-90,0])
    cylinder(r=1.5,h=35,$fn=33);
    
   // countersink
    translate([-t4-35,116-5.5,8])
    rotate([0,-90,0])
    cylinder(r=3.3,h=5,$fn=33);

    // trim corner near radiator screw
    translate([-t4-40,103,9])
    rotate([45,0,0])
    cube([8,14,14]);
    
    // material reduction, cut out some baseplate under the pump
    translate([-35,163,-10])
    minkowski(){
      cube([30,40,20]);
      cylinder(r=4,h=20,$fn=44);
    }
    
  }  // end of difference
  
  // extra brace on pump surround near radiator outlet
  translate([0.3,120,0])
  difference(){
    cube([5.5,20,16]);
    translate([-1,0,2])
    rotate([45,0,0])
    cube([8,22,22]);
  }  
  
  
  // text label
  color("red")
    translate([-26,218.6,6])
  rotate([90,0,180])
  linear_extrude(height=2,scale=1)
  text("SUPERCOOL", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
  
}    

//-----------------------------------------------------------
module pump(tol=0){

  // box
  translate([-62+5.1-tol/2,147-tol/2,0]){
    cube([64.8+tol,64.8+tol,56]);
    // reservoir
    translate([32,32,56])
    cylinder(r=30,h=59,$fn=88);
  }

}    

//-------------------------------------------------------
module reelBracket1(){
}
  
//===============================

//translate([-x2+70,yoff-165,30+z1+20]){
  //color("gray")
  //radiator();
  //color("green")
  //radiatorBracket1();
  //color("cyan")
  //radiatorBracket2(); 
  //color("orange")
  //pump();
//}


topshelf();

/*
translate([x2-70,-80,z1+55])
rotate([0,-90,180]){
  duet3();
  duet3bracket();
}
*/

//===============================
