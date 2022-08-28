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

arm1x = 40;     // length of arm1
arm1angle = 45;

arm2x = 40;     // length of arm2
arm2angle = 130;
arm2x0 = arm1x*cos(arm1angle);
arm2y0 = arm1x*sin(arm1angle);

arm3x = 40;
arm3angle = 130;
arm3x0 = arm1x*cos(arm1angle);
arm3y0 = arm1x*sin(arm1angle);

arm4x = 40;
arm4angle = 130;
arm4x0 = arm3x*cos(arm3angle);
arm4y0 = arm3x*sin(arm3angle);

x2 = 330;   // length of front rail
y2 = 140;   // distance between front and back rails
z2 = 20.5;    // height of cyclone board

$fn=89;


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

  // Add resolver chip master side  ------------------------------------------------------------------------------------------------------------------------------
  translate([122,55,thick]){
    // body
    cube([6.86, 6.86, 1.40], center=true);
    // legs
    for(i=[0:11]){
      translate([3.46,i*0.5-2.7,0])
      cube([1,0.22,1],center=true);
    }
  }
} 

//-------------------------------------------------------------------------------
// mounts for the PCB, left or right side, mount2 adds the brass heat-set nut
module mount2(x0=0){
  

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

    // cut for M3x6 and brass heat set insert
    translate([x0,9,9.9])
    cylinder(r=2.3,h=3.0+1);    
    
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
// much smaller pins from Adafruit, required for the Resolver project
module pin2(){
  
  $fn=16;
  cylinder(r1=0.01,r2=0.7/2,h=0.5);
  translate([0,0,0.5])
  cylinder(r=0.7/2,h=2.6);
  color("silver")
  translate([0,0,0.5+2.6])
  cylinder(r=1.0/2,h=13.3);
  
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
    if(pin==2){
      translate([arm2x+sin(pang)*10,0,-20])
      rotate([0,-pang,0])
      pin2();
    }
    
  }
  
  
}

//-------------------------------------------------------------------------------
// second arm for small pogos
module arm3(ang=0,pin=0,pang=20){

  rotate([0,0,ang]){
    difference(){
      union(){
      hull(){
        cylinder(r=5,h=6,$fn=89);        

        translate([arm3x/4,0,3])
        rotate([90,0,0])
        cylinder(r=3,h=6, center=true, $fn=89);        
        
      }
      hull(){
        translate([arm3x/4,0,3])
        rotate([90,0,0])
        cylinder(r=3,h=6, center=true, $fn=89);        
        
        translate([arm3x/2,0,3])
        rotate([90,0,0])
        cylinder(r=3,h=6, center=true, $fn=89);        
      }
      }
      // cut for M3x6 and brass heat set insert
      translate([0,0,-1]){
        cylinder(r=1.6,h=7);
        cylinder(r=2.3,h=3.0+1);
      }

      // cuts for the wiring
      translate([arm3x-35,0,-5])
      rotate([0,30,0])
      cylinder(r=1.0,h=20,$fn=77);
      
      // wrist joint cut for M3x6 and brass heat set insert
      translate([arm3x/2,3,3]){
        rotate([90,0,0]){
          cylinder(r=1.6,h=7);
          cylinder(r=2.3,h=3.0+1);
        }
      }
      

   }
    
  }
  
  
}

//-------------------------------------------------------------------------------
// short arm for small pogos
module arm4(ang=0,pin=0,pang=20){

translate([4,4,0]){
  rotate([0,0,ang]){
    difference(){
      hull(){
        translate([arm3x/2,0,3])
        rotate([90,0,0])
        cylinder(r=3,h=3, center=true, $fn=89);        

        // sleeve for pin
        translate([arm3x-sin(pang)*10,0,-12])
        intersection(){
          rotate([0,-pang,0])
          translate([0,0,-1])
          cylinder(r=1.5,h=8,$fn=89);
          translate([0,0,3])
          cube([20,20,6],center=true);
        }
      }

      // cut for the pin
      translate([arm3x-sin(pang)*10,0,-12])
      rotate([0,-pang,0])
      translate([0,0,-1])
      cylinder(r=0.5+0.1,h=20,$fn=77);

      // strain relief for the pin
      translate([arm3x,-0.25,-10-12])
      rotate([0,-pang,0])
      cube([8,0.5,40]);

      // wrist joint cut for M3x6
      translate([arm3x/2,3,3]){
        rotate([90,0,0]){
          cylinder(r=1.6,h=7);
        }
      }
   }
    
    // add the pin
    if(pin==1){
      translate([arm3x+sin(pang)*10,0,-20])
      rotate([0,-pang,0])
      pin1();
    }
    if(pin==2){
      translate([arm3x+sin(pang)-1,0,-20])
      rotate([0,-pang,0])
      pin2();
    }
    
  }
  
}
}

//-------------------------------------------------------------------------------
// first arm connects to post
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
      cylinder(r=1.0,h=20,$fn=77);

      translate([10,0,-5])
      rotate([0,30,0])
      cylinder(r=1.0,h=20,$fn=77);
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

//-----------------------------------------------------------------------------
// special probe for the resolver
module res1(){

  translate([122,55,1.5]){
   for(i=[-1:1]){
      translate([3.46,i*0.5-2.2,19])
      rotate([-10*i,0,0])
      pin2();
    }
  }  
}

//=================================================================================

// t-slot base, whole frame
if(1){
  translate([-10.5,0,0])
  color("silver")
  base1();
}

if(1){
  res1();
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
  mount2(x0=0);
  translate([0,58.2-9,0])
  mount2(x0=0);
  translate([0,121.2-9,0])
  mount2(x0=0);
  translate([0,181.35-9,0])
  mount2(x0=0);
}

// right rail mounts
if(0){
  translate([157,18,0])
  rotate([0,0,180])
  mount2(x0=0);
  translate([157,9+58.2,0])
  rotate([0,0,180])
  mount2(x0=0);
  translate([157,9+121.2,0])
  rotate([0,0,180])
  mount2(x0=0);
  translate([157,9+181.35,0])
  rotate([0,0,180])
  mount2(x0=0);
}


// example probe arm with big pogos
if(0){
  translate([10,-30,15]){
    post3(nuts=1);
    
    translate([7,30+6,zpost])
    arm1(ang=arm1angle);
    
    translate([7+arm2x0,30+6+arm2y0,zpost-6])
    arm2(ang=arm2angle,pin=1,pang=20);
    
  }
}

// example probe arm with small pogos
if(0){
  translate([10,-30,15]){
    post3(nuts=0);
    
    translate([7,30+6,zpost])
    arm1(ang=arm1angle);
    
    translate([7+arm3x0,30+6+arm3y0,zpost-6])
    arm3(ang=arm3angle,pin=2,pang=20);
    
    translate([7+arm3x0,30+6+arm3y0,zpost-6])
    arm4(ang=arm4angle,pin=2,pang=20);
  }
}

// DCC board
if(1){
  translate([0,0,18])
  dcc();

}

// for printing
//arm1();
//arm2(pang=20);
//post3(num=1);
//mount1(x0=0);
//mount2(x0=0);
//post4(num=1);
//arm3();
//arm4(pang=20);

if(0){
  for(i=[18:20]){
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
