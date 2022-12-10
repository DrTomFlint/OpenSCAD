//=================================================================================
// bigcam.scad
//
// For Raspberry Pi HQ Camera and Lenses
// Use continuous rotation servo Feetech FT90R
//
// Dr Tom Flint, 3 Dec 2022
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>
use <../Parts/servo1.scad>
use <../BotCam/arm1.scad>

zservo=10.75;

//-----------------------------------------------------------------------------------
module hqcam(extraX=0){

  // foot
  difference(){
    translate([0,0,11.2/2])
    cube([11.5,13.97,11.2],center=true);

    translate([0,0,-1])
    cylinder(r=5/2,h=10.5+1,$fn=22);
  }
  hull(){
    translate([0,9,12.0])
    rotate([0,90,0])
    cylinder(r=4,h=11.5,$fn=23,center=true);
    translate([0,-9,12.0])
    rotate([0,90,0])
    cylinder(r=4,h=11.5,$fn=23,center=true);
    translate([0,0,7])
    cube([11.5,13.97,2],center=true);
  }
  color("red")
  translate([0,10.5,6])
  rotate([32,0,0])
  cylinder(r=2,h=2,$fn=22);
  color("orange")
  translate([0,-10.5,6])
  rotate([-32,0,0])
  cylinder(r=2,h=2,$fn=22);

  // top box
  translate([2.9,0,11.2+38])
  cube([5.2,10.3,8],center=true);

  // pcb
  color("green")
  translate([-11.5/2,0,11.2+38/2])
  difference(){
    cube([1.5,38,38],center=true);
  
    // mounting holes
    translate([0,38/2-4,38/2-4])
    rotate([0,90,0]){
      cylinder(r=2.5/2,h=3,$fn=23,center=true);
      translate([-4,4,-1.5])
      rotate([0,0,-90])
      rounder(r=4,h=3,f=23);
    }

    translate([0,-38/2+4,38/2-4])
    rotate([0,90,0]){
      cylinder(r=2.5/2,h=3,$fn=23,center=true);
      translate([-4,-4,-1.5])
      rotate([0,0,0])
      rounder(r=4,h=3,f=23);
    }

    translate([0,-38/2+4,-38/2+4])
    rotate([0,90,0]){
      cylinder(r=2.5/2,h=3,$fn=23,center=true);
      translate([4,-4,-1.5])
      rotate([0,0,90])
      rounder(r=4,h=3,f=23);
    }

    translate([0,38/2-4,-38/2+4])
    rotate([0,90,0]){
      cylinder(r=2.5/2,h=3,$fn=23,center=true);
      translate([4,4,-1.5])
      rotate([0,0,180])
      rounder(r=4,h=3,f=23);
    }

  }
  // pcb backside components
  translate([-11.5/2,0,11.2+38/2]){
  color("pink")
    translate([-2.25,38/2-7,0])
    rotate([0,90,0])
    cylinder(r=3.6/2,h=3,$fn=23,center=true);
    color("pink")
    translate([-2.25,-38/2+7,0])
    rotate([0,90,0])
    cylinder(r=3.6/2,h=3,$fn=23,center=true);
    // cable
    color("red")
    translate([-2.25,0,-38/2+4])
    cube([2.8,21,8],center=true);
  }
  
  // body
  difference(){
    union(){
      color("gray")
      translate([0.25,0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=35/2,h=10.5,$fn=189,center=true);

      color("gray")
      translate([0.25+extraX,0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=26/2,h=10.5+extraX,$fn=189,center=true);

      color("cyan")
      translate([(10.5+1.35)/2+0.25+extraX,0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=36/2,h=1.35,$fn=189,center=true);
    }
    color("blue")
    translate([(10.5+1.35)/2+0.25-3.25+extraX,0,11.2+38/2])
    rotate([0,90,0])
    cylinder(r=22.4/2,h=8+extraX,$fn=189,center=true);
  }

}
//-----------------------------------------------------------------------------------
module shortLens(extraX=0,focus=1.5){

  difference(){
    union(){
      color("orange")
      translate([(10.5+1.35)/2+0.25+extraX,0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=30.0/2,h=9.8,$fn=189);

      color("gray")
      translate([(10.5+1.35)/2+0.25+extraX+9.8,0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=28.5/2,h=focus,$fn=189);

      color("gray")
      translate([(10.5+1.35)/2+0.25+extraX+9.8+focus, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=30/2,h=8,$fn=189);

      color("gray")
      translate([(10.5+1.35)/2+0.25+extraX+9.8+focus+8, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=28.5/2,h=1.5,$fn=189);

      color("gray")
      translate([(10.5+1.35)/2+0.25+extraX+9.8+focus+8+1.5, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=30/2,h=9,$fn=189);
    }

    color("blue")
    translate([(10.5+1.35)/2+0.25+extraX,0,11.2+38/2])
    rotate([0,90,0])
    cylinder(r=18/2,h=33,$fn=189);

    color("blue")
    translate([(10.5+1.35)/2+0.25+extraX+27.5,0,11.2+38/2])
    rotate([0,90,0])
    cylinder(r=26/2,h=2.5,$fn=189);
  }    
    
}

//-----------------------------------------------------------------------------------
module longLens(extraX=0,focus=1.0){

  difference(){
    union(){
      // adapter to camera
      color("orange")
      translate([(10.5+1.35)/2+0.25+extraX,0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=30.8/2,h=5.6,$fn=189);

      // silver base
      color("silver")
      translate([(10.5+1.35)/2+0.25+extraX+5.6,0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=36/2,h=2.6,$fn=189);

      // aperature knob
      color("gray")
      translate([(10.5+1.35)/2+0.25+extraX+5.6+2.6, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=38.0/2,h=13,$fn=189);

      // non-rotating section
      color("gray")      
      translate([(10.5+1.35)/2+0.25+extraX+5.6+2.6+13, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=37/2,h=6,$fn=189);

      // focus knob
      color("gray")
      translate([(10.5+1.35)/2+0.25+extraX+5.6+2.6+13+6, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=38/2,h=12,$fn=189);

      // blue section
      color("cyan")
      translate([(10.5+1.35)/2+0.25+extraX+5.6+2.6+13+6+12, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=37/2,h=3.8,$fn=189);
      
      // lens end
      translate([(10.5+1.35)/2+0.25+extraX+5.6+2.6+13+6+12+3.8, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=34/2,h=5.4,$fn=189);
      
      translate([(10.5+1.35)/2+0.25+extraX+5.6+2.6+13+6+12+3.8+focus, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r1=34/2,r2=39/2,h=5.4,$fn=189);
      
      translate([(10.5+1.35)/2+0.25+extraX+5.6+2.6+13+6+12+3.8+focus+5.4, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=39/2,h=8.5,$fn=189);
      
    }

    color("blue")
      translate([(10.5+1.35)/2+0.25+extraX+5.6+2.6+13+6+12+3.8+focus+5.4+8.5-2.99, 0,11.2+38/2])
      rotate([0,90,0])
      cylinder(r=36/2,h=3,$fn=189);
  }    
    
}

//--------------------------------------------------------------------------------
module servoMate(){

difference(){

  // body
  union(){
    translate([0,0,-0.6])
    cylinder(r=2.4+1.5,h=2.3+0.6,$fn=99);

    translate([0,0,-0.6-2])
    cylinder(r1=2.4,r2=2.4+1.5,h=2,$fn=99);
  }

  // center hole
  translate([0,0,0])
  cylinder(r=2.25,h=4,$fn=22);
  
  // splines
  for(i=[0:19]){
    rotate([0,0,360/20*i])
    translate([2.15,0,0])
    cylinder(r1=0.4,r2=0.4,h=9,$fn=22);
  }

  // through hole
  translate([0,0,-1])
  cylinder(r=0.5,h=4,$fn=22);
}
}

//------------------------------------------------------------------------------
// lower Worm 3
module lowerWorm3(){
  
  // worm gear
  translate([0,0,10-1])  
  rotate([0,90,0])
  worm_gear(modul=1, tooth_number=42, thread_starts=1, width=5, length=26, worm_bore=0.6, gear_bore=38, pressure_angle=20, lead_angle=10, optimized=1, together_built=1, show_spur=0, show_worm=1);

  // attachments
  zworm1=6;
  translate([0,11,zworm1])  
  rotate([90,0,0])
  cylinder(r1=4,r2=2,h=4,center=true,$fn=99);

  translate([0,11+4,zworm1])  
  rotate([90,0,0])
  cylinder(r=4,h=4,center=true,$fn=99);

  translate([0,-11,zworm1])  
  rotate([90,0,0])
  cylinder(r1=2,r2=4,h=4,center=true,$fn=99);

  translate([0,-11-4,zworm1])  
  rotate([90,0,0])
  cylinder(r=4,h=4,center=true,$fn=99);

  translate([0,-11-4-4,zworm1])  
  rotate([90,0,0])
  cylinder(r=3-0.15,h=4,center=true,$fn=99);

  // Include the spur gear
  translate([0,27,13.0])  
  rotate([90,0,0])
  rotate([0,0,90])
  worm_gear(modul=1.0, tooth_number=14, thread_starts=1, width=5, length=15, worm_bore=1.7, gear_bore=3, pressure_angle=20, lead_angle=10, optimized=1, together_built=1, show_spur=1, show_worm=0);

  zspur2=6;

  //color("green")
  translate([0,27,zspur2])  
  rotate([90,0,0])
  cylinder(r=5.5,h=5,center=true,$fn=99);

  //color("cyan")
  translate([0,23,zspur2])  
  rotate([90,0,0])
  cylinder(r=4,h=4,center=true,$fn=99);

  //color("pink")
  translate([0,21,zspur2])  
  rotate([90,0,0])
  cylinder(r=3,h=9,center=true,$fn=99);

}

//--------------------------------------------------------------------------------
module upperWorm3(left=1){

  // worm gear
  translate([0,27,13.0])  
  rotate([90,0,0])
  rotate([0,0,90])
  worm_gear(modul=1.0, tooth_number=14, thread_starts=1, width=5, length=15, worm_bore=1.7, gear_bore=3, pressure_angle=20, lead_angle=10, optimized=1, together_built=1, show_spur=0, show_worm=1);

  // attachments
  zworm2=16;
  translate([-11,27,zworm2])  
  rotate([0,90,0])
  cylinder(r=4,h=4,center=true,$fn=99);

  translate([-7,27,zworm2])  
  rotate([0,90,0])
  cylinder(r1=4,r2=2,h=4,center=true,$fn=99);

  translate([7,27,zworm2])  
  rotate([0,90,0])
  cylinder(r1=2,r2=4,h=4,center=true,$fn=99);

  translate([10,27,zworm2])  
  rotate([0,90,0])
  cylinder(r1=2,r2=1.8,h=6,center=true,$fn=99);

  // include drive shaft to servo
  if(left==1){
    // drive shaft 1
    translate([5-24,27.0,zservo+5.25])
    rotate([0,-90,0]){
      servoMate();

      translate([0,0,-6])
      cylinder(r=3-0.15,h=6,$fn=89);    

    }
  }else{
    //drive shaft 2
    translate([5-37,27.0,16.0])
    rotate([0,-90,0]){
      servoMate();

      translate([0,0,-19])
      cylinder(r=3-0.15,h=19,$fn=89);    
        
    }

  }
  

}
//--------------------------------------------------------------------------------
module lowerWormSupport(){

tol=0.25;

// lowerWorm supports
difference(){
  color("cyan")
  hull(){
    translate([24,19,6])  
    rotate([90,0,0])
    cylinder(r=6,h=4-tol,center=true,$fn=99);

    translate([37,19,6])  
    rotate([90,0,0])
    cylinder(r=6,h=4-tol,center=true,$fn=99);

    translate([-6,19,1.5])  
    cube([4,4-tol,12],center=true);
  }

  // cut for worm axle focus
  hull(){
    translate([37,19,6])  
    rotate([90,0,0])
    cylinder(r=3+tol/2,h=6,center=true,$fn=99);

    translate([37,19,16])  
    rotate([90,0,0])
    cylinder(r=3+tol/2,h=6,center=true,$fn=99);
}
  
  // cut for worm axle apperature
  hull(){
    translate([24,19,6])  
    rotate([90,0,0])
    cylinder(r=3+tol/2,h=6,center=true,$fn=99);

    translate([24,19,16])  
    rotate([90,0,0])
    cylinder(r=3+tol/2,h=6,center=true,$fn=99);
  }
}

}

//--------------------------------------------------------------------------------
module upperWormSupport(){
xuw=27;
tol=0.25;

// upperWorm supports
difference(){
  color("blue")
  hull(){
    translate([9,xuw,16])  
    rotate([0,90,0])
    cylinder(r=5,h=4-tol,center=true,$fn=99);

    translate([9,xuw,20])  
    cube([4-tol,10,5],center=true);

  }

  // cut for worm axle
  hull(){
    translate([9,xuw,16])  
    rotate([0,90,0])
    cylinder(r=3+0.1,h=6,center=true,$fn=99);

    translate([9,xuw,6])  
    rotate([0,90,0])
    cylinder(r=3-0.1,h=6,center=true,$fn=99);
  }
}

xuw2=35.25;

difference(){
  color("cyan")
  hull(){
    translate([xuw2,27,16])  
    rotate([0,90,0])
    cylinder(r=5,h=4-tol,center=true,$fn=99);

    translate([xuw2,27,20])  
    cube([4-tol,10,5],center=true);

  }

  // cut for worm axle
  hull(){
    translate([xuw2,27,16])  
    rotate([0,90,0])
    cylinder(r=2.0+tol/2,h=6,center=true,$fn=99);

    translate([xuw2,27,6])  
    rotate([0,90,0])
    cylinder(r=2.0+tol/2,h=6,center=true,$fn=99);
  }
}

}

//--------------------------------------------------------------------------------
// spur gear on the lens
module camGearL(){

intersection(){
  translate([24,0,10-1])  
  rotate([0,90,0])
  worm_gear(modul=1, tooth_number=42, thread_starts=1, width=5, length=26, worm_bore=0.6, gear_bore=38, pressure_angle=20, lead_angle=10, optimized=1, together_built=1, show_spur=1, show_worm=0);

  union(){
    translate([24,0,30])  
    rotate([0,90,0])
    cylinder(r=19.8,h=20,center=true,$fn=99);
    
    translate([24,0,15])  
    cube([30,60,30],center=true);  
  }
}

}

//--------------------------------------------------------------------------------
// spur gear on the lens
module camGearR(){

intersection(){
  translate([24+13,0,10-1])  
  rotate([0,90,0])
  worm_gear(modul=1, tooth_number=42, thread_starts=1, width=5, length=26, worm_bore=0.6, gear_bore=38, pressure_angle=20, lead_angle=10, optimized=1, together_built=1, show_spur=1, show_worm=0);

  union(){
    translate([24+13,0,30])  
    rotate([0,90,0])
    cylinder(r=19.8,h=20,center=true,$fn=99);
    
    translate([24+13,0,15])  
    cube([30,60,30],center=true);  
  }
}

}

//--------------------------------------------------------------------------------
// aperature 2
module aperature2(){

  translate([24,0,0])
  lowerWorm3();

  // upperWorm
  translate([24,0,0])  
  upperWorm3(left=1);

if(1){
  translate([-25,27,zservo])  
  rotate([0,90,0])
  rotate([0,0,180])
  servo1();
}
}

//--------------------------------------------------------------------------------
// focus 2
module focus2(){
  translate([37,0,0])
  rotate([0,0,180])
  lowerWorm3();

  translate([37,-54,0])  
  upperWorm3(left=0);

if(1){
  translate([-25,-27,zservo])  
  rotate([0,90,0])
  rotate([0,0,180])
  servo1();
}
}


//--------------------------------------------------------------------------------
module halfBlock(left=1){

// base block
difference(){
  union(){
    // main base
    translate([0,0,-5])  
    cube([16,68,4],center=true);
  
    // camera base
    translate([0,0,-3.5])  
    cube([16,18,7],center=true);
  
    // upper arm
    if(left==1){
      difference(){
        translate([18.5,27,24])  
        cube([37.5,10,4],center=true);
        translate([19,21,26])  
        rotate([70,0,0])
        cube([37.5,10,4],center=true);
      }
    }else{
      difference(){
        translate([22.25,27,24])  
        cube([56,10,4],center=true);
        translate([22.25,21,26])  
        rotate([70,0,0])
        cube([57,10,4],center=true);
      }
    }
    // servo tower
    translate([-3,27,11])
    cube([10,14,36],center=true);

    // lower worm support
    lowerWormSupport();

    // upper worm support
    if(left==1){
      upperWormSupport();
    }else{
      translate([13,0,0])
      upperWormSupport();
    }
  }  

  // cut for servo
  translate([-25,27,10.75])  
  rotate([0,90,0])
  rotate([0,0,180])
  servo1cut(tol=0.2);
  
  // cuts for half block attachment
  translate([-4,30,-6])  
  cube([24,30,2],center=true);
  
  translate([0,-9.875,-5])  
  cube([18,54,10],center=true);

  // hole for camera mount
  cylinder(r=6.5/2,h=20,center=true,$fn=23);
}
}

//--------------------------------------------------------------------------------
module centerBlock(){

// base block
difference(){
  union(){
    // main base
    translate([0,0,-5])  
    cube([16,68,4],center=true);
  
    // camera base
    translate([0,0,-3.5])  
    cube([16,18,7],center=true);    

  }  
  
  // cuts for servos
  translate([-25,27,10.75])  
  rotate([0,90,0])
  rotate([0,0,180])
  servo1cut(tol=0.2);
  
  translate([-25,-27,10.75])  
  rotate([0,90,0])
  rotate([0,0,180])
  servo1cut(tol=0.2);
  
  // cuts for half block attachment
  translate([0,32,-4])  
  cube([18,30,2.1],center=true);
  
  // other half
  mirror([0,1,0]){
    translate([0,32,-4])  
    cube([18,30,2.1],center=true);  
  }

  // hole for camera mount
  cylinder(r=6.5/2,h=20,center=true,$fn=23);
}
}

//=================================================================================

//x1=2.0;
//x2=1.5;
//hqcam(extraX=x1);
//shortLens(extraX=x1,focus=x2);

if(0){
  difference(){
    union(){

  x1=0;
  x2=1.0;
  //hqcam(extraX=x1);
  //longLens(extraX=x1,focus=x2);

  //aperature2();
  //camGearL();
  //focus2();
  //camGearR();
  halfBlock(left=1);
  //mirror([0,1,0])
  //halfBlock(left=0);
  
  centerBlock();

    }
    translate([0,0,200])
    cube([200,200,200],center=true);
  }
}

//lowerWorm3();
//upperWorm3(left=1);
//upperWorm3(left=0);

//halfBlock(left=1);

mirror([0,1,0])
halfBlock(left=0);

//centerBlock();

//camGearL();
//aperature2();

//camGearR();
//focus2();

//=================================================================================

