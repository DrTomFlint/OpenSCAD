// scanner1.scad
// Design for a 3D scanner using photogrammetry.
// Slewing bearing used as a turntable, azimuth.
// Camera mounted on circular arm to gain different views, elevation.
// Will want to estimate the radius from the center of the sphere, radius.
// So this is spherical co-ordinates for the volume to be scanned.
// A LED strip mounts on the camera arm to provide light from different
// directions, intensity, and color.
// Elevation and azimuth driven axis use stepper motors 0.9 deg driven
// from expansion board 3HC off the Duet 3 main controller on Dusa.
// Use gates tooth GT2 continuous belts and 16 tooth pulley.

use <../Slewing/slew10.scad>
use <../Parts/motors.scad>
use <../Parts/bearings1.scad>
use <../Parts/timing2.scad>
use <../Fractals/Lsystem.scad>
use <../Parts/rack1.scad>
use <../Parts/rounder.scad>

ElOn=1;     // elevation axis, ewheel
AzOn=1;     // azimuth axis, turntable
ShellOn=0;  // shell cover
LidOn=0;    // rear lid
TableOn=0;  // rotational table, 0=off, 1=flat, 2=pillar

BaseOn=0;   // base plate

TowerOn=3;  // 0 = off, 1=left, 2=right, 3=both
TowerHigh=92;  // adjusts hub height, 92 min
TowerLow=73;

BearingsOn=1;   // show bearings in the towers
ZdriveOn=1;     // powered Z axis

ArmOn=0;    // camera arm
Az=-90;       // azimuth angle -80 min, 0=flat back, 90=overhead, 180=front

WheelOn=0;  // show the ewheel by itself

F2=88;
F1=222;

//--------------------------------------------------------------------
module baseplate(){
  
Ntabi=6;  
oid=50;         // outer race inner rad
ohi=15;         // outer race height
  
    for(i=[0:Ntabi-1]){
      rotate([0,0,i*360/Ntabi]){
        color("gray")
        difference(){
          hull(){
            translate([0,oid,0])
            scale([1,1.5,1])
            cylinder(r=5,h=3,$fn=F1);      

            translate([0,oid+2,0])
            scale([3,1,1])
            cylinder(r=3,h=3,$fn=F1);      
          }
          translate([0,oid-4,-4])
          cylinder(r=1.7,h=8,$fn=F1);
        }
      }
    }

  
  difference(){
    translate([0,0,0])
    cylinder(r=90,h=3,$fn=F2);
   
    translate([0,0,-1])
    cylinder(r=50,h=5,$fn=F2);
  }  
}

//--------------------------------------------------------------------
module axle(){

  // ewheel engage
  cylinder(r=7,$fn=6,h=8);
  // thru the bearing
  translate([0,0,8])
  cylinder(r=7.8/2,h=14,$fn=F2);
  // arm engage
  translate([0,0,14+8])
  cylinder(r1=3.6,r2=3.5,h=4.5,$fn=6);
  
  
  // Add a fancy button top
  difference(){
    translate([0,0,-3])
    cylinder(r1=10,r2=12,h=2,$fn=F2);
    translate([0,0,-3.1])
    linear_extrude(height=1,convexity=6)
    scale([3.5,3.5])
    penrose_tiling(n=2, w=0.2);
  }
  translate([0,0,-1])
  cylinder(r1=12,r2=12,h=1,$fn=F2);
  
  
}
  
//--------------------------------------------------------------------
module azimuth(){

  // Turntable
  rotate([180,0,0])
  slew10();
  
  phi=30;
  phi2=phi+4.35;
  ax1=144*cos(phi);
  ay1=144*sin(phi);
  ax2=102.9*cos(phi2);
  ay2=102.9*sin(phi2);
  echo(AX1 = ax1);
  echo(AY1 = ay1);
  echo(AX2 = ax2);
  echo(AY2 = ay2);

  // azimuth motor
  color("green")
  translate([-ax1,ay1,-56])
  rotate([0,0,180])
  rotate([0,0,0])
  xymotor();
  
  // azimuth pulley
  color("orange")
  translate([-ax1,ay1,10])
  rotate([180,0,0])
  pulley();
  
  // azimuth idler
  color("green")
  translate([-ax2,ay2,5])
  rotate([180,0,0])
  idler();

} // end azimuth

// --------------------------------------------------------------------
module table(type=1){
  
  // plain flat base
  color("gray")
  translate([0,0,11.5])
  cylinder(r=79,h=2,$fn=F2);
  
  // add the support pillar in the center
  if(type==2){
    color("gray")
    translate([0,0,11.5])
    cylinder(r=6,h=100-11.5-10,$fn=F2);
  }
  
}
//-------------------------------------------------------------------
module ewheel(){

Nspokes=7;

  // outer rim is GT2 pulley
  time2();

  difference(){
    union(){
      // hub for shaft
      translate([0,0,3])
      cylinder(r=12,h=6,$fn=F2);
      // fancy disk
      intersection(){
        translate([0,0,4])
        linear_extrude(height=3,convexity=10)
        scale([12,12])
        penrose_tiling(n=4, w=0.2);
        
        cylinder(r=76,h=20,center=true);
      }
    }
    // cut for the axle
    cylinder(r=7,$fn=6,h=20);  
  }
}
//-------------------------------------------------------------------
module fwheel(){


  // outer rim
  translate([0,0,3])
  difference(){
    cylinder(r=34,h=6,$fn=F2);
    cylinder(r=32,h=20,$fn=F2,center=true);
  }

  difference(){
    union(){
      // hub for shaft
      translate([0,0,3])
      cylinder(r=12,h=6,$fn=F2);
      // fancy disk
      intersection(){
        translate([0,0,4])
        linear_extrude(height=3,convexity=10)
        scale([12,12])
        penrose_tiling(n=2, w=0.2);
        
        cylinder(r=76,h=20,center=true);
      }
    }
    // cut for the axle
    cylinder(r=7,$fn=6,h=20);  
  }
}

//-------------------------------------------------------------------
module elevation(){


  // elevation wheel
  translate([0,0,TowerHigh])  
  rotate([0,90,0])
  ewheel();
  

  theta=90;
  theta2=theta+4.35;
  y1=144*cos(theta);
  z1=144*sin(theta);
  y2=102.9*cos(theta2);
  z2=102.9*sin(theta2);
  echo(EY1 = y1);
  echo(EZ1 = z1);
  echo(EY2 = y2);
  echo(EZ2 = z2);
  
  // elevation motor
  color("red")
  translate([-56,y1,TowerHigh-z1])  
  rotate([0,90,0])
  rotate([0,0,180])
  xymotor();

  // elevation pulley
  color("orange")
  translate([-3,y1,TowerHigh-z1])  
  rotate([0,90,0])
  pulley();

  // elevation idler
  color("red")
  translate([2,y2,TowerHigh-z2])  
  rotate([0,90,0])
  idler();

  // left axle
  color("cyan")
  translate([3,0,TowerHigh])  
  rotate([0,90,0])
  axle();

  // right axle
  color("cyan")
  translate([201,0,TowerHigh])  
  rotate([0,-90,0])
  axle();
  
  // fwheel
if(0){
  translate([184,0,TowerHigh])  
  rotate([0,90,0])
  fwheel();
}

} // end elevation
//---------------------------------------------------------------------
module shell(){

  // cylinder shell
  translate([0,0,-10]){
    difference(){
      cylinder(r=82,h=110,$fn=F2);
      translate([0,0,-1])
      cylinder(r=81,h=112,$fn=F2);
    }
  }

} // end shell  
//--------------------------------------------------------------------
module zdrive(){

  // z motor        **********************************************************************
  color("blue")
  translate([-25,-40.5,-34.0])
  rotate([0,-90,0])
  rotate([0,0,-45])
  xymotor();

  translate([-90,0,-14])
  rotate([0,0,180])
  rotate([0,90,0])
  zclamp(type=1);

  translate([90,0,-14])
  rotate([0,0,0])
  rotate([0,90,0])
  zclamp(type=2);

}
//------------------------------------------------------------------------------
module zbeam(
xlength,
zwide,
thickness,
tol=0
){
  
z8=zwide/2+5;
z9=zwide/3+2;
z10=zwide/6;

t8=thickness/2+1.5;
t9=0;

pts = [ [-z8,-t8], [z8,-t8], [z8,t8],
      [z9,t8], [z9,t9], [z10,t9], [z10,t8], [-z10,t8], [-z10,t9],
      [-z9,t9], [-z9,t8],
      [-z8,t8] ];

rotate([0,90,0])
rotate([0,0,90])
linear_extrude(height=xlength,convexity=6){
  offset(r=1+tol,$fn=44)
  offset(r=-1)
  polygon(points=pts);
  }
}
//--------------------------------------------------------------------
module zrail(hi=100){

zwide=16.5;  
xlength=hi;
  
//example rack and pinion:
//all distances in mm
n1 = 24; //red gear number of teeth. Set to zero if you don't want to print a pinion.
n5 = 80;  //gray rack number of teeth.  Set to 1 if you don't want to print a rack- that's as small as it gets (you'll get 2 teeth if you set it to zero... I haven't tried to determine why that happens)
mm_per_tooth = 2;
thickness    = 7;  // depth of the rack from side-to-side, including backboard if any. The pinion will be this depth minus the backboard_thickness
hole         = 2;   //hole diameter in pinion gear
height       = 5;  // distance from bottom of the rack to the tips of the teeth

//rac-Added - Set your values here for  a Backboard along one side of the teeth.
backboard_thickness = 0; //set to zero for no backboard
    backboard_height = 2;   //set to zero for top of backboard to be even with tips of teeth, a positive number will extend above the teeth by the chosen amount. Negative number will place the top of the backboard lower than the teeth.

//rac-Added - Set your values here for a rear Side-Flange along one side of the teeth extending to the rear of the rack (opposite the direction of a backboard).
side_flange_thickness = 0; //set to zero for no rear Side-Flange
    side_flange_height = 10; // A positive number extends the side-flange beyond the bottom of the rack the by specified amount.
    flange_offset = 0; //Set to zero for a flange running coplanar with one side of the teeth. A positive number moves the flange toward other side of the teeth

//rac-Added - Set your values here for Stop Blocks at one or both ends.
stop_height = 2; //Stop Blocks will extend this much above the teeth. A positive number will extend above the teeth by the chosen amount. Negative number will place the top of the block lower than the teeth. 
    left_stop_enable = 0;  //set to 1 to generate Left Stop Block, set to 0 to disable
    right_stop_enable = 0;  //set to 1 to generate Right Stop Block, set to 0 to disable

//rac-Added - Set your values here for rear End-Flanges at one or both ends.    
flange_height = 2.25; //Flanges will extend this much from the bottom of the rack. ****Combine with 0 height Stop Blocks to effectively start flanges at top of tooth instead of backside.****
    left_flange_enable = 0;  //set to 1 to generate Left Rear Flange, set to 0 to disable. 
    right_flange_enable = 0;  //set to 1 to generate Right Rear Flange, set to 0 to disable.
//end of inputs -------------------------------------------------------

d1 =pitch_radius(mm_per_tooth,n1);

//Generation of rack, and Relative positioning of gear and rack:
translate([0,zwide/2,0])
InvoluteGear_rack(mm_per_tooth,n5,thickness+1,height,backboard_thickness,backboard_height,side_flange_thickness,side_flange_height,flange_offset,stop_height,left_stop_enable,right_stop_enable,flange_height,left_flange_enable,right_flange_enable);   //rac - In the above 'translate' instruction, the middle parameter sets spacing between the rack and the pinion. I've set it to '-height-backboard_height-d1-mm_per_tooth' to give a proportionate offset that allows for ease of printing for most sets of gear & rack parameters. If you use a large NEGATIVE backboard height THE GEAR AND RACK MAY OVERLAP. That can be fixed by substituting some other number/formula for '-height-backboard_height-d1-mm_per_tooth'. Try for example -3*d1, or just subtract an additional fixed offset from what's in there now (e.g. (-height-backboard_height-d1-mm_per_tooth)-14.)

translate([0,-zwide/2,0])
mirror([0,1,0])
InvoluteGear_rack(mm_per_tooth,n5,thickness+1,height,backboard_thickness,backboard_height,side_flange_thickness,side_flange_height,flange_offset,stop_height,left_stop_enable,right_stop_enable,flange_height,left_flange_enable,right_flange_enable);   //rac - In the above 'translate' instruction, the middle parameter sets spacing between the rack and the pinion. I've set it to '-height-backboard_height-d1-mm_per_tooth' to give a proportionate offset that allows for ease of printing for most sets of gear & rack parameters. If you use a large NEGATIVE backboard height THE GEAR AND RACK MAY OVERLAP. That can be fixed by substituting some other number/formula for '-height-backboard_height-d1-mm_per_tooth'. Try for example -3*d1, or just subtract an additional fixed offset from what's in there now (e.g. (-height-backboard_height-d1-mm_per_tooth)-14.)

difference(){
  zbeam(xlength=xlength, zwide=zwide, thickness=thickness, tol=0);

  // cuts to inset the racks
  translate([xlength/2,zwide/2+5,0])
  cube([xlength,5,thickness+1],center=true);
  translate([xlength/2,-zwide/2-5,0])
  cube([xlength,5,thickness+1],center=true);
}



}

//--------------------------------------------------------------------
module zclamp(hi=200,type=1){
  
zwide=16.5;  
xlength=hi;
  
//example rack and pinion:
//all distances in mm
n1 = 24; //red gear number of teeth. Set to zero if you don't want to print a pinion.
n5 = 80;  //gray rack number of teeth.  Set to 1 if you don't want to print a rack- that's as small as it gets (you'll get 2 teeth if you set it to zero... I haven't tried to determine why that happens)
mm_per_tooth = 2;
thickness    = 7;  // depth of the rack from side-to-side, including backboard if any. The pinion will be this depth minus the backboard_thickness
hole         = 2;   //hole diameter in pinion gear
height       = 5;  // distance from bottom of the rack to the tips of the teeth

//rac-Added - Set your values here for  a Backboard along one side of the teeth.
backboard_thickness = 0; //set to zero for no backboard
    backboard_height = 2;   //set to zero for top of backboard to be even with tips of teeth, a positive number will extend above the teeth by the chosen amount. Negative number will place the top of the backboard lower than the teeth.

//rac-Added - Set your values here for a rear Side-Flange along one side of the teeth extending to the rear of the rack (opposite the direction of a backboard).
side_flange_thickness = 0; //set to zero for no rear Side-Flange
    side_flange_height = 10; // A positive number extends the side-flange beyond the bottom of the rack the by specified amount.
    flange_offset = 0; //Set to zero for a flange running coplanar with one side of the teeth. A positive number moves the flange toward other side of the teeth

//rac-Added - Set your values here for Stop Blocks at one or both ends.
stop_height = 2; //Stop Blocks will extend this much above the teeth. A positive number will extend above the teeth by the chosen amount. Negative number will place the top of the block lower than the teeth. 
    left_stop_enable = 0;  //set to 1 to generate Left Stop Block, set to 0 to disable
    right_stop_enable = 0;  //set to 1 to generate Right Stop Block, set to 0 to disable

//rac-Added - Set your values here for rear End-Flanges at one or both ends.    
flange_height = 2.25; //Flanges will extend this much from the bottom of the rack. ****Combine with 0 height Stop Blocks to effectively start flanges at top of tooth instead of backside.****
    left_flange_enable = 0;  //set to 1 to generate Left Rear Flange, set to 0 to disable. 
    right_flange_enable = 0;  //set to 1 to generate Right Rear Flange, set to 0 to disable.
//end of inputs -------------------------------------------------------

d1 =pitch_radius(mm_per_tooth,n1);

n0=64;
zoff=3;
thick2=5;
// pitch in mm, num teeth, thickness, bore hole diameter

color("red")
difference(){
  union(){
    translate([0,12.2+zwide/2,0])
    gear(mm_per_tooth,n1,thickness,2);

    translate([0,12.2+zwide/2,-thick2-zoff])
    rotate([0,0,180/n0])
    gear(mm_per_tooth,n0,thick2,2);

    translate([0,12.2+zwide/2,-zoff-thickness/2])
    cylinder(r=6.5,h=zoff+0.2);

  }
  // driveshaft
  translate([0,12.2+zwide/2,0])
  cylinder(r=4,h=5*thickness,center=true,$fn=6);
}
difference(){  
  color("green")
  union(){
    translate([0,-12.2-zwide/2,0])
    gear(mm_per_tooth,n1,thickness,2);

    translate([0,-12.2-zwide/2,-thick2-zoff])
    gear(mm_per_tooth,n0,thick2,2);

    translate([0,-12.2-zwide/2,-zoff-thickness/2])
    cylinder(r=6.5,h=zoff+0.2);

    translate([0,-12.2-zwide/2,thickness/2])
    cylinder(r=6.5,h=zoff+0.2);

  }
  // driveshaft
  translate([0,-12.2-zwide/2,0])
  cylinder(r=4,h=5*thickness,center=true,$fn=6);

}

  // bearings
  if(1){
    translate([0,12.2+zwide/2,-thickness/2-thick2-zoff-7])
      balls1();
    translate([0,-12.2-zwide/2,-thickness/2-thick2-zoff-7])
      balls1();
  }

  if(type==1){
    // takeoff spur gear 
    color("cyan")
    translate([20,20+12+zwide/2,0-thick2-zoff])
    rotate([0,0,0/n1])
    gear(mm_per_tooth,n1,thick2,5);
    
  }

  // supporting block
  difference(){
    union(){
      color("gray")
      translate([2,0,-4])
      minkowski(){
        cube([52,60,22],center=true);
        sphere(r=3,$fn=88);
      }
      // extra block for input spur
      if(type==1){
        translate([16,42,-4])
        minkowski(){
          cube([24,24,22],center=true);
          sphere(r=3,$fn=88);
        }        
      }
    }    
    // pass through for the beam
    translate([-xlength/2,0,0])
    zbeam(xlength=xlength, zwide=zwide, thickness=thickness, tol=0.2);

    // clearance for gears
    translate([0,12.2+zwide/2,-thickness-1])
    cylinder(r=24,h=thickness+0.2,$fn=22,center=true);    
    translate([0,-12.2-zwide/2,-thickness-1])
    cylinder(r=24,h=thickness+0.2,$fn=22,center=true);
    
    
    // clearance for input spur
    if(type==1){
      hull(){
        translate([20,30+zwide/2,-thickness-1])
        cylinder(r=12,h=thickness+0.2,$fn=22,center=true);
        translate([50,30+zwide/2,-thickness-1])
        cylinder(r=12,h=thickness+0.2,$fn=22,center=true);
      }
    }
    
    hull(){
      translate([0,12.2+zwide/2,0])
      cylinder(r=11,h=thickness+2,$fn=22,center=true);    
      translate([0,24+zwide/2,0])
      cylinder(r=11,h=thickness+2,$fn=22,center=true);    
    }

    hull(){
      translate([0,-12.2-zwide/2,0])
      cylinder(r=11,h=thickness+2,$fn=22,center=true);
      translate([0,-24-zwide/2,0])
      cylinder(r=11,h=thickness+2,$fn=22,center=true);
    }
    
    // cuts for bearings
    translate([0,12.2+zwide/2,-thickness/2-thick2-zoff-7])
    cylinder(r=11,h=7.1,$fn=88);
    translate([0,-12.2-zwide/2,-thickness/2-thick2-zoff-7])
    cylinder(r=11,h=7.1,$fn=88);

    // through holes for the shafts
    translate([0,12.2+zwide/2,-thickness/2-thick2-zoff-7])
    cylinder(r=3.5,h=30,$fn=88);
    translate([0,-12.2-zwide/2,-thickness/2-thick2-zoff-7])
    cylinder(r=3.5,h=30,$fn=88);
    
    
    // cutaway viewer
    translate([0,0,-60])
    cube([80,80,20],center=true);
  }

    // show the motor
  if(type==1){
    color("cyan")
    translate([20,20+12+zwide/2,-70])
    rotate([0,0,-45])
    xymotor();
  }
}

//---------------------------------------------------------------------
module tower(){


  difference(){
    union(){
      // left tower
      translate([-90,0,-TowerLow])
      rotate([0,0,180])
      rotate([0,-90,0])
      zrail(hi=TowerHigh+TowerLow-2);
      
      // left bearing housing
      translate([-90+6,0,TowerHigh])  
      rotate([0,-90,0])
      cylinder(r=14,h=12,$fn=F2);
      
      
    }
    // cut left bearing insert
    translate([-81,0,TowerHigh])  
    rotate([0,-90,0])
    cylinder(r=11+0.15,h=9,$fn=F2);

    // cut left bearing shaft 
    translate([-79,0,TowerHigh])  
    rotate([0,-90,0])
    cylinder(r=7,h=9,$fn=F2);
  }
  
} // end tower  

//---------------------------------------------------------------------
module dome(Rin=81,thick=1){
  
  difference(){
    sphere(r=Rin+thick,$fn=F1);
    sphere(r=Rin,$fn=F1);
    translate([0,0,-50])
    cube([200,200,100],center=true);    
  }
}

//-------------------------------------------------------------------
// 1 = back lid
// 2 = back lid + front lip
// 3 = front lid
// 4 = front lid + front lip

module lid(type=1){
  
  difference(){
    union(){
      // dome part
      difference(){
        dome(Rin=81,thick=1);
        rotate([-60,0,0])         // here is the cut angle
        translate([0,-100,50])    
        cube([200,200,100],center=true);    
        translate([0,-100,40])    
        cube([200,200,100],center=true);    
      }
      // overlapping lip
      color("green")
      translate([0,0,-2])
      difference(){
        cylinder(r=83,h=4,$fn=F1);
        translate([0,0,-1])
        cylinder(r=82,h=6,$fn=F1);
        translate([0,-97,40])
        cube([200,200,100],center=true);    
      }
      if(type==2){
        // add front lip
        color("orange")
        rotate([30,0,0])
        translate([0,0,-2])
        difference(){
          cylinder(r=83,h=4,$fn=F1);
          translate([0,0,-1])
          cylinder(r=82,h=6,$fn=F1);
          translate([0,-97,40])
          cube([200,200,100],center=true);    
        }
      }        
    } // end union
      
    // cuts for hinge spot
    translate([-90,0,0])
    rotate([0,90,0])
    cylinder(r=12.1,h=15,$fn=F2);

    // cuts for hinge spot
    translate([78,0,0])
    rotate([0,90,0])
    cylinder(r=12.1,h=15,$fn=F2);
  } 
}

//---------------------------------------------------------------
// assemble lid parts to make total top
module backlid(){
  union(){
    lid(type=1);
    rotate([30,0,0])
    lid(type=1);
    rotate([60,0,0])
    lid(type=1);
    
    rotate([90,0,0])
    lid(type=1);
    rotate([120,0,0])
    lid(type=1);
    rotate([150,0,0])
    lid(type=2);
  }
}
//-------------------------------------------------------------------
module arm(){
    
  difference(){
    union(){
      // main loop
      difference(){
        // boss
        cylinder(r=78,h=12,$fn=F2, center=true);
        
        // cut to make a loop
        cylinder(r=76,h=14,$fn=F2, center=true);
        
        // remove the front edge
        translate([0,-110,0])
        cube([160,160,40],center=true);
      }
      // reinforce at axles
      translate([-79.5,0,0])  
      rotate([0,90,0])
      cylinder(r=12,h=3.5,$fn=F2);
      
      translate([79.5,0,0])  
      rotate([0,-90,0])
      cylinder(r=12,h=3.5,$fn=F2);
      
    } // end union  

    // cut for the left axle  
    translate([-79.5,0,0])  
    rotate([0,90,0])
    cylinder(r=3.6,h=6,$fn=6);

    // cut for the right axle  
    translate([75,0,0])  
    rotate([0,90,0])
    cylinder(r=3.6,h=6,$fn=6);
  }
}

//----------------------------------------------------------------
module scanner(){

  if(ElOn){
    translate([-108,0,0])
    elevation();
  }

  // azimuth
  if(AzOn){
    azimuth();
  }
  
  if(TableOn){
    table(type=TableOn);
  }
  
  // shell
  if(ShellOn){
    shell();
  }
  
  // arm
  if(ArmOn){
    translate([0,0,TowerHigh])
    rotate([Az,0,0])
    arm();
  }
    
  // back lid
  if(LidOn){
    translate([0,0,TowerHigh]){
      backlid();
    }
  }
  
  if(WheelOn){
    ewheel();
  }
    
  if(BaseOn){
    translate([0,0,-13.5])
    baseplate();
  }
  if(TowerOn){
    tower();
    mirror([1,0,0])
    tower();
  }
  if(ZdriveOn){
    zdrive();
  }
  

  if(BearingsOn){
    // add left bearing
    color("red")
    translate([-84,0,TowerHigh])  
    rotate([0,-90,0])
    balls1(tol=0);
    
    // add right bearing
    color("red")
    translate([88,0,TowerHigh])  
    rotate([0,-90,0])
    balls1(tol=0);
  }  

}
//=================================================================

scanner();
//translate([-60,0,0])
//zrail(hi=TowerHigh+TowerLow);

//zclamp();
//==================================================================


