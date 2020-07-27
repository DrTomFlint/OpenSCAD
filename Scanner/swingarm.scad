// swingarm.scad
// scanner part

// ------------------------------------------------------------
use <../Parts/motors.scad>

module swingarm(tol=0,angle=-60,length=50){

thick=15;
z5=1;

    ax3=length*cos(angle);
    ay3=length*sin(angle);


difference(){
  // the arm  
  hull(){
    color("pink")
    translate([31/2,31/2,z5])
    cylinder(r=6,h=thick,$fn=44);


    // azimuth idler location:
    translate([-ax3,-ay3,z5])
    cylinder(r=5,h=thick,$fn=44); 
    }

    // cut for idler bolt
    translate([-ax3,-ay3,-1])
    cylinder(r=1.7,h=thick+2,$fn=44);  
    // cut for idler 
    translate([-ax3,-ay3,z5+4])
    cylinder(r=11,h=9.5,$fn=44);  

    // cut for motor bolt
    translate([31/2,31/2,z5-2])
    cylinder(r=1.7,h=thick+10,$fn=44);  
    translate([31/2,31/2,z5-0.01])
    cylinder(r=3,h=4,$fn=44);  
  }

  // add the idler wheel
  if(1){
    translate([-ax3,-ay3,z5+4])
      idler();
  }
}


//---------------------------------------------------------
module swingarm2(tol=0,angle=0,length=50){

thick=15;
z5=1;

    ax3=length*cos(angle);
    ay3=length*sin(angle);

difference(){
// arm
union(){
difference(){
    // cylinder boss
    translate([ax3/2,ay3/2,0])
    scale([1,0.5,1])
    cylinder(r=length/2+thick/2,h=thick,$fn=44);
    // hollow out
    translate([ax3/2,ay3/2,-1])
    scale([1,0.5,1])
    cylinder(r=length/2-thick/2,h=thick+2,$fn=44);
    // half moon
    translate([-ax3/2,-ay3/2,-1])
    rotate([0,0,angle])
    cube([length*2,length*2,20]);
}

translate([0,0,0])
cylinder(r=thick/2,h=thick,$fn=44);  

translate([ax3,ay3,0])
cylinder(r=thick/2,h=thick,$fn=44);  
}

    // cut for the idler
    translate([ax3,ay3,2])
    cylinder(r=11,h=9.5,$fn=44);  
    translate([ax3,ay3,-2])
    cylinder(r=1.7,h=thick+20,$fn=44);  

    // cut for motor bolt
    translate([0,0,-1])
    cylinder(r=1.7,h=thick+2,$fn=44);  
    // bolt head
    translate([0,0,thick-2])
    cylinder(r=3,h=4,$fn=44);  
}

  // add the idler wheel
  if(1){
    translate([ax3,-ay3,2.25])
      idler();
  }
}
//---------------------------------------------------------
module swingarm3(tol=0,angle=0,length=50){

thick=12;
z5=1;

    ax3=length*cos(angle);
    ay3=length*sin(angle);

difference(){
// arm
union(){
difference(){
    // cylinder boss
    translate([ax3/2,ay3/2,0])
    scale([1,0.7,1])
    cylinder(r=length/2+thick/2,h=thick,$fn=44);
    // hollow out
    translate([ax3/2,ay3/2,-1])
    scale([1,0.7,1])
    cylinder(r=length/2-thick/2,h=thick+2,$fn=44);
    // half moon
    translate([-ax3/2,-ay3/2,-1])
    rotate([0,0,angle])
    cube([length*2,length*2,20]);
}

translate([0,0,0])
cylinder(r=thick/2,h=thick,$fn=44);  

translate([ax3,ay3,0])
cylinder(r=thick/2,h=thick,$fn=44);  
}

    // cut for the idler
    translate([ax3,ay3,2])
    cylinder(r=11,h=9.5,$fn=44);  
    translate([ax3,ay3,-2])
    cylinder(r=1.7,h=thick+20,$fn=44);  

    // cut for motor bolt
    translate([0,0,-1])
    cylinder(r=1.7,h=thick+2,$fn=44);  
    // bolt head
    translate([0,0,thick-2])
    cylinder(r=3,h=4,$fn=44);  
}

  // add the idler wheel
  if(1){
    translate([ax3,-ay3,2.25])
      idler();
  }
}
//=============================

//translate([0,0,-40])
//color("gray")
//swingarm();

swingarm2(length=35, angle=0);

//===================================
