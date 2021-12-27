//=================================================================================
// Calorimeter1.scad
// Calorimeter for inverter loss estimation using immersion cooling
//
//
// Dr Tom Flint, 10 March 2021
//=================================================================================


use <../Parts/rounder.scad>
use <../Parts/ti.scad>
use <./quickie.scad>

// Lid Angle
LidAngle=180;
// Lid Lift
LidLift=40;

//--------------------------------------------------
module prop1(){

  // U shape for base
  difference(){
    union(){
      cube([20,50,10],center=true);
    
      translate([0,10,17])
      cube([20,13,30],center=true);

      // fillets
      translate([-10,3.5,5])
      rotate([0,90,0])
      rotate([0,0,180])
      rounder(r=6,h=20,f=89);

      translate([-10,16.5,5])
      rotate([0,90,0])
      rotate([0,0,90])
      rounder(r=6,h=20,f=89);  
    }
    
    translate([0,0,-2])
    cube([11.2,50.2,6.1],center=true);

    translate([2,10,21])
    cube([17,6.8,32],center=true);
    
    translate([12,18,32])
    rotate([90,0,0])
    scale([1,1.5,1])
    cylinder(r=14,h=20,center=true,$fn=99);

    translate([12,0,32])
    rotate([90,0,0])
    scale([0.6,1.5,1])
    cylinder(r=14,h=20,center=true,$fn=99);

    translate([10,25,-6])
    rotate([0,0,180])
    rounder(r=10,h=20,f=89);  

    translate([-10,25,-6])
    rotate([0,0,-90])
    rounder(r=10,h=20,f=89);  

    translate([10,-25,-6])
    rotate([0,0,90])
    rounder(r=10,h=20,f=89);  

    translate([-10,-25,-6])
    rotate([0,0,0])
    rounder(r=10,h=20,f=89);  

  }
    

}

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
module tubtab1(tol=0){

translate([-7,-4,0])
difference(){
  union(){
    translate([-tol/2,-tol/2,-tol/2])
    cube([7+tol,8+tol,8+tol]);
    translate([7,4,-tol/2])
    cylinder(r=4+tol/2,h=8+tol,$fn=89);
  }
  translate([7+tol/2,4+tol/2,2])
  cylinder(r=2-tol/2,h=7,$fn=89);
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
module tub1(quickie=1){
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
    
    // cuts for coolant connectors APPROXIMATE
    translate([83,100,55+2.5])
    rotate([90,0,0])
    cylinder(r=17.6/2,h=30,$fn=89);   
    translate([-100,100,23+2.5])
    rotate([90,0,0])
    cylinder(r=17.6/2,h=30,$fn=89);   
    
  }

  // quick connects for the coolant
  if(quickie==1){
    translate([83,77,55+2.5])
    rotate([0,0,90])
    quickie(nut=2.3);
    translate([-100,77,23+2.5])
    rotate([0,0,90])
    quickie(nut=2.3);
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

    // wiring holes 
    translate([16.4+7.9,33.3+7.9,0])
    cylinder(r=7.9,h=30,$fn=89);
    translate([57.0+7.9,31.3+7.9,0])
    cylinder(r=7.9,h=30,$fn=89);   
    translate([-35.0-7.9,31.5+7.9,0])
    cylinder(r=7.9,h=30,$fn=89);   
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
module spiderfoot(){

  difference(){
    translate([182.2/2,137/2+0.5,12])
    cube([14,11,11],center=true);
    
    translate([182.2/2,137/2,18])
    rotate([0,0,-90])
    rotate([180,0,0])
    tubtab1(tol=0.2);
    
    translate([182.2/2-15,137/2+6,18])
    rotate([0,90,0])
    rotate([0,0,-90])
    rounder(r=3,h=30,f=66);  

    translate([182.2/2,137/2,0])
    cylinder(r=2.5,h=20,$fn=22);
  }

  // foot outside the moat
  translate([182.2/2,137/2-7,12-0.5])
  cube([14,4,10],center=true);
  
}
//--------------------------------------------------------------------
module spider1(z1=45,y1=30,x1=0){

// feet bolt to top
spiderfoot();
mirror([0,1,0])
spiderfoot();

  hull(){
    translate([182.2/2+x1,(137/2-7),12-0.5])
    cube([14,4,10],center=true);

    translate([182.2/2+x1+2,(137/2-7-y1),12-0.5-z1])
    cube([10,4,6],center=true);
  }
  
  hull(){
    translate([182.2/2+x1,-(137/2-7),12-0.5])
    cube([14,4,10],center=true);

    translate([182.2/2+x1+2,-(137/2-7-y1),12-0.5-z1])
    cube([10,4,6],center=true);
  }

  $fn=23;
  
  // crossbar
  difference(){
    translate([182.2/2+x1+2,0,12-0.5-z1])
    cube([10,120-2*y1,6],center=true);
    translate([182.2/2+x1+2,0,12-0.5-z1])
    cylinder(r=1.65,h=20,center=true);
    translate([182.2/2+x1+2,60-y1-10,12-0.5-z1])
    cylinder(r=1.65,h=20,center=true);
    translate([182.2/2+x1+2,-(60-y1-10),12-0.5-z1])
    cylinder(r=1.65,h=20,center=true);
    
  }
}

//--------------------------------------------------------------------------------
// carrier for the TI Delfino LaunchPadXL and GaN Inverter
module carrier1b(z1=45,y1=30,x1=0){

    difference(){
      union(){
        translate([-(193/2+2),-(63-y1),8.5-z1-6])
        cube([12,13,6]);  
        translate([-(193/2),-(63-y1),8.5-z1-2])
        cube([193/2,7,2]);
        translate([-(193/2),-(63-y1),8.5-z1-6])
        cube([193/2,3,6]);
        translate([-(193/2)+10,-(63-y1-7),8.5-z1-2])
        rounder(r=6,h=2,f=44);
        translate([-(185/2),-(60-y1-10),12-0.5-z1-9])
        cylinder(r=6,h=6,$fn=33);
      }
      translate([-(185/2),-(60-y1-10),12-0.5-z1])
      cylinder(r=1.65,h=20,center=true,$fn=33);
      translate([-(193/2)-2,-(63-y1),8.5-z1-8])
      rounder(r=3,h=10,f=44);
    }
    
}

//--------------------------------------------------------------------------------
// carrier for the TI Delfino LaunchPadXL and GaN Inverter
module carrier1(z1=45,y1=30,x1=0){

  carrier1b();
  mirror([1,0,0])
  carrier1b();
    
}
  
//--------------------------------------------------------------------------------
// carrier for the TI Delfino LaunchPadXL, GaN Inverter, and cal heater
module carrier2(wide=30){

    difference(){
      translate([0,0,1])
      cube([wide,7,33]);
      
      translate([-1,2,3]) 
      cube([32,8,1.8]); 
      translate([-1,2,3+12]) 
      cube([32,8,1.7]); 
      translate([-1,2,3+24.5]) 
      cube([32,8,3.5]); 
      
      translate([5,0,10])
      rotate([90,0,0])
      cylinder(r=3,h=20,$fn=6,center=true);
      translate([15,0,10])
      rotate([90,0,0])
      cylinder(r=3,h=20,$fn=6,center=true);
      translate([25,0,10])
      rotate([90,0,0])
      cylinder(r=3,h=20,$fn=6,center=true);

      translate([5,0,22])
      rotate([90,0,0])
      cylinder(r=3,h=20,$fn=6,center=true);
      translate([15,0,22])
      rotate([90,0,0])
      cylinder(r=3,h=20,$fn=6,center=true);
      translate([25,0,22])
      rotate([90,0,0])
      cylinder(r=3,h=20,$fn=6,center=true);
     
    }  
      
}

//--------------------------------------------------------------------
module carrier3(){
 
  carrier1b();
  mirror([1,0,0])
  carrier1b();
 
  translate([15,-58.5/2-3.75,-35.5])
  rotate([0,180,0])
  carrier2();
  
  translate([87,-58.5/2-3.75,-35.5])
  rotate([0,180,0])
  carrier2(wide=20);
  
  translate([87,-58.5/2-0.75+4,-42.5])
  rotate([90,0,0])
  rotate([0,0,-90])
  rounder(r=6,h=7,f=66);  

  translate([87-20,-58.5/2-0.75,-42.5])
  rotate([90,0,0])
  rotate([0,0,180])
  rounder(r=6,h=3,f=66);  

  translate([-15,-58.5/2-0.75,-42.5])
  rotate([90,0,0])
  rotate([0,0,180])
  rounder(r=6,h=3,f=66);  

  translate([-15+30,-58.5/2-0.75,-42.5])
  rotate([90,0,0])
  rotate([0,0,-90])
  rounder(r=6,h=3,f=66);  

}
 
  
//--------------------------------------------------------------------
module calheater(){
 
 translate([0,0,3.2/2]) 
 cube([126.6, 59.8, 3.2],center=true); 
 
}  

//=================================================================================

// disable cutaway views if printing or working single parts
if(0){
  
xcut=260;
ycut=660;
zcut=500;

cutcube = 600;

intersection(){
  translate([-cutcube+xcut,-cutcube+ycut,-cutcube+zcut])
  cube([cutcube,cutcube,cutcube]);
  
  union(){

    // base section
    if(0){
      base1();
    }
    if(0){
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
      translate([0,100-TopAngle*0.5,0])
      rotate([-TopAngle,0,0])
      translate([0,-100,0]){
        color("silver", alpha=0.7)
        top1();
        
        color("white")
        spider1();
        mirror([1,0,0])
        color("white")
        spider1();

        rotate([0,0,180]){
        carrier3();
        mirror([0,1,0])
        carrier3();
                
        translate([129.8/2-21,-58.5/2,-30])
        rotate([0,0,180])
        rotate([180,0,0]){
          launch();
          gan();
        }   
        
        color("red",alpha=0.7)
        translate([20,0,-66.3])
        calheater();     
      
      }
      }
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
}
// for printing and individual part editing, do below this line ---

if(0){
  color("silver", alpha=0.7)
  top1();
  spider1();
  mirror([1,0,0])
  spider1();
  translate([-129.8/2,58.5/2,-35])
  rotate([180,0,0]){
    launch();
    gan();
  }
  
}

//prop1();
translate([40,0,0])
mirror([1,0,0])
prop1();

//spider1();
//carrier1();
//mirror([0,1,0])
//carrier3();

//top1();
//tub1();

//    cube([129.8,58.5,1.7]);
 
//difference(){
//tubtab1(tol=0.2);
//tubtab1(tol=0);
//}

// AL angles in the corners of metal box
//L1(len=60);


//=================================================================================


