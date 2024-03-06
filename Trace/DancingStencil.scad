//======================================================================
// DancingStencil.scad
//
//
// DrTomFlint 11 Dec 2023
//======================================================================

use <./DancingStencil1.scad>
use <./DancingStencil2.scad>
use <./DancingStencil3.scad>
use <./DancingStencil4.scad>
use <./DancingStencil5.scad>

//~ mag=30;
//~ mag=60;

mag=120;
thick=0.9;
pad=2;

//----------------------------------------------------------------------
module stencil_OLD(num=1,xoff=5,yoff=0){

$fn=77;

  difference(){
    translate([xoff,yoff,0.01])
    scale([0.85,1,1])
    cylinder(r=0.60*mag,h=thick);

    if(num==1){
      scale([mag,mag,thick+1])  
      DancingStencil1();
    }
    if(num==2){
      scale([mag,mag,thick+1])  
      DancingStencil2();
    }
    if(num==3){
      scale([mag,mag,thick+1])  
      DancingStencil3();
    }
    if(num==4){
      scale([mag,mag,thick+1])  
      DancingStencil4();
    }
    if(num==5){
      scale([mag,mag,thick+1])  
      DancingStencil5();
    }
  }

  translate([xoff,yoff,0]){
    // add handle loops
    difference(){
      translate([-0.45*mag,0.4*mag,0.01])
      cylinder(r=10,h=2*thick);
      translate([-0.45*mag,0.4*mag,-1])
      cylinder(r=7,h=5*thick);
    }
    
    difference(){
      translate([-0.45*mag,-0.4*mag,0.01])
      cylinder(r=10,h=1*thick);
      translate([-0.45*mag,-0.4*mag,-1])
      cylinder(r=7,h=5*thick);
    }
  }

}

//----------------------------------------------------------------------
module stencil1(){

$fn=33;

  difference(){
  
    scale([1.05,1.05,1])
    hull(){
    difference(){
      DancingStencil1();
      
      translate([0.5,0.5,-1])
      cylinder(r=0.16,h=3);
      translate([-0.5,0.5,-1])
      cylinder(r=0.16,h=3);
      translate([-0.5,-0.5,-1])
      cylinder(r=0.16,h=3);
      translate([0.5,-0.5,-1])
      cylinder(r=0.16,h=3);

      }
    }

    translate([0,0,-0.1])
    scale([1,1,2])
    DancingStencil1();

    translate([0.3,-0.05,-1])
    cylinder(r=0.08,h=3);

    translate([-0.33,-0.12,-1])
    cylinder(r=0.08,h=3);

    translate([0.08,-0.37,-1])
    cylinder(r=0.06,h=3);
  }    
    
}

//----------------------------------------------------------------------
module stencil2(){

$fn=33;

  difference(){
  
    scale([1.05,1.05,1])
    hull(){
    difference(){
      DancingStencil2();
      
      translate([0.5,0.5,-1])
      cylinder(r=0.16,h=3);
      translate([-0.5,0.5,-1])
      cylinder(r=0.16,h=3);
      translate([-0.5,-0.5,-1])
      cylinder(r=0.16,h=3);
      translate([0.5,-0.5,-1])
      cylinder(r=0.16,h=3);

      }
    }

    translate([0,0,-0.1])
    scale([1,1,2])
    DancingStencil2();

    translate([0.3,-0.18,-1])
    cylinder(r=0.06,h=3);

    translate([0.28,0.18,-1])
    cylinder(r=0.06,h=3);

    translate([-0.28,-0.2,-1])
    cylinder(r=0.06,h=3);

    translate([0.07,-0.44,-1])
    cylinder(r=0.04,h=3);
  }    
    
}

//----------------------------------------------------------------------
module stencil3(){

$fn=33;

  difference(){
  
    scale([1.05,1.05,1])
    hull(){
    difference(){
      DancingStencil3();
      
      translate([0.5,0.5,-1])
      cylinder(r=0.16,h=3);
      translate([-0.5,0.5,-1])
      cylinder(r=0.16,h=3);
      translate([-0.5,-0.5,-1])
      cylinder(r=0.16,h=3);
      translate([0.5,-0.5,-1])
      cylinder(r=0.16,h=3);

      }
    }

    translate([0,0,-0.1])
    scale([1,1,2])
    DancingStencil3();

    translate([0.21,0.2,-1])
    cylinder(r=0.04,h=3);

  }    
    
}

//----------------------------------------------------------------------
module stencil4(){

$fn=33;

  difference(){
  
    scale([1.05,1.05,1])
    hull(){
    difference(){
      DancingStencil4();
      
      translate([0.5,0.5,-1])
      cylinder(r=0.16,h=3);
      translate([-0.5,0.5,-1])
      cylinder(r=0.16,h=3);
      translate([-0.5,-0.5,-1])
      cylinder(r=0.16,h=3);
      translate([0.5,-0.5,-1])
      cylinder(r=0.16,h=3);

      }
    }

    translate([0,0,-0.1])
    scale([1,1,2])
    DancingStencil4();

    translate([0.28,-0.06,-1])
    cylinder(r=0.05,h=3);

    translate([0.24,0.18,-1])
    cylinder(r=0.06,h=3);

    translate([-0.26,0.2,-1])
    cylinder(r=0.04,h=3);

  }    
    
}

//----------------------------------------------------------------------
module stencil5(){

$fn=33;

  difference(){
  
    scale([1.05,1.05,1])
    hull(){
    difference(){
      DancingStencil5();
      
      translate([0.5,0.5,-1])
      cylinder(r=0.16,h=3);
      translate([-0.5,0.5,-1])
      cylinder(r=0.16,h=3);
      translate([-0.5,-0.5,-1])
      cylinder(r=0.16,h=3);
      translate([0.5,-0.5,-1])
      cylinder(r=0.16,h=3);

      }
    }

    translate([0,0,-0.1])
    scale([1,1,2])
    DancingStencil5();

    translate([-0.22,0.3,-1])
    cylinder(r=0.05,h=3);

    translate([0.25,-0.25,-1])
    cylinder(r=0.04,h=3);

    translate([0.36,0.22,-1])
    cylinder(r=0.04,h=3);

    translate([-0.24,-0.18,-1])
    cylinder(r=0.07,h=3);

    translate([0.1,-0.37,-1])
    cylinder(r=0.06,h=3);
  }    
    
}


//======================================================================


//~ scale([mag,mag,thick]) stencil1();
//~ scale([mag,mag,thick]) stencil2();
//~ scale([mag,mag,thick]) stencil3();
//~ scale([mag,mag,thick]) stencil4();
scale([mag,mag,thick]) stencil5();


//~ stencil(num=1,xoff=2,yoff=-3);
//~ stencil(num=2,xoff=5);
//~ stencil(num=3,xoff=5);
//~ stencil(num=4,xoff=5);
//~ stencil(num=5,xoff=5);


//~ for(i=[1:3]){
  //~ translate([(i-1)*(mag+80),0,0]){
    //~ stencil(num=i);
  //~ }
//~ }
//~ for(i=[4:5]){
  //~ translate([(i-4)*(mag+80)+80,200,0]){
    //~ stencil(num=i);
  //~ }
//~ }



//======================================================================


