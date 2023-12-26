//=================================================================================
// db9.scad
//
// Dr Tom Flint, 22 Oct 2023
//=================================================================================


use <../Parts/rounder.scad>
use <../Parts/threads.scad>

F1=33;

//----------------------------------------------------------------------------------
module dbplate(tol=0){
r1=1;
y1=25.3/2;

  difference(){
    linear_extrude(height=1+tol)  
    offset(r=r1,$fn=F1)
    square([12.6-2*r1,30.8-2*r1],center=true);

    if(tol==0){
      translate([0,y1,-1])
      cylinder(r=2.9/2,h=3,$fn=F1);
      translate([0,-y1,-1])
      cylinder(r=2.9/2,h=3,$fn=F1);
    }
  }
}

//----------------------------------------------------------------------------------
module dbmale(tol=0){

r2=3+tol;
y2=(17.85-r2)/2+tol;
y3=(16.5-r2)/2+tol;
y4=y2+1;
y5=y3+1;
  
  rotate([0,90,0])
  dbplate(tol=tol);
  
  // pin side
  hull(){
    translate([0,y2,2.5])
    rotate([0,90,0])
    cylinder(r=r2,h=5.8,$fn=F1);
    translate([0,-y2,2.5])
    rotate([0,90,0])
    cylinder(r=r2,h=5.8,$fn=F1);

    translate([0,y3,-2.5])
    rotate([0,90,0])
    cylinder(r=r2,h=5.8,$fn=F1);
    translate([0,-y3,-2.5])
    rotate([0,90,0])
    cylinder(r=r2,h=5.8,$fn=F1);
  }
  // wire lead side
  hull(){
    translate([-4,y4,2.5])
    rotate([0,90,0])
    cylinder(r=r2,h=4,$fn=F1);
    translate([-4,-y4,2.5])
    rotate([0,90,0])
    cylinder(r=r2,h=4,$fn=F1);

    translate([-4,y5,-2.5])
    rotate([0,90,0])
    cylinder(r=r2,h=4,$fn=F1);
    translate([-4,-y5,-2.5])
    rotate([0,90,0])
    cylinder(r=r2,h=4,$fn=F1);
  }
  // leads
  hull(){
    translate([-8,y4-3,1.5])
    rotate([0,90,0])
    cylinder(r=r2,h=4,$fn=F1);
    translate([-8,-y4+3,1.5])
    rotate([0,90,0])
    cylinder(r=r2,h=4,$fn=F1);

    translate([-8,y5-3,-1.5])
    rotate([0,90,0])
    cylinder(r=r2,h=4,$fn=F1);
    translate([-8,-y5+3,-1.5])
    rotate([0,90,0])
    cylinder(r=r2,h=4,$fn=F1);
  }

}

//----------------------------------------------------------------------------------
module dbfemale(){
}

//----------------------------------------------------------------------------------
module block1(tol=0){

r1=0.1;
y1=25.3/2;

r2=3+tol;
y2=(17.85-r2)/2+tol;
y3=(16.5-r2)/2+tol;
y4=y2+1;
y5=y3+1;

  translate([1.1,0,0])
  rotate([0,90,0])
  difference(){
    linear_extrude(height=3)  
    offset(r=r1,$fn=F1)
    square([12.6-2*r1,30.8-2*r1],center=true);

    //~ translate([0,y1,-1])
    //~ cylinder(r=2.9/2,h=6,$fn=F1);
    //~ translate([0,-y1,-1])
    //~ cylinder(r=2.9/2,h=6,$fn=F1);
    
    // wire lead side
    translate([0,0,2])
    rotate([0,-90,0])
    hull(){
      translate([-4,y4,2.5])
      rotate([0,90,0])
      cylinder(r=r2,h=8,$fn=F1);
      translate([-4,-y4,2.5])
      rotate([0,90,0])
      cylinder(r=r2,h=8,$fn=F1);

      translate([-4,y4,8])
      rotate([0,90,0])
      cylinder(r=r2,h=8,$fn=F1);
      translate([-4,-y4,8])
      rotate([0,90,0])
      cylinder(r=r2,h=8,$fn=F1);

      translate([-4,y5,-2.5])
      rotate([0,90,0])
      cylinder(r=r2,h=8,$fn=F1);
      translate([-4,-y5,-2.5])
      rotate([0,90,0])
      cylinder(r=r2,h=8,$fn=F1);
    }

  }

}

//=================================================================================

//dbplate();
//dbmale(tol=0);
//dbfemale();

translate([4-5,30.8/2-1.8/2,0])
cube([8,1.8,12.6],center=true);
translate([4-5,-(30.8/2-1.8/2),0])
cube([8,1.8,12.6],center=true);

difference(){
  translate([4-5.9-5,0,-12.6/2-1.8/2])
  cube([30,30.8,1.8],center=true);
  translate([4-5.9-9,0,-12.6/2-1.8/2])
  scale([1,1.5,1])
  rotate([0,0,30])
  cylinder(r=7,h=10,$fn=6,center=true);
}

block1();
translate([4,0,0])
block1();

//=================================================================================
