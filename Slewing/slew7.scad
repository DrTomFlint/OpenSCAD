//==================================================================
// slew7.scad
// slewing joint with cross roller bearings
//
// DrTomFlint July 2020
//==================================================================

CarrierOn = 1;
RollersOn = 1;
RollerPrint = 0;
OuterRaceOn = 1;
InnerHiOn = 1;
InnerLowOn = 1;
PlateOn = 0;
GasketOn = 0;

CutawayOn = 1;
CutawayAngle = 0;

// 9.1 is good, use that extra 0.1 on the rollers only!!
// roller outer diameter, for races
rod=9.0;          
// roller outer diameter, for rollers
rodx=9.1;
// roller inner diameter
rid=5.8;           
// roller height
rhi=rod-0.6;
// z height of bevels
rbevel=1.2;   
// half the number of rollers
Nr = 7;    

ood=36;        // outer race outer rad
oid=16;         // outer race inner rad
ohi=12;         // outer race height

iooff=0.52;     // offset race in the boss

iogap=4;        // inner outer gap

Nholei=4;     // number holes inner
rholei=1.55;     // radius of holes inner
oholei=3.0;       // offset from edge

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
    
    // cut for bolts inner
    for(i=[0:Nholei-1]){
        rotate([0,0,360/Nholei*i])
        translate([oid+oholei,0,-1])
        cylinder(r=rholei,h=ohi*2,center=true,$fn=16);
    }
  }
}

//---------------------------------
module outer1(){

lip=0;
    
  difference(){
    union(){
      ring1();  

      // extend outer race vertically to clear the bolts of inner races
      color("cyan")
      translate([0,0,ohi/2])
      cylinder(r1=ood+lip,r2=ood+lip,h=6,$fn=F1);
      color("green")
      translate([0,0,ohi/2+6])
      cylinder(r1=ood+lip,r2=ood+lip-1,h=1,$fn=F1);
    }// end union
  
    // cut the central hole
    cylinder(r=(ood+oid)*iooff+iogap/2,h=ohi*3,center=true,$fn=F1);
    translate([0,0,ohi/2+6])
    cylinder(r1=(ood+oid)*iooff+iogap/2,r2=(ood+oid)*iooff+iogap/2+1,h=1.01,$fn=F1);
  
    // add a version number for tracking
    translate([ood-0.8,0,ohi/2])
    color("red")
    rotate([90,0,90])
    linear_extrude(height=0.8){
      text("7", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
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
  }
 
  difference(){
    translate([0,0,-ohi/2-3])
    difference(){
      union(){
        color("orange")
        cylinder(r1=ood-1,r2=ood,h=1,center=true,$fn=F2);
        translate([0,0,1])
        cylinder(r=ood,h=1,center=true,$fn=F2);
        color("blue")
        translate([0,0,2])
        cylinder(r=(ood+oid)*iooff-iogap/2,h=2,center=true,$fn=F2);
      }
        
      //
      cylinder(r=oid,h=7,center=true,$fn=F1);

      // cut for bolts inner
      for(i=[0:Nholei-1]){
        rotate([0,0,360/Nholei*i])
        translate([oid+oholei,0,-1])
        cylinder(r=rholei,h=ohi*2,center=true,$fn=16);
      }

      // cuts for bolt heads
      if(1){
        for(i=[0:Nholei-1]){
          rotate([0,0,360/Nholei*i]){
            translate([oid+oholei,0,-0.1])
            cylinder(r=2.9,h=3.0,center=true,$fn=16);
            translate([oid+oholei,0,1.6])
            cylinder(r1=2.9,r2=1.55,h=1,center=true,$fn=16);
          }
        }
      }
    }
        
    translate([(ood+oid)/2-3,9,-ohi/2-4.1])
    color("red")
    rotate([0,0,-65])
    linear_extrude(height=1){
      rotate([180,0,0])
      text("7", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }        
  }    
}

//-----------------------------------
module innerHi(tol=0.1){
  difference(){
    intersection(){
      inner1();
      
      translate([-ood,-ood,+tol])
      cube([ood*2,ood*2,20]);
    }

    translate([(ood+oid)/2-7,6,ohi/2-0.2])
    color("red")
    rotate([0,0,-65])
    linear_extrude(height=0.8){
      rotate([0,0,-4])
      text("7", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }
}
}

//--------------------------------
module gasket(){
    intersection(){
    inner1();
    cylinder(r=30,h=0.2,center=true);
}
}


//--------------------------------
module carrier2(tol=-0.25){
    a1=360/Nr;
//    a1=360;
z0=ohi;
z1=0.0;     // clearance to top/bottom
tolR=0.25;  // radial tolerance to clear races    
    
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
    translate([0,0,-rhi/2-c1])
    cylinder(r=rod/2+0.3, h=rhi+2*c1, $fn=F1);

 }
for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i+180/Nr])

    color("green")
    translate([(ood+oid)*iooff,0,0])
    rotate([0,-45,0])
    translate([0,0,-rhi/2-c1])
    cylinder(r=rod/2+0.3, h=rhi+2*c1, $fn=F1);
}

// indicator cuts
    rotate([0,0,90/Nr])
    translate([(ood+oid)*iooff,0,ohi/2])
    rotate([45,0,0])
    cube([5,2,2],center=true);



}// end diff
}

// ----------------------------------
module plate1(){
    difference(){
    union(){
        cylinder(r=(ood+oid)*iooff-iogap/2-4,h=2.1,$fn=F2);
        
        cylinder(r2=3,r1=oid,h=7,$fn=12);

        cylinder(r=7.3/2,h=25,$fn=6);
}
       // cut for bolts inner
        for(i=[0:Nholei-1]){
            rotate([0,0,360/Nholei*i])
            translate([oid+oholei,0,-1])
            cylinder(r=rholei+0.05,h=ohi*2,center=true,$fn=16);
        }
            
        // center hole
        cylinder(r=rholei,h=ohi*2,$fn=6);

    }
}
//=====================================================================

// Use this to get a cutaway view of the carrier
if(0){
  difference(){
    carrier2();
    translate([22,-13,0])
    rotate([0,0,180/Nr])
    cube([40,40,40],center=true);    
  }
}

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

  // Inner race, low side only
  if(InnerLowOn){
    innerLow();
  }

  // Plate attaches to screw on inner race, used to spin with a drill
  if(PlateOn){
    plate1();
  }

  // Gasket can adjust spacing between upper and lower inner races to get
  // smooth motion of the bearing
  if(GasketOn){
    gasket();
  }
} // end of cutaway union
if(CutawayOn){
  rotate([0,0,CutawayAngle])
  translate([20,-20,0])
  cube([40,40,40],center=true);    
}
} // end of cutaway difference


//=====================================================================
