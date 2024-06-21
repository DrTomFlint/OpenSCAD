//======================================================================
// FiberOpticCable.scad
//
// Plug for passing cable through wall.
// Hangers and minimum radius supports.
//
// DrTomFlint 31 May 2024
//
//======================================================================

use <../Parts/rounder.scad>

//----------------------------------------------------------------------
module plug1(){

	difference(){
		// main body
		cylinder(r1=12,r2=5.0,h=25.4,$fn=88);
		// bore for fiber optic cable
		cylinder(r=1.5,h=70,center=true,$fn=22);
		// slot for inserting cable
		translate([-0.25,0,-1])
		cube([0.5,30,30]);
	}
	
}

//----------------------------------------------------------------------
module hang1(){
wide=26;
thick=1.2;
gap=7;

// gap
difference(){
  cube([wide,thick,gap]);
  translate([22,-1,-10])
  cube([10,8*thick,30]);
}

// staple attachment
difference(){
  translate([0,2.2*thick,-0.5])
  rotate([20,0,0])
  difference(){
    translate([-(26-wide)/2,0,gap])
    cube([26,7*thick,10]);
    translate([-(24-wide)/2,4*thick,gap])
    cube([24,7*thick,10-thick]);
    translate([(wide-10)/2,3*thick,gap+4])
    rotate([90,0,0])
    cylinder(r=1.2,h=10,center=true,$fn=33);
    translate([(wide-10)/2+10,3*thick,gap+4])
    rotate([90,0,0])
    cylinder(r=1.2,h=10,center=true,$fn=33);
  }
  translate([-2,-3*thick,gap-2])
  cube([34,3*thick,15]);
  translate([22,-1,-10])
  cube([10,8*thick,30]);
}

// fiber clip
difference(){
  translate([0,thick+1.5,0])
  rotate([0,90,0])
  cylinder(r=1.5+thick,h=wide,$fn=33);
  translate([0,thick+1.5,0])
  rotate([0,90,0])
  cylinder(r=1.5,h=wide,$fn=33);

  translate([0,thick,0])
  cube([wide,2*thick,5]);
  translate([22,-1,-10])
  cube([10,8*thick,30]);
}



}
//----------------------------------------------------------------------
module hang2(){

gap=7;
wide=26;
thick=2.1;
rmin=50;
off=32;

    translate([-off,-off,0])
    rounder(r=10,h=3+thick,f=66);

  difference(){
    cylinder(r=rmin+thick+1,h=3+thick,$fn=200);
    translate([-off,-off,-1])
    cube([100,100,10]);
    
    translate([0,0,thick+2])
    rotate_extrude($fn=99){
      translate([rmin,0])
      circle(r=1.7,$fn=33);
    }

    translate([0.7*rmin,-0.75*rmin,thick+2])
    rotate([0,0,39])
    cube([25,6,4],center=true);

    translate([-0.75*rmin,0.7*rmin,thick+2])
    rotate([0,0,39])
    cube([25,6,4],center=true);

// cut text for Version
  translate ([-rmin*0.25,-rmin*0.75,3+thick-0.6]) color("red") 
  linear_extrude(height=0.6)
  text("2024", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

  translate ([-rmin*0.75,-rmin*0.25,3+thick-0.6]) color("red") 
  rotate([0,0,-90])
  linear_extrude(height=0.6)
  text("FLINT", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

  }

  // tabs for stapler
  translate([0,-off,22])
  rotate([180,0,0])
  staple();

  translate([-off,25,22])
  rotate([0,0,-90])
  rotate([180,0,0])
  staple();


}

//----------------------------------------------------------------------
module staple(){
wide=26;
thick=1.2;
gap=7;
  
// staple attachment
difference(){
  translate([0,0,0])
  //~ translate([0,2.2*thick,-0.5])
  //~ rotate([20,0,0])
  difference(){
    translate([-(26-wide)/2,0,gap])
    cube([26,7*thick,10]);
    translate([-(24-wide)/2,4*thick,gap])
    cube([24,7*thick,10-thick]);
    translate([(wide-10)/2,3*thick,gap+4])
    rotate([90,0,0])
    cylinder(r=1.2,h=10,center=true,$fn=33);
    translate([(wide-10)/2+10,3*thick,gap+4])
    rotate([90,0,0])
    cylinder(r=1.2,h=10,center=true,$fn=33);
  }
  translate([-2,-3*thick,gap-2])
  cube([34,3*thick,15]);
  translate([22,-1,-10])
  cube([10,8*thick,30]);
}

}

//----------------------------------------------------------------------
module hang3(){

gap=7;
wide=26;
thick=2.1;
rmin=50;
off=32;

  difference(){
    hull(){
      translate([-rmin-3,-rmin-3,0])
      cube([20,20,3+thick]);
      cylinder(r=rmin+thick+1,h=3+thick,$fn=200);
    }
    cylinder(r=rmin-6,h=3+thick,$fn=200);

    translate([-100,0,-1])
    cube([200,200,10]);
    translate([0,-100,-1])
    cube([200,200,10]);
    
    translate([0,0,thick+2])
    rotate_extrude($fn=99){
      translate([rmin,0])
      circle(r=1.7,$fn=33);
    }

    translate([0.7*rmin,-0.75*rmin,thick+2])
    rotate([0,0,39])
    cube([25,6,4],center=true);

    translate([-0.75*rmin,0.7*rmin,thick+2])
    rotate([0,0,39])
    cube([25,6,4],center=true);

    translate([-rmin-3.5,-rmin-3.5,-2])
    rotate([0,0,0])
    rounder(r=10,h=20,f=44);

    translate([-rmin*0.8,-rmin*0.8,-2])
    cylinder(r=3,h=4*thick,$fn=200);

  }

  // tabs for stapler
  translate([-rmin-3,-rmin-3+7.5,22])
  rotate([0,0,90])
  rotate([180,0,0])
  staple();

  translate([-rmin-3+7.5,-rmin-3,22])
  mirror([0,0,1])
  staple();


}
//----------------------------------------------------------------------
module hang4(){
  
gap=7;
wide=26;
thick=2.1;
rmin=50;
off=32;


  // tip
  difference(){
    union(){
      rotate([0,0,32])
      translate([2*rmin,0,0])
      cylinder(r=rmin+thick+1,h=3+thick,$fn=200);
      translate([40,0,0])
      cube([40,rmin,thick+3]);
    }
    
    rotate([0,0,32])
    translate([2*rmin,0,0])
    cylinder(r=rmin-3,h=5*thick,center=true,$fn=200);

    rotate([0,0,32])
    translate([2*rmin,0,0])
    translate([0,0,thick+2])
    rotate([0,0,180])
    rotate_extrude($fn=99,angle=180){
      translate([rmin,0])
      circle(r=1.7,$fn=33);
    }

    rotate([0,0,32])
    translate([2*rmin,2*rmin,thick+3])
    cube([4*rmin,4*rmin,5*thick],center=true);
    translate([3.8*rmin,0,thick+3])
    cube([4*rmin,4*rmin,5*thick],center=true);
  }
  
  // main loop
  difference(){
    cylinder(r=rmin+thick+1,h=3+thick,$fn=200);
    
    translate([0,0,thick+2])
    rotate([0,0,32])
    rotate_extrude($fn=99,angle=180){
      translate([rmin,0])
      circle(r=1.7,$fn=33);
    }
    rotate([0,0,32])
    translate([2*rmin,0,0])
    translate([0,0,thick+2])
    rotate([0,0,180])
    rotate_extrude($fn=99,angle=180){
      translate([rmin,0])
      circle(r=1.7,$fn=33);
    }

    translate([0,-2*rmin,thick+3])
    cube([4*rmin,4*rmin,5*thick],center=true);

    translate([12,0,-1])
    cylinder(r=0.5*rmin,h=5*thick,$fn=200);

    translate([2,40,-1])
    cylinder(r=4,h=5*thick,$fn=200);

// cut text for Version
  translate ([-15,35,3+thick-0.6]) color("red")   
  rotate([0,0,200])
  linear_extrude(height=0.6)
  text("2024", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

  translate ([20,33,3+thick-0.6]) color("red")   
  rotate([0,0,150])
  linear_extrude(height=0.6)
  text("FLINT", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.2);

    translate([-rmin,5,thick+3])
    cube([30,11,5*thick],center=true);
  }

  // tabs for stapler
  translate([-35,0,22])
  mirror([1,0,0])
  rotate([0,0,180])
  rotate([180,0,0])
  staple();

  translate([35,0,22])
  mirror([1,0,0])
  rotate([0,0,180])
  rotate([180,0,0])
  staple();

}

//======================================================================

//~ plug1();

//~ mirror([1,0,0])
//~ hang1();

//~ hang2();

//~ hang3();

hang4();

//~ staple();

// Print N copies of hang1 add 2 cubes to improve bed adhesion
if(0){
  N=15;
  for(i=[0:N-1]){
    translate([0,i*15,0])
    mirror([1,0,0])
    hang1();
  }
  translate([-0.6,-5,15])
  cube([0.6,15*N,1.2]);
  translate([-0.6,-5,-2.5])
  cube([0.6,15*N,1.2]);
}

//======================================================================



