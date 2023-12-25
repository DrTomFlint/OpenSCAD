//======================================================================
// halo3.scad
//
// Halo using fairy lights & battery instead of fibers from the wings.
//
// DrTomFlint 24 Dec 2024
//======================================================================


r0 = 130/2;     // around the head
r1 = 5;       // size of main loop
N = 29;         // number of tips

F1=600;
F2=44;

//----------------------------------------------------------------------
module tip(){
    
difference(){    
  hull(){
    cube([10,0.11,2*r1*0.52],center=true);
    translate([0,10,0])
    cylinder(r=0.5,h=2*r1*0.52,center=true,$fn=22);
  }
}  

}


//----------------------------------------------------------------------
module halo3(){

    difference(){
      rotate_extrude($fn=199){
        translate([r0,0,0])
        scale([1,0.6])
        circle(r=r1,$fn=6);
      }
      
      // backside cuts for leds  
      for (i=[0:N-1]){
        rotate([0,0,360/N*i+180/N])
        translate([0,r0-2,1.2]){
          cylinder(r=3.5,h=5,center=true,$fn=F2);
          translate([0,-5,0])
          cylinder(r=5,h=5,center=true,$fn=F2);
        }                  
      }
      
      // post holes
      rotate([0,0,3*360/N])
      translate([0,r0,0])
      cylinder(r=1,h=6,center=true,$fn=F2);
      rotate([0,0,-3*360/N])
      translate([0,r0,0])
      cylinder(r=1,h=6,center=true,$fn=F2);

      rotate([0,0,6*360/N])
      translate([0,r0,0])
      cylinder(r=1,h=6,center=true,$fn=F2);
      rotate([0,0,-6*360/N])
      translate([0,r0,0])
      cylinder(r=1,h=6,center=true,$fn=F2);

      rotate([0,0,0*360/N])
      translate([0,r0,0])
      cylinder(r=1,h=6,center=true,$fn=F2);
    }
    
    // add backside posts 
    for (i=[0:N-1]){
      rotate([0,0,360/N*i+180/N])
      translate([0,r0-4,-0.1-2.5/2]){
        difference(){
          union(){
            cylinder(r1=3,r2=2,h=2.5,center=true,$fn=F2);
            translate([0,0,2.5])
            cylinder(r1=2,r2=2.5,h=2.5,center=true,$fn=F2);
          }
          translate([0,-4.5,-2])
          rotate([38,0,0])
          cube([10,10,10],center=true);          

          translate([0,-4.5,5])
          rotate([-38,0,0])
          cube([10,10,10],center=true);          
        }
      }                  
    }
  if(1){
    for (i=[0:N-1]){
      rotate([0,0,360/N*i+180/N])
      translate([0,r0+1.5,0])
      tip();
    }
  }
}

//----------------------------------------------------------------------
module lock(){

dr=2;
    
  translate([0,0,3])
  difference(){    
    union(){
      cylinder(r1=r0+dr+0.5,r2=r0+dr+0.3,h=0.9,center=true,$fn=F1);
    
      // backside cuts for leds  
      for (i=[0:N-1]){
        rotate([0,0,360/N*i+180/N])
        translate([0,r0-2,-1.0]){
          cylinder(r=3.3,h=1.5,center=true,$fn=F2);
        }                  
      }
    }
    
    // center bore
    cylinder(r=r0-dr-1.8,h=5,center=true,$fn=F1);

    // backside posts 
    for (i=[0:N-1]){
      rotate([0,0,360/N*i+180/N])
      translate([0,r0-4,-0.1-2.5/2])
      cylinder(r=2.6,h=2.0,center=true,$fn=F2);
    }

    // post holes
    rotate([0,0,3*360/N])
    translate([0,r0,0])
    cylinder(r=1,h=6,center=true,$fn=F2);
    rotate([0,0,-3*360/N])
    translate([0,r0,0])
    cylinder(r=1,h=6,center=true,$fn=F2);

    rotate([0,0,6*360/N])
    translate([0,r0,0])
    cylinder(r=1,h=6,center=true,$fn=F2);
    rotate([0,0,-6*360/N])
    translate([0,r0,0])
    cylinder(r=1,h=6,center=true,$fn=F2);

    rotate([0,0,0*360/N])
    translate([0,r0,0])
    cylinder(r=1,h=6,center=true,$fn=F2);

  }


}  

//======================================================================

//~ tip();
//~ halo3();

//~ color("red")
lock();

if(0){
  difference(){
    //~ halo3();
    lock();
    rotate([0,0,2])
    translate([-100,0,-10])
    cube([200,200,20]);
    rotate([0,0,152])
    translate([-100,0,-10])
    cube([200,200,20]);
  }
}

//======================================================================
