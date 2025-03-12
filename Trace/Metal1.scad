//=================================================================================
// Metal1.scad
//
//
// Dr Tom Flint, 12 March 2025
//=================================================================================


thick=1.2;
r1=65;
F2=99;

//-----------------------------------------------------------------------------------
module rim(){
  
  render()
  intersection(){
    translate([0,0,-0.3])
    scale([1,1,0.02])
    surface(file="./MetalRim.png", center = true);
  
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
  
  // hanger loop
    translate([-50,185,0])
    #difference(){
      cylinder(r=30,h=thick,$fn=F2);
      cylinder(r=15,h=thick,$fn=F2);
    }
}  

//-----------------------------------------------------------------------------------
module palm(){
  
  render()
  intersection(){
    translate([0,0,-0.3])
    scale([1,1,0.02])
    surface(file="./MetalPalm.png", center = true);
    
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
}  

//-----------------------------------------------------------------------------------
module nails(){
  
  render()
  intersection(){
    translate([0,0,-0.3])
    scale([1,1,0.02])
    surface(file="./MetalNails.png", center = true);
    
    translate([0,0,thick/2])
    cube([800,800,thick],center=true);
  }
}  

//----------------------------------------------------------------------
module Black(tsize = 60){

a1=25;
a2=12;
yoff = -r1*4.2;
a9 = -2;

    rotate([0,0,-a1+a9])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("B", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,-a2+a9])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("L", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a9])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("A", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a2+a9])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("C", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a1+a9])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("K", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);


}

//----------------------------------------------------------------------
module BlackRim(tsize = 60){

m1=8;
a1=25;
a2=12;
yoff = -r1*4.2;
a9 = -2;

    rotate([0,0,-a1+a9])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("B", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("B", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,-a2+a9])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("L", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("L", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a9])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("A", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("A", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a2+a9])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("C", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("C", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a1+a9])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("K", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("K", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

}

//----------------------------------------------------------------------
module Metal(tsize = 60){

a1=25;
a2=12;
yoff = -r1*4.2;
a9 = 2;

    rotate([0,0,-a1+a9])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("M", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,-a2+a9])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("E", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a9])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("T", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a2+a9])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("A", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);

    rotate([0,0,a1+a9])
    translate([0,yoff,0])
    linear_extrude(height=thick)
    text("L", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);


}

//----------------------------------------------------------------------
module MetalRim(tsize = 60){

m1=8;
a1=25;
a2=12;
yoff = -r1*4.2;
a9 = 2;

    rotate([0,0,-a1+a9])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("M", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("M", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,-a2+a9])
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

    rotate([0,0,a9])
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

    rotate([0,0,a2+a9])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("A", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("A", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

    rotate([0,0,a1+a9])
    translate([0,yoff,0])
    difference(){
      minkowski(){
        linear_extrude(height=thick)
        text("L", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
        
        cylinder(r=m1,h=0.001,$fn=12,center=true);
      }
      
      translate([0,0,-1])
      linear_extrude(height=thick+2)
      text("L", font = "Open Sans:style=Bold", size=tsize,halign="center",valign="center",spacing=1.0);
    }

}


//=================================================================================

// Right rim
if(0){
  difference(){
    rim();
    Black();
    BlackRim();
  }
  BlackRim();
}

// Right palm
if(0){
  difference(){
    palm();
    Black();
    BlackRim();
  }
}

// Right palm upper
if(0){
  intersection(){
    difference(){
      palm();
      Black();
      BlackRim();
    }
    translate([-400,-400,thick/2])
    cube([800,800,thick/2]);
  }
}

// Right palm lower
if(1){
  intersection(){
    difference(){
      palm();
      Black();
      BlackRim();
    }
    translate([-400,-400,0])
    cube([800,800,thick/2]);
  }
}

// Right nails
if(0){
  nails();
}

// Right text
if(0){
  Black();
}

// Left rim
if(0){
  difference(){
    translate([400,0,0])
    mirror([1,0,0])
    rim();
    translate([400,0,0])
    Metal();
    translate([400,0,0])
    MetalRim();
  }
  translate([400,0,0])
  MetalRim();
}

// Left palm
if(0){
  difference(){
    translate([400,0,0])
    mirror([1,0,0])
    palm();
    translate([400,0,0])
    Metal();
    translate([400,0,0])
    MetalRim();
  }
}
// Left palm upper
if(0){
  intersection(){
    difference(){
      translate([400,0,0])
      mirror([1,0,0])
      palm();
      translate([400,0,0])
      Metal();
      translate([400,0,0])
      MetalRim();
    }
    translate([0,-400,thick/2])
    cube([800,800,thick/2]);
  }
}
// Left palm lower
if(1){
  intersection(){
    difference(){
      translate([400,0,0])
      mirror([1,0,0])
      palm();
      translate([400,0,0])
      Metal();
      translate([400,0,0])
      MetalRim();
    }
    translate([0,-400,0])
    cube([800,800,thick/2]);
  }
}


// Left nails
if(0){
  translate([400,0,0])
  mirror([1,0,0])
  nails();
}  

// Left text
if(0){
  translate([400,0,0])
  Metal();
}


//=================================================================================
