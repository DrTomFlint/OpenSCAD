//=================================================================================
// binoc.scad
//
// L bracket for mounting binoculars to tripod
// Camera thread standards Small = 1/4-20,  large = 3/8-16
//
// Dr Tom Flint, 23 Dec 2020
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>

//-------------------------------------------------------
module binoc(){

z0=65;		// height of binoc mounting hole
y0=-8;

if(1){
	// foot
	difference(){
		union(){
			linear_extrude(height=5,scale=0.95)
			offset(r=4,$fn=44)
			square([40-8,60-8],center=true);

			translate([0,13,5])
			cylinder(r1=12,r2=11,h=2,$fn=88);
		}
		// try a threaded hole for the metal insert
		translate([0,13,-1])
		english_thread (diameter=3/8, threads_per_inch=16, length=0.40, internal=true);

		translate([0,13,6])
		cylinder(r=8,h=2,$fn=88);

	}
}

	// post
	difference(){
		union(){
			hull(){
				translate([0,y0,z0])
				rotate([90,0,0])
				cylinder(r=9,h=7,$fn=88);

				translate([0,y0-3.5,2])
				cube([36,7,2],center=true);
			}
			
			translate([0,y0,z0])
			rotate([90,0,0])
			cylinder(r=12,h=7,$fn=88);
		}

		// hole for thumbscrew
		translate([0,y0+1,z0])
		rotate([90,0,0])
		cylinder(r=3.1,h=6,$fn=88);

		translate([0,y0-3,z0])
		rotate([90,0,0])
		cylinder(r=8,h=5,$fn=88);
		
	}

	// three I beams
	color("pink")
	difference(){
		union(){			
			hull(){
				translate([16,y0+8,3])
				rotate([90,0,0])
				cylinder(r=2,h=12,$fn=55);
				
				translate([8.9,y0+2,z0-13])
				rotate([90,0,0])
				cylinder(r=2,h=6,$fn=55);
			}
			hull(){
				translate([-16,y0+8,3])
				rotate([90,0,0])
				cylinder(r=2,h=12,$fn=55);

				translate([-8.9,y0+2,z0-13])
				rotate([90,0,0])
				cylinder(r=2,h=6,$fn=55);
			}
			hull(){
				translate([0,y0-10,6])
				cube([10,16,2],center=true);

				translate([0,y0-6,z0-14])
				rotate([90,0,0])
				cylinder(r=2,h=6,$fn=55);
			}
		}	
		
		// cut away back side
		translate([0,y0-27.5,50])
		rotate([0,-90,0])
		scale([2.5,1,1,])
		cylinder(r=20,h=50,$fn=200,center=true);
	}


if(1){
	
	// fillets
	translate([33/2,y0,4])
	rotate([0,-90,0])
	rounder(r=9,h=33,f=44);

	translate([33/2,y0-7,4])
	rotate([0,-90,0])
	rotate([0,0,-90])
	rounder(r=9,h=33,f=44);
}


      color("red")
      translate([0,y0-0.1,33])
      rotate([0,0,180])
			rotate([90,0,0])
      rotate([0,0,-90])
      linear_extrude(height=0.6,scale=1)
      text("FLINT", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);


}
//===================================================================

binoc();

//===================================================================

