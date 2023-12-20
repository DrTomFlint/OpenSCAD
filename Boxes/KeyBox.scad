//=================================================================================
// KeyBox.scad
// 
// Rooftop box for spare Vingilot key
//
// Dr Tom Flint, 19 Dec 2023
//=================================================================================


use <../Parts/rounder.scad>

thick = 1.5;

// box innner dimensions
x0=125;
y0=40;
z0=15;

// big magnet
x1=9;
y1=31;
z1=12;

// small magnet
x2=6;
y2=25;
z2=12;

r0=2;
r1=r0+thick;

tol=0.25;

//---------------------------------------------------------------------------------
module KeyBox(){

  difference(){
    translate([0,0,z0/2+thick])
    cube([x0+2*thick,y0+2*thick,z0+2*thick],center=true);
    // keyhole
    translate([-2,0,z0/2+2*thick])
    cube([100,40,z0+2*thick],center=true);
    // big magnet
    translate([x0/2-thick-x1/2,0,z1/2-0.1])
    cube([x1,y1,z1],center=true);
    // small magnet
    translate([-x0/2+thick+x2/2,0,z2/2-0.1])
    cube([x2,y2,z2],center=true);

    translate([-x0/2-thick,y0/2+thick,-1])
    rotate([0,0,-90])
    rounder(r=r0,h=z0+10,f=33);
    translate([-x0/2-thick,-y0/2-thick,-1])
    rotate([0,0,0])
    rounder(r=r0,h=z0+10,f=33);
    
    translate([x0/2+thick,y0/2+thick,-1])
    rotate([0,0,180])
    rounder(r=r0,h=z0+10,f=33);
    translate([x0/2+thick,-y0/2-thick,-1])
    rotate([0,0,90])
    rounder(r=r0,h=z0+10,f=33);
	}
}

//---------------------------------------------------------------------------------
module KeyLid(){

  difference(){
    translate([0,0,z0/2+1.5*thick])
    cube([x0+4*thick,y0+4*thick,z0+3*thick],center=true);
    // hole
    translate([0,0,z0/2+thick])
    cube([x0+2*thick+2*tol,y0+2*thick+2*tol,z0+2*thick+2*tol],center=true);

    translate([-x0/2-2*thick,y0/2+2*thick,-thick])
    rotate([0,0,-90])
    rounder(r=r1,h=z0+10,f=33);    
    translate([-x0/2-2*thick,-y0/2-2*thick,-thick])
    rotate([0,0,0])
    rounder(r=r1,h=z0+10,f=33);
    
    translate([x0/2+2*thick,y0/2+2*thick,-thick])
    rotate([0,0,180])
    rounder(r=r1,h=z0+10,f=33);
    translate([x0/2+2*thick,-y0/2-2*thick,-thick])
    rotate([0,0,90])
    rounder(r=r1,h=z0+10,f=33);

    translate([0,-2,z0+3*thick-0.3])
    linear_extrude(height=0.4,scale=1)
    text("Vingilot", font = "Open Sans:style=Bold", size=18,halign="center",valign="center",spacing=1.1);

	}
  
  // fillets inside
  translate([-x0/2-thick-tol,y0/2+thick+tol,0])
  rotate([0,0,-90])
  rounder(r=r0,h=z0+2*thick+tol,f=33);
  translate([-x0/2-thick-tol,-y0/2-thick-tol,0])
  rotate([0,0,0])
  rounder(r=r0,h=z0+2*thick+tol,f=33);
  
  translate([x0/2+thick+tol,y0/2+thick+tol,0])
  rotate([0,0,180])
  rounder(r=r0,h=z0+2*thick+tol,f=33);
  translate([x0/2+thick+tol,-y0/2-thick-tol,0])
  rotate([0,0,90])
  rounder(r=r0,h=z0+2*thick+tol,f=33);

}


//=================================================================================

xcut=100;
ycut=0;
zcut=-30;

difference(){
  union(){
    color("cyan")
    //~ KeyBox();
    KeyLid();
  }
  translate([xcut-100,ycut-50,zcut-25])
  cube([200,100,50],center=true);
}

//=================================================================================



