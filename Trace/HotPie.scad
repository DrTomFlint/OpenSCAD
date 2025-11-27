//======================================================================
// HotPie.scad
//
// Hot Pie Earrings for Rosalee's
//
// DrTomFlint 25 Nov 2025
//
//======================================================================

use <../Parts/rounder.scad>

layer = 0.24;
thick = 4*layer;
line = 0.8;

F1 = 99;
F2 = 24;  

//~ a1 = -30;
//~ a2 = -18;
//~ a3 = -7;
//~ a4 = 12;
//~ a5 = 20;
//~ a6 = 28;

//~ apie=56;

//~ yoff= -30;
//~ tsize = 5.4;
//~ poff = 3.0;


a1 = -28;
a2 = -17.5;
a3 = -7.75;
a4 = 13;
a5 = 20;
a6 = 27;

apie=56;

yoff= -40;
tsize = 7;
poff = 5;

//----------------------------------------------------------------------
module hotpie(){

    rotate([0,0,a1])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("H", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a2])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a3])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a4])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("P", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a5])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("I", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a6])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("E", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);


}

//----------------------------------------------------------------------
module hotpieBlack(){

m1=0.9;

    rotate([0,0,a1])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("H", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("H", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a2])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("O", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a3])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a4])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("P", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("P", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a5])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("I", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("I", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a6])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("E", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("E", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }




}

//----------------------------------------------------------------------
module pieFull(){

  difference(){
    cylinder(r=-yoff-poff,h=thick,$fn=F1);
    rotate([0,0,apie])
    translate([-100,0,-thick])
    cube([200,200,3*thick]);
    rotate([0,0,-apie])
    translate([-100,0,-thick])
    cube([200,200,3*thick]);
  }

}

//----------------------------------------------------------------------
module pie(){

  difference(){
    pieFull();
    translate([0,0,-1])
    scale([1,1,3]){
      roundsFull();
      squares();
    }
  }

}

//----------------------------------------------------------------------
module pie2(){

  difference(){
    pieFull();
    translate([0,0,-1])
    scale([1,1,3]){
      roundsFull2();
      squaresFull2();
    }
  }

}

//----------------------------------------------------------------------
module rounds(){

  difference(){
    union(){
      translate([2,-5,0])
      cylinder(r=4,h=thick,$fn=F2);
      
      translate([-8.2,-18,0])
      cylinder(r=4,h=thick,$fn=F2);
      
      translate([13,-25,0])
      cylinder(r=4,h=thick,$fn=F2);
    }
    rotate([0,0,apie])
    translate([-100,0,-thick])
    cube([200,200,3*thick]);
    rotate([0,0,-apie])
    translate([-100,0,-thick])
    cube([200,200,3*thick]);
  }

}

//----------------------------------------------------------------------
module rounds2(){

  difference(){
    union(){
      translate([-3,-9,0])
      cylinder(r=4,h=thick,$fn=F2);
      
      translate([4,-27,0])
      cylinder(r=4,h=thick,$fn=F2);
      
      translate([-13,-25,0])
      cylinder(r=4,h=thick,$fn=F2);
    }
    rotate([0,0,apie])
    translate([-100,0,-thick])
    cube([200,200,3*thick]);
    rotate([0,0,-apie])
    translate([-100,0,-thick])
    cube([200,200,3*thick]);
  }

}
//----------------------------------------------------------------------
module roundsFull2(){

    union(){
      translate([-3,-9,0])
      cylinder(r=4,h=thick,$fn=F2);
      
      translate([4,-27,0])
      cylinder(r=4,h=thick,$fn=F2);
      
      translate([-13,-25,0])
      cylinder(r=4,h=thick,$fn=F2);
    }

}

//----------------------------------------------------------------------
module roundsFull(){

    union(){
      translate([2,-5,0])
      cylinder(r=4,h=thick,$fn=F2);
      
      translate([-8.2,-18,0])
      cylinder(r=4,h=thick,$fn=F2);
      
      translate([13,-25,0])
      cylinder(r=4,h=thick,$fn=F2);
    }

}


//----------------------------------------------------------------------
module squares(){

  difference(){
    union(){
      translate([3,-15,0])
      rotate([0,0,30])
      cube([5,2,thick]);
      
      translate([-1,-22,0])
      rotate([0,0,-45])
      cube([7,2,thick]);
      
      translate([-11,-29,0])
      rotate([0,0,15])
      cube([6,2,thick]);
    }
    rotate([0,0,apie])
    translate([-100,0,-thick])
    cube([200,200,3*thick]);
    rotate([0,0,-apie])
    translate([-100,0,-thick])
    cube([200,200,3*thick]);
  }

}
//----------------------------------------------------------------------
module squares2(){

  difference(){
    union(){
      translate([8,-17,0])
      rotate([0,0,-30])
      cube([5,2,thick]);
      
      translate([-1,-21,0])
      rotate([0,0,45])
      cube([7,2,thick]);
      
      translate([-8,-29,0])
      rotate([0,0,-40])
      cube([6,2,thick]);

      translate([14,-29,0])
      rotate([0,0,40])
      cube([6,2,thick]);
    }
    rotate([0,0,apie])
    translate([-100,0,-thick])
    cube([200,200,3*thick]);
    rotate([0,0,-apie])
    translate([-100,0,-thick])
    cube([200,200,3*thick]);
  }

}


//----------------------------------------------------------------------
module squaresFull2(){

    union(){
      translate([8,-17,0])
      rotate([0,0,-30])
      cube([5,2,thick]);
      
      translate([-1,-21,0])
      rotate([0,0,45])
      cube([7,2,thick]);
      
      translate([-8,-29,0])
      rotate([0,0,-40])
      cube([6,2,thick]);

      translate([14,-29,0])
      rotate([0,0,40])
      cube([6,2,thick]);
    }
}



//----------------------------------------------------------------------
module crust(){

m1=1.25;  

  difference(){
    minkowski(){
      pieFull();  
      cylinder(r=m1,h=0.001,$fn=12,center=true);
    }
    translate([0,0,-1])
    scale([1,1,3])
    pieFull();  
  }

}

//----------------------------------------------------------------------
module loop(){

  translate([0,2.2,0])
  scale([1.2,1.1,1])
  difference(){
    cylinder(r=2,h=thick,$fn=F1);
    cylinder(r=1,h=5*thick,center=true,$fn=F1);
  }

  translate([0,-38,0])
  scale([1.2,1.1,1])
  difference(){
    cylinder(r=2,h=thick,$fn=F1);
    cylinder(r=1,h=5*thick,center=true,$fn=F1);
  }
}

//----------------------------------------------------------------------
module pieBlack(){

  intersection(){
    union(){
      hotpieBlack();
      crust();
      loop();
    }
    translate([-100,-100,0])
    cube([200,200,layer]);
  }  

}
//----------------------------------------------------------------------
module pieClear(){

  intersection(){
    union(){
      hotpieBlack();
      crust();
      loop();
    }
    translate([-100,-100,layer])
    cube([200,200,3*layer]);
  }  

}

//====================================================================================================

//~ hotpie();

//~ hotpieBlack();

//~ pie();

//~ crust();
//~ loop();

//~ pieBlack();
//~ pieClear();

//~ rounds();
//~ squares();

// second version
xoff=55;

translate([xoff,0,0])
hotpie();

//~ translate([xoff,0,0])
//~ rounds2();

//~ translate([xoff,0,0])
//~ squares2();

//~ translate([xoff,0,0])
//~ pie2();

//~ translate([xoff,0,0])
//~ pieBlack();

//~ translate([xoff,0,0])
//~ pieClear();

//====================================================================================================
