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

z0=55;		// height of binoc mounting hole

if(1){
	// foot
	difference(){
		linear_extrude(height=4,scale=0.95)
		offset(r=2,$fn=44)
		square([40-4,60-4],center=true);

		// try a threaded hole for the metal insert
		translate([0,-10,-1])
		english_thread (diameter=1/4, threads_per_inch=20, length=0.20, internal=true);

		// inset for washer
		translate([0,-10,3])
		cylinder(r=8,h=2,$fn=77);
		
		// dent for extra post on fluid head
		translate([0,30,-1])
		cylinder(r1=3,r2=4,h=6,$fn=44);
		

	}
}

	// post
	difference(){
		hull(){
			translate([0,20,z0])
			rotate([90,0,0])
			cylinder(r=9,h=4,$fn=88);

			translate([0,20-2,2])
			cube([36,4,2],center=true);
		}

		// hole for thumbscrew
		translate([0,20+1,z0])
		rotate([90,0,0])
		cylinder(r=3.1,h=6,$fn=88);
	}

	// surround the brass nut on the binocs
	color("cyan")
	difference(){
		translate([0,20,z0])
		rotate([90,0,0])
		cylinder(r=12,h=7,$fn=88);

		translate([0,20-3,z0])
		rotate([90,0,0])
		cylinder(r=8,h=5,$fn=88);
		// hole for thumbscrew
		translate([0,20+1,z0])
		rotate([90,0,0])
		cylinder(r=3.1,h=6,$fn=88);
	}

	color("pink")
	difference(){
		union(){			
			hull(){
				translate([16,28,3])
				rotate([90,0,0])
				cylinder(r=2,h=12,$fn=55);
				
				translate([9.2,20+2,z0-12])
				rotate([90,0,0])
				cylinder(r=2,h=6,$fn=55);
			}
			hull(){
				translate([-16,28,3])
				rotate([90,0,0])
				cylinder(r=2,h=12,$fn=55);

				translate([-9.2,20+2,z0-12])
				rotate([90,0,0])
				cylinder(r=2,h=6,$fn=55);
			}
			hull(){
				translate([0,19,3])
				rotate([90,0,0])
				cylinder(r=2,h=20,$fn=55);

				translate([0,19,z0-12])
				rotate([90,0,0])
				cylinder(r=2,h=6,$fn=55);
			}
		}	
		
		// cut away back side
		translate([0,-7,44])
		rotate([0,-90,0])
		scale([2,1,1,])
		cylinder(r=20,h=50,$fn=200,center=true);
	}


if(1){
	
	// fillets
	translate([33/2,20,4])
	rotate([0,-90,0])
	rounder(r=6,h=33,f=44);

	translate([33/2,20-4,4])
	rotate([0,-90,0])
	rotate([0,0,-90])
	rounder(r=9,h=33,f=44);
}


      color("red")
      translate([0,19.9,26])
      rotate([0,0,180])
			rotate([90,0,0])
      rotate([0,0,-90])
      linear_extrude(height=0.6,scale=1)
      text("FLINT", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);


}
//===================================================================

binoc();

//===================================================================

