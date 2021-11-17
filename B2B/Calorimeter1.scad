//=================================================================================
// Calorimeter1.scad
// Calorimeter for inverter loss estimation using immersion cooling
//
//
// Dr Tom Flint, 10 March 2021
//=================================================================================


use <../Parts/rounder.scad>

// Lid Angle
LidAngle=180;
// Lid Lift
LidLift=40;

//--------------------------------------------------
module L1(len=10){

difference(){
  union(){
    cube([25.5,3.2,len]);
    cube([3.2,25.5,len]);  
    translate([3.2,3.2,0])
    rounder(r=3.2,h=len);
  }
  
  translate([3.2,25.5,0])
  rotate([0,0,180])
  rounder(r=3.2,h=len);

  translate([25.5,3.2,0])
  rotate([0,0,180])
  rounder(r=3.2,h=len);
}

}
  
//--------------------------------------------------
module base1(){
  // base plate
  color("gray")
  cube([330,254,3]);
  
  // back plate
  color("orange")
  translate([0,254,0])
  cube([330,3,152]);
  
  // back left vertical L
  translate([0,254,3])
  rotate([0,0,-90])
  L1(len=152-6);
  
  // back right vertical L
  translate([330,254,3])
  rotate([0,0,180])
  L1(len=152-6);

  // back horizontal L
  translate([(330+151)/2,254,3])
  rotate([0,-90,0])
  rotate([0,0,-90])
  L1(len=151);

}
//--------------------------------------------------
module base2(){
  // base plate
  color("pink")
  translate([-15.2-3,-15.2-3,-15.2])
  cube([330+2*(15.2+3),254+2*(15.2+3),15.2]);
  
  // back plate
  color("pink")
  translate([-3-15.2,254+3,0])
  cube([330+2*(3+15.2),15.2,152+15.2]);
  

}

//--------------------------------------------------
// AL sheets 3 mm thick and 90 degree L stock

module lid1(){

if(1){
  // top plate
  color("silver")
  translate([0,0,152-3])
  cube([330,254,3]);
}

  // left plate
  color("red")
  translate([-3,0,0])
  cube([3,254,152]);
  
  // right plate
  color("green")
  translate([330,0,0])
  cube([3,254,152]);
  
  // front plate
  color("yellow")
  translate([0,-3,0])
  cube([330,3,152]);
  
  // front left vertical L
  translate([0,0,3])
  L1(len=152-6);
  
  // left horizontal L
  translate([0,254/2-151/2,152-3])
  rotate([-90,0,0])
  L1(len=151);

  // front right vertical L
  translate([330,0,3])
  rotate([0,0,90])
  L1(len=152-6);

  // right horizontal L
  translate([330-3,254/2-151/2,152-3])
  rotate([-90,0,0])
  rotate([0,0,90])
  L1(len=151);


  // front horizontal L
  translate([(330+151)/2,0,152-3])
  rotate([0,-90,0])
  rotate([0,0,90])
  L1(len=151);


}  

//--------------------------------------------------
// insulated panels XPS foam 1/2" nominal 15.2 mm measured R3 value

module lid2(){

if(1){
  // top plate
  color("pink")
  translate([-15.2-3,-15.2-3,152])
  cube([330+2*(3+15.2),254+6+15.2,15.2]);
}

  // left plate
  color("pink")
  translate([-15.2-3,-3,0])
  cube([15.2,254+6,152]);
  
  // right plate
  color("pink")
  translate([330+3,-3,0])
  cube([15.2,254+6,152]);
  
  // front plate
  color("pink")
  translate([-15.2-3,-3-15.2,0])
  cube([330+2*(15.2+3),15.2,152]);

}
//------------------------------------------
module tubtab1(){

translate([-7,-4,0])
difference(){
  union(){
    cube([7,8,8]);
    translate([7,4,0])
    cylinder(r=4,h=8,$fn=89);
  }
  translate([7,4,2])
  cylinder(r=2,h=7,$fn=89);
}
}

//------------------------------------------
module tubtab2(){

translate([-13/2,-13/2,0])
difference(){
  union(){
    cube([13,13,12.2]);
    translate([13,13/2,0])
    cylinder(r=13/2,h=12.2,$fn=89);
  }
  translate([13,13/2,-1])
  cylinder(r=2,h=18,$fn=89);
}
}

//-----------------------------------------------------------------------------
// zero point is at center of xy and bottom outside z
module tub1(){
$fn=89;
 
  translate([0,0,2.5])
  difference(){
    union(){
      // outer cube
      translate([0,0,-2.5])
      linear_extrude(height=80+2.5,scale=252/249.2)
      offset(r=5.5)
      square([249.2-6,148.2-6],center=true);

      // lip
      translate([0,0,80-5.6])
      linear_extrude(height=5.6)
      offset(r=11.0)
      square([252,151],center=true);      
    }
    
    // innner cube
    linear_extrude(height=80.1,scale=252/249.2)
    offset(r=3)
    square([249.2-6,148.2-6],center=true);
  }

  // inner tabs 
  translate([-230/2,0,2.5])
  tubtab1();
  translate([-230/2,38,2.5])
  tubtab1();
  translate([-230/2,-38,2.5])
  tubtab1();

  translate([230/2,0,2.5])
  rotate([0,0,180])
  tubtab1();
  translate([230/2,38,2.5])
  rotate([0,0,180])
  tubtab1();
  translate([230/2,-38,2.5])
  rotate([0,0,180])
  tubtab1();

  translate([182.2/2,137/2,2.5])
  rotate([0,0,-90])
  tubtab1();
  translate([-182.2/2,137/2,2.5])
  rotate([0,0,-90])
  tubtab1();

  translate([182.2/2,-137/2,2.5])
  rotate([0,0,90])
  tubtab1();
  translate([-182.2/2,-137/2,2.5])
  rotate([0,0,90])
  tubtab1();

  // corner tabs
  translate([(252-14)/2,(151-14)/2,2.5+4])
  cube([12,12,8],center=true);
  translate([-(252-14)/2,(151-14)/2,2.5+4])
  cube([12,12,8],center=true);
  translate([-(252-14)/2,-(151-14)/2,2.5+4])
  cube([12,12,8],center=true);
  translate([(252-14)/2,-(151-14)/2,2.5+4])
  cube([12,12,8],center=true);
  
  // outer tabs
  translate([-222/2,173/2,80-12.2+2.5])
  rotate([0,0,90])
  tubtab2();
  translate([0,173/2,80-12.2+2.5])
  rotate([0,0,90])
  tubtab2();
  translate([222/2,173/2,80-12.2+2.5])
  rotate([0,0,90])
  tubtab2();
  
  translate([-222/2,-173/2,80-12.2+2.5])
  rotate([0,0,-90])
  tubtab2();
  translate([0,-173/2,80-12.2+2.5])
  rotate([0,0,-90])
  tubtab2();
  translate([222/2,-173/2,80-12.2+2.5])
  rotate([0,0,-90])
  tubtab2();
  
}
//------------------------------------------------------------------------
// top of the tub
// zero is center of xy, bottom of cube
module top1(tol=0){

  difference(){
    union(){
      // lip
      linear_extrude(height=5.6)
      offset(r=11.0,$fn=55)
      square([252,151],center=true);   
      
      // outer cube
      linear_extrude(height=20.1,scale=250/252)
      offset(r=5.5,$fn=55)
      square([252-6,151-6],center=true);

   
    }
    
    // innner cube
    translate([0,0,-0.1])
    linear_extrude(height=20.1-2.5,scale=250/252)
    offset(r=3,$fn=45)
    square([252-6,151-6],center=true);
  }
  
  // outer tabs
  translate([-222/2,173/2,0])
  rotate([0,0,90])
  tubtab2();
  translate([0,173/2,0])
  rotate([0,0,90])
  tubtab2();
  translate([222/2,173/2,0])
  rotate([0,0,90])
  tubtab2();
  
  translate([-222/2,-173/2,0])
  rotate([0,0,-90])
  tubtab2();
  translate([0,-173/2,0])
  rotate([0,0,-90])
  tubtab2();
  translate([222/2,-173/2,0])
  rotate([0,0,-90])
  tubtab2();
  
  // corner tabs
  difference(){
    translate([(252-11)/2,(151-11)/2,4+10])
    cube([10,10,8],center=true);
    translate([(242)/2,(141)/2,0])
    cylinder(r=2,h=17.5,$fn=89);
  }
  difference(){
    translate([-(252-11)/2,(151-11)/2,4+10])
    cube([10,10,8],center=true);
    translate([-(242)/2,(141)/2,0])
    cylinder(r=2,h=17.5,$fn=89);
  }
  difference(){
    translate([-(252-11)/2,-(151-11)/2,4+10])
    cube([10,10,8],center=true);
    translate([-(242)/2,-(141)/2,0])
    cylinder(r=2,h=17.5,$fn=89);
  }
  difference(){
    translate([(252-11)/2,-(151-11)/2,4+10])
    cube([10,10,8],center=true);
    translate([(242)/2,-(141)/2,0])
    cylinder(r=2,h=17.5,$fn=89);
  }

  // inner tabs
  translate([182.2/2,137/2,18])
  rotate([0,0,-90])
  rotate([180,0,0])
  tubtab1();
  translate([-182.2/2,137/2,18])
  rotate([0,0,-90])
  rotate([180,0,0])
  tubtab1();

  translate([182.2/2,-137/2,18])
  rotate([0,0,90])
  rotate([180,0,0])
  tubtab1();
  translate([-182.2/2,-137/2,18])
  rotate([0,0,90])
  rotate([180,0,0])
  tubtab1();

}
//--------------------------------------------------------------------
module spider1(){
  
    // corner tabs
  difference(){
    translate([(252-11)/2,(151-11)/2,4+10])
    cube([10,10,8],center=true);
    translate([(242)/2,(141)/2,0])
    cylinder(r=2,h=17.5,$fn=89);
  }
  difference(){
    translate([-(252-11)/2,(151-11)/2,4+10])
    cube([10,10,8],center=true);
    translate([-(242)/2,(141)/2,0])
    cylinder(r=2,h=17.5,$fn=89);
  }
  difference(){
    translate([-(252-11)/2,-(151-11)/2,4+10])
    cube([10,10,8],center=true);
    translate([-(242)/2,-(141)/2,0])
    cylinder(r=2,h=17.5,$fn=89);
  }
  difference(){
    translate([(252-11)/2,-(151-11)/2,4+10])
    cube([10,10,8],center=true);
    translate([(242)/2,-(141)/2,0])
    cylinder(r=2,h=17.5,$fn=89);
  }

  // inner tabs
  translate([182.2/2,137/2,18])
  rotate([0,0,-90])
  rotate([180,0,0])
  tubtab1();
  translate([-182.2/2,137/2,18])
  rotate([0,0,-90])
  rotate([180,0,0])
  tubtab1();

  translate([182.2/2,-137/2,18])
  rotate([0,0,90])
  rotate([180,0,0])
  tubtab1();
  translate([-182.2/2,-137/2,18])
  rotate([0,0,90])
  rotate([180,0,0])
  tubtab1();
}

//=================================================================================


xcut=80;
ycut=500;
zcut=500;

cutcube = 600;

intersection(){
  translate([-cutcube+xcut,-cutcube+ycut,-cutcube+zcut])
  cube([cutcube,cutcube,cutcube]);
  
  union(){

    // base section
    if(1){
      base1();
    }
    if(1){
      base2();
    }

    // tub
    if(1){
      color("silver")
      translate([330/2,255/2,15.2+3])
      tub1();
    }

    // dimension check!
    if(0){
      color("silver", alpha=0.7)
      translate([0,0,80+3])
      cube([274,173,2],center=true);
    }

    // top
    TopAngle = 0;
    if(1){
      translate([330/2,255/2,80+15.2+3+2.5])
      color("silver", alpha=0.7)
      translate([0,100-TopAngle*0.5,0])
      rotate([-TopAngle,0,0])
      translate([0,-100,0])
      top1();
    }

    // lid
    if(0){
      translate([0,LidLift,LidLift])
      translate([0,254,152+15.2])
      rotate([-LidAngle,0,0])
      translate([0,-254,-152-15.2])
      {
        if(1){
          lid1();
        }
        if(1){
          lid2();
        }
      }
    }
  }
}
// for printing and individual part editing, do below this line ---

//top1();
//translate([0,0,-8])
//spider1();

// AL angles in the corners of metal box
//L1(len=60);


//=================================================================================


