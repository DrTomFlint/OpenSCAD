//======================================================================
// StoutNew.scad
//
// Update Mountain Sun Earrings for Stout Month
//
// DrTomFlint 24 Jan 2025
//
//======================================================================


use <./StoutNewBlack.scad>
use <./StoutNewGreen.scad>
use <./StoutNewYellow.scad>
use <./StoutNewWhite.scad>
use <./StoutNewGrey.scad>

ss=50;
thick=1.2;

F1=99;
F2=77;

//----------------------------------------------------------------------
module black(){

	intersection(){
    translate([0,-0.5,0])
		scale([ss,ss,thick])
		StoutNewBlack();
		
		cylinder(r=ss/2-2,h=3*thick,$fn=F2,center=true);
	}
  
  // hanger
  rotate([0,0,0])
  difference(){
    hull(){
      translate([0,ss/2-1,thick/2])
      cylinder(r=2,h=thick,$fn=F2,center=true);
      translate([-1,ss/7,thick/2])
      cylinder(r=ss/2-4-5,h=thick,$fn=F2,center=true);
    }
    translate([-1,0,thick/2])    
    cylinder(r=ss/2-3,h=3*thick,$fn=F2,center=true);
    
    translate([0,ss/2+-1,thick/2])
    cylinder(r=1,h=3*thick,$fn=F2,center=true);
  }
  
}

//----------------------------------------------------------------------
module green(){

	intersection(){
    translate([0,-0.5,0])
		scale([ss,ss,thick])
		StoutNewGreen();
		
		cylinder(r=ss/2-2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module yellow(){

	intersection(){
    translate([0,-0.5,0])
		scale([ss,ss,thick])
		StoutNewYellow();
		
		cylinder(r=ss/2-2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module white(){

	intersection(){
    translate([0,-0.5,0])
		scale([ss,ss,thick])
		StoutNewWhite();
		
		cylinder(r=ss/2-2,h=3*thick,$fn=F2,center=true);
	}
}

//----------------------------------------------------------------------
module grey(){

	intersection(){
    translate([0,-0.5,0])
		scale([ss,ss,thick])
		StoutNewGrey();
		
		cylinder(r=ss/2-2,h=3*thick,$fn=F2,center=true);
	}
}

//======================================================================

black();
//~ green();
//~ yellow();
//~ white();
//~ grey();


//======================================================================
