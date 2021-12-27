//=================================================================================
// panelDCC.scad
//
// Control Panel for running DCC tests
//
// Dr Tom Flint, 7 Dec 2021
//=================================================================================


use <../Parts/tslot.scad>
use <../Parts/rounder.scad>
use <../Parts/estop.scad>
use <../Parts/switch2.scad>
use <../Parts/switchPaddle.scad>
use <../Parts/slidePot.scad>


x1=30;  // x for sliders and panel left edge
z1=-3;   // z for sliders

x2=60;  // x for paddle switches
z2=4;   // z for paddle

x3=60; // x for second set paddle switches

x4=95;  // x for PWM output loops
z4=0;

x5=40;  // x for LED indicator holes
z5=0;

pwms = ["X2","X1","CL","CU","BL","BU","AL","AU"];

//---------------------------------------------------------------------
module panel1(){
  
  // T-slot base
  if(0){  
    translate([15,100,-15])
    rotate([90,0,0])
    tslot1(type=1,len=200);
  }

  if(0){
    // slide pots for the HV_SCALED
    translate([x1,12,z1]) // master
    slidePot1();

    translate([x1,0,z1])  // slave
    slidePot1();
  }

  if(0){
    // top row of paddle switches = master
    for(i=[0:3]){
      translate([x2,35+20*i,z2])
      rotate([0,0,90])
      switchPaddle(position=1);
    }

    // second row of paddle switches = slave
    for(i=[0:3]){
      translate([x3,-75+20*i,z2])
      rotate([0,0,90])
      switchPaddle(position=1);
    }
  }

  if(0){ // show a single paddle switch
      translate([x2,35,z2])
      rotate([0,0,90])
      switchPaddle(position=1);
  }
  
  difference(){
    // panel
    color("gray")
    translate([50+5,10,1.5]) // master
    cube([100-5,200,3],center=true);
    
    // rounders
    translate([7.5,-90,-3]) 
    rounder(r=10,h=10,f=45);
    translate([7.5,-90+200,-3]) 
    rotate([0,0,-90])
    rounder(r=10,h=10,f=45);
    translate([102.5,-90+200,-3])
    rotate([0,0,180])
    rounder(r=10,h=10,f=45);
    translate([102.5,-90,-3])
    rotate([0,0,90])
    rounder(r=10,h=10,f=45);
    
    // bolt holes for M4 to the tslot frame
    translate([15,10,0])
    cylinder(r=2.2,h=10,center=true,$fn=45);
    translate([15,95,0])
    cylinder(r=2.2,h=10,center=true,$fn=45);
    translate([15,-75,0])
    cylinder(r=2.2,h=10,center=true,$fn=45);

    // two extra feet may be added
    translate([85,95,0])
    cylinder(r=2.2,h=10,center=true,$fn=45);
    translate([85,-75,0])
    cylinder(r=2.2,h=10,center=true,$fn=45);

if(1){
    // cuts for top row of paddle switches = master
    for(i=[0:3]){
      // switches
      translate([x2,35+20*i,z2])
      rotate([0,0,90])
      switchPaddleCut(tol=0.4);
      // led indicators
      translate([x5,35+20*i+3,z5])
      cylinder(r=1.6,h=10,center=true,$fn=22);
      translate([x5,35+20*i-3,z5])
      cylinder(r=1.6,h=10,center=true,$fn=22);
      // signal test points for scope
      translate([x5+35,35+20*i,z5])
      cylinder(r=1,h=10,center=true,$fn=22);
    }

    // cuts for second row of paddle switches = slave
    for(i=[0:3]){
      // switches
      translate([x3,-75+20*i,z2])
      rotate([0,0,90])
      switchPaddleCut(tol=0.4);
      // led indicators
      translate([x5,-75+20*i+3,z5])
      cylinder(r=1.6,h=10,center=true,$fn=22);
      translate([x5,-75+20*i-3,z5])
      cylinder(r=1.6,h=10,center=true,$fn=22);
      // signal test points for scope
      translate([x5+35,-75+20*i,z5])
      cylinder(r=1,h=10,center=true,$fn=22);
    }

    // cut for slide pots for the HV_SCALED
    translate([x1,12,z1]) // master
    slidePotCut1(tol=0.2);
    // testpoints for the signals too
    translate([x1+65,12+5,0]) 
    cylinder(r=1,h=10,center=true,$fn=22);

    translate([x1,0,z1])  // slave
    slidePotCut1(tol=0.2);
    translate([x1+65,5,0]) 
    cylinder(r=1,h=10,center=true,$fn=22);
    
    // cuts for PWM output loops
    for(i=[0:7]){
      translate([x4,30+10*i,z4])
      cylinder(r=1,h=10,center=true,$fn=22);
    }
    for(i=[0:7]){
      translate([x4,-80+10*i,z4])
      cylinder(r=1,h=10,center=true,$fn=22);
    }
}
    // labels on the testpoints
    if(1){
      for(i=[0:7]){
        translate([x4-8,30+10*i,z4-0.8])
        color("red")
        translate([0,0,2.9])
        linear_extrude(height=1,scale=1)
        text(pwms[i], font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.1);
      }
      for(i=[0:7]){
        translate([x4-8,-80+10*i,z4-0.8])
        color("red")
        translate([0,0,2.9])
        linear_extrude(height=1,scale=1)
        text(pwms[i], font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.1);
      }
    }

  }
  
}

//====================================================================

panel1();

if(0){  
  difference(){
    panel1();
    color("red")
    translate([50,146,0]) // master
    cube([120,200,20],center=true);
    color("green")
    translate([50,-90,0]) // master
    cube([120,200,20],center=true);
  }
}


//====================================================================
