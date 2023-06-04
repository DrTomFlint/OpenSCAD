//=================================================================================
// BootStrap1.scad
//
//
// Dr Tom Flint, 30 May 2023
//=================================================================================

s0 = 20;  // side before offset
r0 = 3;   // radius of offset
t0 = 10;   // size of text
z0 = 1.5; // thickness

//----------------------------------------------------------------------------------
module bsBack(){
  
  difference(){
    linear_extrude(height = z0)
    offset(r=r0,$fn=89)
    square([s0,s0],center=true);
    
    translate([0,0,-1])
    scale([1,1.8,1])
    linear_extrude(height = z0+2)
    text("BS", font = "Open Sans:style=Bold", size=t0,halign="center",valign="center",spacing=1.1);
  }
}

//----------------------------------------------------------------------------------
module bsRim(){
  difference(){
    linear_extrude(height = z0)
    offset(r=1.5*r0,$fn=89)
    square([s0,s0],center=true);

    linear_extrude(height = z0)
    offset(r=r0,$fn=89)
    square([s0,s0],center=true);
  }
}


//----------------------------------------------------------------------------------
module bsRim2(){
  difference(){
    linear_extrude(height = z0)
    offset(r=1.5*r0,$fn=89)
    square([s0,s0],center=true);

    linear_extrude(height = z0)
    offset(r=r0,$fn=89)
    square([s0,s0],center=true);
  }

  translate([-s0/2-1.2*r0,s0/2+1.2*r0,0])
  difference(){
    cylinder(r=r0/2,h=z0,$fn=99);
    cylinder(r=0.4,h=5*z0,center=true,$fn=99);
  }

}

//----------------------------------------------------------------------------------
module bsText(){
    
    scale([1,1.8,1])
    linear_extrude(height = z0)
    text("BS", font = "Open Sans:style=Bold", size=t0,halign="center",valign="center",spacing=1.1);

}
//==================================================================================

//bsBack();
//bsRim();
//bsText();
bsRim2();

//==================================================================================
