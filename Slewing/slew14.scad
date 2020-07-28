//==================================================================
// slew14.scad
// A slewing joint with cross roller bearings.
// ** larger pulley than inner race to increase length of belt
// ** small settings for elevation drive 
// ** test for moving the timing belt pulley to the inner race
//
// This has only been tested with the default parameters, if you are
// changing them be careful and look closely at the models.  I am not
// sure that all the dimensions will scale correctly.
// 
// When printing the rollers, do one piece at a time.  If you make a 
// full set of 12 at once there will be bumps on the surface where
// the printhead moved horizontally to the next part on each layer.  
// Doing them 1 at a time keeps the retraction bump sticking up in the 
// vertical direction so it will get covered by the next layer.
//
// If your slicer supports it you can set it to finish each part before
// starting the next, be sure the parts are placed far enough apart so
// the printhead doesn't strike a finished part when making a new one.
//
// I use 0.1 mm layers for the rollers and the races.  If you have 
// adaptive layer thickness, you can increase the thickness of sections
// that are not on the bearing races to 0.3 mm 
//
// There may be some design improvements that use conical rollers, but
// I have not tried that yet.
//
// The upper and lower races screw together.  This allows you to set the
// tension on the rollers.  There is a set of holes on the inner race
// that should fit a raw bit of 1.75 mm filament.  This is used to lock
// the screw in place.  
//
// This version still has some bad hacks in it.  In particular the added
// GT2 timing belt pulley on the outer race will require some manual 
// coding if you change other parameters.  The dimensions are set in 
// timing2.scad file and not computed from the other parameters.  There
// is also a 45 degree cylindrical support that fits just below the 
// pulley to make the outer race printable without support.  That will
// need manual adjustment.
//
// If you don't need the timing pulley you can turn it off with PulleyOn
// and save messing with it.  The rest of the bearing should scale OK.
//
// This was tested using PetG on a Prusa i3 mk3s.
//
// DrTomFlint July 2020
//==================================================================

use <../Parts/threads.scad>  // include the threads.scad file
use <../Parts/timing2.scad>  // include the timing2.scad file
use <../Parts/timing4.scad>  // include the timing2.scad file
use <../Parts/timing5.scad>  // include the timing2.scad file
use <../Parts/timing6.scad>  // include the timing2.scad file
use <../Fractals/Lsystem.scad>

CarrierOn = 0;    // 1=turned on, 0=turned off
RollersOn = 0;    // use this only for design, see how roller fit
RollerPrint = 0;  // use this only for printing the rollers
OuterRaceOn = 1;
InnerHiOn = 1;
InnerLowOn = 1;
InnerCapOn = 0;
PulleyOn = 0;
Pulley2On = 0;
JwheelOn = 1;

OuterTab = 2; // 0=off, 1=inner, 2=outer, 3=special for insert in tower
InnerTab = 3; // 0=off, 1=inner, 2=outer, 3=internal 90 degreee

CutawayOn = 0;    // turn this on to make a sectional view
CutawayAngle = 0; // adjust the angle of the sectional cut

// 9.1 is good, use that extra 0.1 on the rollers only!!
// roller outer diameter, for races
rod=9.0;          
// roller outer diameter, for rollers
rodx=9.2;
// roller inner diameter
rid=5.8;           
// roller height
rhi=rod-0.6;
// z height of bevels
rbevel=1.2;   
// half the number of rollers
Nr = 8;    

//ood=75;        // outer race outer rad
ood=50;        // outer race outer rad
oid=ood-25;         // outer race inner rad
ohi=15;         // outer race height

iooff=0.525;     // offset race in the boss

iogap=4;        // inner outer gap

Ntabo=3;      // number of bolt down tabs outer 
Ntabi=4;      // number of bolt down tabs inner
Ntab2=4;      // number of bolt down tabs outer race inner side 
Ntab3=4;      // number of bolt down tabs inner race outer side

//CutAngle=180/Nr;   // cutaway view if < 360
CutAngle=360;   // cutaway view if < 360

F1=200;              // $fn for rollers
F2=44;              // $fn for less critical

//-------------------------------
// solid rollers, print in PetG
module roller1(tol=0){

  union(){
    // boss is stack of 3 cylinders
    translate([0,0,-tol])
    cylinder(r1=rodx/2-rbevel,  r2=rodx/2+tol, h=rbevel+tol, $fn=F1);

    translate([0,0,rbevel])
    cylinder(r=rodx/2+tol, h=rhi-2*rbevel, $fn=F1);
        
    translate([0,0,rhi-rbevel])
    cylinder(r1=rodx/2+tol,  r2=rodx/2-rbevel, h=rbevel, $fn=F1);
  }
}

//-------------------------------
module roller1cut(tol=0){

  translate([0,0,rbevel])
  cylinder(r=rod/2+tol, h=rhi-2*rbevel, $fn=F1);
}

//------------------------------------
module ring1(tol=0.1){
    
  difference(){
    union(){
      // main ring
      rotate_extrude(angle=CutAngle,$fn=F1){
      translate([(ood+oid)/2,0,0])
      square([ood-oid,ohi],center=true);
      }
    } // end union
  
    // cut for races
    rotate_extrude($fn=F1){
      translate([(ood+oid)*iooff,0,0])
      rotate([0,0,45])
      offset(r=rbevel,$fn=F2)
      square([rod-rbevel*2+tol,
          rod-rbevel*2+tol],center=true);
    }
    
  }
}

//---------------------------------
module outer1(){

lip=0;
    
  difference(){
    union(){
      // main outer 
      ring1();
      if(PulleyOn){ 
        // add teeth for a GT2 timing belt, this is a bit of a hack
        // and will not scale with other parameters.  The dimensions are
        // all set in the timing2.scad file.
        // @TODO fix the use of the pulley.
        translate([0,0,-6]){ 
          time4();
          // add lower support for the time2 timing belt pulley
          translate([0,0,-1.5]) 
          difference(){
            cylinder(r1=ood,r2=ood+2.5,h=2.5,$fn=F1);
            cylinder(r=ood-2,h=2.5,$fn=F1);
          }
          // add upper support for the time2 timing belt pulley
          translate([0,0,10.25]) 
          difference(){
            cylinder(r2=ood,r1=ood+2.5,h=2.5,$fn=F1);
            cylinder(r=ood-2,h=2.5,$fn=F1);
          }
        }
      }

if(0){
      // extend outer race vertically to clear the carrier
      color("green")
      translate([0,0,ohi/2])
      cylinder(r1=ood+lip,r2=ood+lip-1,h=1,$fn=F1);
}

      // base plate  
      color("green")
      translate([0,0,-ohi/2-2])
      cylinder(r=ood,h=2,$fn=F1);

  
      // Outer tabs for bolting down  
      if(OuterTab==2){
      translate([0,0,2])
      for(i=[0:Ntabo-1]){
        rotate([0,0,i*360/Ntabo]){
          
          hull(){
            translate([0,ood,-ohi/2-4])
            scale([1,1.5,1])
            cylinder(r=5,h=4,$fn=F1);
            translate([0,ood-5,-ohi/2-4])
            scale([3,1,1])
            cylinder(r=3,h=4,$fn=F1);
          }

        }
      }
      }

      // Special Outer tabs for bolting down  
      if(OuterTab==3){
      translate([0,0,ohi+1])
      for(i=[0:Ntabo-1]){
        rotate([0,0,i*360/Ntabo]){
          
          hull(){
            translate([0,ood,-ohi/2-4])
            scale([1,1.5,1])
            cylinder(r=5,h=3,$fn=F1);
            translate([0,ood-5,-ohi/2-4])
            scale([3,1,1])
            cylinder(r=3,h=3,$fn=F1);
          }

        }
      }
      }

    }// end union

    // holes in the outer tabs for bolting down
    if(OuterTab==2){
      translate([0,0,2])
      for(i=[0:Ntabo-1]){
        rotate([0,0,i*360/Ntabo])
        translate([0,ood+4,-ohi/2-6])
        cylinder(r=1.7,h=8,$fn=F1);
      }
    }
    // holes in the special tabs for bolting down  
    if(OuterTab==3){
      translate([0,0,ohi+1])
      for(i=[0:Ntabo-1]){
        rotate([0,0,i*360/Ntabo])
        translate([0,ood+4,-ohi/2-6])
        cylinder(r=1.7,h=8,$fn=F1);
      }
    }
    
    // inner bevel base plate  
    translate([0,0,-ohi/2-2.01])
    cylinder(r1=(ood+oid)*iooff+iogap/2+1,r2=(ood+oid)*iooff+iogap/2,h=1,$fn=F1);

    // outer bevel outer race high
    if(0){
      translate([0,0,ohi/2-2.01]){
        difference(){
          cylinder(r=ood+2,h=3,$fn=F2);
          cylinder(r1=ood+1,r2=ood-2,h=3.1,$fn=F1);
        }
      }
    }

    // outer bevel outer race low
    if(0){
      translate([0,0,-ohi/2-2.5]){
        difference(){
          cylinder(r=ood+2,h=3,$fn=F2);
          cylinder(r1=ood-2,r2=ood+1,h=3.1,$fn=F1);
        }
      }
    }


    // cut the central hole
    cylinder(r=(ood+oid)*iooff+iogap/2,h=ohi*3,center=true,$fn=F1);
      
  }// end diff
 
  // Inner tabs for bolting down 
  if(OuterTab==1){
  for(i=[0:Ntab2-1]){
    rotate([0,0,i*360/Ntabi]){
      difference(){
        hull(){
          color("pink")
          translate([0,oid,-ohi/2-4])
          scale([1,1.5,1])
          cylinder(r=5,h=3,$fn=F1);
          color("cyan")
          translate([0,ood-6,-ohi/2-4])
          scale([3,1,1])
          cylinder(r=5,h=3,$fn=F1);
        }
        // bolt holes
        translate([0,oid-4,-ohi/2-6])
        cylinder(r=1.7,h=8,$fn=F1);
        // arch holes
        translate([0,ood-4,-ohi/2-6])
        scale([1,1.5,1])
        cylinder(r=8,h=8,$fn=F1);
      }
    }
  }
  }
}

//---------------------------------
module inner1(){
    
    intersection(){
        ring1();  
        // cut for inner ring
        cylinder(r=(ood+oid)*iooff-iogap/2,h=ohi*3,center=true,$fn=F1);
    }   
    
}
//-----------------------------------
module innerLow(tol=0.1){
  difference(){
    inner1();
    
    translate([-ood,-ood,-tol])
    cube([ood*2,ood*2,20]);

    // cut for threads
    translate([0,0,-ohi/2+0.2])
    metric_thread (diameter=oid*2+7+0.7, pitch=2, length=ohi/2, leadin=3, n_starts=2);
    
    // cuts for the locking pins
    rlock=6;
    for(i=[-3:3]){
      rotate([0,0,-180/Ntabi+6*i])
      translate([0,-oid-rlock,-ohi/2-2])
      cylinder(r=1.9/2,h=2*ohi,$fn=33);
      rotate([0,0,-180/Ntabi+6*i+180])
      translate([0,-oid-rlock,-ohi/2-2])
      cylinder(r=1.9/2,h=2*ohi,$fn=33);
    }    

    // extra clearance for top threaded part, make these thru holes so
    // it might be possible to remove the locking pin
    translate([0,0,-ohi/2])
    cylinder(r=(oid*2+5.6)/2, h=0.5, $fn=F2);

      // main bore recut with taper
    cylinder(r1=oid-1,r2=oid+4,h=ohi*2.5,center=true,$fn=F1);


  }
 }

//-------------------------------------------------------
module innerCap(tol=0){
  
  intersection(){
    translate([0,0,ohi/2+3])
    rotate([0,0,0])
    rotate([0,0,72/2])
    linear_extrude(height=9,convexity=10)
    scale([5.2,5.2])
    penrose_tiling(n=5, w=0.2);
    
    translate([0,0,ohi/2+3])
  //  cylinder(r=112/2,h=12,$fn=F1);
    // cut for the central bore
    cylinder(r1=oid-1,r2=oid+4,h=ohi*3,center=true,$fn=F1);
  }
  


}

//------------------------------------------------------------------------------
module jwheel(){

difference(){
union(){            
  // pulley from timing5.scad, bore diameter 110
  translate([0,0,ohi/2+2])
  time6();

  // riser from inner race to attach the pulley     ******************************************************************
  translate([0,0,ohi/2])
  cylinder(r1=(ood+oid)*iooff-iogap/2,r2=oid+6,h=12.3,$fn=F1);
  
  intersection(){
    translate([0,0,ohi/2+6.3])
    rotate([0,0,0])
    rotate([0,0,72/2])
    linear_extrude(height=6,convexity=10)
    //scale([5.2,5.2])
    scale([6.5,6.5])
    penrose_tiling(n=5, w=0.2);
    
    translate([0,0,ohi/2+3])
    cylinder(r=112/2,h=12,$fn=F1);
  }
}

    // cut for the central bore
    cylinder(r1=oid-1,r2=oid+4,h=ohi*3,center=true,$fn=F1);
    
    // cut for the top inside bevel
    translate([0,0,ohi/2+11])
    cylinder(r1=oid+3.0,r2=oid+5,h=2,$fn=F1);
  }
  
  // bolt in tabs
    intersection(){
    // center bore
    cylinder(r1=oid-1,r2=oid+4,h=ohi*2.5,center=true,$fn=F1);

    for(i=[0:Ntabi-1]){
      rotate([0,0,i*360/Ntabi]){
        color("green")
        difference(){
          // boss sticks out from inner wall
          translate([0,oid+2,-ohi/2+15])
          //rotate([-16,0,0])
          scale([1,1.2,1])
          cylinder(r=5,h=5,$fn=F1);
          
          // bolt holes
          translate([0,oid-1,-ohi/2+10])
          cylinder(r=1.7,h=30,$fn=F2);

        }
      }
    }
  }

}


//-----------------------------------
module innerHi(tol=0.1){
  color("orange")
  difference(){
    union(){
      // top half of the inner race
      intersection(){
        color("orange")
        inner1();
        
        color("orange")
        translate([-ood,-ood,+tol])
        cube([ood*2,ood*2,20]);
      }

      // add a raised section (inner tabs)
      if(InnerTab<2){
        color("orange")
        translate([0,0,ohi/2])
        cylinder(r=(ood+oid)*iooff-iogap/2,h=2,$fn=F1);
        color("orange")
        translate([0,0,ohi/2+2])
        cylinder(r1=(ood+oid)*iooff-iogap/2,r2=(ood+oid)*iooff-iogap/2-1,h=1,$fn=F1);
      }
      // raised section (outer tabs)
      if(InnerTab==2){
        color("orange")
        translate([0,0,ohi/2])
        cylinder(r=(ood+oid)*iooff-iogap/2,h=4,$fn=F1);
        //color("orange")
        translate([0,0,ohi/2+4])
        cylinder(r1=(ood+oid)*iooff-iogap/2,r2=(ood+oid)*iooff-iogap/2-1,h=1,$fn=F1);
      }      
      
    }
    
    // cut for the central bore
    cylinder(r1=oid-1,r2=oid+4,h=ohi*3,center=true,$fn=F1);
    
    // cut for the top inside bevel
    translate([0,0,ohi/2+12])
    cylinder(r1=oid+3.0,r2=oid+5,h=2,$fn=F1);
    
    // cuts for the locking pins
    rlock=6;
    for(i=[-3:3]){
      rotate([0,0,-180/Ntabi+7*i])
      translate([0,-oid-rlock,-ohi/2-2])
      cylinder(r=1.9/2,h=2*ohi,$fn=33);
      rotate([0,0,-180/Ntabi+7*i+180])
      translate([0,-oid-rlock,-ohi/2-2])
      cylinder(r=1.9/2,h=2*ohi,$fn=33);
    }    
      
  } // end diff from main union

  // inner tabs for bolting down  
  if(InnerTab==1){
    for(i=[0:Ntabi-1]){
      rotate([0,0,i*360/Ntabi]){
        color("gray")
        difference(){
          hull(){
            translate([0,oid,ohi/2])
            scale([1,1.5,1])
            cylinder(r=5,h=3,$fn=F1);      

            translate([0,oid+2,ohi/2])
            scale([3,1,1])
            cylinder(r=3,h=3,$fn=F1);      
          }
          translate([0,oid-4,ohi/2-4])
          cylinder(r=1.7,h=8,$fn=F1);
        }
      }
    }
  }
    
  // outer tabs for bolting down
  if(InnerTab==2){
    for(i=[0:Ntab3-1]){
      rotate([0,0,i*360/Ntab3]){
        //color("red")
        difference(){
          union(){
            // main arm
            hull(){
              translate([0,ood+4,ohi/2+2])
              scale([1,1.5,1])
              cylinder(r=5,h=3,$fn=F1);      

              translate([0,oid+11,ohi/2+2])
              scale([5,1,1])
              cylinder(r=3,h=3,$fn=F1);      
            }
            // fillet
            hull(){
              translate([0,oid+12,ohi/2+2])
              scale([5,1,1])
              cylinder(r=2.9,h=3,$fn=F1);      

              translate([0,oid+10,ohi/2+0])
              scale([5,1,1])
              cylinder(r=3,h=5,$fn=F1);      
            }
            
          }
          // bolt holes
          translate([0,ood+7,ohi/2])
          cylinder(r=1.7,h=8,$fn=F1);
          // arch holes
          translate([0,0.5*(ood+oid),ohi/2])
          scale([1,1.8,1])
          cylinder(r=7,h=8,$fn=F1);
        }
      }
    }
  }
  
  // special tabs for bolting down  
  if(InnerTab==3){
    intersection(){
      // center bore
      cylinder(r1=oid-1,r2=oid+4,h=ohi*2.5,center=true,$fn=F1);

      for(i=[0:Ntabi-1]){
        rotate([0,0,i*360/Ntabi]){
          color("gray")
          difference(){
            // boss sticks out from inner wall
            translate([0,oid+2,-ohi/2])
            //rotate([-16,0,0])
            scale([1,1.2,1])
            cylinder(r=5,h=15,$fn=F1);
            
            // bolt holes
            translate([0,oid-1,-ohi/2-5])
            cylinder(r=1.7,h=30,$fn=F2);

          }
        }
      }
    }
  }
    
  // add thread
  difference(){  
    translate([0,0,-ohi/2+0.2])
    metric_thread (diameter=oid*2+7, pitch=2, length=ohi/2, leadin=3, n_starts=2);

    // cut for center bore
    cylinder(r1=oid-1,r2=oid+4,h=ohi*2.5,center=true,$fn=F1);


  }
}

//--------------------------------
module carrier2(tol=-0.25){

z0=ohi;
z1=0.0;     // clearance to top/bottom
tolR=0.5;  // radial tolerance to clear races    
    
difference(){ 
  union(){  
     difference(){
        // outer ring
        translate([0,0,z1])
            cylinder(r=(ood+oid)*iooff+iogap/2-tolR,h=z0-z1,center=true,$fn=F1);
                
        // cut for inner ring
        translate([0,0,-z1])
        cylinder(r=(ood+oid)*iooff-iogap/2+tolR,h=ohi*1.3,center=true,$fn=F1);
    }   
    }

c1=2;
    
for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i])

    color("red")
    translate([(ood+oid)*iooff,0,0])
    rotate([0,45,0])
    translate([0,0,-rhi/2-c1-rhi/2])
    cylinder(r=rodx/2+0.15, h=2*rhi+2*c1, $fn=F1);

 }
for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i+180/Nr])

    color("green")
    translate([(ood+oid)*iooff,0,0])
    rotate([0,-45,0])
    translate([0,0,-rhi/2-c1-rhi/2])
    cylinder(r=rodx/2+0.15, h=2*rhi+2*c1, $fn=F1);
}

// indicator cut
    color("pink")
    rotate([0,0,90/Nr-1])
    translate([(ood+oid)*iooff,0,ohi/2])
    rotate([45,0,0])
    cube([5,2,2],center=true);



}// end diff
}

//=====================================================================

module slew14(){
// make a union of all the parts to allow a cutaway view
difference(){
union(){    
  // This is the carrier that keeps the rollers seperated
  if(CarrierOn){
    carrier2();
  }

  // this makes the full set of rollers, use for modeling not printing
  if(RollersOn){
    for(i=[0:Nr-1]){
        rotate([0,0,360/Nr*i])

        color("red")
        translate([(ood+oid)*iooff,0,0])
        rotate([0,45,0])
        translate([0,0,-rhi/2])
        roller1();
    }
    for(i=[0:Nr-1]){
        rotate([0,0,360/Nr*i+180/Nr])

        color("green")
        translate([(ood+oid)*iooff,0,0])
        rotate([0,-45,0])
        translate([0,0,-rhi/2])
        roller1();
    }
  }

  // Make 1 roller, use for printing
  if(RollerPrint){
    roller1();
  }

  // Outer bearing race
  if(OuterRaceOn){
    outer1();
  }

  // Inner race, high side only
  if(InnerHiOn){
    innerHi();
  }
  if(JwheelOn){
    jwheel();
  }
  if(InnerCapOn){
    innerCap();
  }

  // Inner race, low side only
  if(InnerLowOn){
  //translate([0,0,-40])
    innerLow();
  }

} // end of cutaway union
if(CutawayOn){
  rotate([0,0,CutawayAngle])
  translate([ood,-ood,0])
  cube([2*ood,2*ood,3*ohi],center=true);    
}
} // end of cutaway difference
}

//=======================
slew14();

//=====================================================================
