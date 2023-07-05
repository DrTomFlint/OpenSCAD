//====================================================================
// rewinder2.scad
// Rework for the universal auto rewinder spool holder
// https://www.thingiverse.com/thing:3338467
// The original design is fragile due to bi-directional action.
// This makes a replacement spring and housing, the spring is a
// seperate part so you can adjust and replace it.
// Print each part individually then assemble them.
// You may want to mirror the parts to get the opposite rotation for
// you setup.
// OpenScad coding could have been better so this takes a while to 
// render, 30 seconds on my laptop for the spring.
// 
// DrTomFlint July 2020
// 3 July 2023:
// - increase from 10 to 12 wraps
// - change spring attachment to a square post
//
//=====================================================================
// Customizer parameters:

// Spring thickness
Thick = 1.4;
// Turn on the spring
SpringOn = 0;
// Turn on the housing
HousingOn = 1;

//-------------------------------------------------------------------
module line(point1, point2, width = 1, cap_round = false) {
    angle = 90 - atan((point2[1] - point1[1]) / (point2[0] - point1[0]));
    offset_x = 0.5 * width * cos(angle);
    offset_y = 0.5 * width * sin(angle);

    offset1 = [-offset_x, offset_y];
    offset2 = [offset_x, -offset_y];

    if(cap_round) {
        translate(point1) circle(d = width, $fn = 24);
        translate(point2) circle(d = width, $fn = 24);
    }

    polygon(points=[
        point1 + offset1, point2 + offset1,  
        point2 + offset2, point1 + offset2
    ]);
}

//----------------------------------------------------------------------
module polyline(points, width = 1) {
    module polyline_inner(points, index) {
        if(index < len(points)) {
            line(points[index - 1], points[index], width);
            polyline_inner(points, index + 1);
        }
    }

    polyline_inner(points, 1);
}

//---------------------------------------------------------------------
module spiral1(){
PI = 3.14159;
step = 0.05;
//circles = 10;
circles = 12;
//arm_len = 4.2;
arm_len = 3.5;

b = arm_len / 2 / PI;
// one radian is almost 57.2958 degrees
points = [for(theta = [0:step:2 * PI * circles])
    [b * theta * cos(theta * 57.2958), b * theta * sin(theta * 57.2958)]
];

linear_extrude(height=6.6,convexity=20)
//polyline(points, 1.4);
polyline(points, Thick);

}

//------------------------------------------------------------------
module house(mirror=0){
  
  // clutch housing
  difference(){
    // outer base
    cylinder(r=87.8/2,h=8.0,$fn=300);
    difference(){
      // main cutout
      translate([0,0,1])    
      cylinder(r=83/2,h=8,$fn=200);
      // shaft reinforce
      cylinder(r=7,h=1.2,$fn=88);
    }
    // shaft cutout
    translate([0,0,-1])
    cylinder(r=8.5/2,h=4,$fn=88);
    
    // material reduction
    for(i=[0:6]){
      rotate([0,0,i*360/7])
      hull(){
        translate([14,0,0])
        cylinder(r=3,h=8,center=true,$fn=45);
        translate([30,0,0])
        cylinder(r=9,h=8,center=true,$fn=45);
      }
    }
    
    // cut for spring attach
    color("pink")
    rotate([0,0,180/7])
    translate([41,-1,1.2+3.3+1])
    cube([4.2,3.2,6.6+2],center=true);
    
  }
  
  // block for spring attach
  color("green")
  rotate([0,0,180/7])
  translate([39,-1,1.2+3.3-0.5])
  cube([2,5,6.6],center=true);
  
  if(mirror==1){
    color("cyan")
    rotate([0,0,180/7])
    translate([40,-4,1.2+3.3-0.5])
    cube([4,2,6.6],center=true);
  }else{
    color("blue")
    rotate([0,0,180/7])
    translate([40,2,1.2+3.3-0.5])
    cube([4,2,6.6],center=true);
  }

}

//------------------------------------------------------------------
module spring(mirror=0){
  
  color("green")
  difference(){
    // shaft collar
    translate([0,0,1.2])
    cylinder(r=6,h=12.5,$fn=88);
    
    // cutout for the shaft
    difference(){
      cylinder(r=4.1,h=20,$fn=88);
      translate([3.2,-5,-1])
      cube([10,10,30]);
    }
  }

  // spring
  color("red")
  difference(){
    translate([0,0,1.2])
    if(mirror==1){
      rotate([0,0,-3])
      mirror([0,1,0])
      spiral1();
    }else{
      spiral1();
    }
    translate([0,0,1.0])
    cylinder(r=5.5,h=20,$fn=22);
  }  
  
  // attachment post
  color("pink")
  translate([42.5,-1,1.2+3.3])
  cube([3,3,6.6],center=true);
}

//==================================================================

// un-mirrored parts for left side of the Dusa only
if(SpringOn){
  rotate([0,0,180/7])
  spring(mirror=1);
}
if(HousingOn){
  house(mirror=0);
}

// mirrored parts for the MMU and right side of Dusa
//translate([120,0,0])
//mirror([1,0,0]) house();

//translate([120,0,0])
//mirror([1,0,0]) spring();

// Use these to show a section view
if(0){
  difference(){
    house();
    translate([-50,-100,-10])
    cube([100,100,30]);
  }
}

if(0){
  difference(){
    spring();
    translate([-50,-100,-10])
    cube([100,100,30]);
  }
}



//==================================================================
