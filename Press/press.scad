//====================================================
// press.scad
// Drill press using T-slot
//
// Dr Tom Flint, 21 March 2021
//====================================================

use <../Parts/tslot.scad>
use <../Parts/motors.scad>
use <../Parts/presstime.scad>

// handle angle
//handleAngle=-45;
// sled position
//sledZ=300;

// handle angle
handleAngle=-45+undulate($t)*90;
// sled position
sledZ=300-undulate($t)*27.0;

// vertical post
postHi=480;
footLong=240;
footSide=120;

railX=30;    // position of the rails
railY=35;
railZ=102;

makitaHi = 3;

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
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);

  translate([railX,-railY-20,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);

  translate([railX,-railY-20,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r=2.2,h=tabHi+2,$fn=88,center=true);
  

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
  
  // strain relief for the bearings
//  translate([railX,railY-9.5,0])
//  cylinder(r=2,h=330,$fn=66,center=true);
//  translate([railX,-railY+9.5,0])
//  cylinder(r=2,h=330,$fn=66,center=true);
  
  // channel for the belt
  translate([railX,0,20])
  cube([15,10.5,120],center=true);
  translate([railX+10,0,16])
  cube([30,10.5,60],center=true);
  
  // access for screws
  translate([railX-7.5,0,29/2])
  rotate([0,90,0])
  cylinder(r1=17,r2=22,h=22,$fn=122);
  
  // mating pins for the tool holder   ***********************
  translate([railX+8,35,29/2])
  rotate([0,90,0])
  cylinder(r1=5,r2=5.5,h=5,$fn=122);  
  translate([railX+8,-35,29/2+sledHi])
  rotate([0,90,0])
  cylinder(r1=5,r2=5.5,h=5,$fn=122);
  translate([railX+8,-35,29/2-sledHi])
  rotate([0,90,0])
  cylinder(r1=5,r2=5.5,h=5,$fn=122);
  cylinder(r1=5,r2=5.5,h=5,$fn=122);
  
  // provide a way to remove the 2 left side bearings
  translate([railX+6,-railY+7,29/2-34])
  rotate([0,90,0])
  cylinder(r=6,h=20,$fn=33,center=true);
  translate([railX+6,-railY+7,29/2+34])
  rotate([0,90,0])
  cylinder(r=6,h=20,$fn=33,center=true);

  // better strain relief for the linear bearings
  // had to use the heat gun to get smooth motion 
  // assemble the rails, rail blocks, and the base 30x60 
  // with the sled and the bearings on the rails but not yet inserted
  // into the sled.  Heat until the bearings slide in and the travel 
  // remains smooth.
  // provide a way to remove the 2 left side bearings
  translate([railX+6,-railY,-47])
  cube([15,2,40],center=true);
  translate([railX+6,-railY,75])
  cube([15,2,40],center=true);  
  translate([railX+6,railY,4])
  cube([15,2,40],center=true);  

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

difference(){
  union(){
    color("green")
    translate([railX-3,0,29/2+sledHi-30])
    cube([11,10.5,8],center=true);

    color("blue")
    translate([railX-3,0,29/2+sledHi-70])
    cube([11,10.5,8],center=true);
  }
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

postOff=12;  // Z-offset from posts to sled shoe


d1=21.5;
d2=27.7;
d3=-27.2;
d4=27.7;

d5=-23.4;
d6=-26.1;
d7=25.4;
d8=-28.2;

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
    translate([railX+screwOff-post2Hi-post1Hi,d1,d2+postOff])
    rotate([0,-90,0])
    cylinder(r=10,h=post3Hi,$fn=22);

    translate([railX+screwOff-post2Hi-post1Hi,d7,d8+postOff])
    rotate([0,-90,0])
    cylinder(r=10,h=post3Hi,$fn=22);

    translate([railX+tabHi/2+tabHi2/2,railY,29/2])
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

    translate([railX+tabHi/2+tabHi2/2,-railY,29/2+sledHi])
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

    translate([railX+tabHi/2+tabHi2/2,-railY,29/2-sledHi])
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
    
    // to get a flat base, make the mating pins a separate part
/*    
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
*/    
  }

    // cuts for mating pins for the tool holder
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
  
  // material reduction hole in center
    translate([railX+screwOff-post2Hi-post1Hi,0,0+postOff])
    rotate([0,-90,0])
    cylinder(r=20,h=40,$fn=22,center=true);
      
      
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


//=========================================================================================================


translate([0,0,sledZ])
makita();


//beltClip();

//color("gray")
//stand1();

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
    translate([0,0,postHi])
    leverArm();

    translate([0,0,postHi+36*2])
    rotate([180,0,0])
    leverArm(mirror=1);
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
if(0){
  translate([0,0,sledZ])
  sled();
}

// sled shoe
if(0){
  translate([0,0,sledZ])
  sledShoe();
}

if(0){
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
