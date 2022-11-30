//=================================================================================
// bigcam.scad
//
// For Raspberry Pi HQ Camera and Lenses
// - add a focus ring using continuous servo and worm gear
// - might need to use a pinion and regular gear since focus moves teeth
// - legos use a straight rack and helical worm so should be ok
//
// Added worm gear and servos, need long lens.  26 Nov 2022
//
// Dr Tom Flint, 19 Oct 2021
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>
use <../Parts/servo1.scad>


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
module focus(){
translate([25,0,12])  
rotate([0,90,0])
worm_gear(modul=1, tooth_number=37, thread_starts=1, width=9, length=20, worm_bore=1.7, gear_bore=30, pressure_angle=20, lead_angle=10, optimized=1, together_built=1, show_spur=1, show_worm=1);


translate([20,43,9])  
rotate([90,0,0])
servo1();

}

//--------------------------------------------------------------------------------
module focus2(){
translate([21,0,10])  
rotate([0,90,0])
worm_gear(modul=0.5, tooth_number=80, thread_starts=1, width=5, length=16, worm_bore=1.7, gear_bore=38, pressure_angle=20, lead_angle=10, optimized=1, together_built=1, show_spur=1, show_worm=1);


translate([15.7,43,8.6])  
rotate([90,0,0])
servo1();

translate([39,0,10])  
rotate([0,90,0])
worm_gear(modul=0.5, tooth_number=80, thread_starts=1, width=5, length=16, worm_bore=1.7, gear_bore=38, pressure_angle=20, lead_angle=10, optimized=1, together_built=1, show_spur=1, show_worm=1);

rotate([180,0,0])
translate([39-4.3,43,-8.6])  
rotate([90,0,0])
servo1();

}
//------------------------------------------------------------------------------
module lowerWorm2(spur=1,worm=1){


  translate([0,0,10-1])  
  rotate([0,90,0])
  worm_gear(modul=1, tooth_number=42, thread_starts=1, width=5, length=26, worm_bore=0.6, gear_bore=38, pressure_angle=20, lead_angle=10, optimized=1, together_built=1, show_spur=spur, show_worm=worm);

if(spur==1){
  
}
zworm1=6;

if(worm==1){
  translate([0,11,zworm1])  
  rotate([90,0,0])
  cylinder(r1=4,r2=2,h=4,center=true,$fn=99);

  difference(){
    translate([0,11+4,zworm1])  
    rotate([90,0,0])
    cylinder(r=4,h=4,center=true,$fn=99);
    color("cyan")
    translate([0,11+4.01,zworm1])  
    rotate([90,0,0])
    cylinder(r=2.5,h=4,center=true,$fn=6);
  }


  translate([0,-11,zworm1])  
  rotate([90,0,0])
  cylinder(r1=2,r2=4,h=4,center=true,$fn=99);

  translate([0,-11-4,zworm1])  
  rotate([90,0,0])
  cylinder(r=4,h=4,center=true,$fn=99);

  translate([0,-11-4-4,zworm1])  
  rotate([90,0,0])
  cylinder(r=3-0.15,h=4,center=true,$fn=99);
}

}

//--------------------------------------------------------------------------------
module upperWorm2(spur=1,worm=1,left=1){

translate([0,27,13.0])  
rotate([90,0,0])
rotate([0,0,90])
worm_gear(modul=1.0, tooth_number=14, thread_starts=1, width=5, length=15, worm_bore=1.7, gear_bore=3, pressure_angle=20, lead_angle=10, optimized=1, together_built=1, show_spur=spur, show_worm=worm);

zspur2=6;

if(spur==1){
  if(left==1){
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

    //color("orange")
    translate([0,15,zspur2])  
    rotate([90,0,0])
    cylinder(r1=2.5,r2=2.1,h=4,center=true,$fn=6);
  }else{
      //color("green")
      translate([0,27,zspur2])  
      rotate([90,0,0])
      cylinder(r=5.5,h=5,center=true,$fn=99);

      //color("cyan")
      translate([0,31,zspur2])  
      rotate([90,0,0])
      cylinder(r=4,h=4,center=true,$fn=99);

      //color("pink")
      translate([0,33,zspur2])  
      rotate([90,0,0])
      cylinder(r=3,h=9,center=true,$fn=99);

      //color("orange")
      translate([0,39,zspur2])  
      rotate([90,0,0])
      cylinder(r2=2.5,r1=2.1,h=4,center=true,$fn=6);      
  }
}

zworm2=16;

if(worm==1){

  difference(){
    translate([-11,27,zworm2])  
    rotate([0,90,0])
    cylinder(r=4,h=4,center=true,$fn=99);

    translate([-11,27,zworm2])  
    rotate([0,90,0])
    cylinder(r=2.5,h=4.2,center=true,$fn=6);
  }
  translate([-7,27,zworm2])  
  rotate([0,90,0])
  cylinder(r1=4,r2=2,h=4,center=true,$fn=99);

  translate([7,27,zworm2])  
  rotate([0,90,0])
  cylinder(r1=2,r2=4,h=4,center=true,$fn=99);

  translate([10,27,zworm2])  
  rotate([0,90,0])
  cylinder(r1=2,r2=1.8,h=4,center=true,$fn=99);
}

}

//--------------------------------------------------------------------------------
module lowerWormSupport(){

// lowerWorm supports
difference(){
  color("cyan")
  hull(){
    translate([24,19,6])  
    rotate([90,0,0])
    cylinder(r=8,h=4,center=true,$fn=99);

    translate([37,19,6])  
    rotate([90,0,0])
    cylinder(r=8,h=4,center=true,$fn=99);

    translate([30,19,-6])  
    cube([30,4,2],center=true);
  }

  // cut for worm axle focus
  hull(){
    translate([37,19,6])  
    rotate([90,0,0])
    cylinder(r=3+0.1,h=6,center=true,$fn=99);

    translate([37,19,26])  
    rotate([90,0,0])
    cylinder(r=3+0.1,h=6,center=true,$fn=99);
  }
  
  // cut for worm axle apperature
  hull(){
    translate([24,19,6])  
    rotate([90,0,0])
    cylinder(r=3+0.1,h=6,center=true,$fn=99);

    translate([24,19,26])  
    rotate([90,0,0])
    cylinder(r=3+0.1,h=6,center=true,$fn=99);
  }
}

}

//--------------------------------------------------------------------------------
module upperWormSupport(){
xuw=27;

// upperWorm supports
difference(){
  color("blue")
  hull(){
    translate([9,xuw,16])  
    rotate([0,90,0])
    cylinder(r=6,h=4,center=true,$fn=99);

    translate([9,xuw,-4])  
    cube([4,12,6],center=true);

  }

  // cut for worm axle
  translate([9,xuw,16])  
  rotate([0,90,0])
  cylinder(r=3+0.1,h=6,center=true,$fn=99);

}

xuw2=35.25;

difference(){
  color("cyan")
  hull(){
    translate([xuw2,27,16])  
    rotate([0,90,0])
    cylinder(r=6,h=4,center=true,$fn=99);

    translate([xuw2,27,-4])  
    cube([4,12,6],center=true);

  }

  // cut for worm axle
  translate([xuw2,27,16])  
  rotate([0,90,0])
  cylinder(r=2.0+0.1,h=6,center=true,$fn=99);

}

}


//--------------------------------------------------------------------------------
module focus3(){

// aperature 
translate([24,0,0])
lowerWorm2(spur=1,worm=1);

// upperWorm
translate([24,0,0])  
upperWorm2(spur=1,worm=1,left=1);

translate([-26,27,21.5])  
rotate([0,90,0])
servo1();

// focus
if(1){
  translate([37,0,0])
  rotate([0,0,180])
  lowerWorm2(spur=1,worm=1);

  translate([37,-54,0])  
  upperWorm2(spur=1,worm=1,left=0);

  translate([-26,-27,21.5])  
  rotate([0,90,0])
  servo1();
}


// base block
color("gray")
difference(){
  union(){
    translate([0,0,-3.5])  
    cube([16,66,7],center=true);
  
    translate([20,25,-5])  
    cube([50,16,4],center=true);

    translate([20,-25,-5])  
    cube([60.5,16,4],center=true);
  }  
  
  cylinder(r=6.5/2,h=20,center=true,$fn=23);
}

// lower worm support
lowerWormSupport();
translate([0,-38,0])  
lowerWormSupport();

// upper worm support
upperWormSupport();
translate([13,-54,0])  
upperWormSupport();





}



//=================================================================================

//x1=2.0;
//x2=1.5;
//hqcam(extraX=x1);
//shortLens(extraX=x1,focus=x2);

if(1){
  difference(){
    union(){

  x1=0;
  x2=1.0;
  //hqcam(extraX=x1);
  //longLens(extraX=x1,focus=x2);

  focus3();

    }
    translate([0,0,200])
    cube([200,200,200],center=true);
  }
}

//lowerWorm2(spur=0,worm=1);
//lowerWorm2(spur=1,worm=0);

//upperWorm2(spur=1,worm=0);
//upperWorm2(spur=0,worm=1);

//=================================================================================

