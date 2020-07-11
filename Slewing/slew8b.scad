//==================================================================
// slew8B.scad
// A slewing joint with tapered cross roller bearings.
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
// tension on the rollers.  There is a set of holes on the inner bore 
// that should fit a raw bit of 1.75 mm filament.  This is used to lock
// the screw in place.  The holes go all the way through the lower race,
// so you should be able to remove the locking pin by pushing it out 
// with a paperclip or needle.  Don't push the locking pin all the way 
// into the hole until you have worn in the bearing a bit.
//
// This was tested using PetG on a Prusa i3 mk3s.
//
// DrTomFlint July 2020
//==================================================================

use <../Parts/threads.scad>  // include the threads.scad file

CarrierOn = 1;    // 1=turned on, 0=turned off
Rollers2On = 1;    // use this only for design, see how roller fit
Roller2Print = 0;  // use this only for printing the rollers
OuterRaceOn = 1;
InnerHiOn = 1;
InnerLowOn = 1;

CutawayOn = 1;    // turn this on to make a sectional view
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
Nr = 6;    


// tapered rollers
rod2=8.0;
rod3=10.0;
rbev2=1.2;
rhi2=rod2-0.2;

ood=36;        // outer race outer rad
oid=16;         // outer race inner rad
ohi=15;         // outer race height

iooff=0.52;     // offset race in the boss

iogap=4;        // inner outer gap

Nholei=4;     // number holes inner
rholei=1.55;     // radius of holes inner
oholei=3.0;       // offset from edge

//CutAngle=180/Nr;   // cutaway view if < 360
CutAngle=360;   // cutaway view if < 360

F1=200;              // $fn for rollers
F2=44;              // $fn for less critical

//--------------------------------------------------------------
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
//------------------------------------------------------------------
// solid rollers, print in PetG
module roller2(tol=0){
 
  if(1){
  difference(){
    union(){
      // boss is stack of 3 cylinders
      translate([0,0,-tol])
      cylinder(r1=rod3/2-rbev2,  r2=rod3/2+tol, h=rbev2+tol, $fn=F1);

      translate([0,0,rbev2])
      cylinder(r1=rod3/2+tol,r2=rod2/2+tol, h=rhi2-2*rbev2, $fn=F1);
          
      translate([0,0,rhi2-rbev2])
      cylinder(r1=rod2/2+tol,  r2=rod2/2-rbev2, h=rbev2, $fn=F1);

      // top tip
      translate([0,0,rhi2-0.25])
      scale([1,1,0.5])
      sphere(r=2.6, $fn=F1);
      
    }
    cylinder(r=2+0.1,h=5.2,$fn=F1);
  }
  }
  if(1){
  // bottom tip insert
  translate([0,0,+0.5])
  scale([1,1,0.7])
  color("red")
  sphere(r=2, $fn=F1);
  cylinder(r=2,h=7,$fn=F1);
  translate([0,0,7])
  cylinder(r1=2,r2=1.5,h=1,$fn=F1);
  }
  if(0){
  // printing support for the pin
  translate([0,0,8-0.15]){
    cube([8,1.2,0.3],center=true);
    cube([1.2,8,0.3],center=true);
  }  
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
  
    // cut for races square
    if(0){
      rotate_extrude($fn=F1){
        translate([(ood+oid)*iooff,0,0])
        rotate([0,0,45])
        offset(r=rbevel,$fn=F2)
        square([rod-rbevel*2+tol,
            rod-rbevel*2+tol],center=true);
      }
    }
    if(1){
      // cut for races tapered
      rotate_extrude($fn=F1){
        translate([(ood+oid)*iooff,0,0])
        rotate([0,0,0])
        offset(r=rbevel+tol,$fn=F2)
        offset(r=-rbevel,$fn=F2)
        polygon(points=0.707*[ [0,-rod2], [0.95*rod3,-0.2*rhi2], [0.95*rod3,0.2*rhi2], [0,rod2],
               [0,1.2*rod3],  [-0.90*rod2,0.1*rhi2], [-0.90*rod2,-0.1*rhi2], [0,-1.2*rod3] ]);
      }
    }
  }
}

//---------------------------------
module outer1(){

lip=0;
    
  difference(){
    union(){
      ring1();  

      // extend outer race vertically to clear the inner race
      color("green")
      translate([0,0,ohi/2])
      cylinder(r1=ood+lip,r2=ood+lip-1,h=1,$fn=F1);
    }// end union
  
    // cut the central hole
    cylinder(r=(ood+oid)*iooff+iogap/2,h=ohi*3,center=true,$fn=F1);
    translate([0,0,ohi/2+6])
    cylinder(r1=(ood+oid)*iooff+iogap/2,r2=(ood+oid)*iooff+iogap/2+1,h=1.01,$fn=F1);
  
    // add a version number for tracking
    translate([ood-0.8,0,0])
    color("red")
    rotate([90,0,90])
    linear_extrude(height=0.8){
      text("8B", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }
    
    // bevel on lower edge, causes print to peel up from buildplate?
    if(0){
      translate([0,0,-ohi/2-0.01]){
        difference(){
          cylinder(r=ood+0.01,h=1,$fn=F1);
          cylinder(r1=ood-1,r2=ood,h=1.01,$fn=F1);
        }
      }
    }
  }// end diff
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
    metric_thread (diameter=oid*2+7+0.7, pitch=2, length=ohi/2, leadin=3);
    
    // extra clearance for top threaded part, make these thru holes so
    // it might be possible to remove the locking pin
    translate([0,0,-ohi/2])
    cylinder(r=(oid*2+5.5)/2, h=0.5, $fn=F2);

    // cuts to lock threads
    for(i=[-4:4]){
      rotate([0,0,9*i])
      translate([0,-oid+1,-ohi/2])
      rotate([90,0,0])
      cylinder(r=1.9/2,h=6+10,$fn=F2);
    }
  }
 
  // bottom plate
  difference(){
    translate([0,0,-ohi/2-3])
    difference(){
      union(){
        color("orange")
        cylinder(r1=ood-5,r2=ood-4,h=1,center=true,$fn=F1);
        translate([0,0,1])
        cylinder(r=ood-4,h=1,center=true,$fn=F1);
        color("blue")
        translate([0,0,2])
        cylinder(r=(ood+oid)*iooff-iogap/2,h=2,center=true,$fn=F1);
      }
        
      // Center bore
      cylinder(r=oid,h=9,center=true,$fn=F1);      
    
      // lower bevel cut on inner diameter
      translate([0,0,-0.51])
      cylinder(r1=oid+1,r2=oid,h=1,$fn=F1);

      // repeat the cuts to lock threads
      for(i=[-4:4]){
        rotate([0,0,9*i])
        translate([0,-oid+1,3])
        rotate([90,0,0])
        cylinder(r=1.9/2,h=6+10,$fn=F1);
      }
    }
        
    translate([(ood+oid)/2-3,9,-ohi/2-4.1])
    color("red")
    rotate([0,0,-65])
    linear_extrude(height=1){
      rotate([180,0,0])
      text("8B", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }        
  }    
}

//-----------------------------------
module innerHi(tol=0.1){
  color("orange")
  difference(){
    intersection(){
      color("orange")
      inner1();
      
      color("orange")
      translate([-ood,-ood,+tol])
      cube([ood*2,ood*2,20]);
    }

    // upper bevel cut on inner diameter
    color("orange")
    translate([0,0,ohi/2-1])
    cylinder(r1=oid,r2=oid+1,h=1.01,$fn=F1);

    translate([(ood+oid)/2-6,6,ohi/2-0.2])
    color("red")
    rotate([0,0,-65])
    linear_extrude(height=0.8){
      rotate([0,0,-4])
      text("8B", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }
  }
  
  // add thread
  difference(){  
    translate([0,0,-ohi/2+0.2])
    metric_thread (diameter=oid*2+7, pitch=2, length=ohi/2, leadin=3);

    cylinder(r=oid,h=ohi*2,center=true,$fn=F1);

    // cuts to lock threads, increase angular displacement by 1 deg
    // versus the cuts on the innerLow part, should insure some align
    for(i=[-4:4]){
      rotate([0,0,12*i])
      translate([0,-oid+1,-ohi/2])
      rotate([90,0,0])
      cylinder(r=1.9/2,h=6,$fn=F2);
    }
  }
  
}

//--------------------------------
module carrier2(tol=-0.25){
    a1=360/Nr;
//    a1=360;
z0=ohi;
z1=0.0;     // clearance to top/bottom
tolR=0.5;  // radial tolerance to clear races, increased from 0.25 for 8B
    
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

// cuts for cylinderical rollers
if(0){
  c1=2;    
  for(i=[0:Nr-1]){
      rotate([0,0,360/Nr*i])

      color("red")
      translate([(ood+oid)*iooff,0,0])
      rotate([0,45,0])
      translate([0,0,-rhi/2-c1-rhi/2])
      cylinder(r=rodx/2+0.2, h=2*rhi+2*c1, $fn=F1);

   }
  for(i=[0:Nr-1]){
      rotate([0,0,360/Nr*i+180/Nr])

      color("green")
      translate([(ood+oid)*iooff,0,0])
      rotate([0,-45,0])
      translate([0,0,-rhi/2-c1-rhi/2])
      cylinder(r=rodx/2+0.2, h=2*rhi+2*c1, $fn=F1);
  }
}
// cuts for tapered rollers
if(1){
  c1=2;    
  c2=0.5;
  for(i=[0:Nr-1]){
      rotate([0,0,360/Nr*i])

      color("red")
      translate([(ood+oid)*iooff,0,c2])
      rotate([0,45,0])
      translate([0,0,-rhi/2-c1-rhi/2])
      cylinder(r=rod3/2, h=2*rhi+2*c1, $fn=F1);

   }
  for(i=[0:Nr-1]){
      rotate([0,0,360/Nr*i+180/Nr])

      color("green")
      translate([(ood+oid)*iooff,0,-c2])
      rotate([0,-45,0])
      translate([0,0,-rhi/2-c1-rhi/2])
      cylinder(r=rod3/2, h=2*rhi+2*c1, $fn=F1);
  }
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


// make a union of all the parts to allow a cutaway view
difference(){
union(){    
  // This is the carrier that keeps the rollers seperated
  if(CarrierOn){
    carrier2();
  }


  // Make 1 roller, use for printing
  if(Roller2Print){
    roller2();
  }

  // this makes the full set of rollers, use for modeling not printing
  if(Rollers2On){
    for(i=[0:Nr-1]){
        rotate([0,0,360/Nr*i])

        color("red")
        translate([(ood+oid)*iooff,0,0])
        rotate([0,45+180,0])
        translate([0,0,-rhi/2])
        roller2();
    }
    for(i=[0:Nr-1]){
        rotate([0,0,360/Nr*i+180/Nr])

        color("green")
        translate([(ood+oid)*iooff,0,0])
        rotate([0,-45,0])
        translate([0,0,-rhi/2])
        roller2();
    }
  }

  // Outer bearing race
  if(OuterRaceOn){
    outer1();
  }

  // Inner race, high side only
  if(InnerHiOn){
    innerHi();
  }

  // Inner race, low side only
  if(InnerLowOn){
    innerLow();
  }

} // end of cutaway union
if(CutawayOn){
  rotate([0,0,CutawayAngle])
  translate([20,-20,0])
  cube([40,40,40],center=true);    
}
} // end of cutaway difference


//=====================================================================
