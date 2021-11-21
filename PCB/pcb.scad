//=================================================================================
// pcb.scad
//
// T-slot frame and bolt-on holders for PCB and pogo-pin probes
// to help testing boards that have tiny test-point pads
//
// Location of holes in the DCC is exact from the mechanical drawing
// Location of connector on DCC is approximate by hand measuring
//
// Dr Tom Flint, 22 Oct 2021
//=================================================================================


use <../Parts/tslot.scad>
use <../Parts/rounder.scad>
use <../Parts/estop.scad>
use <../Parts/switch2.scad>


x1 = 167.5+10.5+60;      // length of front rail
y1 = 192.2+30;       // distance between front and back rail centers

zpost = 30;      // height of the post

arm1x = 50;     // length of arm1
arm1angle = 45;

arm2x = 40;     // length of arm2
arm2angle = 130;
arm2x0 = arm1x*cos(arm1angle);
arm2y0 = arm1x*sin(arm1angle);

arm3x = 40;     // length of arm1
arm3angle = 45;

arm4x = 40;     // length of arm2
arm4angle = 60;
arm4x0 = arm3x*cos(arm3angle);
arm4y0 = arm3x*sin(arm3angle);

x2 = 330;   // length of front rail
y2 = 140;   // distance between front and back rails
z2 = 20.5;    // height of cyclone board

$fn=89;

//---------------------------------------------------------------------------------
// adi ad7768 fmc board 
// no mounting holes provided?

module adc(tol=0,plugs=1){

thick=1.6;
  
  // board
  color("green")
  difference(){
    cube([174,103,thick]);
    
    translate([-0.1,103-34,-thick])
    cube([17.1,34.1,3*thick]);
    
    translate([10.8,3.5,0])
    cylinder(r=2.5/2,h=3*thick,center=true);

    translate([10.8,3.5+62.5,0])
    cylinder(r=2.5/2,h=3*thick,center=true);

  }
  
  // connectors
  // J2 Vrefs
  translate([77.5,0,thick])
  cube([19.2,8,8.5]);
  
  // Power plug
  translate([138.5,0,thick])
  cube([9,14,11]);
  
  // J3 Vrefs
  translate([174-7.5,4.5,thick])
  cube([7.5,11.5,9]);
  
  // J8-J9 terminal block
  translate([174-9.4,19.5,thick])
  cube([9.4,31.25,7.2]);
  
  // J16 terminal block
  translate([174-9.4,51.6,thick])
  cube([9.4,12.2,7.2]);
  
  // J13-J14 terminal block
  translate([174-9.4,64.5,thick])
  cube([9.4,31.25,7.2]);
  
  // FMC connector
  translate([2,6,-7])
  cube([13.5,56.65,7]);
    
  if(plugs==1){
    // J8-J9 terminal block
    color("green")
    translate([174,19.5,-2])
    cube([9.4,31.25,11.2]);
    
    // J16 terminal block
    color("green")
    translate([174,51.6,-2])
    cube([9.4,12.2,11.2]);
    
    // J13-J14 terminal block
    color("green")
    translate([174,64.5,-2])
    cube([9.4,31.25,11.2]);
  }
  
}
//---------------------------------------------------------------------------------
// Max31855 Thermocouple PMOD board 
module thermo(tol=0,plug=1,wire=1){

thick=1.6;
  
  // board
  color("green")
  cube([19.4,47.3,thick]);
  
  // main connector
  color("silver")
  translate([1.5,25.5,thick])
  cube([16.5,22,6.2]);
 
  // pmod pins
  color("black")
  translate([1.5,0,thick])
  cube([16.5,5.0,3.6]);
  
  // plug
  if(plug==1){
    color("yellow")
    translate([1.0,47.3,-0.5])
    cube([17,20.5,8.2]);

    color("gray")
    translate([19.4/2,47.3+20.5,3.5])
    rotate([-90,0,0])
    cylinder(r1=7.6/2,r2=5.7/2,h=18,$fn=89);
  }
  // wire
  if(wire==1){
    color("brown")
    translate([19.4/2,47.3+20.5,3.5])
    rotate([-90,0,0])
    cylinder(r=1.2,h=35,$fn=89);
  }
}

//---------------------------------------------------------------------------------
// cyclone board 
// mounting holes fit an M3 nicely

module cyclone(tol=0){

thick=2.0;
  
  // board
  color("green")
  difference(){
    cube([159.93,130.0,thick]);
    
    // mounting holes
    translate([5,5,0])
    cylinder(r=3.2/2,h=3*thick,center=true);

    translate([5,130-5,0])
    cylinder(r=3.2/2,h=3*thick,center=true);

    translate([159.93-5,130-5,0])
    cylinder(r=3.2/2,h=3*thick,center=true);

    translate([159.93-5,5,0])
    cylinder(r=3.2/2,h=3*thick,center=true);

    translate([159.93-7.75,37.5,0])
    cylinder(r=2.5/2,h=3*thick,center=true);

    translate([159.93-7.75,37.5+62.5,0])
    cylinder(r=2.5/2,h=3*thick,center=true);

  }
  
  // connectors
  // hdmi
  translate([18.75,0,thick])
  cube([16.5,12.6,6]);
  
  // usb
  translate([44,0,thick])
  cube([15,18,16]);

  // usb
  translate([68,0,thick])
  cube([15,18,16]);

  // ethernet
  translate([92,-3,thick])
  cube([16,21.5,13.8]);

  // SD card 
  translate([118,-1,thick])
  cube([14.3,18,2]);
  
  // micro usb
  translate([0,72,thick])
  cube([7,8,3]);
  
  // micro usb
  translate([0,88,thick])
  cube([7,8,3]);
  
  // power plug
  translate([0,106,thick])
  cube([15,9,11]);
  
  // pmod
  translate([40,130-16.5,thick])
  cube([16,16.5,5.5]);
  
  // pmod
  translate([63,130-16.5,thick])
  cube([16,16.5,5.5]);
  
  // pmod
  translate([86,130-16.5,thick])
  cube([16,16.5,5.5]);
  
  // pmod
  translate([108.5,130-16.5,thick])
  cube([16,16.5,5.5]);
  
  // fmc connector
  translate([143.6,40.5,thick])
  cube([13.5,57.5,6.5]);
  
  



}

//---------------------------------------------------------------------------------
// dcc board 
module dcc(tol=0){

thick=1.5;
  
  // board
  color("green")
  difference(){
    union(){
      translate([-10.5,0,0])
      cube([10.5+167.5,192.12,thick]);
      
      cylinder(r=5,h=thick);

      translate([166,181.35,0])
      cylinder(r=5,h=thick);
    }

    // two smaller holes in the tabs
    cylinder(r=4.5/2,h=thick*3,center=true);
    translate([166,181.35,0])
    cylinder(r=4.5/2,h=thick*3,center=true);
    
    // 12 larger holes in 3 columns, bottom up, left to right
    translate([0,9,0])
    cylinder(r=2.5,h=thick*3,center=true);
    translate([0,58.2,0])
    cylinder(r=2.5,h=thick*3,center=true);
    translate([0,121.2,0])
    cylinder(r=2.5,h=thick*3,center=true);
    translate([0,181.35,0])
    cylinder(r=2.5,h=thick*3,center=true);

    translate([78.75,17,0])
    cylinder(r=2.5,h=thick*3,center=true);
    translate([78.75,69.33,0])
    cylinder(r=2.5,h=thick*3,center=true);
    translate([78.75,121.67,0])
    cylinder(r=2.5,h=thick*3,center=true);
    translate([78.75,174.0,0])
    cylinder(r=2.5,h=thick*3,center=true);

    translate([157,9,0])
    cylinder(r=2.5,h=thick*3,center=true);
    translate([157,58.2,0])
    cylinder(r=2.5,h=thick*3,center=true);
    translate([157,121.2,0])
    cylinder(r=2.5,h=thick*3,center=true);
    translate([157,181.35,0])
    cylinder(r=2.5,h=thick*3,center=true);
    
    // 4 more slighty inside outer columns
    translate([16.22,6.72,0])
    cylinder(r=2.5,h=thick*3,center=true);
    translate([16.22,179.62,0])
    cylinder(r=2.5,h=thick*3,center=true);
    translate([140.22,6.72,0])
    cylinder(r=2.5,h=thick*3,center=true);
    translate([140.22,179.62,0])
    cylinder(r=2.5,h=thick*3,center=true);
    
    // rectangular cut
    translate([65.75,-1,-thick])
    cube([96.16-65.75,9+1,thick*3]);
  }  

}

//-------------------------------------------------------------------------------
// mounts for the PCB, left or right side
module mount1(x0=0){
  

  // lower body
  difference(){
    union(){
      translate([-10.5-0.5,9-7,-15])
      cube([6,14,30]);

      // post up to the pcb
      translate([x0,9,10])
      cylinder(r=2.5-0.15,h=9.5);
      
      translate([x0,9,10])
      cylinder(r=3.5,h=9.5-1.5);

      hull(){
        translate([x0,9,10])
        cylinder(r=3.5,h=5);

        translate([-10.5-0.5,9-7,10])
        cube([8,14,5]);
      }
      
      translate([-5,16,10])
      rotate([90,0,0])
      rotate([0,0,-90])
      rounder(h=14,r=2,f=45);

    }
    
    // cut for M3x16
    translate([x0,9,7])
    cylinder(r=1.7,h=16);
      
    // cut for t-slot
    translate([-10.5,0,0])
    translate([-15,0,0])
    rotate([-90,0,0])
    tslot1(type=1,len=y1-30,tol=0.2);
    
    // cut for M4x12 bolt, 6 mm thread space
    translate([-11,9,0])
    rotate([0,90,0])
    cylinder(r=2.0,h=6);
    
    // 45 degree cut at bottom
    translate([-10,-10,-15])
    rotate([0,45,0])
    cube([20,40,20]);

    // 45 degree trim to clear the arm posts
    translate([-35,-10,18.5])
    rotate([0,45,0])
    cube([20,40,20]);
    
  }
  
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
module washer1(){
  
  difference(){
    cylinder(r1=4.5,r2=3.5,h=2.0);
    cylinder(r=1.6,h=5,center=true);
  }
}


//-------------------------------------------------------------------------------
// second arm
module arm2(ang=0,pin=0,pang=20){

  rotate([0,0,ang]){
    difference(){
      hull(){
        cylinder(r=5,h=6,$fn=89);        

        // sleeve for pin
        translate([arm2x-sin(pang)*10,0,0])
        intersection(){
          rotate([0,-pang,0])
          translate([0,0,-1])
          cylinder(r=2,h=8,$fn=89);
          translate([0,0,3])
          cube([20,20,6],center=true);
        }
      }

      // cut for M3x6 and brass heat set insert
      translate([0,0,-1]){
        cylinder(r=1.6,h=7);
        cylinder(r=2.3,h=3.0+1);
      }

      // cut for nut and washer
      translate([0,0,-10])
      cylinder(r=6,h=10,$fn=22);

      // cut for the pin
      translate([arm2x-sin(pang)*10,0,0])
      rotate([0,-pang,0])
      translate([0,0,-1])
      cylinder(r=0.5+0.1,h=20,$fn=77);

      // strain relief for the pin
      translate([arm2x,-0.25,-10])
      rotate([0,-pang,0])
      cube([8,0.5,40]);

      // cuts for the wiring
      translate([arm2x-10,0,-5])
      rotate([0,-30,0])
      #cylinder(r=1.0,h=20,$fn=77);

//      translate([arm2x-25,0,-5])
//      rotate([0,0,0])
//      cylinder(r=1.0,h=20,$fn=77);

      translate([arm2x-30,0,-5])
      rotate([0,30,0])
      #cylinder(r=1.0,h=20,$fn=77);

   }
    
    // add the pin
    if(pin==1){
      translate([arm2x+sin(pang)*10,0,-20])
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
        cylinder(r=5,h=6,$fn=89);

        translate([arm1x,0,0])
        cylinder(r=5,h=6,$fn=89);
        
        translate([0,-5,0])
        cube([arm1x,10,6]);
      }
      
      // cuts for M3x16 bolts
      translate([0,0,-1])
      cylinder(r=1.7,h=6+2,$fn=89);
      translate([0,0,4])
      cylinder(r=5.6/2,h=3,$fn=89);

      translate([arm1x,0,-1])
      cylinder(r=1.7,h=6+2,$fn=89);
      translate([arm1x,0,4])
      cylinder(r=5.6/2,h=3,$fn=89);

      // cuts for the wiring
      translate([arm1x-10,0,-5])
      rotate([0,-30,0])
      #cylinder(r=1.0,h=20,$fn=77);

      translate([10,0,-5])
      rotate([0,30,0])
      #cylinder(r=1.0,h=20,$fn=77);
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
    translate([arm2x0,arm2y0,0])
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
module post3(nuts=0,num=8){
  
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

    // cut for M3x6 and brass heat set insert
    translate([7,30+6,zpost-6]){
      cylinder(r=1.6,h=7);
      cylinder(r=2.3,h=3.0+1);
    }
//    cylinder(r=1.7,h=10,$fn=22);
    
    // cut on base for tslot
    translate([0,15,-15])
    rotate([0,90,0])
    tslot1(type=1,len=30);

    // cut for access to tbolt
    translate([7,15,4])
    cylinder(r1=7.4/2,r2=8.5/2,h=zpost,$fn=99);
  
    // M4x12 tie downs to the T-slot
    translate([7,15,-8])
    cylinder(r=2.15,h=12,$fn=22);
  
    // diagonal cut for material reduction
    translate([-10,-10,-3])
    rotate([45,0,0])
    cube([100,100,100]);        

    // wire pass-through into the base
    translate([2,10,14.5])
    rotate([100,0,0])
    cylinder(r=1.0,h=60,$fn=22,center=true);
    
    // wire pass-through into the base
    translate([12,10,14.5])
    rotate([100,0,0])
    cylinder(r=1.0,h=60,$fn=22,center=true);
    
    // material reduction and pcb edge clearance near base
    translate([0,30,4])
    rotate([0,90,0])
    scale([2,1,1])
    cylinder(r=6,h=60,$fn=99,center=true);
    
    // text numbers
    color("red")
    translate([7,8,14.3])
    rotate([45,0,0])
    linear_extrude(height=0.5,scale=1)
    text(chr(64+num), font = "Open Sans:style=Bold", size=5,halign="center",valign="center",spacing=1.1);

    color("red")
    translate([-0.01+0.3,23,20])
    rotate([0,0,-90])
    rotate([90,0,0])
    linear_extrude(height=0.3,scale=1)
    text(chr(64+num), font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);

    color("red")
    translate([14.01-0.3,23,20])
    rotate([0,0,90])
    rotate([90,0,0])
    linear_extrude(height=0.3,scale=1)
    text(chr(64+num), font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
    
  }    
    
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
    translate([arm2x0,arm2y0,0])
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
// t-slot base for DCC
module base1(){
  
  // front rail
  translate([-30,-15,0])
  rotate([0,90,0])
  tslot1(type=1,len=x1);

  // back rail
  translate([-30,-15+y1,0])
  rotate([0,90,0])
  tslot1(type=1,len=x1);

  // left rail
  translate([-15,0,0])
  rotate([-90,0,0])
  tslot1(type=1,len=y1-30);

  // right rail
  translate([x1-45,0,0])
  rotate([-90,0,0])
  tslot1(type=1,len=y1-30);

  // left front
  color("pink")
  translate([-30,-30,-15])
  rotate([0,0,-90])
  rotate([0,180,0])
  lbrace();

}

//-------------------------------------------------------------------------------
// t-slot base for DAQ
module base2(){
  
  // front rail
  translate([15,0,0])
  rotate([0,90,0])
  tslot1(type=1,len=x2);

  // back rail
  translate([-15,y2,0])
  rotate([0,90,0])
  tslot1(type=1,len=x2);

  // left rail
  translate([0,-15,0])
  rotate([-90,0,0])
  tslot1(type=1,len=y2);

  // right rail
  translate([x2,15,0])
  rotate([-90,0,0])
  tslot1(type=1,len=y2);

  // left front
  color("pink")
  translate([-15,-15,-15])
  rotate([0,0,-90])
  rotate([0,180,0])
  lbrace();

}
//--------------------------------------------------------------
module foot2(){

  difference(){
    // main boss
    hull(){
      translate([7,7,-0.5])
      cylinder(r=7,h=6);
      translate([7,7+15+1,-0.5])
      cylinder(r=7,h=6);
    }
    
    // cut for tslot
    translate([0,15,-15])
    rotate([0,90,0])
    tslot1(type=1, len=60);
    
    // cut for M4x12
    translate([7,15,-1])
    cylinder(r=2,h=8);
    
    // cut for M3x6 and brass heat set insert
    translate([7,25,-1]){
      cylinder(r=1.6,h=7);
      cylinder(r=2.3,h=3.0+1);
    }
    
    // diagonal cut
    translate([0,0,0])
    rotate([30,0,0])
    cube([16,16,10]);
  }
}

//--------------------------------------------------------------
// support for the ADC signal header
module foot3(){

  difference(){
    // main boss
    union(){
      translate([11,34-12,0])
      cube([6,103+24,31]);
      translate([1,34-12,-0.5])
      cube([28,103+24,4.5]);

      // reinforce ends for M4x12
      hull(){
        translate([1,150-12,0])
        cube([28,12,4]);
        translate([10,150-12,31-4])
        cube([10,12,4]);
      }
      
      // reinforce ends for M4x12
      hull(){
        translate([1,33-12,0])
        cube([28,12,4]);
        translate([10,33-12,31-4])
        cube([10,12,4]);
      }
      
      // fillets
      translate([11,28,4])
      rotate([-90,0,0])
      rotate([0,0,180])
      rounder(r=10,h=120,f=89);

      translate([17,28,4])
      rotate([-90,0,0])
      rotate([0,0,-90])
      rounder(r=10,h=120,f=89);
    }

    // cuts for pcb
    translate([5,33,15])
    cube([20,104.5,2]);
    
    // cuts tall connector
    translate([5,33+3,15])
    cube([20,17,11]);
    
    // cuts tall connector backside pins
    translate([-1,33+3,11])
    cube([17,17,11]);
    
    // cuts for pcb
    translate([5,33+3,15])
    cube([20,95,9]);
    
    // cut for tslot
    translate([15,0,-15])
    rotate([-90,0,0])
    tslot1(type=1, len=160, tol=0.2);
    
    // cut for M4x16 and head clearance
    translate([15,150-7,-1])
    cylinder(r=2,h=40);
    translate([15,150-7,-6+16])
    cylinder(r=4,h=24);
    
    // cut for M4x16 and head clearance
    translate([15,33-7,-1])
    cylinder(r=2,h=40);
    translate([15,33-7,-6+16])
    cylinder(r=4,h=24);
    
    // bottom side cut for material reduction
    translate([14,128/2+42/2,-2])
    rotate([90,0,0])
    scale([1,1.3,1])
    cylinder(r=7,h=100,$fn=99,center=true);

    // round off the top rail
    translate([8,20,31])
    rotate([-90,0,0])
    rotate([0,0,0])
    rounder(r=6,h=160,f=89);

    translate([23,20,31])
    rotate([-90,0,0])
    rotate([0,0,90])
    rounder(r=8,h=160,f=89);

  }

}

//=================================================================================

// t-slot base, whole frame
if(0){
  translate([-10.5,0,0])
  color("silver")
  base1();
}


// left rail only
if(0){
  translate([-10.5,0,0])
  translate([-15,0,0])
  rotate([-90,0,0])
  tslot1(type=1,len=y1-30);
}

// left rail mounts
if(0){
  mount1(x0=0);
  translate([0,58.2-9,0])
  mount1(x0=0);
  translate([0,121.2-9,0])
  mount1(x0=0);
  translate([0,181.35-9,0])
  mount1(x0=0);
}

// right rail mounts
if(0){
  translate([157,18,0])
  rotate([0,0,180])
  mount1(x0=0);
  translate([157,9+58.2,0])
  rotate([0,0,180])
  mount1(x0=0);
  translate([157,9+121.2,0])
  rotate([0,0,180])
  mount1(x0=0);
  translate([157,9+181.35,0])
  rotate([0,0,180])
  mount1(x0=0);
}

// example probe arm
if(0){
  translate([60,-30,15]){
    post2(nuts=1);
    
    translate([7,30+6,zpost])
    arm1(ang=arm1angle);
    
    translate([7+arm2x0,30+6+arm2y0,zpost-6])
    arm2(ang=arm2angle,pin=1,pang=20);
    
  }
}

// example probe arm *******************************************
if(0){
  translate([10,-30,15]){
    post3(nuts=1);
    
    translate([7,30+6,zpost])
    arm1(ang=arm3angle);
    
    translate([7+arm4x0,30+6+arm4y0,zpost-6])
    arm2(ang=arm4angle,pin=1,pang=20);
    
  }
}

// DCC board
if(0){
  translate([0,0,18])
  dcc();

}

// Cyclone Board
if(0){
  translate([2,0,z2])
  cyclone();

}

// Feet for cyclone
if(0){
  color("white"){
  translate([0,-20,15])
  foot2();
  translate([14,150,15])
  rotate([0,0,180])
  foot2();

  translate([150,-20,15])
  foot2();
  translate([14+150,150,15])
  rotate([0,0,180])
  foot2();
}
}

// ADC Board
if(0){
  translate([159.93-7.75,37.5,0])
  translate([-10.8,-3.5,0])  
  translate([2,0,z2+9.6])
  adc(plugs=1);

}

// ADC board foot
if(0){
//  difference(){
  translate([300,0,15])  
  foot3();
//  translate([300,0,15])  
//  cube([100,100,100]);
//}
}


if(0){
  color("silver")
  translate([-15,-5,0])
  base2();
}

// thermocouple board in pmod
// unsure which row of sockets the pmods will use, Z offset may differ?
zoff=1.5;
if(0){
  translate([2,0]){
  translate([38.25,130,z2+zoff])
  thermo();
  translate([38.25+23,130,z2+zoff])
  thermo();
  translate([38.25+46,130,z2+zoff])
  thermo();
  translate([38.25+69,130,z2+zoff])
  thermo();
}
}

// for printing
arm1();
//arm2(pang=20);
//post3(num=1);
//mount1(x0=0);

if(0){
  for(i=[2:4]){
    translate([40*i,0,0])
    post3(num=i);
  }
}

if(0){
for(i=[0:7]){
  translate([0,8.75*i,0])
  washer1();
}
}

 
//=================================================================================
