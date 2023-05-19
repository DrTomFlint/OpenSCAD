//======================================================================
// MountainCoin.scad
//
// Coin size Mountain Sun Logo with no text
//
// DrTomFlint 13 March 2023
//
//======================================================================


use <./mcBlue.scad>
use <./mcGreen.scad>
use <./mcGreen2.scad>
use <./mcGreen3.scad>
use <./mcYellow.scad>
use <./mcOrange.scad>

ss=50;
thick=1.5;

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

//======================================================================

//blue();
//green();
//green2();
green3();
//orange();
//yellow();

//black3();
//black2();
//black();

//======================================================================
