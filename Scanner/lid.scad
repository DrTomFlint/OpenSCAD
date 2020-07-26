// lid.scad
// scanner part

F1=200;
F2=88;
//---------------------------------------------------------------------
module dome(Rin=91,thick=1){
  
  difference(){
    sphere(r=Rin+thick,$fn=F1);
    sphere(r=Rin,$fn=F1);
    translate([0,0,-50])
    cube([200,200,100],center=true);    
  }
}

//-------------------------------------------------------------------
// 1 = back lid
// 2 = back lid + front lip
// 3 = front lid
// 4 = front lid + front lip

module lid(type=1){
  Rin=92;
  
  difference(){
    union(){
      // dome part
      difference(){
        dome(Rin=Rin,thick=1);
        rotate([-60,0,0])         // here is the cut angle
        translate([0,-100,50])    
        cube([200,200,100],center=true);    
        translate([0,-100,40])    
        cube([200,200,100],center=true);    
      }
      // overlapping lip
      color("green")
      translate([0,0,-2])
      difference(){
        cylinder(r=Rin+2,h=4,$fn=F1);
        translate([0,0,-1])
        cylinder(r=Rin+1,h=6,$fn=F1);
        translate([0,-97,40])
        cube([200,200,100],center=true);    
      }
      if(type==2){
        // add front lip
        color("orange")
        rotate([30,0,0])
        translate([0,0,-2])
        difference(){
          cylinder(r=Rin+2,h=4,$fn=F1);
          translate([0,0,-1])
          cylinder(r=Rin+1,h=6,$fn=F1);
          translate([0,-97,40])
          cube([200,200,100],center=true);    
        }
      }        
    } // end union
      
    // cuts for left tower sleve
    translate([-Rin-10,0,0])
    rotate([0,90,0])
    cylinder(r=30,h=20,$fn=F2);   

    // cuts for hinge spot
    translate([Rin,0,0])
    rotate([0,90,0])
    cylinder(r=12.1,h=15,$fn=F2);
  } 
}

//---------------------------------------------------------------
// assemble lid parts to make total top
module lid2(){
  union(){
    lid(type=1);
    rotate([30,0,0])
    lid(type=1);
    rotate([60,0,0])
    lid(type=1);
    
    rotate([90,0,0])
    lid(type=1);
    rotate([120,0,0])
    lid(type=1);
    rotate([150,0,0])
    lid(type=2);
  }
}

//==============================================================

lid2();

//=========================================================
