//======================================================================
// StoutEars.scad
//
// Update Mountain Sun Earrings for Stout Month
//
// DrTomFlint 23 Jan 2025
//
//======================================================================


use <./mcBlue.scad>
use <./mcGreen.scad>
use <./mcGreen2.scad>
use <./mcGreen3.scad>
use <./mcGreen4.scad>
use <./mcYellow.scad>
use <./mcOrange.scad>

ss=50;
thick=1.2;

F1=99;
F2=77;

//----------------------------------------------------------------------
module blue(){

	intersection(){
		scale([ss,ss,thick])
		mcBlue();
		
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module green(){

	intersection(){
		scale([ss,ss,thick])
		mcGreen();
		
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module green2(){

	intersection(){
		scale([ss,ss,thick])
		mcGreen2();
		
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module green3(){

	intersection(){
		scale([ss,ss,thick])
		mcGreen3();
		
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module green4(){

	intersection(){
		scale([ss,ss,thick])
		mcGreen4();
		
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module orange(){

	intersection(){
		scale([ss,ss,thick])
		mcOrange();
		
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module yellow(){

	intersection(){
		scale([ss,ss,thick])
		mcYellow();
		
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module black(){

	intersection(){
		difference(){
			translate([0,0.5,0])
			cylinder(r=ss/2,h=thick,$fn=F1);
			translate([0,0,-thick])
			scale([ss,ss,3*thick]){
				mcYellow();
				mcOrange();
				mcBlue();
				mcGreen();
			}
		}
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module black2(){

	intersection(){
		difference(){
			translate([0,0.5,0])
			cylinder(r=ss/2,h=thick,$fn=F1);
			translate([0,0,-thick])
			scale([ss,ss,3*thick]){
				mcYellow();
				mcOrange();
				mcBlue();
				mcGreen2();
			}
		}
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module black3(){

	intersection(){
		difference(){
			translate([0,0.5,0])
			cylinder(r=ss/2,h=thick,$fn=F1);
			translate([0,0,-thick])
			scale([ss,ss,3*thick]){
				mcYellow();
				mcOrange();
				mcBlue();
				mcGreen3();
			}
		}
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}
//----------------------------------------------------------------------
module black4(){

	intersection(){
		difference(){
			translate([0,0.5,0])
			cylinder(r=ss/2,h=thick,$fn=F1);
			translate([0,0,-thick])
			scale([ss,ss,3*thick]){
				mcYellow();
				mcOrange();
				mcBlue();
				mcGreen3();
			}
		}
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
  // hanger
  rotate([0,0,2])
  difference(){
    hull(){
      translate([0,ss/2+1,thick/2])
      cylinder(r=2,h=thick,$fn=F2,center=true);
      translate([0,0,thick/2])
      cylinder(r=ss/2-1,h=thick,$fn=F2,center=true);
    }
    cylinder(r=ss/2-0.5,h=3*thick,$fn=F2,center=true);
    translate([0,ss/2+1.1,thick/2])
    cylinder(r=1,h=3*thick,$fn=F2,center=true);
  }
}

//----------------------------------------------------------------------
module black5(){

	intersection(){
		difference(){
			translate([0,0.5,0])
			cylinder(r=ss/2,h=thick,$fn=F1);
			translate([0,0,-thick])
			scale([ss,ss,3*thick]){
				mcYellow();
				mcOrange();
				mcBlue();
				mcGreen4();
			}
		}
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
  // hanger
  rotate([0,0,2])
  difference(){
    hull(){
      translate([0,ss/2+1,thick/2])
      cylinder(r=2,h=thick,$fn=F2,center=true);
      translate([0,0,thick/2])
      cylinder(r=ss/2-1,h=thick,$fn=F2,center=true);
    }
    cylinder(r=ss/2-0.5,h=3*thick,$fn=F2,center=true);
    translate([0,ss/2+1.1,thick/2])
    cylinder(r=1,h=3*thick,$fn=F2,center=true);
  }
}

//======================================================================

//~ blue();
//~ green3();
//~ green4();
//~ orange();
//~ yellow();

//~ black4();
black5();

//======================================================================
