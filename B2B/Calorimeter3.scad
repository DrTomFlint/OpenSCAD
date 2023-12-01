//=================================================================================
// Calorimeter3.scad
// Calorimeter for inverter loss estimation using immersion cooling
//
//
// Dr Tom Flint, 10 March 2021
// Change to minimal tub volume design 31 Oct 2023
// Switch to cylinders instead of cubes 26 Nov 2023
//
//=================================================================================


use <../Parts/rounder.scad>
use <../Parts/ti.scad>
use <./quickie.scad>
use <./rtd.scad>

// Lid Angle
LidAngle=0;
// Lid Lift
LidLift=0;

F1=222;

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
  cube([336+30.4,260+30.4,15.2]);
  
  color("cyan")
  translate([-2*15.2-3,-2*15.2-3,-2*15.2])
  cube([336+30.4+30.4,260+30.4+30.4,15.2]);
  
  difference(){
    // back plate
    union(){
      color("pink")
      translate([-3-15.2,254+3,0])
      cube([330+2*(3+15.2),15.2,152+15.2]);
      color("cyan")
      translate([-3-2*15.2,254+3+15.2,-15.2])
      cube([336+4*15.2,15.2,152+3*15.2]);
    }
    // holes for coolant
    translate([65,260,3+40])
    rotate([90,0,0])
    cylinder(r=9.2,h=60,center=true,$fn=33);
    translate([245,260,3+72])
    rotate([90,0,0])
    cylinder(r=9.2,h=60,center=true,$fn=33);
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
  color("cyan")
  translate([-2*15.2-3,-2*15.2-3,152+15.2])
  cube([336+4*15.2,254+6+3*15.2,15.2]);
}

  // left plate
  color("pink")
  translate([-15.2-3,-3,0])
  cube([15.2,254+6,152]);
  color("cyan")
  translate([-2*15.2-3,-3-15.2,-15.2])
  cube([15.2,254+6+2*15.2,152+2*15.2]);
  
  // right plate
  color("pink")
  translate([330+3,-3,0])
  cube([15.2,254+6,152]);
  color("cyan")
  translate([330+3+15.2,-3-15.2,-15.2])
  cube([15.2,254+6+2*15.2,152+2*15.2]);
  
  // front plate
  color("pink")
  translate([-15.2-3,-3-15.2,0])
  cube([330+2*(15.2+3),15.2,152]);
  color("cyan")
  translate([-2*15.2-3,-3-2*15.2,-15.2])
  cube([336+4*15.2,15.2,152+2*15.2]);

}
//--------------------------------------------------------------------
module minheater(){
 
// translate([0,0,3.2/2]) 
// cube([126.6, 59.8, 3.2],center=true); 
 translate([0,0,0]) 
 cube([100,45,0.45]); 
 
}  


//--------------------------------------------------------------------
module strut(tol=0.2){

thick=3;
wide=10;
y1=116;
yb=42+2*thick;
 
 // base
 translate([-3,-20-thick,-8-thick]) 
 cube([wide,yb,thick]); 
 
 // front tab
 translate([-3,22,-8]) 
 cube([wide,thick-tol,thick]); 

 // bumps so tub makes less contact with struts
 translate([-3,-8,-8]) 
 rotate([0,90,0])
 cylinder(r=0.5,h=wide,$fn=44);
 translate([-3,14,-8]) 
 rotate([0,90,0])
 cylinder(r=0.5,h=wide,$fn=44);
 
  // bumps on riser
 translate([-3,-20.2,68]) 
 rotate([0,90,0])
 cylinder(r=0.5,h=wide,$fn=44);

 translate([-3,-20.2,47]) 
 rotate([0,90,0])
 cylinder(r=0.5,h=wide,$fn=44);

 translate([-3,-20.2,6]) 
 rotate([0,90,0])
 cylinder(r=0.5,h=wide,$fn=44);


 // riser
  difference(){
    translate([-3,-20-thick,-8]) 
    cube([wide,thick-tol,86]); 
    translate([2,-20,75])
    rotate([90,0,0])
    cylinder(r=1.7,h=16,center=true,$fn=99);
  }
  
 // front foot
 hull(){
   translate([-3,22.5,-8-thick]) 
   cube([wide,thick-0.5,thick]); 
   translate([-3,32.5,-8-38]) 
   cube([wide,thick-0.5,thick]); 
  }
  
 // back foot
 hull(){
   translate([-3,-20-thick,-8-thick]) 
   cube([wide,thick,thick]); 
   translate([-3,-20-thick,-8-38]) 
   cube([wide,thick,0.1]); 
  }
  
  // bottom brace between feet
  hull(){
   translate([-3,28,-8-38]) 
    cube([wide,2*thick,thick]); 
    translate([-3,-20-thick,-8-38]) 
    cube([wide,2*thick,thick]); 
  }
  
  // brace to back of outer box
  hull(){
    translate([-3,-20-thick,-7+86-thick+tol]) 
    cube([wide,thick-tol,thick-tol]); 
    translate([-3,-y1,-7+86-thick+tol]) 
    cube([wide,thick-tol,thick-tol]); 
  }
  hull(){
    translate([-3,-20-thick,-7+86-thick+tol-30]) 
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

// outer dimensions
x1=70;
y1=42;
y2=y1/2;
z1=80;
z2=5;     // bevels on tub
r1=20;

//z1=6;
thick=2;

  difference(){
    // outside shell add thick
    union(){      
      // Main tub
      hull(){
        // boss
        translate([0,y1/2,z2])
        cylinder(r=y1/2,h=z1,$fn=F1);
        translate([x1,y1/2,z2])
        cylinder(r=y1/2,h=z1,$fn=F1);
        // base bevel  
        translate([0,y1/2,0])
        cylinder(r1=y1/2-z2,r2=y1/2,h=z2,$fn=F1);
        translate([x1,y1/2,0])
        cylinder(r1=y1/2-z2,r2=y1/2,h=z2,$fn=F1);
      }
      // inlet
      translate([90,y1/2,7])
      cube([15,14,14],center=true);
      // outlet
      hull(){
        translate([-y1/2,y1/2,75])
        cube([15,14,14],center=true);
        translate([-y1/2+1,y1/2,55])
        cube([1,1,1],center=true);
      }
      
    }
    
    // CUTS
    // inner sheel sized for the inverter
    union(){      
      // main tub
      hull(){
        // boss
        translate([0,y1/2,z2+thick])
        cylinder(r=y1/2-thick,h=z1+1,$fn=F1);
        translate([x1,y1/2,z2+thick])
        cylinder(r=y1/2-thick,h=z1+1,$fn=F1);
        
        // base bevel  
        translate([0,y1/2,thick])
        cylinder(r1=y1/2-z2-thick+1,r2=y1/2-thick,h=z2-1,$fn=F1);
        translate([x1,y1/2,thick])
        cylinder(r1=y1/2-z2-thick+1,r2=y1/2-thick,h=z2-1,$fn=F1);
      }

      // inlet cut
      translate([90,y1/2,7])
      rotate([0,90,0])
      cylinder(r=9.9/2,h=16,center=true,$fn=99);
      // outlet cut
      translate([-y1/2,y1/2,75])
      rotate([0,90,0])
      cylinder(r=9.9/2,h=16,center=true,$fn=99);
      
      // cuts for mounting struts
      translate([x1-5,-5,82])
      rotate([90,0,0])
      cylinder(r=1.7,h=16,center=true,$fn=99);
      translate([5,-5,82])
      rotate([90,0,0])
      cylinder(r=1.7,h=16,center=true,$fn=99);
    
    } // end of union
  }   // end of diffs
    
  // supports for the GaN board
  translate([0,0,thick]){
    difference(){
      translate([-6,10,0])
      cube([8,6,4]);
      translate([-3.5,11.7,2.5])
      cube([6.5,2,2]);
    }
    difference(){
      translate([70,10,0])
      cube([8,6,4]);
      translate([70,11.7,2.5])
      cube([6.5,2,2]);
    }
  }
  
  // AeroAmp Logo
  translate([x1/2,y1-0.01,75])
  rotate([0,0,180])
  rotate([90,0,0])
  linear_extrude(height=0.3,scale=1)
  text("AeroAmp", font = "Open Sans:style=Bold", size=9,halign="center",valign="center",spacing=1.1);

  translate([x1/2,y1-0.01,65])
  rotate([0,0,180])
  rotate([90,0,0])
  linear_extrude(height=0.3,scale=1)
  text("Nov 2023", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);

  // Front outside RTD
  translate([x1/2,y1-0.01,43])
  rotate([0,-90,0])
  rotate([-90,0,0])
  rtdBlock1();
  
  // Back outside RTD
  translate([x1/2,0.01,43])
  rotate([0,-90,0])
  rotate([90,0,0])
  rtdBlock1();

  // Low inside RTD
  translate([x1+1,y1/2+4,thick])
  rotate([0,0,0])
  rtdBlock2();
  
  // Middle-back inside RTD
  translate([x1/2,y1-40,43])
  rotate([0,0,-90])
  rotate([0,-90,0])
  rtdBlock2();

  // Middle-front inside RTD
  translate([x1/2,y1-thick,43])
  rotate([0,0,90])
  rotate([0,-90,0])
  rtdBlock2();
  
  // Upper inside RTD    
  difference(){
    translate([0,y1/2,52.5])
    cylinder(r=y1/2,h=15,$fn=F1);

    translate([4,y1/2,60])
    cube([40,40,50],center=true);
  }

  intersection(){
    translate([0,y1/2,30])
    cylinder(r=y1/2,h=30,$fn=F1);

    hull(){
      translate([-17,y1/2,53])
      cube([1,25,1],center=true);
      translate([-25,y1/2,43])
      cube([1,25,20],center=true);
    }
  }
  
  translate([x1/2-51,y1/2,63])
  rotate([0,0,180])
  rotate([0,-90,0])
  rtdBlock2();
  
    
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
if(1){
  
xcut=400;
ycut=400;
zcut=500;

cutcube = 600;

intersection(){
  translate([-cutcube+xcut,-cutcube+ycut,-cutcube+zcut])
  cube([cutcube,cutcube,cutcube]);
  
  union(){

    // base section
    if(0){
      base1();
    }
    if(0){
      base2();
    }

    // struts
    if(0){
      translate([330/2+37,255/2+10,3+45])
      rotate([0,0,180])
      strut();

      translate([330/2-27,255/2+10,3+45])
      rotate([0,0,180])
      mirror([1,0,0])
      strut();      
    }
    
    // tub
    if(0){
      color("silver")
      translate([330/2+40,255/2+30-1.5,3+44.0+0.5-7])
      rotate([0,0,180])
      tub3();
    }
        
    // inverter
    if(0){
      translate([330/2+40,255/2+29,52-7])
      rotate([0,0,180])
      translate([104,-8,0]) 
      rotate([90,0,180])
      gan(wires=2);
    }

    // lid
    if(1){
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

//~ tub3();
//~ tubtest();
//~ strut();


//=================================================================================


