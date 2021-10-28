//=================================================================================
// pcb.scad
//
// T-slot frame and bolt-on holders for PCB and pogo-pin probes
// to help testing boards that have tiny test-point pads
//
// @TODO simplify arm2 for printability, add wiring loop to stress relieve the pin
//
// Dr Tom Flint, 22 Oct 2021
//=================================================================================


use <../Parts/tslot.scad>
use <../Parts/rounder.scad>
use <../Parts/estop.scad>
use <../Parts/switch2.scad>


x1 = 192+60;      // length of front rail
y1 = 178+30;       // distance between front and back rail centers

zpost = 30;      // height of the post

arm1x = 40;     // length of arm1
arm1angle = 40;

arm2x = 40;     // length of arm2
arm2angle = 130;
arm2x0 = arm1x*cos(arm1angle);
arm2y0 = arm1x*sin(arm1angle);


arm3x = 40;     // length of arm3
arm3angle = 90;

arm4x = 40;     // length of arm2
arm4angle = 90;
arm4x0 = arm3x*cos(arm3angle);
arm4y0 = arm3x*sin(arm3angle);

//---------------------------------------------------------------------------------
// dcc board 
module dcc(tol=0){

  // board
  color("green")
  cube([192,178,1.5]);
}

//-------------------------------------------------------------------------------
module pin1(){
  
  $fn=16;
  cylinder(r1=0.01,r2=1.3/2,h=1.0);
  translate([0,0,1.0])
  cylinder(r=1.3/2,h=1.5);
  color("silver")
  translate([0,0,1.0+1.5])
  cylinder(r=0.73/2,h=6);
  translate([0,0,1.0+1.5+6])
  cylinder(r=1.0/2,h=25.4);
  
}
//-------------------------------------------------------------------------------
// second arm
module arm2(ang=0,pin=0){

  rotate([0,0,ang]){
    difference(){
      hull(){
        cylinder(r=7,h=6,$fn=89);        

        // sleeve for pin
        translate([arm2x-sin(20)*10,0,-20+10])
        rotate([0,-20,0])
        cylinder(r=2,h=6,$fn=89);
      }

      // cut for M3x16 bolt
      translate([0,0,-1])
      cylinder(r=1.7,h=10,$fn=22);

      // cut for nut and washer
      translate([0,0,-10])
      cylinder(r=6,h=10,$fn=22);

      // cut for the pin
      translate([arm2x,0,-20])
      rotate([0,-20,0])
      cylinder(r=0.5+0.1,h=20,$fn=77);

      // strain relief for the pin
      translate([arm2x,-0.25,-20])
      rotate([0,-20,0])
      cube([10,0.5,40]);
   }
    
    // add the pin
    if(pin==1){
      translate([arm2x,0,-20])
      rotate([0,-20,0])
      pin1();
    }
    
  }
  
  
}

//-------------------------------------------------------------------------------
// second arm
module arm4(ang=0,pin=0){

  rotate([0,0,ang]){
    difference(){
      hull(){
        cylinder(r=5,h=6,$fn=89);        

        // sleeve for pin
        translate([arm4x-sin(0)*10,0,0])
        rotate([0,0,0])
        cylinder(r=2,h=6,$fn=89);
      }

      // cut for M3x16 bolt
      translate([0,0,-1])
      cylinder(r=1.7,h=10,$fn=22);

      // cut for nut and washer
      translate([0,0,-10])
      cylinder(r=6,h=10,$fn=22);

      // cut for the pin
      translate([arm4x,0,-5])
      rotate([0,0,0])
      cylinder(r=0.5+0.1,h=20,$fn=77);

      // strain relief for the pin
      translate([arm4x,-0.25,-20])
      rotate([0,0,0])
      cube([10,0.5,40]);

      // cuts for the wiring
      translate([arm4x-20,0,-5])
      rotate([0,0,0])
      cylinder(r=0.8,h=20,$fn=77);

      translate([arm4x-25,0,-5])
      rotate([0,0,0])
      cylinder(r=0.8,h=20,$fn=77);

      translate([arm4x-30,0,-5])
      rotate([0,0,0])
      cylinder(r=0.8,h=20,$fn=77);

   }
    
    // add the pin
    if(pin==1){
      translate([arm4x,0,-20])
      rotate([0,0,0])
      pin1();
    }
    
  }
  
  
}

//-------------------------------------------------------------------------------
// second arm
module arm5(ang=0,pin=0,pang=20){

  rotate([0,0,ang]){
    difference(){
      hull(){
        cylinder(r=5,h=6,$fn=89);        

        // sleeve for pin
        translate([arm4x-sin(pang)*10,0,0])
        intersection(){
          rotate([0,-pang,0])
          translate([0,0,-1])
          cylinder(r=2,h=8,$fn=89);
          translate([0,0,3])
          cube([20,20,6],center=true);
        }
      }

      // cut for M3x16 bolt
      translate([0,0,-1])
      cylinder(r=1.7,h=10,$fn=22);

      // cut for nut and washer
      translate([0,0,-10])
      cylinder(r=6,h=10,$fn=22);

      // cut for the pin
      translate([arm4x-sin(pang)*10,0,0])
      rotate([0,-pang,0])
      translate([0,0,-1])
      cylinder(r=0.5+0.1,h=20,$fn=77);

      // strain relief for the pin
      translate([arm4x,-0.25,-10])
      rotate([0,-pang,0])
      cube([8,0.5,40]);

      // cuts for the wiring
      translate([arm4x-20,0,-5])
      rotate([0,0,0])
      cylinder(r=1.0,h=20,$fn=77);

      translate([arm4x-25,0,-5])
      rotate([0,0,0])
      cylinder(r=1.0,h=20,$fn=77);

      translate([arm4x-30,0,-5])
      rotate([0,0,0])
      cylinder(r=1.0,h=20,$fn=77);

   }
    
    // add the pin
    if(pin==1){
      translate([arm4x+sin(pang)*10,0,-20])
      rotate([0,-pang,0])
      pin1();
    }
    
  }
  
  
}
//-------------------------------------------------------------------------------
// first arm
module arm1(ang=0){

  rotate([0,0,ang]){
    difference(){
      color("cyan")
      union(){
        cylinder(r=9,h=6,$fn=89);

        translate([arm1x,0,0])
        cylinder(r=7,h=6,$fn=89);
        
        translate([0,-5,0])
        cube([arm1x,10,6]);
      }
      
      // cuts for M3x16 bolts
      translate([0,0,-1])
      cylinder(r=1.7,h=6+2,$fn=89);

      translate([arm1x,0,-1])
      cylinder(r=1.7,h=6+2,$fn=89);
    }
  }
}

//-------------------------------------------------------------------------------
// redux first arm
module arm3(ang=0){

  rotate([0,0,ang]){
    difference(){
      color("cyan")
      union(){
        cylinder(r=5,h=6,$fn=89);

        translate([arm3x,0,0])
        cylinder(r=5,h=6,$fn=89);
        
        translate([0,-5,0])
        cube([arm3x,10,6]);
      }
      
      // cuts for M3x16 bolts
      translate([0,0,-1])
      cylinder(r=1.7,h=6+2,$fn=89);

      translate([arm3x,0,-1])
      cylinder(r=1.7,h=6+2,$fn=89);
    }
  }
}

//-------------------------------------------------------------------------------
module post1(nuts=0){
  
  difference(){
    
    // post
    union(){
      translate([0,0,-0.5])
      intersection(){
        cube([30,30,zpost+0.5]);
        translate([15,15,0])
        cylinder(r=18,h=zpost+0.5,$fn=99);
      }
    
      // tab for arm 1
      translate([15,30,zpost-6])
      scale([1,1.3,1])
      cylinder(r=10,h=6,$fn=99);
    }
      
    // cut for arm1 bolt M3x16, should have 12 mm grip
    translate([15,30+4,zpost-8])
    cylinder(r=1.7,h=10,$fn=22);
    
    // cut on base for tslot
    translate([0,15,-15])
    rotate([0,90,0])
    tslot1(type=1,len=30);

    // cut for access to tbolt
    translate([15,15,4.5])
    cylinder(r1=7,r2=10,h=zpost,$fn=99);
  
    // M6 tie downs to the T-slot
    translate([15,15,-1])
    cylinder(r=3,h=20,$fn=22);
  
    // diagonal cut for material reduction
    translate([-10,-10,-3])
    rotate([45,0,0])
    cube([100,100,100]);        
    
  }    
    
  // bolt and nut
  if(nuts==1){
    color("red"){
      // nut and washer space
      translate([15,30+4,zpost-6-3])
      cylinder(r=7/2,h=3,$fn=22);

      // M3 shaft
      translate([15,30+4,zpost-6])
      cylinder(r=3/2,h=12,$fn=22);

      // head and washer space
      translate([15,30+4,zpost+6])
      cylinder(r=7/2,h=3.6,$fn=22);
    }
    translate([arm2x0,arm2y0,0])
    color("blue"){
      // nut and washer space
      translate([15,30+4,zpost-6-3])
      cylinder(r=7/2,h=3,$fn=22);

      // M3 shaft
      translate([15,30+4,zpost-6])
      cylinder(r=3/2,h=12,$fn=22);

      // head and washer space
      translate([15,30+4,zpost+6])
      cylinder(r=7/2,h=3.6,$fn=22);
    }
  }
    
}

//-------------------------------------------------------------------------------
module post2(nuts=0){
  
  difference(){
    
    // post
    union(){
      translate([0,0,-0.5])
      cube([14,30,zpost+0.5]);
    
      // tab for arm 1
      hull(){
        translate([7,30+6,zpost-6])
        cylinder(r=5,h=6,$fn=99);

        translate([0,0,zpost-6])
        cube([14,30,6]);
      }
    }
      
    // cut for arm1 bolt M3x16, should have 12 mm grip
    translate([7,30+6,zpost-8])
    cylinder(r=1.7,h=10,$fn=22);
    
    // cut on base for tslot
    translate([0,15,-15])
    rotate([0,90,0])
    tslot1(type=1,len=30);

    // cut for access to tbolt
    translate([7,15,4.5])
    cylinder(r1=5.5,r2=6,h=zpost,$fn=99);
  
    // M6 tie downs to the T-slot
    translate([7,15,-1])
    cylinder(r=3,h=20,$fn=22);
  
    // diagonal cut for material reduction
    translate([-10,-10,-3])
    rotate([45,0,0])
    cube([100,100,100]);        
    
  }    
    
    color("pink")
    translate([0,30,zpost-6+0])
    rotate([0,90,0])
    rounder(r=3,h=14,f=45);



  // bolt and nut
  if(nuts==1){
    color("red"){
      // nut and washer space
      translate([7,30+6,zpost-6-3])
      cylinder(r=7/2,h=3,$fn=22);

      // M3 shaft
      translate([7,30+6,zpost-6])
      cylinder(r=3/2,h=12,$fn=22);

      // head and washer space
      translate([7,30+6,zpost+6])
      cylinder(r=7/2,h=3.6,$fn=22);
    }
    translate([arm4x0,arm4y0,0])
    color("blue"){
      // nut and washer space
      translate([7,30+6,zpost-6-3])
      cylinder(r=7/2,h=3,$fn=22);

      // M3 shaft
      translate([7,30+6,zpost-6])
      cylinder(r=3/2,h=12,$fn=22);

      // head and washer space
      translate([7,30+6,zpost+6])
      cylinder(r=7/2,h=3.6,$fn=22);
    }
  }
    
}

//-------------------------------------------------------------------------------
// t-slot base
module base1(){
  
  // front rail
  rotate([0,90,0])
  tslot1(type=1,len=x1);

  // back rail
  translate([0,y1,0])
  rotate([0,90,0])
  tslot1(type=1,len=x1);

  // left rail
  translate([15,15,0])
  rotate([-90,0,0])
  tslot1(type=1,len=y1-30);

  // right rail
  translate([x1-15,15,0])
  rotate([-90,0,0])
  tslot1(type=1,len=y1-30);

  // left front
  color("pink")
  translate([0,-15,-15])
  rotate([0,0,-90])
  rotate([0,180,0])
  lbrace();

}

//=================================================================================

//base1();

// into post-frame
if(0){
  translate([50,-15,15]){
    post2(nuts=1);
    
    translate([7,30+6,zpost])
    arm3(ang=arm3angle);
    
    translate([7+arm4x0,30+6+arm4y0,zpost-6])
    arm4(ang=arm4angle,pin=1);
    
  }
}


// into post-frame
if(0){
  translate([150,-15,15]){
    post2(nuts=1);
    
    translate([7,30+6,zpost])
    arm3(ang=arm3angle);
    
    translate([7+arm4x0,30+6+arm4y0,zpost-6])
    arm5(ang=arm4angle,pin=1,pang=20);
    
  }
}


// into board-frame
if(0){
  translate([30,15,17.6]){
    
    dcc();

  }
  
}

// for printing
arm3();
//arm5(pang=20);
//post2();



 
//=================================================================================
