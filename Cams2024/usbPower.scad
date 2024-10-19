//======================================================================
// usbPower.scad
//
// USB Wall Charger, iGENJUN 2.4A Phone Charger Dual USB Port Cube 
// Power Plug
//
// DrTomFlint, 19 Oct 2024
//======================================================================




//----------------------------------------------------------------------
module usbPower(plug=3){

r0=6.0;       // radius of corners
x0=30.0;
y0=32.0;  
z0=39;
F2=33;
  
  // main boss
  translate([0,0,x0/2])
  rotate([0,90,0])
  linear_extrude(height=z0)
  offset(r=r0,$fn=F2)
  square([x0-2*r0,y0-2*r0],center=true);
  
  // ac plugs
  translate([-16.5/2,12.8/2,x0/2])
  cube([16.5,1.5,6.25],center=true);
  translate([-16.5/2,-12.8/2,x0/2])
  cube([16.5,1.5,6.25],center=true);

  // lower output 
  if(plug==1){
    translate([z0+10,0,10.5])
    cube([20,16,8],center=true);
    translate([z0+20,0,10.5])
    rotate([0,90,0])
    cylinder(r=3.3,h=7,$fn=F2);
  }

  // upper output 
  if(plug==2){
    translate([z0+10,0,10.5+8.8])
    cube([20,16,7.75],center=true);
    translate([z0+20,0,10.5+8.8])
    rotate([0,90,0])
    cylinder(r=3.3,h=7,$fn=F2);
  }
  
  // both outputs
  if(plug==3){
    translate([z0+10,0,10.5])
    cube([20,16,8],center=true);
    translate([z0+20,0,10.5])
    rotate([0,90,0])
    cylinder(r=3.3,h=7,$fn=F2);
      
    translate([z0+10,0,10.5+8.8])
    cube([20,16,7.75],center=true);
    translate([z0+20,0,10.5+8.8])
    rotate([0,90,0])
    cylinder(r=3.3,h=7,$fn=F2);
  }
  
}
  

//======================================================================

usbPower();

//======================================================================
