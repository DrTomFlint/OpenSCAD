//====================================================================
// Anderson.scad
// 
// Anderson PowerPole connector for 6 wires from 2 Lipo 13s1p batteries
// that will be inside a Vigor 1/2 size food tub 4" deep
//
// Dr Tom Flint, 21 August 2022
//====================================================================


wire=10;
use <./rounder.scad>

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
module shell6(){

  for (i=[0:5]){
    translate([0,7.9*i,0])
    shell1(wire=10);
  }
  
}

//--------------------------------------------------------------------
module shell6cut(){

  for (i=[0:5]){
    translate([0,7.9*i,0])
    shell1cut(wire=0);
  }
  
}

//--------------------------------------------------------------------
// Tub wall is about 9 degrees off vertical, compensate the attachment
// tabs to account for this fact.
module innerMount(){
  
  difference(){
    // main body
    translate([-10.5,-8,-6])
    cube([24.6-9.9, 6*8+8, 12]);

    shell6cut();
  }
  
  translate([-20,0,0]){
    // mounting tabs
    difference(){
      translate([24.6-9.9-1,-8-8,-6])
      cube([6, 8, 8+4]);

      translate([10, -13, 0])
      rotate([0,90,0])
      cylinder(r=1.6,h=12,$fn=22);
      
      // cut for 9 degree tub walls
      translate([24.6-9.9-1+3,-8-8,-6])
      rotate([0,9,0])
      cube([6, 8, 8+6]);
      
    }
    translate([24.6-9.9-1,-8,-6])
    rotate([0,0,180])
    rounder(r=3,h=12,f=60);
    
    difference(){
      translate([24.6-9.9-1,6*8+8-8,-6])
      cube([6, 8, 8+4]);

      translate([10, 6*8+5, 0])
      rotate([0,90,0])
      cylinder(r=1.6,h=12,$fn=22);

      // cut for 9 degree tub walls
      translate([24.6-9.9-1+3,6*8+8-8,-6])
      rotate([0,9,0])
      cube([6, 8, 8+6]);
      
    }

    translate([24.6-9.9-1,6*8,-6])
    rotate([0,0,90])
    rounder(r=3,h=12,f=60);
  }  
  
}

//--------------------------------------------------------------------
module outerMount(){
  
  difference(){
    // main body
    translate([-10.5,-8,-6])
    cube([24.6-9.9, 6*8+8, 12]);

    shell6cut();
  }
    
    // mounting tabs
    difference(){
      translate([-10.5,-20,2])
      cube([24.6-9.9, 12, 4]);

      translate([-3, -15, 0])
      cylinder(r=2,h=12,$fn=22);        
    }
    
    translate([-10.5,-8,2])
    rotate([0,90,0])
    rotate([0,0,-90])
    rounder(r=3,h=14.7,f=90);
    
    difference(){
      translate([-10.5,6*8,2])
      cube([24.6-9.9, 12, 4]);

      translate([-3, 6*8+8, 0])
      cylinder(r=2,h=12,$fn=22);        
    }
    
    translate([-10.5,6*8,2])
    rotate([0,90,0])
    rotate([0,0,0])
    rounder(r=3,h=14.7,f=90);
    
  
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
//  shell6();

//  translate([0,0,40])
//  color("pink")
//  shell6cut();

//  innerMount();

//  color("pink")
//  translate([24.6-7.8,0,0])
//  rotate([0,180,0])
//  shell6();

//  translate([24.6-7.8,0,0])
//  rotate([0,180,0])
  outerMount();


//====================================================================

