// reservoir3.scad
// Reservoir for the Calorimeter, mounts ontop of the cooling pump.
// coolant reservoir to mount directly ontop of the cooling pump

use <../Parts/threads.scad>


Twall = 2.0;


//------------------------------------
module bottomplug2(tol=0,cut=0){

difference(){
  union(){
    // thread
    color("cyan")
    english_thread (diameter=1/2, threads_per_inch=19, length=0.23);

    // pass through the reservoir body
    translate([0,0,0.23*25.4])
    cylinder(r=7+tol,h=2,$fn=88);

    // nut top
    translate([0,0,0.23*25.4+1.9])
    cylinder(r1=16,r2=15,h=3,$fn=88);
    
    // block off the alternative line in, lower skirt
    translate([0,0,0.23*25.4+2-13])
    cylinder(r=11/2,h=13,$fn=88);
  }
  if(cut==1){
    // bore hole
    translate([0,0,-5.5])
    cylinder(r=4.0,h=20,$fn=88);
    
    // taper to tank
    translate([0,0,10])
    cylinder(r1=4.0,r2=6.5,h=4.1,$fn=88);

    // taper to pump
    translate([0,0,-5.5])
    cylinder(r1=5.3,r2=4.2,h=1.5,$fn=88);
    
    // drainage cut + screwdriver slot
//    translate([0,0,9.4])
//    cube([36,2,3.5],center=true);
    translate([0,0,10.0])
    cube([10,2,10],center=true);
    
  }
}  

}

//--------------------------------------
module topplug(tol=0,cut=1){
  difference(){
    union(){
      metric_thread (diameter=24*2-0.75, pitch=2, length=8, leadin=3);
      translate([0,0,6.5])
      cylinder(r=25+6,h=3,$fn=122);
    }
    if(cut==1){
      difference(){
        translate([0,0,3])
        cylinder(r1=19,r2=21,h=7.1,$fn=122); 
        translate([0,0,3])
        cylinder(r1=11,r2=9,h=7.1,$fn=88); 
        translate([-21,-2,3])
        cube([42,4,7]);
      }
    // center bore
    cylinder(r=5.0,h=30,center=true,$fn=89);
    // finger bumps
    for(i=[0:5]){
      rotate([0,0,i*60])
      translate([39,0,0])
      cylinder(r=14,h=20,center=true,$fn=89);
    }    
  }
}

}  
      
//--------------------------------------
module topbarb(){
  difference(){
    union(){
      // tube down into liquid
      translate([0,0,-30])
      cylinder(r1=5.0,r2=7.5,h=31,$fn=88);
    }

    // main bore
    translate([0,0,-11])
    cylinder(r1=4.9,r2=4.7,h=30,$fn=44);
    translate([0,0,-37.5])
    cylinder(r1=3,r2=4,h=28,$fn=44);

    // side vents
    for(i=[0:1]){
      translate([0,0,-26+i*7])
      rotate([90,0,0])
      cylinder(r=2,h=20,center=true,$fn=44);
    }
    for(i=[0:1]){
      translate([0,0,-26+i*7+7/2])
      rotate([0,90,0])
      cylinder(r=2,h=20,center=true,$fn=44);
    }
    translate([0,0,3])
    cube([40,1,20],center=true);
    translate([0,0,3])
    cube([1,40,20],center=true);
  }
  // bottom skirt to make it printable
  translate([0,0,-31])
  cylinder(r1=9,r2=8,h=2,$fn=88);    

}

//------------------------------------   
module reservoir(){

hi1=70;   // square section height
hi2=16;   // tapered section height

difference(){
  // main box
    hull(){
      intersection(){
        cylinder(r=63/2*1.414,h=hi1+Twall,$fn=101);
        translate([0,0,hi1/2])
        cube([65,65,hi1],center=true);
      }

      translate([0,0,hi1+hi2])
      cylinder(r=26,h=Twall*2,$fn=101);

//      translate([0,0,hi1+20])
//      topplug(cut=0);
    }
  
  // main cut
  hull(){
    intersection(){
      cylinder(r=(63-2*Twall)/2*1.414,h=hi1+Twall,$fn=101);
      translate([0,0,hi1/2+1])
      cube([65-2*Twall,65-2*Twall,hi1-2*Twall-1],center=true);
    }
    translate([0,0,hi1+hi2-3])
    cylinder(r=26-Twall,h=Twall,$fn=101);
  }

  // cut for bottom plug
  cylinder(r=7+0.25,h=10,center=true,$fn=88);
  
  // top plug
  translate([0,0,hi1+hi2-1.5])
  topplug(cut=0);

if(1){
	// alternate cut method for O ring, metric 116
  translate([0,0,0])
  rotate_extrude($fn=99){
		translate([24.6/2-3.3+0.6,0.6-1])
		offset(r=0.6,$fn=44)
		//square([3.80-1.2,2.45-1.2+1]);  // for 3 mm ring
		square([3.30-1.2,1.95-1.2+1]);    // for 2.5 mm ring
	}
}


}  

if(0){
// reinforcement on the side panels ?
for(i=[-1:1]){
  translate([32.5,17*i,0]){
    scale([1,1.5,1]){
    cylinder(r=Twall,h=hi1-3,$fn=49);
    translate([0,0,hi1-3])
    sphere(r=Twall,$fn=43);
  }
  }
  translate([-32.5,17*i,0]){
    scale([1,1.5,1]){
    cylinder(r=Twall,h=hi1-3,$fn=49);
    translate([0,0,hi1-3])
    sphere(r=Twall,$fn=43);
  }
  }
  translate([17*i,32.5,0]){
    scale([1.5,1,1]){
    cylinder(r=Twall,h=hi1-3,$fn=49);
    translate([0,0,hi1-3])
    sphere(r=Twall,$fn=43);
  }
  }
  translate([17*i,-32.5,0]){
    scale([1.5,1,1]){
    cylinder(r=Twall,h=hi1-3,$fn=49);
    translate([0,0,hi1-3])
    sphere(r=Twall,$fn=43);
  }
  }
}
} // end of reinforce

}

// --------------------------------------------------------
module drainplug(){
  difference(){
    union(){
      cylinder(r1=7,r2=7.5,h=3,$fn=9);
      cylinder(r1=4,r2=3,h=18,$fn=89);
      translate([0,0,3])
      cylinder(r1=5,r2=3.5,h=1.5,$fn=89);
      translate([0,0,18])
      sphere(r=3,$fn=45);
    }
    cylinder(r1=2,r2=0.2,h=5,$fn=25);
    cylinder(r=0.2,h=18,$fn=25);
  }
}

//=========================================

//reservoir();
//bottomplug2(cut=1); 
//topplug();
topbarb();

//drainplug();

// cutaway
if(0){
  difference(){
    union(){
      //translate([0,-15,47])
      //fillercap();
    //color("gray")
    //reservoir();
    //color("pink")
    //translate([0,0,-3.8])
    //bottomplug2(cut=1);
    //color("green")
    //translate([0,0,83])
    //topplug();
    //color("cyan")
    //translate([0,0,82])
    //rotate([0,0,180])
    topbarb();
    //drainplug();
    }
    //color("white")
    translate([-40,0,-100])
    cube([80,80,200]);
  }
}

//=========================================




