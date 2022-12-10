//====================================================================
// chalkStick.scad
// 
// Holder for sidewalk chalk on the end of bamboo stick
//
// Dr Tom Flint, 7 August 2022
//====================================================================


use <../Parts/threads.scad>


Tpitch=5;
Tdiam=40;
Ttaper=0.2;

//--------------------------------------------------------------------
module chalk(){
  
  cylinder(r1=21.5/2, r2=24.5/2, h=105);
}


//--------------------------------------------------------------------
module bamboo(){
  
  translate([0,0,20])
  difference(){
    // outer
    cylinder(r=29/2+3, h=300);
    translate([0,0,-1])
    
    // bore hole
    cylinder(r=29/2, h=300);
    
    // strain relief
    translate([0,0,39])
    cube([2,40,80],center=true);  
  }
}

//--------------------------------------------------------------------
module grip(){

if(1){
  // gripper part
  difference(){
    // thread
    metric_thread(diameter=Tdiam, pitch=Tpitch, length=40, internal=false, taper=Ttaper, leadin=1);
    // bore hole
    translate([0,0,-1])
    cylinder(r=25/2,h=50, $fn=99);
    // 3 cuts to allow flex
    translate([0,20,40])
    cube([4,30,80],center=true);  
    rotate([0,0,120])
    translate([0,20,40])
    cube([4,30,80],center=true);  
    rotate([0,0,-120])
    translate([0,20,40])
    cube([4,30,80],center=true);  
    
  }
}
  // sleeve into bamboo
  translate([0,0,-50])
  difference(){
    // outer matches bamboo inner
    cylinder(r=29/2, h=50, $fn=18);
    // bore hole matches max chalk
    
    translate([0,0,-1])
    cylinder(r=25/2, h=60, $fn=99);
    
    // 3 cuts to allow flex
    translate([0,20,45])
    cube([4,30,60],center=true);  
    rotate([0,0,120])
    translate([0,20,45])
    cube([4,30,60],center=true);  
    rotate([0,0,-120])
    translate([0,20,45])
    cube([4,30,60],center=true);  
    
    // circular strain relief at bottom of slots
    rotate([0,0,120])
    translate([0,20,16])
    rotate([90,0,0])
    cylinder(r=3,h=10,$fn=33);
    rotate([0,0,-120])
    translate([0,20,16])
    rotate([90,0,0])
    cylinder(r=3,h=10,$fn=33);
    translate([0,20,16])
    rotate([90,0,0])
    cylinder(r=3,h=10,$fn=33);
    
  }
  // section to hold onto when adjusting the taper nut
  translate([0,0,-10])
  difference(){
    cylinder(r=29/2+6, h=10, $fn=16);
    translate([0,0,-1])
    cylinder(r=25/2, h=60, $fn=99);
    // 3 cuts to allow flex
    translate([0,20,0])
    cube([4,30,20],center=true);  
    rotate([0,0,120])
    translate([0,20,0])
    cube([4,30,20],center=true);  
    rotate([0,0,-120])
    translate([0,20,0])
    cube([4,30,20],center=true);  
  }
  
  // lip
  translate([0,0,-16])
  difference(){
    cylinder(r1=29/2,r2=29/2+6, h=6, $fn=99);
    translate([0,0,-1])
    cylinder(r=25/2, h=60, $fn=99);
    // 3 cuts to allow flex
    translate([0,20,0])
    cube([4,30,20],center=true);  
    rotate([0,0,120])
    translate([0,20,0])
    cube([4,30,20],center=true);  
    rotate([0,0,-120])
    translate([0,20,0])
    cube([4,30,20],center=true);  
  }
  
  // add some tabs to increase bed adhesion
    rotate([0,0,120])
    translate([0,16,-50+0.3])
    cube([6,6,0.6],center=true);  
    rotate([0,0,-120])
    translate([0,16,-50+0.3])
    cube([6,6,0.6],center=true);  
    translate([0,16,-50+0.3])
    cube([6,6,0.6],center=true);  
  
  
  
}

//--------------------------------------------------------------------
module nut(){
  difference(){
    // outer nut
    translate([0,0,21])
    cylinder(r1=Tdiam/2+3,r2=Tdiam/2+1, h=20,$fn=12);
    // thread cut    
    translate([0,0,20])
    metric_thread(diameter=Tdiam-2, pitch=Tpitch, length=40, internal=true, taper=Ttaper, leadin=0);
  }
}

//--------------------------------------------------------------------


//====================================================================

if(0){
  color("green")
  translate([0,0,10])
  rotate([180,0,0])
  bamboo();

  translate([0,0,100])
  rotate([180,0,0])
  chalk();
}

if(1){
  difference(){
    grip();
    translate([-100,0,-100])
    cube([200,200,200]);
  }

  difference(){
    color("cyan")
    translate([0,0,-5.5])
    nut();
    translate([-100,0,-100])
    cube([200,200,200]);
  }
}

//grip();

//nut();



//====================================================================

