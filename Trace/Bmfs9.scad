//======================================================================
// Bmfs8.scad
//
// "Billy logo", Red/Orange cut in the petals.
// Two layers of petals, randomize petal angle and length.
//
// DrTomFlint 11 Sept 2024
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
      translate([0,0,-1])
      linear_extrude(height=thick+2){
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
      translate([0,0,-0.1])
      scale([1.01,1.01,2])
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
// bottom 1 layers
module DaisyBlackA(sd=sd){

  intersection(){
    DaisyBlack(sd=sd);
    
    translate([0,0,0.3/2-thick/2])
    cube([100,100,0.3],center=true);
  }
}

//----------------------------------------------------------------------
// topmost 3 layers
module DaisyBlackB(sd=sd){

  intersection(){
    DaisyBlack(sd=sd);
    
    translate([0,0,1.2/2+0.3-thick/2])
    cube([100,100,1.2],center=true);
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
// slice the red petals into red and orange sections
module DaisyRed2(sd=125){

    difference(){
      DaisyRed(sd=sd);
      translate([0,0,-0.3])  // extra red
      cylinder(r2=r1+2,r1=17.5,h=thick,$fn=F1,center=true);
    }
}

//----------------------------------------------------------------------
// slice the red petals into red and orange sections
module DaisyOrange(sd=125){
  
    intersection(){
      DaisyRed(sd=sd);
      translate([0,0,-0.3]) // extra red
      //~ cylinder(r2=r1,r1=19,h=thick,$fn=F1,center=true);
      cylinder(r2=r1+2,r1=17.5,h=thick,$fn=F1,center=true);
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

//----------------------------------------------------------------------
module Bmfs(tsize = 5.4){

a1=20;
a2=8;
yoff = -r1*4.2;
a9 = 2;

    rotate([0,0,-a1+a9])
    translate([0,yoff,-thick/2])
    linear_extrude(height=thick)
    text("B", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,-a2+a9])
    translate([0,yoff,-thick/2])
    linear_extrude(height=thick)
    text("i", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a9])
    translate([0,yoff,-thick/2])
    linear_extrude(height=thick)
    text("l", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a2+a9])
    translate([0,yoff,-thick/2])
    linear_extrude(height=thick)
    text("l", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a1-2+a9])
    translate([0,yoff,-thick/2])
    linear_extrude(height=thick)
    text("y", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);


}

//----------------------------------------------------------------------
module BmfsBlack(tsize = 5.4){

m1=0.9;
a1=20;
a2=8;
yoff=-r1*4.2;
a9 = 2;

    rotate([0,0,-a1+a9])
    translate([0,yoff,-thick/2])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("B", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("B", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,-a2+a9])
    translate([0,yoff,-thick/2])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("i", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("i", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a9])
    translate([0,yoff,-thick/2])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("l", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("l", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a2+a9])
    translate([0,yoff,-thick/2])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("l", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("l", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a1-2+a9])
    translate([0,yoff,-thick/2])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("y", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("y", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }




}

//----------------------------------------------------------------------
module Bmfs2(tsize = 5.0){

a1=24;
a2=8;
yoff = -r1*4.1;
y2=-7;

    rotate([0,0,0])
    translate([0,yoff,-thick/2])
    linear_extrude(height=thick)
    text("B", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,0])
    translate([0,yoff+y2,-thick/2])
    linear_extrude(height=thick)
    text("M", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,0])
    translate([0,yoff+2*y2,-thick/2])
    linear_extrude(height=thick)
    text("F", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,0])
    translate([0,yoff+3*y2,-thick/2])
    linear_extrude(height=thick)
    text("S", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);


}

//----------------------------------------------------------------------
module BmfsBlack2(tsize = 4.0){

m1=0.9;
a1=24;
a2=8;
yoff=-r1*4.0;
y2=-5;

    rotate([0,0,0])
    translate([0,yoff,-thick/2])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("B", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("B", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,0])
    translate([0,yoff+y2,-thick/2])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("M", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("M", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,0])
    translate([0,yoff+2*y2,-thick/2])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("F", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("F", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,0])
    translate([0,yoff+3*y2,-thick/2])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("S", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("S", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }




}

//======================================================================

// black
//~ color("gray")
//~ DaisyBlack(sd=6);

//~ Bmfs2();

//~ BmfsBlack2();

//~ BmfsBlack();
//~ translate([0,0,thick/2]){
//~ BmfsLeafBlack();
//~ mirror([1,0,0])
//~ BmfsLeafBlack();
//~ }

// green
//~ Bmfs();
//~ translate([0,0,thick/2]){
//~ BmfsLeaf();
//~ mirror([1,0,0])
//~ BmfsLeaf();
//~ }

//~ color("red")
//~ DaisyRed();

//~ DaisyRed2(sd=6);
//~ DaisyOrange(sd=6);
//~ DaisyYellow();

//~ DaisyBlackPetal();

// number to print
M=6;
// seeds for each
//s4=[133,131,127,128,121,130];   // original seeds
s4=[6,131,127,7,121,10];    // seeds when Bmfs is enabled

dx = 40;
dy = 50;

// black
if(0){
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

// black A
if(1){
  for(k=[0:2]){
    translate([dx*k,0,0])
    color("gray")
    DaisyBlackA(sd=s4[k]);
  }
  for(k=[0:2]){
    translate([dx*k,-dy,0])
    color("gray")
    DaisyBlackA(sd=s4[k+3]);
  }
}

// black B
if(0){
  for(k=[0:2]){
    translate([dx*k,0,0])
    color("gray")
    DaisyBlackB(sd=s4[k]);
  }
  for(k=[0:2]){
    translate([dx*k,-dy,0])
    color("gray")
    DaisyBlackB(sd=s4[k+3]);
  }
}

// BMFS black
dy2 = [0, -1, -0.3, -0.5, 0, -0.5];

if(0){
  for(k=[0:2]){
    translate([dx*k,dy2[k],0])
    color("gray")
    BmfsBlack();
  }
  for(k=[0:2]){
    translate([dx*k,-dy+dy2[k+3],0])
    color("gray")
    BmfsBlack();
  }
}

// BMFS green
if(0){
  for(k=[0:2]){
    translate([dx*k,dy2[k],0])
    color("gray")
    Bmfs();
  }
  for(k=[0:2]){
    translate([dx*k,-dy+dy2[k+3],0])
    color("gray")
    Bmfs();
  }
}

// red solid old
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

// red 2
if(0){
  for(k=[0:2]){
    translate([dx*k,0,0])
    color("red")
    DaisyRed2(sd=s4[k]);
  }
  for(k=[0:2]){
    translate([dx*k,-dy,0])
    color("red")
    DaisyRed2(sd=s4[k+3]);
  }
}
// orange
if(0){
  for(k=[0:2]){
    translate([dx*k,0,0])
    color("orange")
    DaisyOrange(sd=s4[k]);
  }
  for(k=[0:2]){
    translate([dx*k,-dy,0])
    color("orange")
    DaisyOrange(sd=s4[k+3]);
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


