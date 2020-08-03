// crown1.scad
// First cut at adding the xtals and cheap led string into the headband

use <./ledlamps2.scad>
use <./headband.scad>
use <../Fractals/Lsystem.scad>


//----------------------------------------
module crown1(

N0=10,       // number of baseline points
r0=102,    // radius to get baseline points
F3=8,     // sides on indicators
x5=5.5,    // offset for the lamps
x6=0.4,    // offset for the midway 
z6=10      // offset for the midway
){


  rfoot=4;
  hfoot=3;
  rmid=6;
  hmid=8;
  rtop=8;
  htop=5;
  rlip=6;
  
  F4=88; // sides on foot
  s1=1.5;   // scaling in Y


difference(){
  union(){
    // base channel
    translate([0,0,0])
    headband(zlow=50,zhi=54,thick=3.5);

    // top channel
    translate([0,0,10])
    headband(zlow=58,zhi=59,thick=3.0);

    // main band
    headband(zlow=50,zhi=74);
    
    for(i=[0:N0-1]){
      a0=i*360/N0+180/N0;
      x0=r0*1.0*cos(a0);
      y0=r0*0.855*sin(a0);
      translate([x0,y0,0]){
        rotate([0,0,a0]){
          
          // lamps
          translate([x5,0,0]){
            base1();
            base2();
            // top
            top2();            
            //top3();
            
          }
        }
      }
    }


  } // end union

  // scallop cut the upper headband
    for(i=[0:2*N0-1]){
      a0=i*180/N0+90/N0;
      x0=r0*1.0*cos(a0);
      y0=r0*0.855*sin(a0);
      translate([x0,y0,0]){
        rotate([0,0,a0]){
          
          // mids
          translate([-12,0,26]){
            rotate([0,90,0])
            scale([1,1.7,1])
            cylinder(r=10,h=10,$fn=44);
          }
        }
      }
    }
  

if(1){
    // cut for in-between light
    for(i=[1,2,3,4,6,7,8,9]){
      a0=i*360/N0;
      x0=r0*1.0*cos(a0);
      y0=r0*0.855*sin(a0);
      translate([x0,y0,0]){
        rotate([0,0,a0]){
          
          // mids
          translate([x6,0,z6]){
            rotate([0,-14,0])
            mid1cut();
          }
        }
      }
    }
}

if(1){
  // repeat the basecuts to eliminate headband material that might interfere
  for(i=[0:N0-1]){
    a0=i*360/N0+180/N0;
    x0=r0*1.0*cos(a0);
    y0=r0*0.855*sin(a0);
    translate([x0,y0,0]){
      rotate([0,0,a0]){
        
        // lamps
        translate([x5,0,0]){
          basecuts();
        }
      }
    }
  } // end for loop
}


} // end diff

if(0){
    // in-between light
//    for(i=[1:N0-1]){
    for(i=[1,2,3,4,6,7,8,9]){
      a0=i*360/N0;
      x0=r0*1.0*cos(a0);
      y0=r0*0.855*sin(a0);
      translate([x0,y0,0]){
        rotate([0,0,a0]){
          
          // mids
          translate([x6,0,z6]){
            rotate([0,-14,0]){
            mid1();
            //color("cyan")
            mid3();
          }
          }
        }
      }
    }
}


// crystals
if(0){
for(i=[0:N0-1]){
  a0=i*360/N0+180/N0;
  x0=r0*1.0*cos(a0);
  y0=r0*0.855*sin(a0);
  translate([x0,y0,0]){
    rotate([0,0,a0]){
      
        //
        translate([x5,0,4])
        color("white")
        xa();
        
      }
    }
  }
}


// battery strap
if(0){
  difference(){
    translate([-105.5,0,10])
    rotate([0,20,0])
    cube([12,32,16],center=true);
    
    translate([-112,23.8/2,2])
    rotate([0,20,0])
    rotate([90,0,0])
    ledbattery(tol=0.2);
  }
}

// battery 2 strap
if(1){
  difference(){
    translate([-106.5,0,10])
    rotate([0,20,0])
    cube([14,32,16],center=true);
    
    translate([-106,-11,2])
    rotate([0,0,180])
    rotate([0,-10,0])
    rotate([90,0,0])
    cutbattery2(tol=0.2);
  }
}

// battery 1
if(0){
    translate([-112,23.8/2,2])
    rotate([0,20,0])
    rotate([90,0,0])
    battery(tol=0);
}
// battery 2
if(1){
    translate([-106,-11,2])
    rotate([0,0,180])
    rotate([0,-10,0])
    rotate([90,0,0])
    color("green")
    ledbattery2(tol=0);
}

// front strap
if(1){
    translate([105.5,0,10])
    rotate([0,-10,0])
    front1();
}

// front lamp
if(1){
    translate([105.5,0,10])
    rotate([0,-10,0])
    front2();
}

}



//=====================================================

// xtal top lid
if(0){
  //difference(){
  intersection(){
  //top2();
  top3(type=3);
  translate([0,0,7.5])
  cube([40,40,10],center=true);
  }
}

// mid token
if(0){
  //difference(){
  intersection(){
  rotate([0,-90,0])
  mid3();
  translate([12,0,7.5])
  cube([40,40,10],center=true);
  }
}
// front token
if(0){
  //difference(){
  intersection(){
  rotate([0,-90,0])
  front2();
  translate([0,0,7.5])
  cube([80,80,10],center=true);
  }
}

// midsection:
if(1){
  color("cyan")
  intersection(){

  union(){
    crown1();
    //tops();
  }

  translate([-200,-200,3])
  cube([400,400,8.5]);
  }
}
// lowsection:
if(1){
  color("red")
  intersection(){

  union(){
    crown1();
    //tops();
  }

  translate([-200,-200,0])
  cube([400,400,3]);
  }
}
// topsection:
if(1){
  intersection(){

    union(){
      crown1();
      //tops();
    }

    translate([-200,-200,11.5])
    cube([400,400,60]);
  }
}


//=====================================================
