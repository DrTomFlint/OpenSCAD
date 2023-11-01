//=================================================================================
// Calorimeter2.scad
// Calorimeter for inverter loss estimation using immersion cooling
//
//
// Dr Tom Flint, 10 March 2021
// Change to minimal tub volume design 31 Oct 2023
//
//=================================================================================


use <../Parts/rounder.scad>
use <../Parts/ti.scad>
use <./quickie.scad>

// Lid Angle
LidAngle=180;
// Lid Lift
LidLift=40;

//--------------------------------------------------
module L1(len=10){

difference(){
  union(){
    cube([25.5,3.2,len]);
    cube([3.2,25.5,len]);  
    translate([3.2,3.2,0])
    rounder(r=3.2,h=len);
  }
  
  translate([3.2,25.5,0])
  rotate([0,0,180])
  rounder(r=3.2,h=len);

  translate([25.5,3.2,0])
  rotate([0,0,180])
  rounder(r=3.2,h=len);
}

}
  
//--------------------------------------------------
module base1(){
  // base plate
  color("gray")
  cube([330,254,3]);
  
  // back plate
  difference(){
    color("orange")
    translate([0,254,0])
    cube([330,3,152]);
    // holes for coolant
    translate([65,254,3+40])
    rotate([90,0,0])
    cylinder(r=9.2,h=10,center=true,$fn=33);
    translate([245,254,3+72])
    rotate([90,0,0])
    cylinder(r=9.2,h=10,center=true,$fn=33);
  }

  // back left vertical L
  translate([0,254,3])
  rotate([0,0,-90])
  L1(len=152-6);
  
  // back right vertical L
  translate([330,254,3])
  rotate([0,0,180])
  L1(len=152-6);

  // back horizontal L
  translate([(330+151)/2,254,3])
  rotate([0,-90,0])
  rotate([0,0,-90])
  L1(len=151);

}
//--------------------------------------------------
module base2(){
  // base plate
  color("pink")
  translate([-15.2-3,-15.2-3,-15.2])
  cube([330+2*(15.2+3),254+2*(15.2+3),15.2]);
  
  difference(){
    // back plate
    color("pink")
    translate([-3-15.2,254+3,0])
    cube([330+2*(3+15.2),15.2,152+15.2]);
    // holes for coolant
    translate([65,260,3+40])
    rotate([90,0,0])
    cylinder(r=9.2,h=30,center=true,$fn=33);
    translate([245,260,3+72])
    rotate([90,0,0])
    cylinder(r=9.2,h=30,center=true,$fn=33);
  }
}

//--------------------------------------------------
// AL sheets 3 mm thick and 90 degree L stock

module lid1(){

if(1){
  // top plate
  color("silver")
  translate([0,0,152-3])
  cube([330,254,3]);
}

  // left plate
  color("red")
  translate([-3,0,0])
  cube([3,254,152]);
  
  // right plate
  color("green")
  translate([330,0,0])
  cube([3,254,152]);
  
  // front plate
  color("yellow")
  translate([0,-3,0])
  cube([330,3,152]);
  
  // front left vertical L
  translate([0,0,3])
  L1(len=152-6);
  
  // left horizontal L
  translate([0,254/2-151/2,152-3])
  rotate([-90,0,0])
  L1(len=151);

  // front right vertical L
  translate([330,0,3])
  rotate([0,0,90])
  L1(len=152-6);

  // right horizontal L
  translate([330-3,254/2-151/2,152-3])
  rotate([-90,0,0])
  rotate([0,0,90])
  L1(len=151);


  // front horizontal L
  translate([(330+151)/2,0,152-3])
  rotate([0,-90,0])
  rotate([0,0,90])
  L1(len=151);


}  

//--------------------------------------------------
// insulated panels XPS foam 1/2" nominal 15.2 mm measured R3 value

module lid2(){

if(1){
  // top plate
  color("pink")
  translate([-15.2-3,-15.2-3,152])
  cube([330+2*(3+15.2),254+6+15.2,15.2]);
}

  // left plate
  color("pink")
  translate([-15.2-3,-3,0])
  cube([15.2,254+6,152]);
  
  // right plate
  color("pink")
  translate([330+3,-3,0])
  cube([15.2,254+6,152]);
  
  // front plate
  color("pink")
  translate([-15.2-3,-3-15.2,0])
  cube([330+2*(15.2+3),15.2,152]);

}
//--------------------------------------------------------------------
module minheater(){
 
// translate([0,0,3.2/2]) 
// cube([126.6, 59.8, 3.2],center=true); 
 translate([0,0,0]) 
 cube([100,45,0.45]); 
 
}  

//--------------------------------------------------------------------
module tub2(){
z1=80;
//z1=6;
thick=2;

  difference(){
    // outside shell add thick
    union(){      
      // Delfino board
      hull(){
        translate([-4-thick,-thick,-4-thick])
        cube([1+1*thick,24+2*thick,z1+1*thick]);
        translate([180,12,-4-thick])
        cylinder(r=12+thick,h=z1+1*thick,$fn=99);
      }
      // GaN board
      hull(){
        translate([5-thick,-4+26,-4-thick])
        cube([105+2*thick,1,z1+1*thick]);
        translate([15,-4+29+6,-4-thick])
        cylinder(r=2+thick,h=z1+1*thick,$fn=44);
        translate([100,-4+29+6,-4-thick])
        cylinder(r=2+thick,h=z1+thick,$fn=44);
      }
      
      // bump for bulk cap
      hull(){
        translate([18-thick,-4+29+8-thick,-4+z1-40])
        cube([20+2*thick,16+2*thick,40]);
        translate([18-thick,-4+29+8-thick,-4+z1-70])
        cube([20+2*thick,1,1]);
      }
      
      // overflow
      hull(){
        translate([-20,-thick,-4+z1-24-2*thick])
        cube([10+2*thick,24+2*thick,24+2*thick]);
        translate([-4-thick,-thick,-4+z1-20-2*thick-18])
        cube([1,24+2*thick,1]);
      }
      // inlet
      translate([168,-thick-4,-6])
      cube([14,6,16]);
    }
    
    // CUTS
    // inner sheel sized for the inverter
    union(){      
      // Delfino board
      hull(){
        translate([-4,0,-4])
        cube([1,24,z1+1]);
        translate([180,12,-4])
        cylinder(r=12,h=z1+1,$fn=99);
      }
      // Gan board
      hull(){
        translate([5,-4+26-1,-4])
        cube([105,1,z1+1]);
        translate([15,-4+29+6,-4])
        cylinder(r=2,h=z1+1,$fn=44);
        translate([100,-4+29+6,-4])
        cylinder(r=2,h=z1+1,$fn=44);
      }
      // bump for cap
      hull(){
        translate([18,-4+29+8,-4+z1-40+0.5])
        cube([20,16,41]);
        translate([18,-4+29+8-thick,-4+z1-70+1.5*thick+0.5])
        cube([20,1,1]);
      }

      // overflow
      translate([-12,-thick,-4+z1-24])
      rotate([90,0,0])
      cylinder(r=9.7/2,h=10,center=true,$fn=99);
      translate([-12,4,-4+z1-23])
      rotate([90+10,0,0])
      cylinder(r=7/2,h=39,center=true,$fn=99);
      
      translate([-20+1*thick,2,-4+z1-18])
      cube([12,22,20]);
      
      translate([-20+3*thick,2,-4+z1-14])
      cube([12,22,16]);
      
      translate([-12,24,-4+z1-17])
      rotate([90,0,0])
      cylinder(r=6,h=22,$fn=99);

      // inlet
      translate([175,-thick,-4+5])
      rotate([90,0,0])
      cylinder(r=9.7/2,h=16,center=true,$fn=99);
      
      // cuts for mounting struts
      translate([163,-5,72])
      rotate([90,0,0])
      cylinder(r=1.7,h=16,center=true,$fn=99);
      translate([2,-5,72])
      rotate([90,0,0])
      cylinder(r=1.7,h=16,center=true,$fn=99);
      
    }    
  }
    
    // AeroAmp Logo
    translate([144,24+thick,60])
    rotate([0,0,180])
    rotate([90,0,0])
    linear_extrude(height=0.3,scale=1)
    text("AeroAmp", font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);
 
    translate([144,24+thick,50])
    rotate([0,0,180])
    rotate([90,0,0])
    linear_extrude(height=0.3,scale=1)
    text("Oct 2023", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    
  
}

//--------------------------------------------------------------------
module tubtest(){
z1=16;
//z1=6;
thick=2;

  difference(){
    // outside shell add thick
    union(){      
      // Delfino board
      hull(){
        translate([-4-thick,-thick,-4-thick])
        cube([1+1*thick,24+2*thick,z1+1*thick]);
        translate([20,12,-4-thick])
        cylinder(r=12+thick,h=z1+1*thick,$fn=99);
      }
    }
      
    
    // CUTS
    // inner sheel sized for the inverter
    union(){      
      // Delfino board
      hull(){
        translate([-4,0,-4])
        cube([1,24,z1+1]);
        translate([20,12,-4])
        cylinder(r=12,h=z1+1,$fn=99);
      }
    }
      translate([5,thick,-4+3])
      rotate([90,0,0])
      cylinder(r=9.7/2,h=16,center=true,$fn=99);
    
  }
    
  
}

//--------------------------------------------------------------------
// for tub3
module strut(tol=0.2){

thick=3;
wide=10;
y1=116;
yb=43;
 
 // base
 translate([-3,-2*thick,-7-thick]) 
 cube([wide,yb+2*thick,thick]); 
 
 // front tab
 translate([-3,-1*thick+yb+tol,-7]) 
 cube([wide,thick-tol,thick]); 

  // bumps so tub makes less contact with struts
 translate([-3,-1*thick+yb+tol-0.20*yb,-7]) 
 rotate([0,90,0])
 cylinder(r=0.5,h=wide,$fn=44);
 translate([-3,-1*thick+yb+tol-0.80*yb,-7]) 
 rotate([0,90,0])
 cylinder(r=0.5,h=wide,$fn=44);
 translate([-3,-1*thick+yb+tol,-7+thick-0.5]) 
 rotate([0,90,0])
 cylinder(r=0.5,h=wide,$fn=44);
 
 // riser
  difference(){
    translate([-3,-2*thick,-7]) 
    cube([wide,thick-tol,86]); 
    translate([2,-5,72])
    rotate([90,0,0])
    cylinder(r=1.7,h=16,center=true,$fn=99);
  }
  
 // riser tab
 translate([-3,-1*thick-tol,-7+86-thick+tol]) 
 cube([wide,4,thick-tol]); 

  // bumps on riser
 translate([-3,4-thick-0.75,-7+86-thick+tol]) 
 rotate([0,90,0])
 cylinder(r=0.5,h=wide,$fn=44);

 translate([-3,-1*thick-tol,68]) 
 rotate([0,90,0])
 cylinder(r=0.5,h=wide,$fn=44);

 translate([-3,-1*thick-tol,47]) 
 rotate([0,90,0])
 cylinder(r=0.5,h=wide,$fn=44);

 translate([-3,-1*thick-tol,6]) 
 rotate([0,90,0])
 cylinder(r=0.5,h=wide,$fn=44);

 // front foot
 hull(){
   translate([-3,-1*thick+yb-thick,-7-thick]) 
   cube([wide,2*thick,thick]); 
   translate([-3,-1*thick+yb-thick+10,-7-38]) 
   cube([wide,2*thick,0.1]); 
  }
  
 // back foot
 hull(){
   translate([-3,-2*thick,-7-thick]) 
   cube([wide,2*thick,thick]); 
   translate([-3,-6,-7-38]) 
   cube([wide,2*thick,0.1]); 
  }
  
  // bottom brace between feet
  hull(){
   translate([-3,-2*thick+yb-thick+10,-7-38]) 
    cube([wide,2*thick,thick]); 
    translate([-3,-6,-7-38]) 
    cube([wide,2*thick,thick]); 
  }
  
  // brace to back of outer box
  hull(){
    translate([-3,-4-1*thick-tol,-7+86-thick+tol]) 
    cube([wide,thick-tol,thick-tol]); 
    translate([-3,-y1,-7+86-thick+tol]) 
    cube([wide,thick-tol,thick-tol]); 
  }
  hull(){
    translate([-3,-2*thick-tol,-7+86-thick+tol-30]) 
    cube([wide,thick-tol,thick-tol]); 
    translate([-3,-y1,-7+86-thick+tol-10]) 
    cube([wide,thick-tol,thick-tol]); 
  }
  
  difference(){
    hull(){
      translate([-3,-y1,-7+86-thick+tol+12]) 
      cube([wide,thick-tol,thick-tol]); 
      translate([-3,-y1,-7+86-thick+tol-10]) 
      cube([wide,thick-tol,thick-tol]); 
    }
    translate([2,-y1,86])
    rotate([90,0,0])
    cylinder(r=1.7,h=16,center=true,$fn=99);
  }
}



//--------------------------------------------------------------------
module tub3(){

x1=94;
y1=38;
y2=y1/2;
z1=80;
r1=20;

//z1=6;
thick=2;

  difference(){
    // outside shell add thick
    union(){      
      // Delfino board
      difference(){
        hull(){
          translate([-4-thick,-thick,-4-thick])
          cube([1+1*thick,y1+2*thick,z1+1*thick]);
          translate([x1,-thick,-4-thick])
          cube([1+1*thick,y1+2*thick,z1+1*thick]);
        }
        translate([x1+1.5*thick,y1+1.0*thick,-4-thick])
        rotate([0,0,180])
        rounder(r=r1+thick,h=z1+thick,f=99);
      }
      
      // overflow
      hull(){
        translate([-20,-thick,-4+z1-12-2*thick])
        cube([10+2*thick,y1+2*thick,12+2*thick]);
        
        intersection(){
          translate([-12,y1+2*thick,z1-20])
          rotate([90+10,0,0])
          cylinder(r=6+thick/2,h=y1+5*thick,$fn=77);
          translate([-20,-thick,-4+z1-30-2*thick])
          cube([10+2*thick,y1+2*thick,30+2*thick]);
        }
        
        intersection(){
          translate([-4-thick,-2*thick,-4+z1-20-2*thick-14])
          rotate([10,0,0])
          cube([1,y1+5*thick,1]);
          translate([-20,-thick,-4+z1-40-2*thick])
          cube([10+2*thick,y1+2*thick,30+2*thick]);
        }
      }
      
      // inlet
      translate([x1-14,-thick-7,-6])
      cube([14,9,12]);
    }
    
    // CUTS
    // inner sheel sized for the inverter
    union(){      
      // Delfino board
      difference(){
        hull(){
          translate([-4,0,-4])
          cube([1,y1,z1+1]);
          translate([x1-thick/2,0,-4])
          cube([thick,y1,z1]);
        }
        translate([x1+0.5*thick,y1,-4-thick])
        rotate([0,0,180])
        rounder(r=r1,h=z1+thick,f=99);
        }
      }

      // overflow
      translate([-12,-thick,-4+z1-24])
      rotate([90+10,0,0])
      cylinder(r=9.7/2,h=10,center=true,$fn=99);
      
      translate([-12,4,-4+z1-23])
      rotate([90+10,0,0])
      cylinder(r=7/2,h=4,center=true,$fn=99);
      
      translate([-20+1*thick,2+thick,-4+z1-18])
      cube([12,y1-2*thick,20]);
      
      // pour over
      translate([-20+3*thick,2*thick,-4+z1-14])
      cube([12,y1-2*thick,16]);
      
      // cut corner
      translate([-20.1,-2*thick,-4+z1-16])
      cube([14,6,16]);
      
      translate([-12,y1-1,-4+z1-14.6])
      rotate([90+10,0,0])
      cylinder(r=6,h=y1-2*thick-2,$fn=99);

      // inlet
      translate([x1-7,-thick-4,-4+3.2])
      rotate([90,0,0])
      cylinder(r=9.7/2,h=8,center=true,$fn=99);
      translate([x1-7,-thick-3,-4+3.2])
      rotate([90,0,0])
      cylinder(r=6.66/2,h=10.1,center=true,$fn=99);
      
      // cuts for mounting struts
      translate([x1-20,-5,72])
      rotate([90,0,0])
      cylinder(r=1.7,h=16,center=true,$fn=99);
      translate([2,-5,72])
      rotate([90,0,0])
      cylinder(r=1.7,h=16,center=true,$fn=99);
    }
    
    // supports for the GaN board
    difference(){
      translate([-2,7,-4])
      cube([8,6,4]);
      translate([0,9.25,-2])
      cube([6,2,2]);
    }
    difference(){
      translate([75,7,-4])
      cube([8,6,4]);
      translate([75,9.25,-2])
      cube([6,2,2]);
    }

    // AeroAmp Logo
    translate([x1/2-10,y1+thick,60])
    rotate([0,0,180])
    rotate([90,0,0])
    linear_extrude(height=0.3,scale=1)
    text("AeroAmp", font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);
 
    translate([x1/2-10,y1+thick,40])
    rotate([0,0,180])
    rotate([90,0,0])
    linear_extrude(height=0.3,scale=1)
    text("Oct 2023", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    
  
}


//=================================================================================



if(0){
  //color("silver",alpha=0.4)
  tub2();
  //strut();
    
  translate([130,0,-4]) 
  rotate([90,0,180]){
  launch();
  gan();
  }
}

if(0){
  difference(){
    union(){
      //color("silver",alpha=0.4)
      tub3();
      //strut();
        
      translate([108,-11,-1.8]) 
      rotate([90,0,180])
      gan(wires=2);
    }
    translate([50,120,0])
    cube([200,200,200],center=true);
  }
}

// disable cutaway views if printing or working single parts
if(0){
  
xcut=400;
ycut=300;
zcut=500;

cutcube = 600;

intersection(){
  translate([-cutcube+xcut,-cutcube+ycut,-cutcube+zcut])
  cube([cutcube,cutcube,cutcube]);
  
  union(){

    // base section
    if(1){
      base1();
    }
    if(1){
      base2();
    }

    // struts
    if(1){
      translate([330/2+40,255/2+10,3+45])
      rotate([0,0,180])
      strut();

      translate([330/2+40-76,255/2+10,3+45])
      rotate([0,0,180])
      mirror([1,0,0])
      strut();      
    }
    
    // tub
    if(1){
      color("silver")
      translate([330/2+40,255/2+11-0.5,3+44.0+0.5])
      rotate([0,0,180])
      tub3();
    }
        
    // inverter
    if(1){
      translate([330/2+40,255/2+11,3+44])
      rotate([0,0,180])
      translate([108,-11,0]) 
      rotate([90,0,180])
      gan(wires=2);
    }

    // lid
    if(0){
      translate([0,LidLift,LidLift])
      translate([0,254,152+15.2])
      rotate([-LidAngle,0,0])
      translate([0,-254,-152-15.2])
      {
        if(1){
          lid1();
        }
        if(1){
          lid2();
        }
      }
    }
  }
}
}
// for printing and individual part editing, do below this line ---

if(0){
  color("silver", alpha=0.7)
  top1();
  spider1();
  mirror([1,0,0])
  spider1();
  translate([-129.8/2,58.5/2,-35])
  rotate([180,0,0]){
    launch();
    gan();
  }
  
}

tub3();
//tubtest();
//strut();


//=================================================================================


