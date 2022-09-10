//====================================================================
// Anderson.scad
// 
// Anderson PowerPole connector for 6 wires from 2 Lipo 13s1p batteries
// that will be inside a Vigor 1/2 size food tub 4" deep
//
// Dr Tom Flint, 21 August 2022
//====================================================================


use <./rounder.scad>

Num=4;    // Number of connectors
wire=10;  // Length of wire to show, 0 is allowed

//--------------------------------------------------------------------
module shell1(wire=0){

  difference(){
    // main body
    cube([24.6, 7.9, 7.9],center=true);
    
    // locking pin cuts
    translate([24.6/2-9.9, 7.9/2, 0])
    cylinder(r=1.3,h=10,$fn=22,center=true);
    translate([24.6/2-9.9, -7.9/2, 0])
    cylinder(r=1.3,h=10,$fn=22,center=true);
    
    // interlock slots, model as square but actually dovetails
    translate([-12.2/2-0.1, -7.9/2+0.15, 0])
    cube([12.22,0.32,3.5],center=true);
    
    translate([-12.2/2-0.1, 0, -7.9/2+0.15])
    cube([12.22,3.5,0.32],center=true);
        
    // end cut, simplified model
    translate([24.6/2-7.7/2+0.01, 0, -7.74/2+1.99])
    cube([7.74,9,4.2],center=true);
  } 
  

  // interlock tabs, model as square but actually dovetails
    translate([-12.2/2-0.1, 7.9/2+0.15, 0])
    cube([12.22,0.32,3.5],center=true);
  
    translate([-12.2/2-0.1, 0, 7.9/2+0.15])
    cube([12.22,3.5,0.32],center=true);

  // option to show wires
  if(wire>0){
    translate([-24.6/2-wire, 0,0])
    rotate([0,90,0])
    cylinder(r=2.2,h=wire,$fn=66);
  }
  
}

//--------------------------------------------------------------------
module shell1cut(wire=0){

T=0.2;

  difference(){
    // main body
    cube([24.6+T, 7.9+T, 7.9+T],center=true);
    
    // interlock slots, model as square but actually dovetails
    translate([-12.2/2-0.1-T, -7.9/2+0.15-T, 0])
    cube([12.22-T,0.32-T,3.5-T],center=true);
    
    translate([-12.2/2-0.1-T, 0, -7.9/2+0.15-T])
    cube([12.22-T,3.5-T,0.32-T],center=true);
        
  } 
  
  // locking pins
  translate([24.6/2-9.9, 7.9/2, 0])
  cylinder(r=1.3,h=20,$fn=22,center=true);
  translate([24.6/2-9.9, -7.9/2, 0])
  cylinder(r=1.3,h=20,$fn=22,center=true);
    

  // interlock tabs, model as square but actually dovetails
  translate([-12.2/2-0.1, 7.9/2+0.15, 0])
  cube([12.22+T,0.32+T,3.5+T],center=true);

  translate([-12.2/2-0.1, 0, 7.9/2+0.15])
  cube([12.22+T,3.5+T,0.32+T],center=true);

  // option to show wires
  if(wire>0){
    translate([-24.6/2-wire, 0,0])
    rotate([0,90,0])
    cylinder(r=2.2+T/2,h=wire,$fn=66);
  }
  
  
}

//--------------------------------------------------------------------
module shell4(N=4){

  for (i=[0:N-1]){
    translate([0,7.9*i,0])
    shell1(wire=10);
  }
  
}

//--------------------------------------------------------------------
module shell4cut(N=4){

  for (i=[0:N-1]){
    translate([0,7.9*i,0])
    shell1cut(wire=0);
  }
  
}

//--------------------------------------------------------------------
// Tub wall is about 9 degrees off vertical, compensate the attachment
// tabs to account for this fact.
module innerMount4(N=4){
  
  difference(){
    // main body
    translate([-10.5,-8,-6])
    cube([24.6-9.9, N*8+8, 12]);

    shell4cut(N=N);
  }
  
  translate([-15,0,0]){
    // mounting tabs
    difference(){
      translate([24.6-9.9-1,-8-8,-6])
      cube([6, 8, 8+4]);

      translate([10, -13, 0])
      rotate([0,90,0])
      cylinder(r=1.6,h=12,$fn=22);
      
      // cut for 6 degree tub walls
      translate([24.6-9.9-1+3,-8-8,-6])
      rotate([0,6,0])
      cube([6, 8, 8+6]);
      
    }
    translate([24.6-9.9-1,-8,-6])
    rotate([0,0,180])
    rounder(r=3,h=12,f=60);
    
    difference(){
      translate([24.6-9.9-1,N*8+8-8,-6])
      cube([6, 8, 8+4]);

      translate([10, N*8+5, 0])
      rotate([0,90,0])
      cylinder(r=1.6,h=12,$fn=22);

      // cut for 6 degree tub walls
      translate([24.6-9.9-1+3,N*8+8-8,-6])
      rotate([0,6,0])
      cube([6, 8, 8+6]);
      
    }

    translate([24.6-9.9-1,N*8,-6])
    rotate([0,0,90])
    rounder(r=3,h=12,f=60);
  }  
  
}

//--------------------------------------------------------------------
module outerMount4(N=4){
  
  difference(){
    // main body
    translate([-10.5,-8,-6])
    cube([24.6-9.9, N*8+8, 12+1.8]);

    shell4cut(N=N);
  }
    
    // mounting tabs
    difference(){
      translate([-10.5,-22,2])
      cube([24.6-9.9+2, 14, 4+1.8]);

      translate([2, -15, 0])
      scale([1,1.5,1])
      cylinder(r=2,h=12,$fn=22);        
    }
    
    translate([-10.5,-8,2])
    rotate([0,90,0])
    rotate([0,0,-90])
    rounder(r=3,h=14.7,f=90);
    
    difference(){
      translate([-10.5,N*8,2])
      cube([24.6-9.9+2, 14, 4+1.8]);

      translate([2, N*8+8, 0])
      scale([1,1.5,1])
      cylinder(r=2,h=12,$fn=22);        
    }
    
    translate([-10.5,N*8,2])
    rotate([0,90,0])
    rotate([0,0,0])
    rounder(r=3,h=14.7,f=90);
    
    
    // setup for 4 connectors
    translate([-5,12,-6])
    rotate([180,0,0])
    rotate([0,0,-90])
    linear_extrude(height=0.2,scale=1)
    text("AeroAmp", font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.1);

    // back lip
    translate([-10.5,-8-14,7])
    cube([5, N*8+8+28, 6]);

  
}

//====================================================================

//shell1(wire=wire);
//shell1cut(wire=wire);

//translate([0,30,0])
//difference(){
//  shell1cut(wire=wire);
//  shell1(wire=wire);
//}

//  color("cyan")
//  shell4(N=Num);

//  innerMount4(N=Num);

//  color("pink")
//  translate([24.6-7.8,0,0])
//  rotate([0,180,0])
//  shell4(N=Num);

//  translate([24.6-7.8,0,0])
//  rotate([0,180,0])
  outerMount4(N=Num);


//====================================================================

