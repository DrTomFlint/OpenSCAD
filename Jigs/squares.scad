//======================================================================
// squares.scad
//
// square with cutaway 
//
// Dr Tom Flint, 31 Dec 2022
//======================================================================


use <./Lsystem.scad>
use <./rounder.scad>


//----------------------------------------------------------------------
module sq(rin=40,rout=60,thick=2.4){

$fn=99;

  translate([0,rin,0])
  cube([1.2,rout-rin,4]);
  
  translate([rin,0,0])
  cube([rout-rin,1.2,4]);
  
  intersection(){
    difference(){
      cylinder(r=rout,h=thick);
      cylinder(r=rin,h=3*thick,center=true);

    }

    cube([rout+2,rout+2,4]);

    if(0){  // set to 1 for fractal squares, render takes several minutes
      scale([4,4,1])
      linear_extrude(height=thick)
      penrose_tiling(n=7, w=0.3); 
    }
  }

  intersection(){
    cube([rout+2,rout+2,4]);
    difference(){
      cylinder(r=rout,h=thick+0.6);
      cylinder(r=rout-1.2,h=3*thick,center=true);

    }
  }
  
  intersection(){
    cube([rout+2,rout+2,4]);
    difference(){
      cylinder(r=rin+1.2,h=thick+0.6);
      cylinder(r=rin,h=3*thick,center=true);

    }
  }
  
}

//----------------------------------------------------------------------
module box(){

$fn=299;
wide=2.5;
tol=0.2;
thick=6.5;

difference(){
  union(){
  difference(){
    translate([-wide-tol-0.6,-wide-tol-0.6,0])
    cube([81.04+2*wide+2*tol+1.2,81.04+2*wide+2*tol+1.2,thick]);

    translate([-0.6,-0.6,-1])
    cube([81.04+tol+1.2,81.04+tol+1.2,thick+2]);
    
  }
  
  intersection(){
    cylinder(r=10-tol,h=4);
    translate([-wide,-wide,0])
    cube([20,20,4]);

    scale([4,4,1])
    linear_extrude(height=thick)
    penrose_tiling(n=3, w=0.3);   // Recommended n <= 6

  }  
  // floor under center rose
  intersection(){
    cylinder(r=10-tol,h=4);
    translate([-wide,-wide,0])
    cube([20,20,1.5]);

  }  

  // inner curve
  intersection(){
    difference(){
      cylinder(r=10-tol,h=thick);
      cylinder(r=10-tol-1.2,h=3*thick,center=true);
    }
    translate([-wide,-wide,0])
    cube([20,20,4]);
  }

  // outer curve
  intersection(){
    difference(){
      cylinder(r=81.04+tol+wide,h=thick);
      cylinder(r=81.04+tol,h=3*thick,center=true);
    }
    translate([-wide-tol-0.6,-wide-tol-0.6,0])
    cube([81.04+2*wide+2*tol+1.2,81.04+2*wide+2*tol+1.2,4]);
  }

  // hilbert fill
  intersection(){
    difference(){
      translate([-wide-tol-0.6,-wide-tol-0.6,0])
      cube([81.04+2*wide+2*tol+1.2,81.04+2*wide+2*tol+1.2,3]);

      cylinder(r=81.04+tol,h=3*thick,center=true);
    }
    
    if(1){
      translate([-44,82,0])
      scale([2,2,1])
      linear_extrude(height=6)
      hilbert_curve(n=6, w=0.5, angle=90);    // Recommended n <= 9
    }
  }

  // floor under hilbert
  difference(){
    translate([-wide-tol-0.6,-wide-tol-0.6,0])
    cube([81.04+2*wide+2*tol+1.2,81.04+2*wide+2*tol+1.2,1.5]);

    cylinder(r=81.04+tol,h=3*thick,center=true);
  }

}


rx=2;

    translate([-wide-tol-0.6,-wide-tol-0.6,0])
    rounder(r=rx,f=77,h=9);

    translate([-wide-tol-0.6+81.04+2*wide+2*tol+1.2,-wide-tol-0.6,0])
    rotate([0,0,90])
    rounder(r=rx,f=77,h=9);

    translate([-wide-tol-0.6+81.04+2*wide+2*tol+1.2,-wide-tol-0.6+81.04+2*wide+2*tol+1.2,0])
    rotate([0,0,180])
    rounder(r=rx,f=77,h=9);

    translate([-wide-tol-0.6,-wide-tol-0.6+81.04+2*wide+2*tol+1.2,0])
    rotate([0,0,-90])
    rounder(r=rx,f=77,h=9);
    
    // slot for lid
    translate([-1.5,-1.5,4.25])
    cube([90,84,1.2]);
    translate([81.8,-0.5,4.25])
    cube([20,82,4]);

    // bevel to make it printable without support
    translate([-1.5,-1.5,4.25+1.2])
    translate([45,42,0])
    linear_extrude(scale=0.96,height=2)
    square([90,84],center=true);
}


}

//----------------------------------------------------------------------
module boxSupport(){

  difference(){
    translate([-1.5,-1.5,4.25])
    cube([85.5,84,1.2]);

    translate([0,0,3.25])
    cube([90-3,84-3,3]);
  }
}

//======================================================================

tol=0.1;
if(1){
  sq(rin=10+tol,rout=20-tol,thick=2.1);
  sq(rin=20+tol,rout=34-tol,thick=2.4);
  sq(rin=34+tol,rout=53.6-tol,thick=2.7);
  sq(rin=53.6+tol,rout=81.04-tol,thick=3.0);
}

//color("cyan")
//~ box();

//color("red")
//~ boxSupport();

//======================================================================
