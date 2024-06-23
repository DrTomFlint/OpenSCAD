//======================================================================
// BillyStrings2.scad
//
// Two layers of petals, randomize petal angle and length
//
// DrTomFlint 21 June 2024
//
//======================================================================

use <../Parts/rounder.scad>

layer = 0.3;
thick = 5*layer;
line = 0.8;

r1 = 5;      // center dot
r2 = 2;       // petal radius
s2 = 3;     // petal scale from circle
N1 = 10;       // number of petals
N2 = 10;       // number of petals
seed = 125;
delta = 0.3;    // variation in petal length
delta2 = 3;     // variation in petal angle

F1 = 100;  

//----------------------------------------------------------------------
module DaisyBlackPetal(sx=2.5){
  
  translate([0,r1+line+r2*sx,-thick/2]){
    difference(){
      linear_extrude(height=thick){
        offset(r=line)
        scale([1,sx,1])
        circle(r=r2,$fn=F1);
      }
      linear_extrude(height=thick){
        scale([1,sx,1])
        circle(r=r2,$fn=F1);
      }
    }
  }
  
}

//----------------------------------------------------------------------
module DaisyBlackPetalX(sx=2.5){

  translate([0,r1+line+r2*sx,-thick/2]){
    linear_extrude(height=thick){
      offset(r=line)
      scale([1,sx,1])
      circle(r=r2,$fn=F1);
    }
  }
  
}

//----------------------------------------------------------------------
module DaisyRedPetal(sx=2.5){

  translate([0,r1+line+r2*sx,-thick/2]){
    linear_extrude(height=thick){
      scale([1,sx,1])
      circle(r=r2,$fn=F1);
    }
  }
  
}
//----------------------------------------------------------------------
module DaisyBlack(sd=125){
  
  // randoms from the given seed
  s3 = rands(s2-delta,s2+delta,N1,sd);   // first layer lengths
  s4 = rands(-delta2,delta2,N1,sd+10);   // first layer angles

  s5 = rands(s2-delta,s2+delta,N2,sd+20);  // 2nd layer lengths
  s6 = rands(-delta2,delta2,N2,sd+30);     // 2nd layer angles

  // center dot
  difference(){
    cylinder(r=r1+line,h=thick,center=true,$fn=F1);
    cylinder(r=r1,h=thick+1,center=true,$fn=F1);
  }
  
  // 33
  translate([0,0,-thick/2])
  linear_extrude(height=thick)
  text("33", font = "Open Sans:style=Bold", size=r1*0.8,halign="center",valign="center",spacing=1.2);
  
  // petals
  difference(){
    union(){
      for(i=[0:N1-1]){
        rotate([0,0,i*360/N1+s4[i]])
        DaisyBlackPetal(sx=s3[i]);
      }
    }
    // cut out shadow of second layer  
    for(i=[0:N2-1]){
      rotate([0,0,i*360/N2+s6[i]+180/N2])
      DaisyBlackPetalX(sx=s5[i]);
    }
  }
  
  // add second layer
  for(i=[0:N2-1]){
    rotate([0,0,i*360/N2+s6[i]+180/N2])
    DaisyBlackPetal(sx=s5[i]);
  }
  
  // hanger loop
  rotate([0,0,s4[0]])
  translate ([0,0.25+r1+line*s3[0]+2*r2*s3[0],0])
  difference(){
    cylinder(r=2,h=thick,center=true,$fn=F1);
    cylinder(r=2-line,h=thick+1,center=true,$fn=F1);
  }
    
}

//----------------------------------------------------------------------
module DaisyRed(sd=125){
  
  // randoms from the given seed
  s3 = rands(s2-delta,s2+delta,N1,sd);   // first layer lengths
  s4 = rands(-delta2,delta2,N1,sd+10);   // first layer angles

  s5 = rands(s2-delta,s2+delta,N2,sd+20);  // 2nd layer lengths
  s6 = rands(-delta2,delta2,N2,sd+30);     // 2nd layer angles

  // petals
  difference(){
    union(){
      for(i=[0:N1-1]){
        rotate([0,0,i*360/N1+s4[i]])
        DaisyRedPetal(sx=s3[i]);
      }
    }
    // cut out shadow of second layer  
    for(i=[0:N2-1]){
      rotate([0,0,i*360/N2+s6[i]+180/N2])
      DaisyBlackPetalX(sx=s5[i]);
    }
  }

  // add second layer
  for(i=[0:N2-1]){
    rotate([0,0,i*360/N2+s6[i]+180/N2])
    DaisyRedPetal(sx=s5[i]);
  }
  
    
}

//----------------------------------------------------------------------
module DaisyYellow(){
  
  difference(){
    cylinder(r=r1,h=thick,center=true,$fn=F1);
    translate([0,0,-thick/2])
    linear_extrude(height=thick)
    text("33", font = "Open Sans:style=Bold", size=r1*0.8,halign="center",valign="center",spacing=1.2);
  }
    
}
//======================================================================

//~ color("gray")
//~ DaisyBlack();

//~ color("red")
//~ DaisyRed();

//~ color("yellow")
//~ DaisyYellow();

//~ DaisyBlackPetal();

// number to print
M=6;
// seeds for each
s4=[133,131,127,128,121,130];

dx = 40;
dy = 45;

// black
if(1){
  for(k=[0:2]){
    translate([dx*k,0,0])
    color("gray")
    DaisyBlack(sd=s4[k]);
  }
  for(k=[0:2]){
    translate([dx*k,-dy,0])
    color("gray")
    DaisyBlack(sd=s4[k+3]);
  }
}

// red
if(0){
  for(k=[0:2]){
    translate([dx*k,0,0])
    color("red")
    DaisyRed(sd=s4[k]);
  }
  for(k=[0:2]){
    translate([dx*k,-dy,0])
    color("red")
    DaisyRed(sd=s4[k+3]);
  }
}

// yellow
if(0){
  for(k=[0:2]){
    translate([dx*k,0,0])
    color("yellow")
    DaisyYellow();
  }
  for(k=[0:2]){
    translate([dx*k,-dy,0])
    color("yellow")
    DaisyYellow();
  }
}



//======================================================================


