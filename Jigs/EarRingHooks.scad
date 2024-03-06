//======================================================================
// EarRingHooks.scad
// 
// Bar for displaying earrings.
//
// DrTomFlint 29 Dec 2023
//======================================================================

//~ N = 6;			// number of hooks

//~ ra=2;

//~ x1=15;
//~ y1=3;
//~ z1=6;


//~ x2=35;
//~ y2=0.1;
//~ z2=6;

//~ y3=11;

//~ thick=1.2;
//~ gap = 0.6;

//~ N = 5;			// number of hooks
//~ xmax = 170;   // width of strip
N = 7;			// number of hooks
xmax = 250;   // width of strip

ra=2;

x1=xmax/N;
y1=3;
z1=6;


x2=35;
y2=0.1;
z2=6;

y3=11;

thick=1.2;
gap = 1.2;


//----------------------------------------------------------------------
module hook(){

difference(){
  union(){
    // back plate
    difference(){
      translate([0,0,1])
      cube([x1+8,thick,8],center=true);

      translate([x1/2,0,0.5])
      rotate([60,0,0])
      cylinder(r=0.9,h=20,center=true,$fn=22);
      translate([-x1/2,0,0.5])
      rotate([60,0,0])
      cylinder(r=0.9,h=20,center=true,$fn=22);

    }
        
    difference(){
      //~ rotate([-20,0,0])
      union(){
        // hook
      rotate([-30,0,0])
        translate([0,thick/2+2,1.5])
        scale([1,0.7,1])
        rotate_extrude(angle=200,$fn=77){
          translate([5,0,0])
          scale([1,2.5])
          circle(r=1.5,$fn=33);
        }
        // extender
      rotate([0,0,0])
        translate([5,thick/2+3.8,0])
        rotate([90,0,0])
        scale([1,2,1])
        cylinder(r1=1.3,r2=2.5,h=4,$fn=33);
                
      }
    }
  }  // end of union

    // cut bottom to make printable
    translate([0,0,-6])
    cube([x1*2,40,6],center=true);
    translate([0,0,7])
    rotate([-30,0,0])
    cube([x1*2,40,6],center=true);

    // recut the gap
    translate([-5,thick/2+0.5/2,0])
    cube([10,0.5,20],center=true);

} // end of diff

}

//----------------------------------------------------------------------
module hooks(){
  
  for (i=[0:N-1]){
    //~ translate([30*i,0,0])
    translate([xmax/N*i,0,0])
    scale([1,1,1])
    hook();
  }
  
}

//======================================================================

//~ hook();

//~ rotate([180+30,0,0])
hooks();

//======================================================================
