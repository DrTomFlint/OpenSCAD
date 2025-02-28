//=================================================================================
// picks.scad
//
//
// Dr Tom Flint, 3 Dec 2022
//=================================================================================

use <../Parts/rounder.scad>
use <../Trace/guitarPick.scad>
use <../Trace/guitarPick2.scad>
use <../Trace/guitarPick3.scad>
use <../Trace/guitarPick4.scad>
use <../Trace/guitarTear2.scad>


//-----------------------------------------------------------------------------------
module pickTestA(){
  
  // right base
  cube([10,10,0.2]);

  // right above
  translate([-10,0,0.2])  
  cube([10,5,0.2]);
  
}
//-----------------------------------------------------------------------------------
module pickTestB(){

  // left base
  translate([-10,0,0])  
  cube([10,10,0.2]);

  // left above
  translate([0,0,0.2])  
  cube([10,5,0.2]);


}

//-----------------------------------------------------------------------------------
module thumb1(){

$fn=200;

thick = 1.2;
long = 27;
Rsmall = 3;
Rbig = 9;
hi = 15;
//mirror([0,1,0])
difference(convexity = 6){
    linear_extrude(height=hi,scale=1.06){
        translate([-20,-6,0]){
        square([long,thick]);

        translate([long,Rsmall+thick])
        difference(convexity = 6){
            circle(r=Rsmall+thick);
            circle(r=Rsmall);
            translate([-Rsmall,Rsmall])
            square([2*Rsmall,4*Rsmall],center=true);

            translate([thick,Rsmall])
            rotate(-45)
            square([2*Rsmall,2*Rsmall],center=true);
        }

        color("cyan")
        translate([0.777*long,Rsmall+thick])
        difference(convexity = 6){
            circle(r=Rbig+thick);
            circle(r=Rbig);
            rotate(6)
            translate([0,-1.5*Rbig-1.4*thick])
            square([3*Rbig,3*Rbig],center=true);

        }
    }
    }
    
        translate([-20,-6,0]){
    // thumb end round offs
    translate([0.25*long,0.9*thick,hi])
    rotate([0,90,0])
    rounder(r=hi/2,h=6*thick,f=89);

    translate([0.5*long,1.1*thick,0])
    rotate([0,-90,0])
    rounder(r=hi/2,h=4*thick,f=89);

    // pick end round offs
    translate([-1.5,-2,hi])
    rotate([-90,0,0])
    scale([1.25,1,1])
    rounder(r=0.7*hi,h=4*thick,f=130);

    translate([-1.5,2,0])
    rotate([90,0,0])
    scale([1.25,1,1])
    rounder(r=0.7*hi,h=4*thick,f=130);
    
    // top cut
    translate([24,18,hi+3])
    rotate([0,10,0])
    rotate([90,0,0])
    scale([3,1,1])
    cylinder(r=6,h=20);

    }
}

}
//-----------------------------------------------------------------------------------
module thumb2(){

$fn=200;

thick = 1.2;
long = 27;
Rsmall = 3;
Rbig = 9;
hi = 15;

difference(){
    linear_extrude(height=hi,scale=1.07){
        translate([-20,-6,0]){
        square([long,thick]);

        translate([long,Rsmall+thick])
        difference(){
            circle(r=Rsmall+thick);
            circle(r=Rsmall);
            translate([-Rsmall,Rsmall])
            square([2*Rsmall,4*Rsmall],center=true);

            translate([thick,Rsmall])
            rotate(-45)
            square([2*Rsmall,2*Rsmall],center=true);
        }

        color("cyan")
        translate([0.777*long,Rsmall+thick])
        difference(){
            scale([1,0.8])
            circle(r=Rbig+thick);
            scale([1,0.8])
            circle(r=Rbig);
            rotate(6)
            translate([0,-1.5*Rbig-1.4*thick])
            square([3*Rbig,3*Rbig],center=true);

        }
    }
    }
    
        translate([-20,-6,0]){
    // thumb end round offs
    translate([0.25*long,0.9*thick,hi])
    rotate([0,90,0])
    rounder(r=hi/2,h=6*thick,f=89);

    translate([0.5*long,1.1*thick,0])
    rotate([0,-90,0])
    rounder(r=hi/2,h=4*thick,f=89);

    // pick end round offs
    translate([-1.5,-2,hi])
    rotate([-90,0,0])
    scale([1.25,1,1])
    rounder(r=0.7*hi,h=4*thick,f=130);

    translate([-1.5,2,0])
    rotate([90,0,0])
    scale([1.25,1,1])
    rounder(r=0.7*hi,h=4*thick,f=130);
    
    // top cut
    translate([24,18,hi+3])
    rotate([0,10,0])
    rotate([90,0,0])
    scale([3,1,1])
    cylinder(r=6,h=20);

    }
}

}

//-----------------------------------------------------------------------------------
// 346 style
module flat7blank(T=1.2,R=28,X=14,F=600,Z=0.2){

    intersection(){
      translate([X,0,0])
      cylinder(r1=R,r2=1.02*R,h=T/2,$fn=F);
      rotate([0,0,120])
      translate([X,0,0])
      cylinder(r1=R,r2=1.02*R,h=T/2,$fn=F);
      rotate([0,0,240])
      translate([X,0,0])
      cylinder(r1=R,r2=1.02*R,h=T/2,$fn=F);
    }
}

//-----------------------------------------------------------------------------------
// 346 style
module flat7lower(T=1.2,R=28,X=14,F=600,Z=0.2){

    difference(){
      flat7blank(T=T,R=R,X=X,F=F,Z=Z);

      translate([-1.5,2.0,0])
      rotate([0,0,32])
      scale([25,25,Z])
      //~ guitarPick2();
      //~ guitarPick3();
      guitarPick4();
    }
}
//-----------------------------------------------------------------------------------
// 346 style
module flat7upper(T=1.2,R=28,X=14,F=600,Z=0.2){

//    difference(){
      flat7blank(T=T,R=R,X=X,F=F,Z=Z);

      translate([-1.5,2.0,-Z])
      rotate([0,0,32])
      scale([25,25,Z])
      //~ guitarPick2();
      //~ guitarPick3();
      guitarPick4();
//    }

}

//-----------------------------------------------------------------------------------
// 346 style
module flat7(T=1.2,R=28,X=14,F=600,Z=0.2){
  
  //~ flat7lower(T=T,R=R,X=X,F=F,Z=Zbottom);
  flat7upper(T=T,R=R,X=X,F=F,Z=Ztop);
  translate([0,0,T])
  rotate([180,0,0])
  flat7upper(T=T,R=R,X=X,F=F,Z=Ztop);
    
}
//-----------------------------------------------------------------------------------
module flat7support(T=0.8,R=28,X=14,F=200){

  difference(){
    translate([0,0,-0.2])
    intersection(){
      translate([X,0,0])
      cylinder(r=R+1,h=T/2+0.2,$fn=F);
      rotate([0,0,120])
      translate([X,0,0])
      cylinder(r=R+1,h=T/2+0.2,$fn=F);
      rotate([0,0,240])
      translate([X,0,0])
      cylinder(r=R+1,h=T/2+0.2,$fn=F);
    }
    translate([0,0,0])
    //~ flat7lower();
    flat7upper();
  }
}

//-----------------------------------------------------------------------------------
// teardrop style
module tear2half(T=0.8,R=8,X=5.1,F=99,Z=0.2){
  
  hull(){
    translate([1.45*X,0,0])
    scale([0.95,1.4,1])
    #cylinder(r1=R,r2=1.02*R,h=T/2,$fn=F);
    
    rotate([0,0,113])
    translate([X,0,0])
    scale([0.7,1.95,1])
    #cylinder(r1=0.85*R,r2=0.87*R,h=T/2,$fn=F);
    
    rotate([0,0,-113])
    translate([X,0,0])
    scale([0.7,1.95,1])
    cylinder(r1=0.85*R,r2=0.87*R,h=T/2,$fn=F);
  }

  translate([0,0,-Z])
  rotate([0,0,0])
  scale([23,23,Z])
  guitarTear2();
    
}
//-----------------------------------------------------------------------------------
module tear2(T=0.8,R=8,X=5.1,F=99,Z=0.2){

  tear2half(T=T,R=R,X=X,F=F,Z=Zbottom);
  translate([0,0,T])
  rotate([180,0,0])
  tear2half(T=T,R=R,X=X,F=F,Z=Ztop);

}

//-----------------------------------------------------------------------------------
// teardrop style
module tear2support(T=0.8,R=8,X=5.2,F=99,Z=0.2){
  
  difference(){
    translate([0,0,-Z])
    scale([1.05,1.05,1])
      hull(){
        translate([1.45*X,0,0])
        scale([0.95,1.4,1])
        #cylinder(r1=R,r2=1.02*R,h=T/2,$fn=F);
        
        rotate([0,0,113])
        translate([X,0,0])
        scale([0.7,1.95,1])
        #cylinder(r1=0.85*R,r2=0.87*R,h=T/2,$fn=F);
        
        rotate([0,0,-113])
        translate([X,0,0])
        scale([0.7,1.95,1])
        cylinder(r1=0.85*R,r2=0.87*R,h=T/2,$fn=F);
      }
    
    tear2half();
  }
}
//-----------------------------------------------------------------------------------
// teardrop style
module tear3half(T=0.6,R=8,X=5.2,F=99,Z=0.2,side=0){
  
  hull(){
    translate([1.45*X,0,0])
    scale([0.95,1.4,1])
    cylinder(r1=R,r2=1.02*R,h=T/2,$fn=F);
    
    rotate([0,0,115])
    translate([X,0,0])
    scale([0.7,1.95,1])
    cylinder(r1=0.85*R,r2=0.87*R,h=T/2,$fn=F);
    
    rotate([0,0,-115])
    translate([X,0,0])
    scale([0.7,1.95,1])
    cylinder(r1=0.85*R,r2=0.87*R,h=T/2,$fn=F);
  }
  
  if(side==0){
    translate([0,0,-Z])
    rotate([0,0,0])
    scale([23,23,Z])
    guitarTear2();
  }else{
    translate([1,0.5,0])
    rotate([180,0,0])
    scale([0.037,0.037,Z])
    guitarTear3();
    
    translate([2.5,0,0])
    rotate([0,0,90])
    rotate([180,0,0])
    linear_extrude(height=Z)
    text(Label, font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    
  }
    
}
//-----------------------------------------------------------------------------------
module tear3(T=0.6,R=8,X=5.2,F=99,Z=0.2){

  tear3half(T=T,R=R,X=X,F=F,Z=Zbottom,side=1);
  translate([0,0,T])
  rotate([180,0,0])
  tear3half(T=T,R=R,X=X,F=F,Z=Ztop,side=0);

}

//-----------------------------------------------------------------------------------
// teardrop style
module tear3support(T=0.6,R=8,X=5.2,F=99,Z=0.2){
  
base=0.2;
  
  difference(){
    translate([0,0,-Z-base])
    scale([1.05,1.05,1])
      hull(){
        translate([1.45*X,0,0])
        scale([0.95,1.4,1])
        cylinder(r1=R,r2=1.02*R,h=T/2+Z+base,$fn=F);
        
        rotate([0,0,113])
        translate([X,0,0])
        scale([0.7,1.95,1])
        cylinder(r1=0.85*R,r2=0.87*R,h=T/2+Z+base,$fn=F);
        
        rotate([0,0,-113])
        translate([X,0,0])
        scale([0.7,1.95,1])
        cylinder(r1=0.85*R,r2=0.87*R,h=T/2+Z+base,$fn=F);
      }
    
    #tear3half(T=T,side=1);
  }
}


//-----------------------------------------------------------------------------------
module guitarTear3(){
  
  render()
  intersection(){
    translate([0,0,-0.3])
    scale([1,1,0.02])
    surface(file="./guitarTear3.png", center = true);
    translate([0,0,0.5])
    cube([800,800,1],center=true);
  }
}  

//===================================================================================

Zbottom = 0.2;
Ztop = 0.2;


//~ guitarTear3();

//~ pickTestA();
//~ color("green")
//~ pickTestB();

//~ guitarTear2();

//~ tear2half();

//~ intersection(){
//~ scale([1.1,1.1,1])
//~ tear2();
//~ scale([1.1,1.1,1])
//~ tear2support();
//~ }


//~ intersection(){
//~ translate([0,0,2])


Label="4";

//~ scale([1.1,1.1,1])
//~ tear3half(side=1,T=1.2);

scale([1.1,1.1,1])
tear3(T=0.4);

scale([1.1,1.1,1])
tear3support(T=0.4);

//~ }


//~ scale([30,30,0.4])
//~ guitarPick2();

//~ thumb2();   // This is the good yellow one

//~ flat7(T=0.8);
//~ flat7support(T=0.8);


//===================================================================================
