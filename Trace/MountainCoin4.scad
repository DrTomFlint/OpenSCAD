//======================================================================
// MountainCoin.scad
//
// Coin size Mountain Sun Logo with no text
//
// DrTomFlint 13 March 2023
//
//======================================================================


use <./mcBlue4.scad>
use <./mcGreen4.scad>
use <./mcYellow4.scad>
use <./mcOrange4.scad>

ss=50;
thick=1.5;

F1=99;
F2=77;

//----------------------------------------------------------------------
module blue(){

	intersection(){
		scale([ss,ss,thick])
		mcBlue4();
		
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module green(){

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
		mcOrange4();
		
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module yellow(){

	intersection(){
		scale([ss,ss,thick])
		mcYellow4();
		
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
				mcYellow4();
				mcOrange4();
				mcBlue4();
				mcGreen4();
			}
		}
		cylinder(r=ss/2,h=3*thick,$fn=F2,center=true);
	}
}

//======================================================================

//blue();
//green();
//orange();
yellow();

//black();

//======================================================================
