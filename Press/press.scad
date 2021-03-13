//====================================================
// press.scad
// Drill press using T-slot
//
// Dr Tom Flint, 21 March 2021
//====================================================

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <../Parts/presstime.scad>


// vertical post
postHi=480;
footLong=240;
footSide=120;

railX=30;    // position of the rails
railY=35;
railZ=102;

sledZ=200;
sledHi=50;

//----------------------------------------------------
module stand1(){

    
    // post
    tslot1(type=2,len=postHi);
    
    translate([-15,15,0])
    rotate([0,0,180])
    rotate([90,0,0])      
    tbrace();

    translate([-15,-15,0])
    rotate([0,0,180])
    rotate([90,0,0])      
    tbrace();
  
    // front foot
    translate([-15-60,0,-15])
    rotate([0,90,0])
    tslot1(type=2,len=footLong);

    // right foot
    translate([0,30,-15])
    rotate([-90,0,0])      
    tslot1(type=1,len=footSide);

    translate([0,30,0])
    rotate([0,0,90])
    rotate([90,0,0])      
    tbrace();

    // left foot
    translate([0,-30-footSide,-15])
    rotate([-90,0,0])      
    tslot1(type=1,len=footSide);

    translate([0,-30,0])
    rotate([0,0,-90])
    rotate([90,0,0])      
    tbrace();

    // rail
    translate([railX,railY,railZ])
    cylinder(r=5,h=330,$fn=66);
    translate([railX,-railY,railZ])
    cylinder(r=5,h=330,$fn=66);

}

//----------------------------------------------------
module railBlock(tol=0.2){

  difference(){
    minkowski(){
      hull(){
        translate([railX,railY,-6])
        cylinder(r=11,h=14,$fn=88);
        translate([railX,-railY,-6])
        cylinder(r=11,h=14,$fn=88);
        translate([15-1,-56/2,-6-6])
        cube([2,56,14+6]);
        
      }
      sphere(r=1,$fn=88);
    }
    // rails
    translate([railX,railY,0])
    cylinder(r=5+tol,h=30,$fn=66);
    translate([railX,-railY,0])
    cylinder(r=5+tol,h=30,$fn=66);
    
    // thru hole strain relief for rails
    translate([railX-5,railY+1,-40])
    cylinder(r=1.5,h=80,$fn=66);
    translate([railX-5,-railY-1,-40])
    cylinder(r=1.5,h=80,$fn=66);

    // post
    translate([0,0,-40])
    tslot1(type=2,len=120);
    
    // M4 bolts to the post
    translate([0,15,0])
    rotate([0,90,0])
    cylinder(r=2,h=60,$fn=88);
    translate([0,-15,0])
    rotate([0,90,0])
    cylinder(r=2,h=60,$fn=88);

    // clearance for bolt heads
    translate([20,15,0])
    rotate([0,90,0])
    cylinder(r=4,h=40,$fn=45);
    translate([20,-15,0])
    rotate([0,90,0])
    cylinder(r=4,h=40,$fn=45);

    // cut for the drive belt
    translate([34,0,0])
    scale([1,2,1])
    cylinder(r=4,h=100,$fn=45,center=true);
  }

}


//---------------------------------------------------
module idleBlock(){

difference(){
color("gray")  
union(){
  hull(){
    translate([26,7.5,75])
    rotate([90,0,0])
    cylinder(r=9,h=5,$fn=44, center=true);

    translate([16,16,74-2])
    cube([3,22,22+4],center=true);
  }
  hull(){
    translate([26,-7.5,75])
    rotate([90,0,0])
    cylinder(r=9,h=5,$fn=44, center=true);

    translate([16,-16,74-2])
    cube([3,22,22+4],center=true);
  }
  translate([15.5,0,74-2])
  cube([3,54,22+4],center=true);
}

  
    translate([26,0,75])
    rotate([-90,0,0])
    cylinder(r=1.6,h=30,$fn=88, center=true);

    translate([26+2,24,75])
    rotate([-90,0,0])
    cylinder(r=6,h=20,$fn=88, center=true);
    
    translate([26+2,-24,75])
    rotate([-90,0,0])
    cylinder(r=6,h=20,$fn=88, center=true);

    // M4 bolt to post
    translate([25,15,64])
    rotate([0,90,0])
    cylinder(r=2,h=30,$fn=88, center=true);
    translate([34,15,64])
    rotate([0,90,0])
    cylinder(r=3.7,h=30,$fn=88, center=true);
    
    translate([25,-15,64])
    rotate([0,90,0])
    cylinder(r=2,h=30,$fn=88, center=true);
    translate([34,-15,64])
    rotate([0,90,0])
    cylinder(r=3.7,h=30,$fn=88, center=true);

    // cut for the post
    translate([0,0,0])
    tslot1(type=2,len=100,tol=0.2);

    // cut for the belt
    translate([10,0,67])
    rotate([0,90,0])
    scale([1,1.2,1])
    cylinder(r=3.9,h=30,$fn=88, center=true);

}

  
}
//-------------------------------------------------------------
module bearing(){
// bearings
difference(){
  union(){
    translate([0,-6,36])
    rotate([90,0,0])
    cylinder(r=22.22/2,h=5.5,$fn=200,center=true);
    translate([0,-6-5.5/2,36])
    rotate([90,0,0])
    cylinder(r=24.7/2,h=1.5,$fn=200,center=true);
  }
  translate([0,-6,36])
  rotate([90,0,0])
  cylinder(r=9.4/2,h=10,$fn=200,center=true);  
}
}

//---------------------------------------------------
module pulley(){
  
  difference(){
  union(){
    translate([0,5.75,36])
    rotate([90,0,0])
    presstime();
    
    color("blue")
    translate([0,-4.5,36])
    rotate([90,0,0])
    cylinder(r=34.5,h=2,$fn=200);

    color("blue")
    translate([0,-4.5-2,36])
    rotate([90,0,0])
    cylinder(r1=34.5,r2=32.5,h=2,$fn=200);
    
    color("green")
    translate([0,4.5+2,36])
    rotate([90,0,0])
    cylinder(r=34.5,h=2,$fn=200);
    
    color("green")
    translate([0,4.5+4,36])
    rotate([90,0,0])
    cylinder(r1=32.5,r2=34.5,h=2,$fn=200);
  }  
    
  // bore for bearings
  translate([0,0,36])
  rotate([90,0,0])
  cylinder(r=22.22/2+0.15,h=40,$fn=200,center=true);

  // locking holes for the lever, use M3x40
  for(i=[0:15]){
    translate([0,0,36])
    rotate([90,0,0])
    rotate([0,0,360/16*i])
    translate([25,0,0])
    cylinder(r=1.6,h=40,$fn=60,center=true);  
  }
  
}

/*
bearing();
rotate([0,0,180])
bearing();
*/

}
//------------------------------------------------------
module leverArm(mirror=0){

  difference(){
    union(){
      color("gray")
      translate([0,-9,36])
      rotate([90,0,0])
      cylinder(r=31.5,h=2,$fn=200);

      color("gray")
      translate([0,-9-2,36])
      rotate([90,0,0])
      cylinder(r1=31.5,r2=29.5,h=2,$fn=200);

      hull(){
        translate([0,-9,36])
        rotate([90,0,0])
        cylinder(r1=20,r2=19,h=6,$fn=200);

        translate([120,-9,36])
        rotate([90,0,0])
        cylinder(r1=10,r2=9,h=6,$fn=200);
      }
    }
    
    // locking holes for the lever, use M3x40
    for(i=[3:13]){
      translate([0,0,36])
      rotate([90,0,0])
      rotate([0,0,360/16*i])
      translate([25,0,0])
      cylinder(r=1.6,h=40,$fn=60,center=true);  
    }

    // cut for main shaft
    translate([0,0,36])
    rotate([90,0,0])
    cylinder(r=9.4/2+0.2,h=100,$fn=60,center=true);  

    // cut on the arm
    difference(){
      hull(){
        translate([0,-12,36])
        rotate([90,0,0])
        cylinder(r1=16,r2=17,h=6,$fn=200);

        translate([120,-12,36])
        rotate([90,0,0])
        cylinder(r1=6,r2=7,h=6,$fn=200);
      }
      translate([0,-12,36])
      rotate([90,0,0])
      cylinder(r1=14,r2=12,h=6,$fn=200);
    }
    
    // cut for handle
    translate([120,0,36])
    rotate([90,0,0])
    cylinder(r=4,h=100,$fn=60,center=true);  

    // cut for handle second shaft for strength
    translate([45,0,36])
    rotate([90,0,0])
    cylinder(r=4,h=100,$fn=60,center=true);  
  }
  
// Text on the arm
if(mirror==0){
  translate([80,-11,36])
  rotate([90,0,0])
  linear_extrude(height=3,scale=1)
  text("FLINT", font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);
}
if(mirror==1){
  translate([80,-11,36])
  rotate([90,0,0])
  rotate([0,0,180])
  linear_extrude(height=3,scale=1)
  text("FLINT", font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);
}  

}

//----------------------------------------------------
module pulleyBlock(){

  difference(){
  color("orange")
  hull(){
    translate([0,23,36])
    rotate([90,0,0])
    cylinder(r=12,h=8,$fn=60);  

    translate([0,24,-14])
    minkowski(){
      cube([36,16,40],center=true);
      sphere(r=1,$fn=44);
    }  
  }

  // post
  translate([0,0,-60])
  color("pink")
  tslot1(type=2,len=60,tol=0.2);
  
  // clear extra tabs 
  translate([0,15,-30])
  cube([27,27,60],center=true);
  
  // main shaft
  translate([0,0,36])
  rotate([90,0,0])
  cylinder(r=9.4/2+0.2,h=100,$fn=60,center=true);  

  // shaft flat spot
  translate([0,28,36])
  rotate([90,0,0])
  cylinder(r=10,h=10,$fn=60,center=true);  

  // M4 bolt to post
  translate([0,28,-20])
  rotate([90,0,0])
  cylinder(r=2,h=100,$fn=60,center=true);  
}

// reinforce the M4 
difference(){
  translate([0,34,-20])
  rotate([90,0,0])
  cylinder(r1=8,r2=10,h=3,$fn=60,center=true);  

  // M4 bolt to post
  translate([0,28,-20])
  rotate([90,0,0])
  cylinder(r=2,h=100,$fn=60,center=true);  
}


}
//-----------------------------------------------------
module sled(tol=0.15){

tabHi=25;

difference(){
  union(){
    // sleeves around the LM10U bearings
    hull(){
      translate([railX,railY,0])
      cylinder(r=19/2+3,h=29,$fn=88);

      translate([railX,-railY,sledHi])
      cylinder(r=19/2+3,h=29,$fn=88);

      translate([railX,-railY,-sledHi])
      cylinder(r=19/2+3,h=29,$fn=88);
    }
    
    // bolt on tabs
    color("pink")
    hull(){
      translate([railX,railY+20,29/2])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi,$fn=88,center=true);

      translate([railX,railY,29/2])
      rotate([0,90,0])
      cylinder(r=10+6,h=tabHi,$fn=88,center=true);
    }

    color("pink")
    hull(){
      translate([railX,-railY-20,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi,$fn=88,center=true);
      
      translate([railX,-railY,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=tabHi,$fn=88,center=true);
    }

    color("pink")
    hull(){
      translate([railX,-railY-20,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi,$fn=88,center=true);
      
      translate([railX,-railY,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=tabHi,$fn=88,center=true);
    }
  }

  // cuts for the bolt mounts
  translate([railX,railY+20,29/2])
  rotate([0,90,0])
  cylinder(r=2,h=tabHi+2,$fn=88,center=true);

  translate([railX,-railY-20,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r=2,h=tabHi+2,$fn=88,center=true);

  translate([railX,-railY-20,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r=2,h=tabHi+2,$fn=88,center=true);
  

  // cut for the LM10Us
  translate([railX,railY,-1])
  cylinder(r=19/2+tol,h=29+2,$fn=88);

  translate([railX,-railY,sledHi-1])
  cylinder(r=19/2+tol,h=29+2,$fn=88);

  translate([railX,-railY,-sledHi-1])
  cylinder(r=19/2+tol,h=29+2,$fn=88);

  // extra cut for right LM10U
  translate([railX,railY,-19])
  cylinder(r=19/2+tol,h=29+2,$fn=88);

  // extra clearance for the rails
  translate([railX,railY,0])
  cylinder(r=5+1,h=330,$fn=66,center=true);
  translate([railX,-railY,0])
  cylinder(r=5+1,h=330,$fn=66,center=true);
}


}

//====================================================

stand1();

// bottom idlers
if(1){
  translate([0,0,2]){
    idleBlock();
    rotate([0,0,180])
    idleBlock();

    if(1){
      color("blue")
      translate([26,4.5,75])
      rotate([90,0,0])
      idler();
      color("blue")
      translate([-26,4.5,75])
      rotate([90,0,0])
      idler();
    }
  }
}

// top pulley
if(1){
  translate([0,0,postHi])
  pulley();
}
if(1){
  translate([0,0,postHi])
  pulleyBlock();
  translate([0,0,postHi])
  rotate([0,0,180])
  pulleyBlock();
}

// lever arm
if(1){
  translate([0,0,postHi])
  leverArm();

  translate([0,0,postHi+36*2])
  rotate([180,0,0])
  leverArm(mirror=1);
}


// rail blocks
if(1){
  translate([0,0,railZ])
  color("cyan")
  railBlock();

  translate([0,0,railZ+330])
  rotate([180,0,0])
  color("cyan")
  railBlock();
}

// cutaway sled
if(1){
difference(){
  translate([0,0,sledZ])
  sled();

  translate([100+railX,0,sledZ])
  cube(200,center=true);
}
}

// full sled
if(0){
  translate([0,0,sledZ])
  sled();
}

if(1){
  // LM10U bearings
  translate([0,0,sledZ]){
    translate([railX,railY,0])
    color("red")
    cylinder(r=19/2,h=29,$fn=88);

    translate([railX,-railY,sledHi])
    color("green")
    cylinder(r=19/2,h=29,$fn=88);

    translate([railX,-railY,-sledHi])
    color("green")
    cylinder(r=19/2,h=29,$fn=88);
  }
}

//====================================================
