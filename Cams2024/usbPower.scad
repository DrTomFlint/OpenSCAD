//======================================================================
// usbPower.scad
//
// USB Wall Charger, iGENJUN 2.4A Phone Charger Dual USB Port Cube 
// Power Plug
//
// DrTomFlint, 19 Oct 2024
//======================================================================

rUsb=6.0;       // radius of corners
xUsb=31.2;
yUsb=32.7;  
zUsb=39;
F2=33;

//----------------------------------------------------------------------
module usbPower(plug=3){

  
  // main boss
  translate([0,0,xUsb/2])
  rotate([0,90,0])
  linear_extrude(height=zUsb,scale=0.96)
  offset(r=rUsb,$fn=F2)
  square([xUsb-2*rUsb,yUsb-2*rUsb],center=true);
  
  // ac plugs
  translate([-16.5/2,12.8/2,xUsb/2])
  cube([16.5,1.5,6.25],center=true);
  translate([-16.5/2,-12.8/2,xUsb/2])
  cube([16.5,1.5,6.25],center=true);

  // lower output 
  if(plug==1){
    hull(){
      translate([zUsb+0,5.25,10.5])
      rotate([0,90,0])
      cylinder(r=7.8/2,h=20,$fn=F2);
      translate([zUsb+0,-5.25,10.5])
      rotate([0,90,0])
      cylinder(r=7.8/2,h=20,$fn=F2);
    }
    
    translate([zUsb+20,0,10.5])
    rotate([0,90,0])
    cylinder(r=3.3,h=7,$fn=F2);
  }

  // upper output 
  if(plug==2){
    translate([zUsb+10,0,10.5+8.8])
    cube([20,16,7.75],center=true);
    translate([zUsb+20,0,10.5+8.8])
    rotate([0,90,0])
    cylinder(r=3.3,h=7,$fn=F2);
  }
  
  // both outputs
  if(plug==3){
    translate([zUsb+10,0,10.5])
    cube([20,16,8],center=true);
    translate([zUsb+20,0,10.5])
    rotate([0,90,0])
    cylinder(r=3.3,h=7,$fn=F2);
      
    translate([zUsb+10,0,10.5+8.8])
    cube([20,16,7.75],center=true);
    translate([zUsb+20,0,10.5+8.8])
    rotate([0,90,0])
    cylinder(r=3.3,h=7,$fn=F2);
  }
  
}
  

//======================================================================

usbPower();

//======================================================================
