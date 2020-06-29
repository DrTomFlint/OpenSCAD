// xends
// x motor attachments

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <../Parts/switch.scad>
use <../Parts/rounder.scad>
use <frame.scad>
use <zaxis.scad>

// repeat params from dusa1.scad

// Height of x rods, 62-304
High0=150;        

// Left extruder position, 150+
LeftX0=150; 

// Right extruder position, 82+
RightX0=82;

// Show frame
frameOn=1;

// Show top z brackets
tops=1;  

// Show ybed ------------------
ybed=1;    

// Length front, back, top rail
x1=480;         

// Length side rails
y1=330;      

// Length of towers -----------
z1=380;       

// Center to Tower 
ytower=-57.2; 

// Tower to Z-axis, >0
ybracket=6;            

// Center to z-axis
//ytoz=7.2;
ytoz=0;


// Height of z rods
zoff2=43;   

// Distance zrod to zscrew
xrodscrew=26;     

// Offset of zscrew
zscrew = -7;

// Height of bottom x motor
zmotor1=45;    

// Delta between x motors
zmotorD=19;    

// Offset x motors from center of towers
xmot0=-2;

//---------------------------------
// Computed values based on parameters
zmotor2=zmotor1+zmotorD;

x2=x1/2;
y2=y1/2;
F2=88;


//------------------------------------------------------
module xleft1(



){

  
difference(){
// boss
translate([x2-50,-13,High0+22])
minkowski(convexity=8) {
  difference(){
    translate([0,2,0])
    cube([50,40-2,65]);    
//    translate([-1,-1,-1])
//    #cube([29,22,55]);
    
    translate([-3,-15,-1])
    rotate([0,0,45])
    cube([20,20,70]);
    translate([54,-15,-1])
    rotate([0,0,45])
    cube([20,20,70]);
//    translate([25,-15,-1])
//    rotate([0,0,45])
//    #cube([20,20,55]);
  }
  cylinder(r=2,h=2,$fn=F2);
}

if(1){  // all the cuts
  
// cut for left z rod plus clearance
translate([x2-30+zscrew+xrodscrew,0,15+42])
cylinder(r=5.3,h=350,$fn=F2);

// cut for left lm10u bearing lower plus clearance 
translate([x2-30+zscrew+xrodscrew,0,High0+20])
cylinder(r=19.01/2,h=29,$fn=F2);

// cut for left lm10u bearing upper plus clearance
translate([x2-30+zscrew+xrodscrew,0,High0+60])
cylinder(r=19.01/2,h=29+1,$fn=F2);

// strain relief cut for M10 and bearings
// leave a little material on the buildplate to help curling
translate([x2-30+zscrew+xrodscrew+10,-11,High0+18])
rotate([0,0,45])
cube([1,15,70]);

// add a cut so M10 could be pushed out if needed
translate([x2-30+zscrew+xrodscrew+10,-13,High0+42])
rotate([0,0,45])
cube([4,14,24]);

// arch the top of push out cut to make it printable
translate([x2-30+zscrew+xrodscrew+10,-13,High0+42])
rotate([0,45,45])
cube([2.8,14,2.8]);

// cut left znut
color("red")
translate([x2-30+zscrew,0,High0+90-1])
rotate([180,0,0])
znut(holes=0,tol=0.15);

// clearance for left znut
color("red")
translate([x2-30+zscrew,0,High0+90-1])
rotate([180,0,0])
cylinder(r=11.1,h=4,$fn=F2);

// cut left znut top clearance
color("blue")
translate([x2-30+zscrew,0,High0+90-4])
cylinder(r1=11,r2=12,h=4,$fn=F2);

// cut for znut mounting screws M3x20
translate([x2-30+zscrew,0,High0+90-2])
rotate([180,0,0]){
  translate([7.75,0,0])
  cylinder(r=1.5,h=20,$fn=F2);
  translate([-7.75,0,0])
  cylinder(r=1.5,h=20,$fn=F2);
}

// cuts for access to znut screws
translate([x2-30+zscrew,0,High0+11]){
  translate([7.75,0,0])
  cylinder(r=5.7/2,h=57,$fn=F2);
  translate([-7.75,0,0])
  cylinder(r=5.7/2,h=57,$fn=F2);
}

// cut left z screw
translate([x2-30+zscrew,0,15])
rotate([0,0,180])
zmotor(tol=0.15);

// extra clearance left z screw
translate([x2-30+zscrew,0,15])
rotate([0,0,180])
cylinder(r=4.5,h=350,$fn=F2);

// cut for upper x rod plus clearance
translate([-480/2,0+16,High0+zmotor1+34])
rotate([0,90,0])
cylinder(r=4+0.1,h=480,$fn=F2);

// upper x rod strain relief
translate([-480/2,0+16,High0+zmotor1+37])
rotate([0,90,0])
cylinder(r=2,h=480,$fn=9);

// check hole for upper x rod
translate([480/2-2.25,33,High0+zmotor1+34])
rotate([90,30,0])
cylinder(r=3,h=15,$fn=6);

// cut for lower x rod plus clearance
translate([-480/2,0+16,High0+30])
rotate([0,90,0])
cylinder(r=4+0.1,h=480,$fn=F2);

// lower x rod strain relief
translate([-480/2,0+16,High0+27])
rotate([0,90,0])
cylinder(r=2,h=480,$fn=9);

// check hole for lower x rod
translate([480/2-2.25,33,High0+30])
rotate([90,30,0])
cylinder(r=3,h=15,$fn=6);

// cut for left x motor
translate([480/2-30-xmot0,0+76,High0+zmotor1])
rotate([90,90,0])
xymotor(tol=0.15);

// cut for left x motor shaft
translate([480/2-30-xmot0,20,High0+zmotor1])
rotate([90,90,0])
cylinder(r=3,h=20,$fn=F2);

F3=22;

translate([-480/2-30-xmot0,65,High0+zmotor1])
rotate([90,0,0]){
    // x motor mounting holes,
    translate([15.5+x1,15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([-15.5+x1,15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([15.5+x1,-15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([-15.5+x1,-15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);

    // countersink for the heads
    translate([15.5+x1,15.5,41])
    cylinder(r=3,h=40,$fn=F3);
    translate([-15.5+x1,15.5,41])
    cylinder(r=3,h=40,$fn=F3);
    translate([15.5+x1,-15.5,41])
    cylinder(r=3,h=40,$fn=F3);
    translate([-15.5+x1,-15.5,41])
    cylinder(r=3,h=40,$fn=F3);
}

// main cut for belt, pulley, and idler
color("cyan")
translate([480/2-80,0+9.5,High0+37])
cube([90,9.5,37]);

// arch the belt cut to make it printable 
color("cyan")
translate([480/2-80,14.25,High0+39])
rotate([0,90,0])
scale([0.9,1,1])
cylinder(r=9.5/2,h=90,$fn=F2);

// clearance for pulley
translate([480/2-30-xmot0,9.5,High0+zmotor1])
rotate([-90,90,0])
cylinder(r=8,h=20,$fn=F2);

// idler attachment M3x20 screw
translate([480/2-30-xmot0,26,High0+zmotor2-1.5])
rotate([90,90,0])
cylinder(r=1.55,h=20,$fn=F2);

// idler attachment M3x30 head and access
translate([480/2-30-xmot0,6,High0+zmotor2-1.5])
rotate([90,90,0])
cylinder(r=3,h=30,$fn=F2);

// idler attachment M3x30 nut
translate([480/2-36-xmot0,23,High0+zmotor2-7])
cube([12,6,9]);

// cut for the limit switch 
translate([x2-28+zscrew,-5,High0+90-48])
rotate([0,-90,90])
//mirror([0,0,0])
switchcut();
translate([x2-28+zscrew,-15,High0+90-48])
rotate([0,-90,90])
mirror([0,0,0])
switchcut();

// cut for BLtouch clearance 
translate([x2+zscrew-48.25,-14,High0+20])
cube([9,20,48]);

// brass M3 heat-set mounting for ooze prevention arm ***********************************
translate([x2+zscrew-33,-8,High0+25.5]){
  translate([0,0,-3.5])
  cylinder(r=2.3,h=3.5,$fn=22);
  cylinder(r=1.65,h=3.5+5,center=true,$fn=22);
}
translate([x2+zscrew-33,8,High0+25.5]){
  translate([0,0,-3.5])
  cylinder(r=2.3,h=3.5,$fn=22);
  cylinder(r=1.65,h=3.5+5,center=true,$fn=22);
}
translate([x2+zscrew-18,-6,High0+25.5]){
  translate([0,0,-3.5])
  cylinder(r=2.3,h=3.5,$fn=22);
  cylinder(r=1.65,h=3.5+5,center=true,$fn=22);
}

// x motor holes, 45 deg cuts to make printable
translate([-480/2-33-xmot0,-15,High0+zmotor1])
rotate([-90,0,0]){
    translate([-15.5+x1,15.5,0])
    cylinder(r=7.5,h=21,$fn=4);
    translate([-15.5+x1,-15.5,0])
    cylinder(r=7.5,h=21,$fn=4);
}

// cut for left x motor wires
translate([480/2-xmot0-6,30,High0+zmotor1+7])
scale([1,1,2])
rotate([90,0,15])
cylinder(r=2.5,h=45,$fn=F2);

// cut for limit switch wires 
translate([x2+zscrew-28,-14.8,High0+43])
cube([4.5,9,18]);
translate([x2+zscrew-24,-10.5,High0+54])
scale([1,1,2])
rotate([0,90,0])
cylinder(r=1,h=30,$fn=20);

// pry out for limit switch
translate([x2+zscrew-44,-5.5,High0+50])
cube([8,2,4]);

// cut for visibility
//translate([x2-30+zscrew-50,-40,High0+20])
//cube([100,40,100]);


} // end if all cuts

}// end diff
  
// text labels
color("red")
translate([x2-28,28,High0+81])
rotate([90,0,180])
linear_extrude(height=2,scale=1)
text("PRUSA", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
color("red")
translate([x2-28,28,High0+72])
rotate([90,0,180])
linear_extrude(height=2,scale=1)
text("DUSA", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

}

//-------------------------------------------------------------------------------------------------------
module xright1(

){
  
difference(){
// boss
translate([-x2,-13,High0+22])
minkowski(convexity=8) {
  difference(){
    translate([0,2,0])
    cube([50,40-2,65]);
    translate([-3+56,-15,-1])
    rotate([0,0,45])
    cube([20,20,70]);
    translate([-4,-15,-1])
    rotate([0,0,45])
    cube([20,20,70]);
  }
  cylinder(r=2,h=2,$fn=F2);
}

if(1){   // all the cuts
  
// cut for right z rod plus clearance
translate([-(x2-30+zscrew+xrodscrew),0,15+42])
cylinder(r=5.2,h=350,$fn=F2);

// cut for right lm10u bearing lower plus clearance
translate([-(x2-30+zscrew+xrodscrew),0,High0+20])
cylinder(r=19.01/2,h=29,$fn=F2);

// cut for right lm10u bearing upper plus clearance
translate([-(x2-30+zscrew+xrodscrew),0,High0+60])
cylinder(r=19.01/2,h=29+1,$fn=F2);

// strain relief cut for M10 and bearings
translate([-(x2-30+zscrew+xrodscrew-0.5)-12,-10,High0+16])
rotate([0,0,-45])
cube([1,15,71]);

// add a cut so M10 could be pushed back out if needed
translate([-(x2-30+zscrew+xrodscrew+14),-10.5,High0+42])
rotate([0,0,-45])
cube([4,14,24]);

// arch the top to make printable
translate([-(x2-30+zscrew+xrodscrew+14),-10.5,High0+42])
rotate([0,45,-45])
cube([2.8,14,2.8]);

// cut right znut
color("red")
translate([-(x2-30+zscrew),0,High0+90-1])
rotate([180,0,0])
znut(holes=0,tol=0.15);

// cut right znut top clearance
color("blue")
translate([-(x2-30+zscrew),0,High0+90-4])
cylinder(r1=11,r2=12,h=4,$fn=F2);

// cut for znut mounting screws M3x20
translate([-(x2-30+zscrew),0,High0+90-2])
rotate([180,0,0]){
  translate([7.75,0,0])
  cylinder(r=1.5,h=20,$fn=F2);
  translate([-7.75,0,0])
  cylinder(r=1.5,h=20,$fn=F2);
}

// cuts for access to znut screws
translate([-(x2-30+zscrew),0,High0+11]){
  translate([7.75,0,0])
  cylinder(r=5.7/2,h=57,$fn=F2);
  translate([-7.75,0,0])
  cylinder(r=5.7/2,h=57,$fn=F2);
}

// cut right z screw
translate([-(x2-30+zscrew),0,15])
rotate([0,0,180])
zmotor(tol=0.15);

// extra clearance right z screw
translate([-(x2-30+zscrew),0,15])
rotate([0,0,180])
cylinder(r=4.5,h=350,$fn=F2);

// cut for upper x rod plus clearance
translate([-480/2,0+16,High0+zmotor1+34])
rotate([0,90,0])
cylinder(r=4+0.1,h=480,$fn=F2);

// upper x rod strain relief
translate([-480/2,0+16,High0+zmotor1+37])
rotate([0,90,0])
cylinder(r=2,h=480,$fn=9);

// check hole for upper x rod
translate([-(480/2-2.25),33,High0+zmotor1+34])
rotate([90,30,0])
cylinder(r=3,h=15,$fn=6);

// cut for lower x rod plus clearance
translate([-480/2,0+16,High0+30])
rotate([0,90,0])
cylinder(r=4+0.05,h=480,$fn=F2);

// lower x rod strain relief
translate([-480/2,0+16,High0+27])
rotate([0,90,0])
cylinder(r=2,h=480,$fn=9);

// check hole for lower x rod
translate([-(480/2-2.25),33,High0+30])
rotate([90,30,0])
cylinder(r=3,h=15,$fn=6);

// cut for right x motor
translate([-(480/2-30-xmot0),0+76,High0+zmotor2])
rotate([90,90,0])
xymotor(tol=0.15);

// cut for right x motor shaft
translate([-(480/2-30-xmot0),20,High0+zmotor2])
rotate([90,90,0])
cylinder(r=3,h=14,$fn=F2);

F3=22;
translate([-x2+28,65,High0+zmotor2])
rotate([90,0,0]){
    // x motor mounting holes,
    translate([15.5,15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([-15.5,15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([15.5,-15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);
    translate([-15.5,-15.5,30])
    cylinder(r=1.6,h=30,$fn=F3);

    // countersink for the heads
    // This one is special since it runs into the znut
    // tunnel to get screw in there
    translate([15.5,15.5,48])
    rotate([-6,7,0])
    cylinder(r=3,h=40,$fn=F3);
    // and a flat face for the head
    translate([15.5,15.5,41])
    cylinder(r=3,h=6,$fn=F3);
    
    // regular countersinks
    translate([-15.5,15.5,41])
    cylinder(r=3,h=40,$fn=F3);
    translate([15.5,-15.5,41])
    cylinder(r=3,h=40,$fn=F3);
    translate([-15.5,-15.5,41])
    cylinder(r=3,h=40,$fn=F3);
}

// main cut for belt, pulley, and idler
color("cyan")
translate([-(480/2+10),0+9.5,High0+37])
cube([90,9.5,37]);

// arch for printability
color("cyan")
translate([-(480/2+10),14.25,High0+39])
rotate([0,90,0])
scale([0.9,1,1])
cylinder(r=9.5/2,h=90,$fn=F2);

// clearance for pulley
translate([-(480/2-30-xmot0),9.5,High0+zmotor2])
rotate([-90,90,0])
cylinder(r=8,h=20,$fn=F2);

// idler attachment M3x20 screw
//translate([480/2-30-xmot0,26,High0+zmotor2-1.5])
translate([-(480/2-30-xmot0),26,High0+zmotor1+1.5])
rotate([90,90,0])
cylinder(r=1.55,h=20,$fn=F2);

// M3x30 head
//translate([480/2-30-xmot0,6,High0+zmotor2-1.5])
translate([-(480/2-30-xmot0),6,High0+zmotor1+1.5])
rotate([90,90,0])
cylinder(r=3,h=30,$fn=F2);

// idler attachment M3x30 nut
translate([-(480/2-24-xmot0),23,High0+zmotor1-2.0])
cube([12,6,9]);

// cut for the limit switch 
translate([-(x2-28+zscrew-2),-6.5,High0+90-34])
rotate([90,90,0])
switchcut();

// cut near limit switch to eliminate overhang
//translate([-(x2+zscrew-39),-15.5,High0+20])
//cube([9,10,14]);

// cut for ooze prevention arm  
translate([-(x2+zscrew-33),-8,High0+25.5]){
  translate([0,0,-3.5])
  cylinder(r=2.3,h=3.5,$fn=22);
  cylinder(r=1.65,h=3.5+5,center=true,$fn=22);
}
translate([-(x2+zscrew-33),8,High0+25.5]){
  translate([0,0,-3.5])
  cylinder(r=2.3,h=3.5,$fn=22);
  cylinder(r=1.65,h=3.5+5,center=true,$fn=22);
}
translate([-(x2+zscrew-18),-6,High0+25.5]){
  translate([0,0,-3.5])
  cylinder(r=2.3,h=3.5,$fn=22);
  cylinder(r=1.65,h=3.5+5,center=true,$fn=22);
}

// cut for left x motor wires
translate([-(480/2-xmot0-6),30,High0+zmotor1+19])
scale([1,1,2])
rotate([90,0,-15])
cylinder(r=2.5,h=45,$fn=F2);

// cut for limit switch wires
translate([-(x2+zscrew-23),-14,High0+36.4]) 
cube([4,6,19.2]);
translate([-(x2+zscrew+9),-10.5,High0+59])
scale([1,1,2])
rotate([0,94,0])
cylinder(r=1,h=35,$fn=20);

// pry out for limit switch
translate([-(x2+zscrew-35),-7.5,High0+44])
cube([8,2,4]);

// cut for visibility
//translate([-(x2-30+zscrew+50),-40,High0+20])
//cube([100,40,100]);


} // end if all cuts

}// end diff


  // text labels
  color("red")
  translate([-x2+28,28,High0+36])
  rotate([90,0,180])
  linear_extrude(height=2,scale=1)
  text("Tom Flint", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
  color("red")
  translate([-x2+28,28,High0+28])
  rotate([90,0,180])
  linear_extrude(height=2,scale=1)
  text("Mar 2020", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);


}
//-----------------------------------------------------  ******************************************************************************
module xooze(type=1){
  
difference(){
  // boss that screws on
  color("cyan")
  translate([x2+zscrew-45,-13,High0+16.5])
  cube([31,26,5.5]);
  
  // M3 mounting holes
  translate([x2+zscrew-33,-8,High0+25.5]){
    translate([0,0,-9.1])
    cylinder(r=1.5,h=3.5+5,$fn=22);
    translate([0,0,-9.1])
    cylinder(r=3,h=4.5,center=true,$fn=22);
  }
  translate([x2+zscrew-33,8,High0+25.5]){
    translate([0,0,-9.1])
    cylinder(r=1.5,h=3.5+5,$fn=22);
    translate([0,0,-9.1])
    cylinder(r=3,h=4.5,center=true,$fn=22);
  }
  color("pink")
  translate([x2+zscrew-18,-6,High0+25.5]){
    translate([0,0,-9.1])
    cylinder(r=1.5,h=3.5+5,$fn=22);
    translate([0,0,-9.1])
    cylinder(r=3,h=4.5,center=true,$fn=22);
  }
  hull(){
    // clearance z screw
    translate([x2-30+zscrew,0,15])
    rotate([0,0,180])
    cylinder(r=4.5,h=350,$fn=F2);

    translate([x2-10+zscrew,10,15])
    rotate([0,0,180])
    cylinder(r=8,h=350,$fn=F2);
  }
  // small rounded corner of boss
  translate([x2+zscrew-14,-13,High0+16])
  rotate([0,0,90])
  rounder(r=8,h=8,f=88);

  // large rounded corner of boss
  translate([x2+zscrew-14,13,High0+16])
  rotate([0,0,180])
  rounder(r=15,h=8,f=88);

  // small rounded corner near arm
  translate([x2+zscrew-45,13,High0+16])
  rotate([0,0,-90])
  rounder(r=5,h=8,f=88);

  // clearance for body of the BLtouch
  translate([x2+zscrew-45,-3,High0+16])
  cylinder(r=6.5,h=8,$fn=88);
}

difference(){
  union(){
    // plate block
    color("green")
    translate([x2+zscrew-96,-10,High0+9.8])
    rotate([0,-2,0])
    cube([28,14,3]);
  
    hull(){
      // front  arm anchor
      color("pink")
      translate([x2+zscrew-80,0,High0+10.3])
      rotate([0,-2,0])
      cube([12,4,4]);

      // front boss anchor
      color("orange")
      translate([x2+zscrew-45,3.5,High0+16.5])
      cube([1,4,5.5]);
    }
    hull(){
      // back  arm anchor
      color("pink")
      translate([x2+zscrew-80,-10,High0+10.3])
      rotate([0,-2,0])
      cube([12,4,4]);

      // back boss anchor
      color("orange")
      translate([x2+zscrew-45,-13,High0+16.5])
      cube([1,4,5.5]);
    }
  }
  
  // cut for metal plate
  color("orange")
  translate([x2+zscrew-102,-7,High0+11.8])
  rotate([0,-2,0])
  cube([31.5,8.3+0.15,0.8+0.15]); // add some extra clearance 0.15
  
  // cut for the hole in the plate
  translate([x2+zscrew-102.5+27.5,-7+4.15,High0+8])
  
  cylinder(r=1.7,h=5,$fn=22);  
}

  // metal plate
  if(0){
    color("orange")
    translate([x2+zscrew-102,-7,High0+11.8])
    rotate([0,-2,0])
    cube([31.5,8.3,0.8]);
  }

}
//=======================================================

// left limit switch 
if(0){
  color("red")
  translate([x2-28+zscrew,-5,High0+90-48])
  rotate([0,-90,90]){
    switch(ang1=0); 
    switch(ang1=12); 
  }
}

mirror([1,0,0])
xooze(type=1);

//translate([-350,0,0])
//xleft1();
if(0){
// This is a printing support enforcer for xleft1
color("pink")
translate([x2-30+zscrew+xrodscrew,0,High0+60-1])
cylinder(r=19.2/2-2,h=30,$fn=12);

color("orange")
translate([x2-30+zscrew,0,High0+76+7])
cylinder(r=10,h=6,$fn=12);

color("red")
translate([x2+zscrew-39,-13,High0+41])
cube([15,7,22]);  

color("pink")
translate([480/2-36-xmot0,23,High0+zmotor2-7])
cube([12,4.5,9]);

}

// right limit switch 
if(0){
  translate([-(x2-28+zscrew-2),ytoz-6.5,High0+90-34])
  rotate([90,90,0]){
    switch(ang1=0);
    switch(ang1=12);
  }
}

//xright1();
if(0){
// This is a printing support for xright1
color("pink")
translate([-(x2-30+zscrew+xrodscrew),0,High0+60-1])
cylinder(r=19.2/2-2,h=30,$fn=12);

color("orange")
translate([-(x2-30+zscrew),0,High0+83])
cylinder(r=10,h=6,$fn=12);

color("red")
translate([-(x2+zscrew-24),-13,High0+36])
cube([17,7,20]);  

color("pink")
translate([-(480/2-24-xmot0),23,High0+zmotor1-2.0])
cube([12,4.5,9]);

}


if(0){
  // left x motor
  color("gray")
  translate([480/2-30-xmot0,0+76,High0+zmotor1])
  rotate([90,90,0])
  xymotor();
}
if(0){

  color("pink")
  translate([480/2-30-xmot0,0+24,High0+zmotor1])
  rotate([90,90,0])
  pulley();

  color("orange")
  translate([480/2-30-xmot0,0+24-5,High0+zmotor2-1.5])
  rotate([90,90,0])
  idler();
}

if(0){
// upper x rod
color("orange")
translate([-480/2,0+16,High0+zmotor1+34])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);

// lower x rod
color("orange")
translate([-480/2,0+16,High0+30])
rotate([0,90,0])
cylinder(r=4,h=480,$fn=F2);
}

if(0){
//----------- red LEFT ------------------------------------
// left z motor
color("red")
translate([x2-30+zscrew,0,15])
rotate([0,0,180])
zmotor();

// left z rod
color("red")
translate([x2-30+zscrew+xrodscrew,0,57])
cylinder(r=5,h=350,$fn=F2);

// left lm10u bearing lower
color("red")
translate([x2-30+zscrew+xrodscrew,0,High0+20])
cylinder(r=19.2/2,h=29,$fn=F2);

// left lm10u bearing upper
color("red")
translate([x2-30+zscrew+xrodscrew,0,High0+60])
cylinder(r=19.2/2,h=29,$fn=F2);

// left znut
color("red")
translate([x2-30+zscrew,ytoz,High0+90-1])
rotate([180,0,0])
znut();

}

if(0){
// left extruder
color("gray")
translate([+480/2-LeftX0,ytoz+4,High0+26])
rotate([90,0,180])
import("aqua5.stl");
// left emotor
color("gray")
translate([+480/2-LeftX0+67,ytoz-55,High0+44])
rotate([90,-90,180])
emotor();
// Add a screw head for clearance check
color("pink")
translate([+480/2-LeftX0+95,ytoz-22.5,High0+80])
rotate([90,-90,180])
cylinder(r=6.8/2,h=4);
}


if(0){
// ----- green RIGHT --------------------------------------------
// right z motor
color("green")
translate([-x2+30-zscrew,0,15])
zmotor();

// right z rod
color("green")
translate([-x2+30-zscrew-xrodscrew,0,15+42])
cylinder(r=5,h=350,$fn=F2);

// right  lm10u bearing lower
color("green")
translate([-x2+30-zscrew-xrodscrew,0,High0+16])
cylinder(r=19.2/2,h=29,$fn=F2);

// right  lm10u bearing upper
color("green")
translate([-x2+30-zscrew-xrodscrew,0,High0+60])
cylinder(r=19.2/2,h=29,$fn=F2);

// right 
color("green")
translate([-x2+30-zscrew,0,High0+90-1])
rotate([180,0,0])
znut();

//-------orange-----------------
}
if(0){
// right x motor
color("blue")
translate([-480/2+30+xmot0,0+76,High0+zmotor2])
rotate([90,90,0])
xymotor();
}

if(0){
// right x motor pulley
color("red")
translate([-480/2+30+xmot0,0+24,High0+zmotor2])
rotate([90,90,0])
pulley();

color("green")
translate([-480/2+30+xmot0,0+24-5,High0+zmotor1+1.5])
rotate([90,90,0])
idler();
}





//===============================================
