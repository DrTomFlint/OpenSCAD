// tubing.scad
// adapters for tubing 

use <threads.scad>


//----------------------------------
// ptfe stiff tube to silicon soft tube
module adaptA(){

difference(){
  union(){
    // lip
    scale([1.2,1,1])
    cylinder(r1=5,r2=5,h=2.1,$fn=88);
    // barbs
    for(i=[0:5]){
      translate([0,0,2+i*3])
      cylinder(r1=3.6,r2=3.2,h=3,$fn=88);
    }
    // tip
    color("red")
    translate([0,0,20])
    cylinder(r1=3.2,r2=2.4,h=1,$fn=88);
  }
  
  // bore hole
  translate([0,0,-0.1])
  cylinder(r1=2.2,r2=1.9,h=22.3,$fn=88);  

  // tip bevel
  color("green")
  translate([0,0,19.5])
  cylinder(r1=1.8,r2=2.7,h=1.6,$fn=88);
  
  // entry bevel
  color("green")
  translate([0,0,-0.1])
  cylinder(r1=2.5,r2=2.2,h=1.2,$fn=88);
}
}
//----------------------------------
// water pump to silicon soft tube used on Dusa
module adaptB(){
difference(){
  union(){
    color("cyan")
    english_thread (diameter=1/2, threads_per_inch=19, length=0.23);

    translate([0,0,0.23*25.4])
    cylinder(r=9,h=2.5,$fn=6);

    // add a barb to connect to the silicon tubing
    translate([0,0,8])
    cylinder(r1=7,r2=3.6,h=3,$fn=88);

    for(i=[0:5]){
      translate([0,0,11+i*3])
      cylinder(r1=3.6,r2=3.2,h=3,$fn=88);
    }
    color("red")
    translate([0,0,29])
    cylinder(r1=3.2,r2=2.5,h=1,$fn=88);
  }

  color("green")
  translate([0,0,28])
  cylinder(r1=1.45,r2=2.7,h=2.1,$fn=88);

  // bore hole, constricted to equal cross section of 2x ptfe tubes
  // each tube is 2mm inner diameter, so 3.1415 mm^2, 6.28 mm^2 total
  // one hole of 1.42 mm radius has the same area.  Try 1.45 mm radius.
  translate([0,0,9])
//  cylinder(r1=2.4,r2=2.2,h=21.1,$fn=88);
  cylinder(r=1.45,h=21.1,$fn=88);

  // tapered inlet since pump bores are offset
  translate([0,0,-0.01])
  cylinder(r1=5,r2=1.45,h=9.1,$fn=88);

}  


}

//---------------------------------- 
// water pump to silicon soft tube used on Calorimeter, 6mm
module adaptB2(){
difference(){
  union(){
    color("cyan")
    english_thread (diameter=1/2, threads_per_inch=19, length=0.30, leadin=3);

    translate([0,0,0.30*25.4])
    cylinder(r=12,h=4.0,$fn=8);

    // add a barb to connect to the silicon tubing
    translate([0,0,10.5])
    cylinder(r1=9,r2=5.5,h=3,$fn=88);

    for(i=[0:5]){
      translate([0,0,12+i*3])
      cylinder(r1=7.6/2,r2=6.4/2,h=3,$fn=88);
    }
    color("red")
    translate([0,0,30])
    cylinder(r1=3.2,r2=2.5,h=1,$fn=88);
  }

  color("green")
  translate([0,0,29])
  cylinder(r1=1.45,r2=2.7,h=2.1,$fn=88);

	// alternate cut method for O ring, metric 113
    translate([0,0,0.30*25.4+0.6-1])
	rotate_extrude($fn=99){
		translate([19.5/2-3.3+0.6,0])
		offset(r=0.6,$fn=44)
		//square([3.80-1.2,2.45-1.2+1]);
		square([3.30-1.2,1.95-1.2+1]);
	}

  // bore hole
  translate([0,0,8])
  cylinder(r=2.1,h=25.1,$fn=88);

  // tapered inlet since pump bores are offset
  translate([0,0,-0.01])
  cylinder(r1=5,r2=2.1,h=9.1,$fn=88);

}  


}

//----------------------------------
// radiator to silicon soft tube used on Dusa
module adaptC(){
difference(){
  union(){
    color("cyan")
    cylinder(r1=3.3,r2=3.5,h=12,$fn=88);

    translate([0,0,12])
    cylinder(r=4,h=2,$fn=88);

    // add a barb to connect to the silicon tubing
    for(i=[0:4]){
      translate([0,0,14+i*3])
      cylinder(r1=3.3,r2=3,h=3,$fn=88);
    }
    color("red")
    translate([0,0,29])
    cylinder(r1=3,r2=2.5,h=1,$fn=88);
    
    // skirt at base to make printable
    cylinder(r=5,h=0.6);
  }

  color("green")
  translate([0,0,29])
  cylinder(r1=2.2,r2=2.7,h=1.1,$fn=88);

  // bore hole
  translate([0,0,0])
  cylinder(r1=2.2,r2=2.2,h=30,$fn=88);

  // tapered inlet since pump bores are offset
  translate([0,0,-0.01])
  cylinder(r1=3.0,r2=2.2,h=2,$fn=88);
  

}  


}

//----------------------------------
// radiator to 6 mm tube used on Calorimeter
module adaptC2(){
difference(){
  union(){
    color("cyan")
    cylinder(r1=3.3,r2=3.5,h=12,$fn=88);

    translate([0,0,12])
    cylinder(r=4,h=2,$fn=88);

    // add a barb to connect to the silicon tubing
    for(i=[0:4]){
      translate([0,0,14+i*3])
//      cylinder(r1=3.3,r2=3,h=3,$fn=88);
      cylinder(r1=7.6/2,r2=6.4/2,h=3,$fn=88);
    }
    color("red")
    translate([0,0,29])
    cylinder(r1=6.4/2,r2=2.5,h=1,$fn=88);
    
    // skirt at base to make printable
    cylinder(r=5,h=0.6);
  }

  color("green")
  translate([0,0,29])
  cylinder(r1=2.2,r2=2.7,h=1.1,$fn=88);

  // bore hole
  translate([0,0,0])
  cylinder(r1=2.2,r2=2.2,h=30,$fn=88);

  // tapered inlet since pump bores are offset
  translate([0,0,-0.01])
  cylinder(r1=3.0,r2=2.2,h=2,$fn=88);
  

}  


}


//----------------------------------
// water pump plug
module adaptD(){
difference(){
  union(){
    color("cyan")
    english_thread (diameter=1/2, threads_per_inch=19, length=0.23);

    translate([0,0,0.23*25.4])
    cylinder(r=9,h=3,$fn=6);

  }

  // bore hole
  translate([0,0,0])
  #cylinder(r1=3.5,r2=2.5,h=4,$fn=88);

}  


}
//---------------------------------- 
// water pump plug with O ring
module adaptD2(){
difference(){
  union(){
    color("cyan")
    english_thread (diameter=1/2, threads_per_inch=19, length=0.30, leadin=3);

    translate([0,0,0.30*25.4])
    cylinder(r=12,h=4.0,$fn=8);

  }


	// alternate cut method for O ring, metric 113
    translate([0,0,0.30*25.4+0.6-1])
	rotate_extrude($fn=99){
		translate([19.5/2-3.3+0.6,0])
		offset(r=0.6,$fn=44)
		//square([3.80-1.2,2.45-1.2+1]);
		square([3.30-1.2,1.95-1.2+1]);
	}


  // tapered inlet since pump bores are offset
  translate([0,0,-0.01])
  cylinder(r1=5,r2=2.1,h=9.1,$fn=88);

}  


}

//===================================

//adaptA();

// cutaway
if(0){
translate([20,0,0])  
difference(){
adaptA();
translate([-10,0,-1])
cube([20,20,40]);
}
}

//adaptB2();

// cutaway view:
if(0){
difference(){
adaptB2();
translate([-20,0,-1])
cube([40,40,40]);
}
}


//adaptC();
//adaptC2();

// cutaway view:
if(0){
difference(){
//adaptC();
adaptC2();
translate([-20,0,-1])
cube([40,40,40]);
}
}

//adaptD();
adaptD2();

// cutaway view:
if(0){
difference(){
adaptD2();
translate([-10,0,-1])
cube([20,20,40]);
}
}

//===================================

