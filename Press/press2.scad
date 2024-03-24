//====================================================
// press.scad
// Drill press using T-slot
//
// Dr Tom Flint, 21 March 2021
//====================================================

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <../Parts/presstime.scad>
use <./timing7.scad>

// handle angle
//handleAngle=-45;
// sled position
//sledZ=162;
sledZ=170;

// handle angle
//handleAngle=-45+undulate($t)*90;
handleAngle=0;
// sled position
//sledZ=300-undulate($t)*27.0;

// vertical post
postHi=480;
footLong=240;
footSide=120;

railX=30;    // position of the rails
railY=35;
railZ=102;

makitaHi = 3;

//sledHi=50;
sledHi=50;

// for animation
function undulate(t) = abs((t - .5) * 2);

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

    // shelf
if(1){  
    translate([15,15,60])
    rotate([-90,0,0])      
    tbrace();

    translate([15,-15,60])
    rotate([0,0,0])
    rotate([-90,0,0])      
    tbrace();

    //~ translate([60,35,60+15])
    //~ rotate([90,0,0])
    //~ tslot1(type=1,len=70);
    translate([60,-75,60+15])
    rotate([0,0,90])
    rotate([0,90,0])
    tslot1(type=2,len=150);
}

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

    // cut for pulley bearing
    translate([0,-10,36])
    rotate([90,0,0])
    cylinder(r=26/2,h=2,$fn=60,center=true);  

    // cut on the arm
    difference(){
      hull(){
        translate([0,-13,36])
        rotate([90,0,0])
        cylinder(r1=16,r2=17,h=6,$fn=200);

        translate([120,-13,36])
        rotate([90,0,0])
        cylinder(r1=6,r2=7,h=6,$fn=200);
      }
      translate([0,-13,36])
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
  translate([80,-12,36])
  rotate([90,0,0])
  linear_extrude(height=3,scale=1)
  text("FLINT", font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);
}

if(mirror==1){
  translate([80,-12,36])
  rotate([90,0,0])
  rotate([0,0,180])
  linear_extrude(height=3,scale=1)
  text("2021", font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);
}  

}
//------------------------------------------------------
module handle(){

difference(){
  union(){

    // main shaft
    translate([97,0,36])
    minkowski(){
      cube([120,17.2-2,15-2],center=true);
      sphere(r=1,$fn=33);
    }

    // T-bar
    translate([157,40,36])
    rotate([90,0,0])
    cylinder(r=15/2,h=140,$fn=88);
    
    // right end
    translate([157,40,36])
    scale([1,1,1])
    sphere(r=15/2,$fn=66);

    // left end
    translate([157,-100,36])
    scale([1,1,1])
    sphere(r=15/2,$fn=66);
  }

  // cut for front pin                  
  translate([120,0,36])
  rotate([90,0,0])
  cylinder(r=4-0.15,h=26,$fn=60,center=true);  

  // cut for back pin
  translate([45,0,36])
  rotate([90,0,0])
  cylinder(r=4-0.15,h=26,$fn=60,center=true);  

}

}
//-----------------------------------------------------
module handlePin(){

difference(){
  union(){
    // pin                  
    translate([120,17.2/2,36])
    rotate([90,0,0])
    cylinder(r=4-0.15,h=24/2,$fn=60,center=true);  
    // head
    translate([120,17.2/2+5.5,36])
    rotate([90,0,0])
    cylinder(r1=4,r2=5,h=1.2,$fn=60,center=true);  
  }

  // M4x30 hole for bolting
  translate([120,0,36])
  rotate([90,0,0])
  cylinder(r=1.7,h=30,$fn=60,center=true);  
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

tabHi=6;

//                                          
difference(){
  union(){
    // sleeves around the LM10U bearings
    hull(){
      translate([railX,-railY,0])
      cylinder(r=19/2+3,h=29,$fn=88);

      translate([railX,railY,sledHi])
      cylinder(r=19/2+3,h=29,$fn=88);

      translate([railX,railY,-sledHi])
      cylinder(r=19/2+3,h=29,$fn=88);
    }
    
    // bolt on tabs
    color("pink")
    hull(){
      translate([railX+(25-tabHi)/2,-railY-20,29/2])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi,$fn=88,center=true);

      translate([railX,-railY,29/2])
      rotate([0,90,0])
      cylinder(r=10+6,h=25,$fn=88,center=true);
    }

    color("pink")
    hull(){
      translate([railX+(25-tabHi)/2,railY+20,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi,$fn=88,center=true);
      
      translate([railX,railY,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=25,$fn=88,center=true);
    }

    color("pink")
    hull(){
      translate([railX+(25-tabHi)/2,railY+20,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi,$fn=88,center=true);
      
      translate([railX,railY,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=25,$fn=88,center=true);
    }
  }

  // cuts for the bolt mounts
  translate([railX,-railY-20,29/2])
  rotate([0,90,0])
  cylinder(r=2.2,h=60,$fn=88,center=true);
  translate([railX,railY+20,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r=2.2,h=60,$fn=88,center=true);
  translate([railX,railY+20,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r=2.2,h=60,$fn=88,center=true);
  
  // clearance for heads or nuts  
  translate([railX-12,-railY-20-10,29/2])
  rotate([0,90,0])
  cylinder(r=16,h=30,$fn=88,center=true);
  translate([railX-12,railY+20+10,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r=16,h=30,$fn=88,center=true);
  translate([railX-12,railY+20+10,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r=16,h=30,$fn=88,center=true);
  

  // cut for the LM10Us
  translate([railX,-railY,-1])
  cylinder(r=19/2+tol,h=29+2,$fn=88);

  translate([railX,railY,sledHi-1])
  cylinder(r=19/2+tol,h=29+2,$fn=88);

  translate([railX,railY,-sledHi-1])
  cylinder(r=19/2+tol,h=29+2,$fn=88);

  // extra cut for left LM10U
  translate([railX,-railY,-19])
  cylinder(r=19/2+tol,h=29+2,$fn=88);

  // extra clearance for the rails
  translate([railX,railY,0])
  cylinder(r=5+1,h=330,$fn=66,center=true);
  translate([railX,-railY,0])
  cylinder(r=5+1,h=330,$fn=66,center=true);
  
  // channel for the belt
  translate([railX,0,20])
  cube([15,10.5,120],center=true);
  translate([railX+10,0,16])
  cube([30,10.5,60],center=true);
  
  // access for screws
  translate([railX-13,0,29/2])
  rotate([0,90,0])
  cylinder(r1=17,r2=22,h=28,$fn=122);
    
  // provide a way to remove the bearings
  translate([railX+6,railY-7,29/2-34])
  rotate([0,90,0])
  cylinder(r=6,h=20,$fn=33,center=true);
  translate([railX+6,railY-7,29/2+34])
  rotate([0,90,0])
  cylinder(r=6,h=20,$fn=33,center=true);
  translate([railX+6,-railY+8,29/2+14])
  rotate([0,90,0])
  cylinder(r=6,h=20,$fn=33,center=true);

  // better strain relief for the linear bearings
  // leave a bit of material near the opening, cut it away later
  // that helps adhesion to the build plate and keeps the dimensions
  // correct for the tiny slot
  translate([railX-6,railY,-36])
  cube([15,2,26],center=true);
  translate([railX-6,railY,65])
  cube([15,2,26],center=true);  
  translate([railX-6,-railY,13])
  cube([15,2,28],center=true);  

  // material reduction?
  translate([railX,railY+20,29/2])
  rotate([0,90,0])
  scale([1.3,0.94,1])
  cylinder(r=28,h=60,center=true,$fn=122);

}

if(0){
  // show the belt clips
  color("red")
  translate([railX-31,0,29/2+sledHi-15])
  rotate([0,90,0])
  rotate([0,0,90])
  beltClip();

  color("red")
  translate([railX-31,0,29/2+sledHi-90])
  rotate([0,90,0])
  rotate([0,0,90])
  beltClip();
}

// add blocks for the belt attach
difference(){
  union(){
    color("green")
    translate([railX-3,0,29/2+sledHi-30])
    cube([11,10.5,8],center=true);

    color("blue")
    translate([railX-3,0,29/2+sledHi-70])
    cube([11,10.5,8],center=true);
  }
  // M3x40 bolt hole to adjust tension
  translate([railX-3,-1,29/2])
  cylinder(r=1.65,h=200,center=true,$fn=23);
} 

}
//--------------------------------------------------------------
module beltClip(){
difference(){
    // base block
    translate([-5,-9,24]) cube([10,21,14]);

    // belt entry 
    translate([-7.5,-10,34.9]) rotate([0,45,0]) cube([3,32,3]);
    
    // belt slot
    translate([-8.5,-16,34.2]) cube([11.5,32,1.9]);
    // angled entry
    translate([-8.5,-16,36.4]) rotate([0,5,0]) cube([11.5,32,0.2]);
    translate([-8.5,-16,33.6]) rotate([0,-5,0]) cube([11.5,32,0.2]);
    
    // belt teeth
    for (_step =[-16:3:16]){
      translate([-8.5,_step-0.4,33]) 
      //cube([11.5,1.5,1.5]);
      translate([0,0,0.9])
      rotate([0,90,0])
      scale([1.5,1,1])
      cylinder(r=1,h=11.5,$fn=22);
    }
    
    // screw hole
    translate([-1,16,28]) 
    rotate([90,0,0])
    cylinder(r=1.6,h=30,$fn=22);
    
  }
  
}

//-----------------------------------------------------------------
module sledShoe(){
tabHi=25;   // height of tabs on the sled
//tabHi2=6;   // height of tabs on the shoe
tabHi2=makitaHi;   // height of tabs on the shoe



difference(){
  union(){
    // bolt on tabs
    color("green")
    hull(){
      translate([railX+tabHi/2+tabHi2/2,railY+20,29/2])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi2,$fn=88,center=true);

      translate([railX+tabHi/2+tabHi2/2,railY,29/2])
      rotate([0,90,0])
      cylinder(r=10+6,h=tabHi2,$fn=88,center=true);
    }

    color("green")
    hull(){
      translate([railX+tabHi/2+tabHi2/2,-railY-20,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi2,$fn=88,center=true);
      
      translate([railX+tabHi/2+tabHi2/2,-railY,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
    }

    color("green")
    hull(){
      translate([railX+tabHi/2+tabHi2/2,-railY-20,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi2,$fn=88,center=true);
      
      translate([railX+tabHi/2+tabHi2/2,-railY,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
    }
    
    // mating pins for the tool holder
    toolOff=0.15;
    translate([railX+10,35,29/2])
    rotate([0,90,0])
    cylinder(r1=5-toolOff,r2=5.5-toolOff,h=3,$fn=122);  
    translate([railX+10,-35,29/2+sledHi])
    rotate([0,90,0])
    cylinder(r1=5-toolOff,r2=5.5-toolOff,h=3,$fn=122);
    translate([railX+10,-35,29/2-sledHi])
    rotate([0,90,0])
    cylinder(r1=5-toolOff,r2=5.5-toolOff,h=3,$fn=122);
  }

  // cuts for the bolt mounts
  translate([railX+15,railY+20,29/2])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);

  translate([railX+15,-railY-20,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);

  translate([railX+15,-railY-20,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);

  // cuts in the mating pins to create perimeters
  translate([railX,35,29/2])
  rotate([0,90,0])
  cylinder(r=2,h=25,$fn=122);  
  translate([railX,-35,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r=2,h=25,$fn=122);  
  translate([railX,-35,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r=2,h=25,$fn=122);  
  
}

}
//------------------------------------------------------------------------
module post1(){

post1Hi=8;
post2Hi=12;
//post3Hi=6;
post3Hi=makitaHi;

difference(){
  union(){
    rotate([0,0,90]){    
      rotate([-90,0,0])
      cylinder(r=6.7/2,h=post1Hi,$fn=22);
      translate([0,post1Hi,0])
      rotate([-90,0,0])
      cylinder(r1=6.7/2,r2=8,h=post2Hi,$fn=22);
      translate([0,post1Hi+post2Hi,0])
      rotate([-90,0,0])
      cylinder(r=10,h=post3Hi,$fn=22);
    }
  }
  rotate([0,90,0])
  cylinder(r=1.7,h=80,center=true,$fn=44);
}
    

}

//------------------------------------------------------------------------
module makita(){

screwOff=38.5-makitaHi;

tabHi=25;   // height of tabs on the sled
//tabHi2=6;   // height of tabs on the shoe
tabHi2=makitaHi;   // height of tabs on the shoe
post1Hi=8;
post2Hi=12;
//post3Hi=6;
post3Hi=makitaHi;

postOff=12+20;  // Z-offset from posts to sled shoe


d1=29.9+1.5-1.75;
d2=30.2-2.0;
d3=-26.2+3.0+1.5;
d4=27.7+1.0-1.5;

d5=-23.4;
d6=-26.1;
d7=25.4;
d8=-27.7-1.0;

difference(){
  union(){
  // post A
  color("red")
  translate([railX+screwOff,d1,d2+postOff])
  post1();
  // post B
  color("blue")
  translate([railX+screwOff,d3,d4+postOff])
  post1();
  //post C
  color("cyan")
  translate([railX+screwOff,d5,d6+postOff])
  post1();
  // post C
  color("orange")
  translate([railX+screwOff,d7,d8+postOff])
  post1();


  color("red")
  hull(){
    translate([railX+screwOff-post2Hi-post1Hi,d3,d4+postOff])
    rotate([0,-90,0])
    cylinder(r=10,h=post3Hi,$fn=22);

    translate([railX+screwOff-post2Hi-post1Hi,d5,d6+postOff])
    rotate([0,-90,0])
    cylinder(r=10,h=post3Hi,$fn=22);

    translate([railX+tabHi/2+tabHi2/2,-railY,29/2])
    rotate([0,90,0])
    cylinder(r=10+6,h=tabHi2,$fn=88,center=true);
  }    

  color("orange")
  hull(){
    translate([railX+screwOff-post2Hi-post1Hi,d1,d2+postOff])
    rotate([0,-90,0])
    cylinder(r=10,h=post3Hi,$fn=22);

    translate([railX+screwOff-post2Hi-post1Hi,d3,d4+postOff])
    rotate([0,-90,0])
    cylinder(r=10,h=post3Hi,$fn=22);

    translate([railX+tabHi/2+tabHi2/2,railY,29/2+sledHi])
    rotate([0,90,0])
    cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
  }    

  color("cyan")
  hull(){
    translate([railX+screwOff-post2Hi-post1Hi,d5,d6+postOff])
    rotate([0,-90,0])
    cylinder(r=10,h=post3Hi,$fn=22);

    translate([railX+screwOff-post2Hi-post1Hi,d7,d8+postOff])
    rotate([0,-90,0])
    cylinder(r=10,h=post3Hi,$fn=22);

    translate([railX+tabHi/2+tabHi2/2,railY,29/2-sledHi])
    rotate([0,90,0])
    cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
  }    
  
  color("gray")
  hull(){
    translate([railX+screwOff-post2Hi-post1Hi,d1,d2+postOff])
    rotate([0,-90,0])
    cylinder(r=10,h=post3Hi,$fn=22);
    translate([railX+screwOff-post2Hi-post1Hi,d3,d4+postOff])
    rotate([0,-90,0])
    cylinder(r=10,h=post3Hi,$fn=22);
    translate([railX+screwOff-post2Hi-post1Hi,d5,d6+postOff])
    rotate([0,-90,0])
    cylinder(r=10,h=post3Hi,$fn=22);
    translate([railX+screwOff-post2Hi-post1Hi,d7,d8+postOff])
    rotate([0,-90,0])
    cylinder(r=10,h=post3Hi,$fn=22);
  }

    // bolt on tabs
    color("green")
    hull(){
      translate([railX+tabHi/2+tabHi2/2,-railY-20,29/2])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi2,$fn=88,center=true);

      translate([railX+tabHi/2+tabHi2/2,-railY,29/2])
      rotate([0,90,0])
      cylinder(r=10+6,h=tabHi2,$fn=88,center=true);
    }

    color("green")
    hull(){
      translate([railX+tabHi/2+tabHi2/2,railY+20,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi2,$fn=88,center=true);
      
      translate([railX+tabHi/2+tabHi2/2,railY,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
    }

    color("green")
    hull(){
      translate([railX+tabHi/2+tabHi2/2,railY+20,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi2,$fn=88,center=true);
      
      translate([railX+tabHi/2+tabHi2/2,railY,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
    }
    
    // ridges to strengthen the B post
    color("pink")
    translate([railX+tabHi/2+tabHi2/2-1,-railY+12,29/2+sledHi-1])
    cube([6,55,3]);
    color("pink")
    translate([railX+tabHi/2+tabHi2/2-1,-railY+5,29/2-10])
    rotate([-1,0,0])
    cube([6,3,55]);
    color("orange")
    translate([railX+tabHi/2+tabHi2/2-1,-railY+12,29/2-15])
    rotate([-3,0,0])
    cube([6,50,3]);
    color("green")
    translate([railX+tabHi/2+tabHi2/2-1,railY-6,29/2-10])
    rotate([-4,0,0])
    cube([6,3,55]);

    color("orange")
    translate([railX+tabHi/2+tabHi2/2-1,-railY+12,29/2-15])
    rotate([-38,0,0])
    cube([6,70,3]);
    color("pink")
    translate([railX+tabHi/2+tabHi2/2-1,railY+7,29/2-54])
    rotate([20,0,0])
    cube([6,3,42]);
      
  } // end of the union

  // cuts for the bolt mounts
  translate([railX+15,-railY-20,29/2])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);
  translate([railX+15,railY+20,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);
  translate([railX+15,railY+20,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);

if(1){
  // material reduction hole in center                                      
  translate([railX+screwOff-post2Hi-post1Hi-1.5,0,2.5+postOff])
  rotate([0,-90,0])
  cylinder(r1=23,r2=19,h=4,center=true,$fn=200);
}            
  // holes to allow an M3 to reinforce the posts
  translate([railX+screwOff-post2Hi-post1Hi,d1,d2+postOff])
  rotate([0,-90,0])
  cylinder(r=3,h=6.1,$fn=22);
  translate([railX+screwOff-post2Hi-post1Hi,d3,d4+postOff])
  rotate([0,-90,0])
  cylinder(r=3,h=6.1,$fn=22);
  translate([railX+screwOff-post2Hi-post1Hi,d5,d6+postOff])
  rotate([0,-90,0])
  cylinder(r=3,h=6.1,$fn=22);
  translate([railX+screwOff-post2Hi-post1Hi,d7,d8+postOff])
  rotate([0,-90,0])
  cylinder(r=3,h=6.1,$fn=22);
  
}

}

//------------------------------------------------------------------------
module drill(){
  
  // bit 
  cylinder(r=0.5,h=10.5,$fn=55);
  translate([0,0,10.5])
  cylinder(r1=0.5,r2=1.5,h=3,$fn=55);
  translate([0,0,10.5+3])
  cylinder(r=1.5,h=3,$fn=55);
  translate([0,0,10.5+3+3])
  cylinder(r=7.7/2,h=5,$fn=55);
  translate([0,0,10.5+3+3+5])
  cylinder(r1=7.7/2,r2=14/2,h=8.5,$fn=55);
  translate([0,0,10.5+3+3+5+8.5])
  cylinder(r=14/2,h=10,$fn=55);
  translate([0,0,10.5+3+3+5+8.5+10])
  cylinder(r=9/2,h=8.5,$fn=55);
  
  // taper
  translate([0,0,10.5+3+3+5+8.5+10+8.5])
  hull(){
    cylinder(r=9/2,h=0.1,$fn=55);
    translate([0,4.5,5.5])
    cylinder(r=21.5/2,h=0.1,$fn=55);
    translate([0,-4.5,5.5])
    cylinder(r=21.5/2,h=0.1,$fn=55);
  }
  
  // main barrel
  translate([0,0,10.5+3+3+5+8.5+10+8.5+5.5])
  hull(){
    translate([0,4.5,0])
    cylinder(r=21.5/2,h=63,$fn=55);
    translate([0,-4.5,0])
    cylinder(r=21.5/2,h=63,$fn=55);
  }

  // lock
  hull(){
    translate([0,0,60])
    rotate([0,-90,0])
    cylinder(r=4.7/2,h=15,$fn=55);
    translate([0,0,63])
    rotate([0,-90,0])
    cylinder(r=4.7/2,h=15,$fn=55);
  }

  // side barrel
  translate([0,0,95])
  rotate([-60,0,0])
  hull(){
    translate([0,7.5,0])
    cylinder(r=21.5/2,h=25,$fn=55);
    translate([0,-7.5,0])
    cylinder(r=21.5/2,h=25,$fn=55);
  }
  translate([0,0,95])
  rotate([-60,0,0])
  hull(){
    translate([0,7.5,0])
    cylinder(r=19/2,h=153,$fn=55);
    translate([0,-7.5,0])
    cylinder(r=19/2,h=153,$fn=55);
  }

}


//------------------------------------------------------------------------
module drillCollar(){

screwOff=38.5-makitaHi;

tabHi=25;   // height of tabs on the sled
//tabHi2=6;   // height of tabs on the shoe
tabHi2=3;   // height of tabs on the shoe


  // upper collar for drill
  translate([railX+32,0,-20])
  difference(){
    hull(){
      translate([0,4.5,0])
      cylinder(r=21.5/2+2,h=25,$fn=55);
      translate([0,-4.5,0])
      cylinder(r=21.5/2+2,h=25,$fn=55);
    }
    hull(){
      translate([0,4.5,-1])
      cylinder(r=21.5/2+0.15,h=27,$fn=55);
      translate([0,-4.5,-1])
      cylinder(r=21.5/2+0.15,h=27,$fn=55);
    }
    // cut for the button
    hull(){
      translate([0,0,10])
      rotate([0,-90,0])
      cylinder(r=5/2,h=15,$fn=55);
      translate([0,0,30])
      rotate([0,-90,0])
      cylinder(r=5/2,h=15,$fn=55);
    }
    // cut for tightening collar
    translate([railX-20,0,10])
    cube([10,4,40],center=true);

    // interlock cuts
    translate([0,6,11])
    rotate([0,-90,0])
    cylinder(r=1.5,h=15,$fn=55);
    translate([0,-6,11])
    rotate([0,-90,0])
    cylinder(r=1.5,h=15,$fn=55);

  }
  
  // lower collar section
  translate([railX+32,0,-23])
  difference(){
    hull(){
      translate([0,4.5,0])
      cylinder(r=21.5/2+2,h=3,$fn=55);
      translate([0,-4.5,0])
      cylinder(r=21.5/2+2,h=3,$fn=55);
    }
    translate([0,0,-2.5])
    hull(){
      cylinder(r=9/2,h=0.1,$fn=55);
      translate([0,4.5,5.5])
      cylinder(r=21.5/2,h=0.1,$fn=55);
      translate([0,-4.5,5.5])
      cylinder(r=21.5/2,h=0.1,$fn=55);
    }
    // cut for tightening collar
    translate([railX-20,0,10])
    cube([10,4,40],center=true);

  }

  // tabs for tightening collar
  difference(){
    intersection(){
      union(){
        translate([railX+48,3.5,-9])
        cube([9,3,28],center=true);
        translate([railX+48,-3.5,-9])
        cube([9,3,28],center=true);
      }
      translate([railX+44,0,-9])
      scale([1,1,1.75])
      rotate([90,0,0])
      cylinder(r=8,h=20,$fn=77,center=true);
    }
    translate([railX+49,0,-9])
    rotate([90,0,0])
    cylinder(r=1.7,h=20,$fn=77,center=true);
  }
}


//------------------------------------------------------------------------
module drillSled(){

screwOff=38.5-makitaHi;

tabHi=25;   // height of tabs on the sled
//tabHi2=6;   // height of tabs on the shoe
tabHi2=3;   // height of tabs on the shoe


difference(){
  union(){

    // bolt on tabs
    color("green")
    hull(){
      translate([railX+tabHi/2+tabHi2/2,-railY-20,29/2])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi2,$fn=88,center=true);

      translate([railX+tabHi/2+tabHi2/2,-railY,29/2])
      rotate([0,90,0])
      cylinder(r=10+6,h=tabHi2,$fn=88,center=true);
    }

    color("green")
    hull(){
      translate([railX+tabHi/2+tabHi2/2,railY+20,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi2,$fn=88,center=true);
      
      translate([railX+tabHi/2+tabHi2/2,railY,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
    }

    color("green")
    hull(){
      translate([railX+tabHi/2+tabHi2/2,railY+20,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi2,$fn=88,center=true);
      
      translate([railX+tabHi/2+tabHi2/2,railY,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
    }
    
  } // end of the union

  // more material reduction
  translate([railX+tabHi/2+tabHi2/2,-railY,29/2])
  rotate([0,90,0])
  cylinder(r=8,h=tabHi2+2,$fn=88,center=true);
  translate([railX+tabHi/2+tabHi2/2,railY,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r=8,h=tabHi2+2,$fn=88,center=true);
  translate([railX+tabHi/2+tabHi2/2,railY,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r=8,h=tabHi2+2,$fn=88,center=true);

  // cuts for the bolt mounts
  translate([railX+15,-railY-20,29/2])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);
  translate([railX+15,railY+20,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);
  translate([railX+15,railY+20,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);
  
} 

  // attachment points
  difference(){
    union(){
      difference(){
        hull(){
          translate([railX+16.5,5,-9])
          cube([8,5,28],center=true);
          translate([railX+tabHi/2+tabHi2/2,railY,29/2-sledHi])
          rotate([0,90,0])
          cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
        }
        hull(){
          translate([railX+16.5,12,-14])
          cube([8,1,16],center=true);
          translate([railX+tabHi/2+tabHi2/2,railY,29/2-sledHi])
          rotate([0,90,0])
          cylinder(r=8,h=tabHi2+2,$fn=88,center=true);
        }
      }
      
      difference(){
        hull(){
          translate([railX+16.5,5,-9])
          cube([8,5,28],center=true);
          translate([railX+tabHi/2+tabHi2/2,railY,29/2+sledHi])
          rotate([0,90,0])
          cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
        }
        hull(){
          translate([railX+16.5,12,6])
          cube([8,1,16],center=true);
          translate([railX+tabHi/2+tabHi2/2,railY,29/2+sledHi])
          rotate([0,90,0])
          cylinder(r=8,h=tabHi2+3,$fn=88,center=true);
        }
      }
      
      difference(){
        hull(){
          translate([railX+16.5,-5,-9])
          cube([8,5,28],center=true);
          translate([railX+tabHi/2+tabHi2/2,-railY,29/2])
          rotate([0,90,0])
          cylinder(r=10+6,h=tabHi2,$fn=88,center=true);
        }
        hull(){
          translate([railX+16.5,-12,-3])
          cube([8,1,16],center=true);
          translate([railX+tabHi/2+tabHi2/2,-railY,29/2])
          rotate([0,90,0])
          cylinder(r=8,h=tabHi2+3,$fn=88,center=true);
        }
      }
      // reinforce joint of hulls
      translate([railX+16.5-2.5,0,-9])
      cube([3,5,28],center=true);
      translate([railX+16.5,0,-19])
      cube([8,5,8],center=true);
      
    }  // end of union
    
    // cut for upper collar for drill
    translate([railX+32,0,-20])
    hull(){
      translate([0,4.5,-0.15])
      cylinder(r=21.5/2+2.1,h=25.3,$fn=55);
      translate([0,-4.5,-0.15])
      cylinder(r=21.5/2+2.1,h=25.3,$fn=55);
    }

    // cut for lower collar section
    translate([railX+32,0,-23])
    hull(){
      translate([0,4.5,0])
      cylinder(r=21.5/2+2.1,h=3,$fn=55);
      translate([0,-4.5,0])
      cylinder(r=21.5/2+2.1,h=3,$fn=55);
    }
  }

    // interlock pins
    translate([railX+21,6,-9])
    rotate([0,-90,0])
    cylinder(r1=1.3,r2=1.5,h=2,$fn=55);
    translate([railX+21,-6,-9])
    rotate([0,-90,0])
    cylinder(r1=1.3,r2=1.5,h=2,$fn=55);

}

//----------------------------------------------------------------------------
module axle(){
difference(){  
  union(){
    // main shaft
    translate([0,0,36])
    rotate([90,0,0])
    cylinder(r=9.4/2,h=48,$fn=60,center=true);  

    translate([0,24,36])
    rotate([-90,0,0])
    cylinder(r=3.5,h=3,$fn=60);  
    translate([0,24+3,36])
    rotate([-90,0,0])
    cylinder(r=9.4/2,h=2,$fn=60);  
    translate([0,24+3+2,36])
    rotate([-90,0,0])
    cylinder(r1=9.4/2,r2=3.5,h=2,$fn=60);  

    translate([0,-24,36])
    rotate([90,0,0])
    cylinder(r=3.5,h=3,$fn=60);  
    translate([0,-24-3,36])
    rotate([90,0,0])
    cylinder(r=9.4/2,h=2,$fn=60);  
    translate([0,-24-5,36])
    rotate([90,0,0])
    cylinder(r1=9.4/2,r2=3.5,h=2,$fn=60);  
  }

  translate([0,0,18])
  cube([80,80,30],center=true);
}
}

//-------------------------------------------------------------------------------
module axleCap(){

fit=0.15;
  
  difference(){
    union(){
      translate([0,24+fit,36])
      rotate([-90,0,0])
      cylinder(r=9,h=9-fit,$fn=60);  

      translate([0,33,36])
      scale([1,0.3,1])
      sphere(r=9,$fn=88);
    }
    
    
    hull(){
      translate([0,24,36])
      rotate([-90,0,0])
      cylinder(r=3.5+fit,h=3-fit,$fn=60);  
      translate([0,24,10])
      rotate([-90,0,0])
      cylinder(r=3.5+fit,h=3-fit,$fn=60);  
    }

    hull(){
      translate([0,24+3-fit,36])
      rotate([-90,0,0])
      cylinder(r=9.4/2+fit,h=2+fit*2,$fn=60);  
      translate([0,24+3-fit,10])
      rotate([-90,0,0])
      cylinder(r=9.4/2+fit,h=2+fit*2,$fn=60);  
    }

    hull(){
      translate([0,24+3+2,36])
      rotate([-90,0,0])
      cylinder(r1=9.4/2+fit,r2=3.5+fit,h=2+fit,$fn=60);  
      translate([0,24+3+2,10])
      rotate([-90,0,0])
      cylinder(r1=9.4/2+fit,r2=3.5+fit,h=2+fit,$fn=60);  
    }
  }

}

//----------------------------------------------------------------------
// slow to render, 
module Block(draft=0){
  
if(draft==0){  
  // grip onto the timing belt
  intersection(){
    translate([-85,0,-5.5])
    timing7();
    translate([0,0,0])
    cube([10,30,6],center=true);
  }
  // base
  translate([1,0,-4])
  cube([12,30,2],center=true);
  
  difference(){
    translate([1,0,0])
    cube([12,30,8],center=true);
    translate([-85,0,0])
    cylinder(r=87.75,h=20,center=true,$fn=99);
  }
}else{
  // base
  translate([1,0,-0.5])
  cube([12,30,9],center=true);
}

}

//----------------------------------------------------------------------
// slow to render, 
module Block2(draft=0){
  
if(draft==0){  
  // grip onto the timing belt
  intersection(){
    translate([-85,0,-5.5])
    timing7();
    translate([0,0,0])
    cube([10,30,6],center=true);
  }
  // base
  translate([1,0,-4])
  cube([12,30,2],center=true);
  // flange
  difference(){
    translate([1,-13,0])
    cube([24,4,16],center=true);
    translate([1,-13,7])
    cube([6,5,20],center=true);
  }
  
  difference(){
    translate([1,0,0])
    cube([12,30,8],center=true);
    translate([-85,0,0])
    cylinder(r=87.75,h=20,center=true,$fn=99);
  }
}else{
  // base
  translate([1,0,-0.5])
  cube([12,30,9],center=true);
}

}
//----------------------------------------------------------------------
module counterWeight(){
  
  // upper block
  translate([-34,-2,postHi])  
  rotate([0,0,180])
  rotate([90,0,0])
  Block(draft=0);
      
  // washers
  translate([-34,20,postHi-130])
  difference(){
    cylinder(r=25.5/2,h=125,$fn=99);
    translate([0,0,-1])
    cylinder(r=7.4/2,h=127,$fn=99);
  }
  translate([-34,-20,postHi-130])
  difference(){
    cylinder(r=25.5/2,h=125,$fn=99);
    translate([0,0,-1])
    cylinder(r=7.4/2,h=127,$fn=99);
  }

  // lower block
  translate([-34,-2,postHi-125])  
  rotate([0,0,180])
  rotate([90,0,0])
  Block2(draft=0);
  

}
//----------------------------------------------------------------------
module counterPost(){
  // posts
  cylinder(r=7.2/2,h=140,$fn=6);
}

//----------------------------------------------------------------------
module counterLatch(thick=2.4){


  difference(){    
    hull(){
      translate([-34,20,postHi+2])
      cylinder(r=25.5/2,h=thick,$fn=99);
      translate([-34,-20,postHi+2])
      cylinder(r=25.5/2,h=thick,$fn=99);

      translate([-28,20,postHi+2])
      cylinder(r=25.5/2,h=thick,$fn=99);
      translate([-28,-20,postHi+2])
      cylinder(r=25.5/2,h=thick,$fn=99);
    }
    translate([-34,-20,postHi+1])
    cylinder(r=7.6/2,h=thick+2,$fn=6);

    translate([-34,20,postHi+1])
    cylinder(r=7.6/2,h=thick+2,$fn=6);

    translate([-34,-2,postHi])
    rotate([0,0,180])
    rotate([90,0,0])
    translate([1,0,-0.5])
    cube([12.4,30.4,9.4],center=true);

    translate([-44,-2,postHi+3])
    cube([10,4,thick+6],center=true);
  }

    translate([-15,15,postHi+2+thick/2])
    cube([6,8-0.5,thick],center=true);
    translate([-15,-15,postHi+2+thick/2])
    cube([6,8-0.5,thick],center=true);
}



//----------------------------------------------------------------------
module dremmel(){
  
    // collet
    cylinder(r=10.5/2,h=16.5,$fn=22);
    // threads
    translate([0,0,16.5])
    cylinder(r=7.7/2,h=4,$fn=22);
    // black knob
    translate([0,0,16.5+4])
    cylinder(r1=17/2,r2=26.6/2,h=4.5,$fn=22);
    translate([0,0,16.5+4+4.5])
    cylinder(r1=26.6/2,r2=22.4/2,h=4.0,$fn=22);
    // narrow neck section
    translate([0,0,16.5+4+4.5+4])
    cylinder(r1=22.4/2,r2=22.6/2,h=7.0,$fn=22);
    // taper and vents
    translate([0,0,16.5+4+4.5+4+7])
    cylinder(r1=22.6/2,r2=44.9/2,h=36,$fn=22);
    // barrel
    translate([0,0,16.5+4+4.5+4+7+36])
//    cylinder(r=47.3/2,h=31.5,$fn=22);
    cylinder(r=47.3/2,h=130,$fn=22);
    // top and bottom fins
    intersection(){
      union(){
        translate([0,0,16.5+4+4.5+4+7+36+31.5])
        cylinder(r1=47.3/2,r2=51.8/2,h=10.5,$fn=22);
        translate([0,0,16.5+4+4.5+4+7+36+31.5+10.5])
        cylinder(r=51.8/2,h=78,$fn=22);
      }
      translate([0,0,130])
      cube([32,50,160],center=true);
    }
    // approximate handle
      translate([0,0,180])
      rotate([-50,0,0])
      hull(){
        cube([31,50,6],center=true);
        translate([0,0,75])
        cube([31,40,6],center=true);
      }
    
      

}

//------------------------------------------------------------------------
module dremmelSled(){

screwOff=38.5-makitaHi;

tabHi=25;   // height of tabs on the sled
//tabHi2=6;   // height of tabs on the shoe
tabHi2=3;   // height of tabs on the shoe


difference(){
  union(){

    // bolt on tabs
    color("green")
    hull(){
      translate([railX+tabHi/2+tabHi2/2,-railY-20,29/2])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi2,$fn=88,center=true);

      translate([railX+tabHi/2+tabHi2/2,-railY,29/2])
      rotate([0,90,0])
      cylinder(r=10+6,h=tabHi2,$fn=88,center=true);
    }

    color("green")
    hull(){
      translate([railX+tabHi/2+tabHi2/2,railY+20,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi2,$fn=88,center=true);
      
      translate([railX+tabHi/2+tabHi2/2,railY,29/2+sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
    }

    color("green")
    hull(){
      translate([railX+tabHi/2+tabHi2/2,railY+20,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10,h=tabHi2,$fn=88,center=true);
      
      translate([railX+tabHi/2+tabHi2/2,railY,29/2-sledHi])
      rotate([0,90,0])
      cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
    }
    
  } // end of the union

  // more material reduction
  translate([railX+tabHi/2+tabHi2/2,-railY,29/2])
  rotate([0,90,0])
  cylinder(r=8,h=tabHi2+2,$fn=88,center=true);
  translate([railX+tabHi/2+tabHi2/2,railY,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r=8,h=tabHi2+2,$fn=88,center=true);
  translate([railX+tabHi/2+tabHi2/2,railY,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r=8,h=tabHi2+2,$fn=88,center=true);

  // cuts for the bolt mounts
  translate([railX+15,-railY-20,29/2])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);
  translate([railX+15,railY+20,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);
  translate([railX+15,railY+20,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);
  
} 

  // attachment points
  difference(){
    union(){
      difference(){
        hull(){
          translate([railX+16.5+4,0,-9])
          cube([16,18,28],center=true);
          translate([railX+tabHi/2+tabHi2/2,railY,29/2-sledHi])
          rotate([0,90,0])
          cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
        }
        hull(){
          translate([railX+16.5+4,12,-14])
          cube([16,1,16],center=true);
          translate([railX+tabHi/2+tabHi2/2,railY,29/2-sledHi])
          rotate([0,90,0])
          cylinder(r=8,h=tabHi2+8,$fn=88,center=true);
        }
      }
      
      difference(){
        hull(){
          translate([railX+16.5+4,0,-9])
          cube([16,18,28],center=true);
          translate([railX+tabHi/2+tabHi2/2,railY,29/2+sledHi])
          rotate([0,90,0])
          cylinder(r=10+4,h=tabHi2,$fn=88,center=true);
        }
        hull(){
          translate([railX+16.5+4,11,14])
          rotate([50,0,0])
          cube([16,1,16],center=true);
          translate([railX+tabHi/2+tabHi2/2,railY,29/2+sledHi])
          rotate([0,90,0])
          cylinder(r=8,h=tabHi2+8,$fn=88,center=true);
        }
      }
      
      difference(){
        hull(){
          translate([railX+16.5+4,0,-9])
          cube([16,18,28],center=true);
          translate([railX+tabHi/2+tabHi2/2,-railY,29/2])
          rotate([0,90,0])
          cylinder(r=10+6,h=tabHi2,$fn=88,center=true);
        }
        hull(){
          translate([railX+16.5+4,-10,-4])
          cube([16,1,22],center=true);
          translate([railX+tabHi/2+tabHi2/2,-railY,29/2])
          rotate([0,90,0])
          cylinder(r=8,h=tabHi2+18,$fn=88,center=true);
        }
      }
      // reinforce joint of hulls
      translate([railX+16.5-2.5,0,-9])
      cube([3,5,28],center=true);
      translate([railX+16.5,0,-19])
      cube([8,5,8],center=true);
      
    }  // end of union
    
    // cut for main collar
    translate([railX+53,0,-6+5])
    cylinder(r=47.3/2+3,h=28+10,$fn=88,center=true);

    // slot for collar
    translate([railX+20,0,16])
    rotate([0,90,0])
    linear_extrude(height=9.2,scale=[1,0.7]){
      square([60+0.4,8+0.4],center=true);
    }
  }

}

//------------------------------------------------------------------------
module dremmelCollar(){

screwOff=38.5-makitaHi;

tabHi=25;   // height of tabs on the sled
//tabHi2=6;   // height of tabs on the shoe
tabHi2=3;   // height of tabs on the shoe


  // collar for dremmel
  translate([railX+53,0,-6])
  difference(){
    cylinder(r=47.3/2+2,h=28,$fn=88,center=true);
    cylinder(r=47.3/2,h=32.5,$fn=88,center=true);
    
    // cut for tightening collar
    translate([railX-4,0,0])
    cube([10,4,40],center=true);
  }
  
  // dovetail
  translate([railX+20,0,-6])
  rotate([0,90,0])
  linear_extrude(height=9,scale=[1,0.7]){
    square([28,8],center=true);
  }

  // tabs for tightening collar
  difference(){
    intersection(){
      union(){
        translate([railX+82,3.5,-6])
        cube([12,3,28],center=true);
        translate([railX+82,-3.5,-6])
        cube([12,3,28],center=true);
      }
      translate([railX+79,0,-6])
      scale([1,1,1.75])
      rotate([90,0,0])
      cylinder(r=8,h=20,$fn=77,center=true);
    }
    translate([railX+82,0,-6])
    rotate([90,0,0])
    cylinder(r=1.7,h=20,$fn=77,center=true);
  }
}


//=========================================================================================================

//translate([0,0,postHi])
//axle();

//translate([0,0,postHi])
//axleCap();

// tool holder for makita drill
if(0){
  translate([0,0,sledZ])
  makita();
}

//**************************************************************************

if(1){
  translate([railX+53,0,sledZ-95])
  dremmel();
}
if(1){
  translate([0,0,sledZ])
  dremmelSled();
}
if(1){
  translate([0,0,sledZ])
  dremmelCollar();
}


//~ color("cyan")
//~ translate([0,0,100-sledZ])
//~ counterWeight();
//~ color("red")
//~ translate([0,0,100-sledZ])
//~ counterLatch(thick=2.4);
//~ color("blue")
//~ translate([0,0,100-sledZ-140])
//~ counterLatch(thick=6);

//~ translate([0,0,100-sledZ])
//~ translate([-34,20,postHi-135])
//~ counterPost();
//~ translate([0,0,100-sledZ])
//~ translate([-34,-20,postHi-135])
//~ counterPost();

//~ Block2();

// tool holder for tiny drill
if(0){
  translate([railX+32,0,sledZ-74])
  drill();
}

if(0){
  translate([0,0,sledZ])
  drillSled();
}
if(0){
  translate([0,0,sledZ])
  drillCollar();
}
if(0){
  difference(){
    translate([0,0,sledZ])
    drillCollar();
    translate([110,0,sledZ])
    cube([100,100,100],center=true);
  }
}

//beltClip();

// stand
if(0){
  color("gray")
  stand1();
}

// bottom idlers
if(0){
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

// animate?
translate([0,0,postHi+36])
rotate([0,handleAngle,0])
translate([0,0,-postHi-36]){

  // top pulley
  if(0){
    translate([0,0,postHi])
    pulley();
  }
  // lever arm
  if(0){
    color("gray")
    translate([0,0,postHi])
    leverArm();

    color("gray")
    translate([0,0,postHi+36*2])
    rotate([180,0,0])
    leverArm(mirror=1);
  }
  // handle
  if(0){
    translate([0,0,postHi])
    handle();
  }    
  // handlePin
  if(0){
    translate([0,0,postHi])
    handlePin();
  }    

}

// pulley block
if(0){
  translate([0,0,postHi])
  pulleyBlock();
  translate([0,0,postHi])
  rotate([0,0,180])
  pulleyBlock();
}


// rail blocks
if(0){
  translate([0,0,railZ])
  color("cyan")
  railBlock();

  translate([0,0,railZ+330])
  rotate([180,0,0])
  color("cyan")
  railBlock();
}

// cutaway sled  
if(0){
difference(){
  translate([0,0,sledZ])
  sled();

  translate([100+railX,0,sledZ])
  cube(200,center=true);
}
}

// full sled
if(1){
  translate([0,0,sledZ])
  sled();
}

// slice sled for printing
if(0){
//  intersection(){
  difference(){
  sled();
  translate([railX,0,0])
  cube([8,200,200],center=true);
  }
}

// sled shoe
if(0){
  translate([0,0,sledZ])
  rotate([0,0,0])
  sledShoe();
}

if(0){
  // LM10U bearings
  translate([0,0,sledZ]){
    translate([railX,-railY,0])
    color("red")
    cylinder(r=19/2,h=29,$fn=88);

    translate([railX,railY,sledHi])
    color("green")
    cylinder(r=19/2,h=29,$fn=88);

    translate([railX,railY,-sledHi])
    color("green")
    cylinder(r=19/2,h=29,$fn=88);
  }
}

//====================================================
