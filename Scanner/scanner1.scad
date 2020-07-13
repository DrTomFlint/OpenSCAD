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


ElOn=1;     // elevation axis, ewheel
AzOn=1;     // azimuth axis, turntable
ShellOn=0;  // shell cover
LidOn=0;    // rear lid
TableOn=0;  // rotational table, 0=off, 1=flat, 2=pillar

BaseOn=0;   // base plate

TowerOn=3;  // 0 = off, 1=left, 2=right, 3=both
TowerHigh=92;  // adjusts hub height, 92 min
BearingsOn=1;   // show bearings in the towers


ArmOn=1;    // camera arm
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
  cylinder(r=7,$fn=6,h=11);
  // thru the bearing
  translate([0,0,11])
  cylinder(r=7.8/2,h=8,$fn=F2);
  // arm engage
  translate([0,0,11+8])
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
  
  //phi=0;
  phi=30;
//  phi2=phi+4.35;
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
//  translate([ax1,ay1,-56])
//  rotate([0,0,180])
//  rotate([0,0,0])
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

  // azimuth belt
  if(0){
  color("gray")
  difference(convexity=6){
    hull(){
      translate([110,0,-9+6])
      cylinder(r=9.6/2+1.5,h=7,$fn=F2);
      translate([0,0,-3.5])
      cylinder(r=152.2/2+1.5,h=7,$fn=F2);
    }
    hull(){
      translate([110,0,-9+6-1])
      cylinder(r=9.6/2,h=9,$fn=F2);
      translate([0,0,-3.5])
      cylinder(r=152.2/2,h=9,$fn=F2);
    }
  }
  }
  
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
  
  theta=118;
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
//  translate([60,y1,TowerHigh-z1])  
//  rotate([0,-90,0])
//  rotate([0,0,90])
  translate([-58,y1,TowerHigh-z1])  
  rotate([0,90,0])
  rotate([0,0,90])
  xymotor();

  // elevation pulley
  color("cyan")
  translate([-5,y1,TowerHigh-z1])  
  rotate([0,90,0])
  pulley();

  // elevation idler
  color("cyan")
  translate([0,y2,TowerHigh-z2])  
  rotate([0,90,0])
  idler();


  // left axle
  translate([3,0,TowerHigh])  
  rotate([0,90,0])
  axle();

  // right axle
  translate([201,0,TowerHigh])  
  rotate([0,-90,0])
  axle();
  
  // fwheel
if(0){
  translate([184,0,TowerHigh])  
  rotate([0,90,0])
  fwheel();
}

/*  // elevation belt
  color("gray")
  difference(convexity=6){
    hull(){
      // pulley
      translate([9,dy1,12])  
      rotate([0,-90,0])
      cylinder(r=9.6/2+1.5,h=7,$fn=F2);
      // ewheel
      translate([2,0,100])  
      rotate([0,90,0])
      cylinder(r=152.2/2+1.5,h=7,$fn=F2);
    }
    hull(){
      translate([9,dy1,12])  
      rotate([0,-90,0])
      cylinder(r=9.6/2,h=9,$fn=F2);
      translate([2,0,100])  
      rotate([0,90,0])
      cylinder(r=152.2/2,h=9,$fn=F2);
    }
  }
  */
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

}

//---------------------------------------------------------------------
module tower(){

TowerLow=58;

  difference(){
    union(){
      // left tower
      translate([-85,-10,-TowerLow])
      cube([4,20,TowerHigh+TowerLow]);
      // make I beams
      translate([-88,-10,-TowerLow])
      cube([4,3,TowerHigh+TowerLow]);
      translate([-88,10,-TowerLow])
      cube([4,3,TowerHigh+TowerLow]);
    
      // left bearing housing
      translate([-80,0,TowerHigh])  
      rotate([0,-90,0])
      cylinder(r=12,h=8,$fn=F2);
      
      // left bearing light shield
      translate([-82.5,0,TowerHigh])  
      rotate([0,-90,0])
      cylinder(r=16,h=4,$fn=F2);
      
      
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
    translate([-102,0,0])
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

  if(BearingsOn){
    // add left bearing
    color("red")
    translate([-81,0,TowerHigh])  
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

//==================================================================


