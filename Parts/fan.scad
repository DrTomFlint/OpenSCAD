//=================================================================================
// fan.scad
// Model for EK-Vardar EVO 120ER fan
// 2200 rpm, 12v, 2.16 watt, 25 to 100% duty, 4-pin header [gnd +12 pwm tach]?
// 120 x 120 x 25 mm nominal
// Max Airflow 77 CFM  = 131 m^3/hour
// Static Pressure 3.16 mm H2O = 31 Pa
// Noise 33.5 dBa at 100% pwm
//
// Air exits on the side with the spider.
//
// Dr Tom Flint, 6 Dec 2020
//=================================================================================

//-------------------------------------------------------
module brace(){
// fan and radiator
t1=4.25;   // thickness box intake side
t2=17.7;   // thickness of circular section
t3=4.0;    // thickness box outlet side
t4=t1+t2+t3;

  intersection(){
    rotate([0,-90,0])
    difference(){ 
      cylinder(r=7.8,h=t4,$fn=22);
      cylinder(r=5.5,h=t4,$fn=22);
    } 
    translate([-t4,-2,-2])
    cube([ t4,12,12]);
  }
}

//---------------------------------------------
module fan(tol=0,holes=1){

// fan and radiator
t1=4.25;   // thickness box intake side
t2=17.7;   // thickness of circular section
t3=4.0;    // thickness box outlet side
t4=t1+t2+t3;
 
  // Fan body
if(holes==1){
  difference(){
    union(){
      translate([-t1,0,0])
      cube([t1+tol,121+tol,120+tol]);
      translate([-(t1+t2),60,60])
      rotate([0,90,0])
      cylinder(r=60,h=t2,$fn=88);  
      translate([-t4,0,0])
      cube([t3+tol,120+tol,120+tol]);
    }
    // mark the openings
    translate([-t4-1,60,60])
    rotate([0,90,0])
    difference(){
      cylinder(r=115/2,h=t4+2,$fn=88);  
      translate([0,0,-1])
      cylinder(r=53/2,h=t4+4,$fn=88);  
    }
    if(1){
      // Corner screws
      translate([1,7,7])
      rotate([0,-90,0])
      cylinder(r=1.45,h=t4+2,$fn=22);

      translate([1,120-7,7])  
      rotate([0,-90,0])
      cylinder(r=1.6,h=t4+2,$fn=22);

      translate([1,7,120-7])
      rotate([0,-90,0])
      cylinder(r=1.45,h=t4+2,$fn=22);
      
      translate([1,120-7,120-7])
      rotate([0,-90,0])
      cylinder(r=1.45,h=t4+2,$fn=22);
    }

  }
  // spider
    translate([0,60,60])
    for(i=[0:3]){
      rotate([i*90,0,0])
      hull(){
        translate([-t4,0,20])
        rotate([0,90,0])
        cylinder(r=3.5,h=4,$fn=88);  
        translate([-t4,-48,46])
        rotate([0,90,0])
        cylinder(r=3.5,h=4,$fn=88);  
      }
    }
  
}else{
    union(){
      translate([-t1,0,0])
      cube([t1+tol,121+tol,120+tol]);
      translate([-(t1+t2),60,60])
      rotate([0,90,0])
      cylinder(r=60,h=t2,$fn=88);  
      translate([-t4,0,0])
      cube([t3+tol,120+tol,120+tol]);
    }
}

if(0){
  // Corner screws
  translate([0,7,7])
  rotate([0,-90,0])
  cylinder(r=1.45,h=t4,$fn=22);

  translate([0,120-7,7])  
  rotate([0,-90,0])
  cylinder(r=1.6,h=t4,$fn=22);

  translate([0,7,120-7])
  rotate([0,-90,0])
  cylinder(r=1.45,h=t4,$fn=22);
  
  translate([0,120-7,120-7])
  rotate([0,-90,0])
  cylinder(r=1.45,h=t4,$fn=22);
}

  // Corner braces
  translate([0,7,7])
  brace();
  translate([0,120-7,7])
  rotate([90,0,0])
  brace();
  translate([0,120-7,120-7])
  rotate([180,0,0])
  brace();
  translate([0,7,120-7])
  rotate([-90,0,0])
  brace();

  // reminder for wiring
  color("red")
  translate([0,120-7,15.5])
  scale([1,4,1])
  rotate([0,90,0])
  cylinder(r=0.7,h=10,$fn=22);
  
  
}

//====================================================================================

fan();


//====================================================================================
