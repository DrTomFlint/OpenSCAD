//=================================================================================
// Rosalees2.scad
//
//
// Dr Tom Flint, 19 Sept 2025
//=================================================================================

use <../Fractals/Lsystem.scad>

layer=0.24;
nlayer=4;
thick=nlayer*layer;  

r1=65;
F2=99;

cut1=1200;
cut2=470;
mag=1/28;

ntop=1;

nbot=nlayer-ntop;

loop1=20;
loop2=18.5;


//-----------------------------------------------------------------------------------
module full(){
  
  render()
  intersection(){
    translate([0,0,-0.5])
    scale([1,1,1])
    surface(file="./Rosalees3.png", center = true, invert=false);
  
    translate([0,0,thick/2])
    cube([cut1,cut1,thick],center=true);
  }
  
}  

//-----------------------------------------------------------------------------------
module circ(){
  
  render()
  scale([mag,mag,1])
  intersection(){
    full();
    
    translate([0,0,thick/2])
    cylinder(r=cut2,h=5*thick,center=true,$fn=F2);
  }
  
}  

//-----------------------------------------------------------------------------------
module loop(){
  
  render()
  // outer loop and hanger
    difference(){
      hull(){
        cylinder(r=loop1,h=thick,$fn=F2);
        translate([0,22,0])
        cylinder(r=3,h=thick,$fn=F2);
      }
      cylinder(r=loop2,h=5*thick,center=true,$fn=F2);
      translate([0,22,0])
      cylinder(r=1.5,h=5*thick,center=true,$fn=F2);
    }
}  

//-----------------------------------------------------------------------------------
module back(){
  
  render()
  difference(){
    cylinder(r=loop2,h=thick,$fn=F2);
    circ();
  }

}  

//-----------------------------------------------------------------------------------
module backA(){
  
  intersection(){
    back();
    cylinder(r1=0.25*loop2,r2=0.6*loop2,h=thick,$fn=F2);
  }

}  


//-----------------------------------------------------------------------------------
module backB(){
  
  intersection(){
    difference(){
      back();
      cylinder(r1=0.25*loop2,r2=0.6*loop2,h=thick,$fn=F2);
    }
    cylinder(r1=0.6*loop2,r2=0.85*loop2,h=thick,$fn=F2);
    }
}  

//-----------------------------------------------------------------------------------
module backC(){
  
  difference(){
    back();
    cylinder(r1=0.6*loop2,r2=0.85*loop2,h=thick,$fn=F2);
  }

}  

//-----------------------------------------------------------------------------------
module circ2(){
  
  linear_extrude(height=thick,scale=0.95)
  offset(r=0.4)
  projection(cut=false)
  circ();
  
}

//-----------------------------------------------------------------------------------
module top(){
  
    intersection(){
      circ();    
      translate([0,0,ntop*layer/2+nbot*layer])
      cube([800,800,ntop*layer],center=true);
    }
    
    intersection(){
      loop();    
      translate([0,0,ntop*layer/2+nbot*layer])
      cube([800,800,ntop*layer],center=true);
    }

}

//-----------------------------------------------------------------------------------
module base(){
  
    intersection(){
      circ();    
      translate([0,0,nbot*layer/2])
      cube([800,800,nbot*layer],center=true);
    }
    
    intersection(){
      loop();    
      translate([0,0,nbot*layer/2])
      cube([800,800,nbot*layer],center=true);
    }

}

//-----------------------------------------------------------------------------------
module backD(){
  
  render()
  intersection(){
    back();
    translate([0,0,thick/2])
    rotate([0,0,30])
    rotate([a0,0,0])
    translate([0,0,z0])
    cube([80,80,z0],center=true);
  }

}  

//-----------------------------------------------------------------------------------
module backE(){
  
  render()
  intersection(){
    back();
    translate([0,0,thick/2])
    rotate([0,0,30])
    rotate([a0,0,0])
    cube([80,80,z0],center=true);
  }

}  
//-----------------------------------------------------------------------------------
module backF(){
  
  render()
  intersection(){
    back();
    translate([0,0,thick/2])
    rotate([0,0,30])
    rotate([a0,0,0])
    translate([0,0,-z0])
    cube([80,80,z0],center=true);
  }

}  

//-----------------------------------------------------------------------------------
module backG(){
  
  render()
  intersection(){
    back();
    translate([0,0,0])
    rotate([0,0,0])
    scale([2,2,1])
    linear_extrude(height=thick)
    penrose_tiling(n=5, w=0.2);   // Recommended n <= 6

  }

}  
//-----------------------------------------------------------------------------------
module backH(){
  
  render()
  difference(){
    back();
    translate([0,0,0])
    rotate([0,0,0])
    scale([2,2,1])
    linear_extrude(height=thick)
    penrose_tiling(n=5, w=0.2);   // Recommended n <= 6

  }

}  

//-----------------------------------------------------------------------------------
module backI(){
  
  render()
  intersection(){
    back();
    translate([0,0,0])
    rotate([0,0,0])
    scale([s0,s0,1])
    linear_extrude(height=thick)
    penrose_tiling(n=5, w=0.25);   // Recommended n <= 6

  }

}  
//-----------------------------------------------------------------------------------
module backJ(){
  
  render()
  difference(){
    back();
    translate([0,0,0])
    rotate([0,0,0])
    scale([s0,s0,1])
    linear_extrude(height=thick)
    penrose_tiling(n=5, w=0.25);   // Recommended n <= 6

  }

}  

//=================================================================================

//~ intersection(){

//~ full();
//~ circ();
//~ circ2();

//~ loop();
//~ back();

//~ top();
//~ base();

//~ backA();
//~ backB();
//~ backC();

// DEF-1
//~ a0=7;
//~ z0=2*thick;

// DEF-2
a0=4;
z0=1.25*thick;


//~ backD();
//~ backE();
//~ backF();


//~ backG();
//~ backH();

s0=5;

//~ backI();
backJ();

//~ }

//=================================================================================
