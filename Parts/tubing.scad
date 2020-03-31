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
    for(i=[0:4]){
      translate([0,0,2+i*3])
      cylinder(r1=3.3,r2=3,h=3,$fn=88);
    }
    // tip
    color("red")
    translate([0,0,17])
    cylinder(r1=3,r2=2.4,h=1,$fn=88);
  }
  
  // bore hole
  translate([0,0,-0.1])
  cylinder(r1=2.3,r2=1.9,h=19.3,$fn=88);  

  // tip bevel
  color("green")
  translate([0,0,17])
  cylinder(r1=1.8,r2=2.6,h=1.1,$fn=88);
  
  // entry bevel
  color("green")
  translate([0,0,-0.1])
  cylinder(r1=2.5,r2=2.3,h=1.2,$fn=88);
}
}
//----------------------------------
// water pump to silicon soft tube
module adaptB(){
difference(){
  union(){
    color("cyan")
    english_thread (diameter=1/2, threads_per_inch=19, length=0.23);

    translate([0,0,0.23*25.4])
    cylinder(r=9,h=2.5,$fn=6);

    // add a barb to connect to the silicon tubing
    translate([0,0,8])
    cylinder(r1=7,r2=3.3,h=3,$fn=88);

    for(i=[0:4]){
      translate([0,0,11+i*3])
      cylinder(r1=3.3,r2=3,h=3,$fn=88);
    }
    color("red")
    translate([0,0,26])
    cylinder(r1=3,r2=2.5,h=1,$fn=88);
  }

  color("green")
  translate([0,0,26])
  cylinder(r1=2.2,r2=2.7,h=1.1,$fn=88);

  // bore hole
  translate([0,0,9])
  cylinder(r1=2.4,r2=2.2,h=18.1,$fn=88);

  // tapered inlet since pump bores are offset
  translate([0,0,-0.01])
  cylinder(r1=5,r2=2.4,h=9.1,$fn=88);

}  


}

//----------------------------------
// radiator to silicon soft tube
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
  cylinder(r=3.5,h=5,$fn=88);

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

//adaptB();

// cutaway view:
if(0){
difference(){
adaptB();
translate([-10,0,-1])
cube([20,20,40]);
}
}


//adaptC();

// cutaway view:
if(0){
difference(){
adaptC();
translate([-10,0,-1])
cube([20,20,40]);
}
}

adaptD();

// cutaway view:
if(0){
difference(){
adaptD();
translate([-10,0,-1])
cube([20,20,40]);
}
}

//===================================

