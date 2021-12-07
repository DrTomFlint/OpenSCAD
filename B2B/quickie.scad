//====================================================
// quickie.scad
// parts for the quick connects on coolant loop
//
// Dr Tom Flint, 2 March 2021
//====================================================

use <../Parts/threads.scad>


//--------------------------------------------------------
module quickie(tol=0,nut=6){

rotate([0,-90,0]){
    // outer flange with o-ring
    translate([0,0,-8.5-13])
    cylinder(r=22/2,h=13);
    translate([0,0,-8.5])
    cylinder(r=33/2,h=8.5);
    cylinder(r=8,h=12.5);
    translate([0,0,12.5])
    cylinder(r=7.5/2,h=16.5);    
    
    translate([0,0,-15])
    rotate([0,90,0])
    scale([1,1.5,1])
    cylinder(r=6,h=16.5);  
    
    if(nut>0){
	translate([0,0,nut])
	cylinder(r=23.7/2,h=5.2,$fn=6);    
    }  
}
    
}

//--------------------------------------------------------
module flangeIn(){
  
  difference(){
    cylinder(r=13,h=3,$fn=8);
 
    translate([0,0,-0.1])
    #english_thread (diameter=11/16, threads_per_inch=24, length=1/4,
                    internal=true, n_starts=1, thread_size=-1, groove=false,
                    square=false, rectangle=0, angle=30, taper=0, leadin=0,
                    leadfac=1.0, test=false);
}

}

//--------------------------------------------------------

module flangeOut(){
  
  difference(){
    union(){
//        translate([0,0,-6])
//        cylinder(r=15.5,h=3,$fn=89);
        translate([0,0,-4])
        cylinder(r=16.5,h=4,$fn=8);
     }
    translate([0,0,-6.1])
    english_thread (diameter=11/16+0.005, threads_per_inch=24, length=0.6,
                    internal=true, n_starts=1, thread_size=-1, groove=false,
                    square=false, rectangle=0, angle=30, taper=0, leadin=0,
                    leadfac=1.0, test=false);

	// alternate cut method for O ring 
	translate([0,0,0.6-2.45])
	rotate_extrude($fn=99){
		translate([28/2-3.8+0.6,0])
		offset(r=0.6,$fn=44)
		square([3.80-1.2,2.45-1.2+1]);
	}


}

}



//====================================================

//flangeIn();
//flangeOut();
//quickie();

if(1){
difference(){
flangeOut();
	translate([0,-20,0])
	cube([40,40,30],center=true);
}
}

//====================================================


