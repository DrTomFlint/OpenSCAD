//======================================================================
// MountainCoin5.scad
//
// Coin size Mountain Sun Logo with no text
//
// DrTomFlint 24 March 2023
//
//======================================================================


use <./mcBlue5.scad>
use <./mcGreen5.scad>
use <./mcYellow5.scad>
use <./mcOrange5.scad>

ss=50;
thick=1.5;

F1=99;
F2=77;

//----------------------------------------------------------------------
module blue(){

	intersection(){
		scale([ss,ss,thick])
		mcBlue5();
		
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module green(){

	intersection(){
		scale([ss,ss,thick])
		mcGreen5();
		
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}


//----------------------------------------------------------------------
module orange(){

	intersection(){
		scale([ss,ss,thick])
		mcOrange5();
		
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module yellow(){

	intersection(){
		scale([ss,ss,thick])
		mcYellow5();
		
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
				mcYellow5();
				mcOrange5();
				mcBlue5();
				mcGreen5();
			}
		}
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//======================================================================

//blue();
//green();
//orange();
//yellow();

black();

//======================================================================
