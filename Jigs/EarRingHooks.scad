//======================================================================
// EarRingHooks.scad
// 
// Bar for displaying earrings.
//
// DrTomFlint 29 Dec 2023
//======================================================================

N = 6;			// number of hooks

ra=2;

x1=15;
y1=3;
z1=6;


x2=35;
y2=0.1;
z2=6;

y3=11;

thick=1.2;
gap = 0.6;

//----------------------------------------------------------------------
module hook2(){

difference(){
  union(){
    // back plate
    difference(){
      translate([0,0,1])
      cube([35,thick,10],center=true);

      translate([15,0,-1])
      rotate([90,0,0])
      cylinder(r=0.7,h=20,center=true,$fn=22);
      translate([-15,0,-1])
      rotate([90,0,0])
      cylinder(r=0.7,h=20,center=true,$fn=22);

      translate([15,0,4])
      rotate([90,0,0])
      cylinder(r=0.7,h=20,center=true,$fn=22);
      translate([-15,0,4])
      rotate([90,0,0])
      cylinder(r=0.7,h=20,center=true,$fn=22);

    }
        
    difference(){
      union(){
        // hook
        translate([0,thick/2+1,0])
        scale([1,0.7,1])
        rotate_extrude(angle=180,$fn=77){
          translate([3,0,0])
          scale([1,2])
          circle(r=2,$fn=33);
        }
        // extender
        translate([3,thick/2+1,0])
        rotate([90,0,0])
        scale([1,2,1])
        cylinder(r1=2,r2=3,h=1,$fn=33);
        // extender
        translate([-3,thick/2+1,0])
        rotate([90,0,0])
        scale([1,2,1])
        cylinder(r1=2,r2=1,h=1-gap,$fn=33);
      }
      // cuts to make loops sit
      translate([1,2.8,-2])
      rotate([0,0,0])
      cylinder(r=1.2,h=20,center=true,$fn=22);
      translate([-1,2.8,-2])
      rotate([0,0,0])
      cylinder(r=1.2,h=20,center=true,$fn=22);
      
      translate([-1.0,0,-2])
      scale([1,2,1])
      cylinder(r=1.5,h=20,center=true,$fn=22);
    }
  }  // end of union

    // cut bottom to make printable
    translate([0,0,-6])
    cube([40,40,6],center=true);
} // end of diff

}

//----------------------------------------------------------------------
module hook(){

difference(){
  union(){
    // back plate
    difference(){
      translate([0,0,1])
      cube([35,thick,10],center=true);

      translate([15,0,-1])
      rotate([90,0,0])
      cylinder(r=0.7,h=20,center=true,$fn=22);
      translate([-15,0,-1])
      rotate([90,0,0])
      cylinder(r=0.7,h=20,center=true,$fn=22);

      translate([15,0,4])
      rotate([90,0,0])
      cylinder(r=0.7,h=20,center=true,$fn=22);
      translate([-15,0,4])
      rotate([90,0,0])
      cylinder(r=0.7,h=20,center=true,$fn=22);

    }
        
    difference(){
      union(){
        // hook
        translate([0,thick/2+1,0])
        scale([1,0.7,1])
        rotate_extrude(angle=180,$fn=77){
          translate([3,0,0])
          scale([1,2])
          circle(r=2,$fn=33);
        }
        // extender
        translate([3,thick/2+1,0])
        rotate([90,0,0])
        scale([1,2,1])
        cylinder(r1=2,r2=3,h=1,$fn=33);
                
        // bump
        translate([-3.5,2.5,1])
        cylinder(r1=1,r2=1.5,h=6,center=true,$fn=22);
        translate([-3.5,2.5,4])
        sphere(r=1.5,$fn=33);
      }
      // cuts to make loops sit
      translate([1,2.8,-2])
      cylinder(r=1.2,h=20,center=true,$fn=22);
      translate([-1,2.8,-2])
      cylinder(r=1.2,h=20,center=true,$fn=22);
      
      translate([-1.0,0,-2])
      scale([1,2,1])
      cylinder(r=1.5,h=20,center=true,$fn=22);
    }
  }  // end of union

    // cut bottom to make printable
    translate([0,0,-6])
    cube([40,40,6],center=true);
} // end of diff

}

//----------------------------------------------------------------------
module hook4(){

difference(){
  union(){
    // back plate
    difference(){
      translate([0,0,1])
      cube([35,thick,10],center=true);

      translate([15,0,-1])
      rotate([90,0,0])
      cylinder(r=0.7,h=20,center=true,$fn=22);
      translate([-15,0,-1])
      rotate([90,0,0])
      cylinder(r=0.7,h=20,center=true,$fn=22);

      translate([15,0,4])
      rotate([90,0,0])
      cylinder(r=0.7,h=20,center=true,$fn=22);
      translate([-15,0,4])
      rotate([90,0,0])
      cylinder(r=0.7,h=20,center=true,$fn=22);

    }
        
    translate([0,0,1])
    rotate([0,90,0])
    union(){
      // hook
      translate([0,thick/2+1,0])
      scale([1,0.5,1])
      rotate_extrude(angle=180,$fn=77){
        translate([3,0,0])
        scale([1,1.5])
        circle(r=1.5,$fn=33);
      }
      // extender
      translate([3,thick/2+1,0])
      rotate([90,0,0])
      scale([1,1.5,1])
      cylinder(r1=1.5,r2=2.0,h=1,$fn=33);
              
    }
  }  // end of union

    // cut bottom to make printable
    translate([0,0,-6])
    cube([40,40,6],center=true);
} // end of diff

}
//----------------------------------------------------------------------
module hooks(){
  
  for (i=[0:N-1]){
    translate([30*i,0,0])
    hook();
  }
  
}

//======================================================================

//~ hook();

hooks();

//======================================================================
