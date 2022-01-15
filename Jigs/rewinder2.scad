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
// Add adapter for spools that have large center hole.
//
// DrTomFlint July 2020
//=====================================================================
// Customizer parameters:

// Spring thickness
Thick = 1.4;
// Turn on the spring
SpringOn = 1;
// Turn on the housing
HousingOn = 0;

//-------------------------------------------------------------------
module line(point1, point2, width = 1, cap_round = true) {
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
module spiral1(h=6.6){
PI = 3.14159;
step = 0.05;
circles = 10;
arm_len = 4.2;

b = arm_len / 2 / PI;
// one radian is almost 57.2958 degrees
points = [for(theta = [0:step:2 * PI * circles])
    [b * theta * cos(theta * 57.2958), b * theta * sin(theta * 57.2958)]
];

//linear_extrude(height=6.6,convexity=20)
linear_extrude(height=h,convexity=20)
//polyline(points, 1.4);
polyline(points, Thick);

}

//------------------------------------------------------------------
module house(){
  
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
    
    // radial strain relief
    for(i=[0:6]){
      rotate([0,0,i*360/7])
      translate([23,0,0])
      cube([28,1,5],center=true);
    }
  }
  
  // attachment for spring
  difference(){
    translate([40.5,0,0.8])
    scale([1,2,1])
    cylinder(r=3,h=7,$fn=44);
    
    color("pink")
    translate([40.2,0,1.0])
    cylinder(r=1.65,h=10,$fn=44);

    translate([39.2,-7,1.0])
    rotate([0,0,-3])
    cube([1.6,6,10]);
  }
  
}

//------------------------------------------------------------------
module spring(){
  
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
    spiral1();
    translate([0,0,1.0])
    cylinder(r=5.5,h=20,$fn=22);
  }  
  
  // attachment post
  color("pink")
  translate([42,0,1.2])
  cylinder(r=1.5,h=6.6,$fn=44);
}

//------------------------------------------------------------------
// side near the clutch
module spoolAdapter1(){

$fn=222;
  
  difference(){
    union(){
      cylinder(r1=78/2,r2=75/2,h=8);
      cylinder(r=86/2,h=2);
    }
    translate([0,0,-0.1])
    cylinder(r1=38/2,r2=30/2,h=4.2);
    
    // cut to make lip
    translate([0,0,3])
    cylinder(r1=69/2,r2=73/2,h=6);
    
    // material reduction
    for(i=[0:9]){
      rotate([0,0,i*360/10])
      translate([27,0,0])
      cylinder(r=7,h=20,center=true);
    }
  }
  
}

//------------------------------------------------------------------
// side away from the clutch
module spoolAdapter2(){

$fn=222;
  
  difference(){
    union(){
      cylinder(r1=75/2,r2=72/2,h=8);
      cylinder(r=86/2,h=2);
    }
    // cut for taper nut
    translate([0,0,-0.1])
    cylinder(r1=42/2,r2=34/2,h=4.2);
    
    // cut to make lip
    translate([0,0,3])
    cylinder(r1=66/2,r2=70/2,h=6);
    
    // material reduction
    for(i=[0:9]){
      rotate([0,0,i*360/10])
      translate([27,0,0])
      cylinder(r=5,h=20,center=true);
    }
  }
}

//==================================================================

spoolAdapter2();

//translate([0,200,0])
//spoolAdapter2();

if(0){
// un-mirrored parts for left side of the Dusa only
if(SpringOn){
  spring();
}
if(HousingOn){
  house();
}
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
