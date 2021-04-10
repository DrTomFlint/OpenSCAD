//=================================================================================
// wireplugs.scad
// Wire pass through plugs for the desktop calorimeter 
//
// Dr Tom Flint, 9 April 2021
//=================================================================================


use <../Parts/tslot.scad>
use <../Parts/rounder.scad>
use <../Parts/threads.scad>


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
		metric_thread (diameter=r0*2, pitch=1, length=10, leadin=1);
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
		metric_thread (diameter=r0*2, pitch=1, length=10, leadin=1);
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
	metric_thread (diameter=r0*2.025, pitch=1, length=10, leadin=1, internal=true);
	
	for(i=[0:5]){
		rotate([0,0,60*i])
		translate([d2,0,5])
		cylinder(r=8,h=10,$fn=201);
	}

}

}

//=================================================================================

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
plug3x12b();
//top3x12();


//=================================================================================


