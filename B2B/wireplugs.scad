//=================================================================================
// wireplugs.scad
// Wire pass through plugs for the desktop calorimeter 
//
// Dr Tom Flint, 9 April 2021
//=================================================================================


use <../Parts/tslot.scad>
use <../Parts/rounder.scad>
use <../Parts/threads.scad>

F1=33;

//----------------------------------------------------------------------------------
module plug3x12(){

d1=4;		// distance from center of plug to center of any wire
r0=15.875/2;	// radius of the plug body, match the 5/8" step bit
zlip=5;

difference(){
	union(){
		// upper
		cylinder(r=r0,h=1,$fn=201);
		// lower lip
		translate([0,0,-zlip])
		cylinder(r1=r0+7,r2=r0+8,h=zlip,$fn=201);
		
		// add theads
		metric_thread (diameter=r0*2, pitch=1, length=10, leadin=1, internal=false);
	}
	
	// cuts for the wires
	for(i=[0:2]){
		rotate([0,0,120*i])
		translate([d1,0,0])
		cylinder(r=4.9/2,h=30,$fn=201,center=true);
	}
		
/*		
	// cut for O ring
	translate([0,0,-2.45])
	difference(){
		cylinder(r=26.5/2,h=3,$fn=201);
		cylinder(r=26.5/2-3.8,h=3,$fn=201);
	}
*/
	
	// alternate cut method for O ring 
	translate([0,0,0.6-2.45])
	rotate_extrude($fn=99){
		translate([26.5/2-3.8+0.6,0])
		offset(r=0.6,$fn=44)
		square([3.80-1.2,2.45-1.2+1]);
	}
}	

}

//----------------------------------------------------------------------------------
// Add 2x 18-Gauge smaller wires
module plug3x12b(){

d1=4;		// distance from center of plug to center of any wire
d3=5.0;		// distance from center of plug to center of any wire
r0=15.875/2;	// radius of the plug body, match the 5/8" step bit
zlip=5;

difference(){
	union(){
		// upper
		cylinder(r=r0,h=1,$fn=201);
		// lower lip
		translate([0,0,-zlip])
		cylinder(r1=r0+7,r2=r0+8,h=zlip,$fn=201);
		
		// add theads
		metric_thread (diameter=r0*2, pitch=1, length=10, leadin=1, internal=false);
	}
	
	// cuts for the wires 12 Ga, 4.4 mm diam
	for(i=[0:2]){
		rotate([0,0,120*i])
		translate([d1,0,0])
		cylinder(r=4.9/2,h=30,$fn=201,center=true);
	}

	// cuts for the wires 18 Ga, 2.3 mm diam
	for(i=[0:1]){
		rotate([0,0,120*i+60])
		translate([d3,0,0])
		cylinder(r=2.8/2,h=30,$fn=201,center=true);
	}
		
	// alternate cut method for O ring, metric 211
	translate([0,0,0.6-2.45])
	rotate_extrude($fn=99){
		translate([26.5/2-3.8+0.6,0])
		offset(r=0.6,$fn=44)
		square([3.80-1.2,2.45-1.2+1]);
	}
}	

}

//----------------------------------------------------------------------------------
module top3x12(){

d1=4;		// distance from center of plug to center of any wire
r0=15.875/2;	// radius of the plug body
zlip=5;
d2=18;	// distance center to finger cuts

difference(){
	union(){
		translate([0,0,2])
		cylinder(r1=r0+7,r2=r0+6,h=7,$fn=201);		
//		translate([0,0,2+7])
//		cylinder(r1=r0+7,r2=r0+6,h=1,$fn=201);		
	}
//	metric_thread (diameter=r0*2.025, pitch=1, length=10, leadin=1, internal=true);
		metric_thread (diameter=r0*2+0.3, pitch=1, length=10, leadin=3, internal=true);
	
	for(i=[0:5]){
		rotate([0,0,60*i])
		translate([d2,0,5])
		cylinder(r=8,h=10,$fn=201);
	}

}

}
//----------------------------------------------------------------------------------
// split body to allow insertion of cable without cutting connectors off ends
module plugUSBa(){

d1=4;		// distance from center of plug to center of any wire
r0=15.875/2;	// radius of the plug body, match the 5/8" step bit
zlip=5;

difference(){
	union(){
		// upper
		//cylinder(r=r0,h=1,$fn=201);
		// lower lip
		translate([0,0,-zlip])
		cylinder(r1=r0+7,r2=r0+8,h=zlip,$fn=201);
		
	}
	
	// copy thread cut from the top part
	translate([0,0,-8])
	metric_thread (diameter=r0*2.025, pitch=1, length=10, leadin=1, internal=true);
//		cylinder (r=r0*2.025/2, h=10,$fn=55);

			
	// alternate cut method for O ring 
	translate([0,0,0.6-2.45])
	rotate_extrude($fn=99){
		translate([26.5/2-3.8+0.6,0])
		offset(r=0.6,$fn=44)
		square([3.80-1.2,2.45-1.2+1]);
	}
}	

}

//----------------------------------------------------------------------------------
// split body to allow insertion of cable without cutting connectors off ends
module plugUSBb(part=0){

d1=4;		// distance from center of plug to center of any wire
r0=15.875/2;	// radius of the plug body, match the 5/8" step bit
zlip=5;

difference(){
		// add theads
		metric_thread (diameter=r0*2, pitch=1, length=10, leadin=1);
//		cylinder (r=r0, h=10,$fn=55);
	
	// cut for the wire
	cylinder(r=4.25/2,h=30,$fn=201,center=true);
	
	// slice in half for assembly
	if(part==1){
		translate([0,-10,-1])
		cube([20,20,20]);
	}		
	if(part==2){
		translate([-20+0.1,-10,-1])
		cube([20,20,20]);
	}
	// try just a cut leaving a live hinge
	if(part==3){
		translate([-10+2.5,0,-1])
		cube([20,0.1,20]);
	}
}	

}

//----------------------------------------------------------------------------------
// split body to allow insertion of cable without cutting connectors off ends
// add encoder wires
module plugUSBc(){

d1=4;		// distance from center of plug to center of any wire
r0=15.875/2;	// radius of the plug body, match the 5/8" step bit
zlip=5;
d3=5.0;


difference(){
		// add theads
		translate([0,0,-5])
		metric_thread (diameter=r0*2, pitch=1, length=10+5, leadin=1);
//		cylinder (r=r0, h=10+5,$fn=55);
	
	// cut for the wire
	cylinder(r=4.25/2,h=30,$fn=201,center=true);
	
	// cuts for the wires 18 Ga, 2.3 mm diam
	for(i=[0:5]){
		rotate([0,0,60*i+30])
		translate([d3,0,0])
		cylinder(r=2.8/2,h=30,$fn=201,center=true);
	}

	// try just a cut leaving a live hinge
	translate([-10+3,-0.2,-9])
	cube([20,0.4,20]);
	translate([-10+3,0,0])
	cylinder(r=0.4,h=30,center=true,$fn=22);
}	

}

//----------------------------------------------------------------------------------
module plugTube(){

d1=4;		// distance from center of plug to center of any wire
r0=15.875/2;	// radius for threads to match wireplugs
r0b=17.46/2;	// radius of upper lip, leave threads to match wireplugs
zlip=5;

// here is the cut used with the quickie plugs to match the thread
//    english_thread (diameter=11/16+0.005, threads_per_inch=24, length=0.6,
//                    internal=true, n_starts=1, thread_size=-1, groove=false,
//                    square=false, rectangle=0, angle=30, taper=0, leadin=0,
//                    leadfac=1.0, test=false);
//
// 11/16 inch = 0.6875 inch = 17.46 mm, slightly larger than the wire plugs.

difference(){
	union(){
		// upper
		cylinder(r=r0b,h=1.5,$fn=201);
		// lower lip
		translate([0,0,-zlip])
		cylinder(r1=r0+7,r2=r0+8,h=zlip,$fn=201);
		
		// add theads
		// TF TEST reduced diameter of the threads by 0.2
		metric_thread (diameter=r0*2-0.2, pitch=1, length=10, leadin=1);
//		cylinder(r=r0, h=10, $fn=67);
	}
	
	// cut for the tubing
	cylinder(r=9.5/2,h=30,$fn=201,center=true);
			
	// alternate cut method for O ring 
	translate([0,0,0.6-2.45])
	rotate_extrude($fn=99){
		translate([26.5/2-3.8+0.6,0])
		offset(r=0.6,$fn=44)
		square([3.80-1.2,2.45-1.2+1]);
	}
}	

}

//-----------------------------------------------------------------------------
module plugBattery(){
  
  rwire=4.3/2+0.1;
  rhole=6.3/2-0.1;
  z1=1.2;
  z2=3.6/2;
  wide=2;
  taper=0.2;
  
  difference(){
    union(){
      translate([0,0.1,0])
      cylinder(r1=rhole,r2=rhole-taper,h=z2,$fn=F1);
      translate([17.2,0,0])
      cylinder(r1=rhole,r2=rhole-taper,h=z2,$fn=F1);
      translate([-20,0,0])
      cylinder(r1=rhole,r2=rhole-taper,h=z2,$fn=F1);

      translate([0,0.1,z2])
      cylinder(r1=rhole,r2=rhole+taper,h=z2/2,$fn=F1);
      translate([17.2,0,z2])
      cylinder(r1=rhole,r2=rhole+taper,h=z2/2,$fn=F1);
      translate([-20,0,z2])
      cylinder(r1=rhole,r2=rhole+taper,h=z2/2,$fn=F1);

      translate([0,0.1,1.5*z2])
      cylinder(r2=rhole,r1=rhole+taper,h=z2/2,$fn=F1);
      translate([17.2,0,1.5*z2])
      cylinder(r2=rhole,r1=rhole+taper,h=z2/2,$fn=F1);
      translate([-20,0,1.5*z2])
      cylinder(r2=rhole,r1=rhole+taper,h=z2/2,$fn=F1);

      hull(){
        translate([17.2,0,-z1])
        cylinder(r=rhole+wide,h=z1,$fn=F1);
        translate([-20,0,-z1])
        cylinder(r=rhole+wide,h=z1,$fn=F1);
      }
    }
    // wire cuts
    translate([0,0.1,0])
    translate([0,0,-2])
    cylinder(r1=rwire+0.1,r2=rwire,h=2*z2+10,$fn=F1);
    translate([17.2,0,-2])
    cylinder(r1=rwire+0.1,r2=rwire,h=2*z2+10,$fn=F1);
    translate([-20,0,-2])
    cylinder(r1=rwire+0.1,r2=rwire,h=2*z2+10,$fn=F1);
    
    // slice a flat side
    translate([-30,rhole-0.2,-4])
    cube([60,4,2*z2+10]);
    translate([-30,-rhole-4.5,-4])
    cube([60,4,2*z2+10]);

    // strain relief
    translate([0,0,z2+1])
    cube([0.4,12,2*z2+0.1],center=true);
    translate([17.2,0,z2+1])
    cube([0.4,12,2*z2+0.1],center=true);
    translate([-20,0,z2+1])
    cube([0.4,12,2*z2+0.1],center=true);
  }    
}
  

//=================================================================================

plugBattery();

if(0){
difference(){
	plug3x12();
	translate([0,-20,0])
	cube([40,40,30],center=true);
}
}

if(0){
difference(){
	top3x12();
	translate([0,-20,0])
	cube([40,40,30],center=true);
}
}

//plug3x12();
//plug3x12b();
//top3x12();
//plugUSBa();

//translate([0,0,20])
//plugUSBb(part=1);
//color("cyan")
//plugUSBb(part=3);
//plugUSBc();

//plugTube();

//=================================================================================


