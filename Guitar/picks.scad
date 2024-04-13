//=================================================================================
// picks.scad
//
//
// Dr Tom Flint, 3 Dec 2022
//=================================================================================

use <../Parts/rounder.scad>

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
module flat1half(T=1.2,R=28,X=14,F=99){
  
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
// soft center section of TPU
module flat1soft(T=1.2,R=28,X=14,F=99){
  
    cylinder(r1=R/4,r2=1.02*R/4,h=T/3,$fn=7);
    translate([0,0,2*T/3])
    cylinder(r2=R/4,r1=1.02*R/4,h=T/3+0.2,$fn=7);

}

//-----------------------------------------------------------------------------------
// 346 style
module flat1(T=1.2,R=28,X=14,F=99){

  difference(){
    union(){
      flat1half(T=T,R=R,X=X,F=F);
      translate([0,0,T])
      rotate([180,0,0])
      flat1half(T=T,R=R,X=X,F=F);
    }
    flat1soft(T=T,R=R,X=X,F=F);
  }

}

//-----------------------------------------------------------------------------------
// 346 style
module flat2half(T=1.2,R=28,X=14,F=99){
  
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
// soft center section of TPU
module flat2soft(T=1.2,R=28,X=14,F=99){
  
    cylinder(r1=R/5,r2=1.03*R/5,h=T/3,$fn=7);
    translate([0,0,2*T/3])
    cylinder(r2=R/5,r1=1.03*R/5,h=T/3+0.2,$fn=7);

}

//-----------------------------------------------------------------------------------
// 346 style
module flat2(T=1.2,R=28,X=14,F=99){

  difference(){
    union(){
      flat2half(T=T,R=R,X=X,F=F);
      translate([0,0,T])
      rotate([180,0,0])
      flat2half(T=T,R=R,X=X,F=F);
    }
    flat2soft(T=T,R=R,X=X,F=F);
  }

}
//-----------------------------------------------------------------------------------
// teardrop style
module tear1half(T=1.2,R=8,X=4.3,F=99){
  
  hull(){
    translate([1.8*X,0,0])
    scale([1,1.4,1])
    cylinder(r1=R,r2=1.02*R,h=T/2,$fn=F);
    rotate([0,0,110])
    translate([X,0,0])
    scale([0.8,2,1])
    cylinder(r1=0.85*R,r2=0.87*R,h=T/2,$fn=F);
    rotate([0,0,-110])
    translate([X,0,0])
    scale([0.8,2,1])
    cylinder(r1=0.85*R,r2=0.87*R,h=T/2,$fn=F);
  }
    
}
//-----------------------------------------------------------------------------------
// tear center section of TPU
module tear1soft(T=1.2,R=8,X=4.5,F=99){
  
    translate([0.5*R,0,0])
    cylinder(r1=0.75*R,r2=0.79*R,h=T/2,$fn=7);
    translate([0.5*R,0,T/2])
    cylinder(r2=0.75*R,r1=0.79*R,h=T/2,$fn=7);

}

//-----------------------------------------------------------------------------------
// tear style
module tear1(T=1.2,R=8,X=4.5,F=200){

  difference(){
    union(){
      tear1half(T=T,R=R,X=X,F=F);
      translate([0,0,T])
      rotate([180,0,0])
      tear1half(T=T,R=R,X=X,F=F);
    }
    tear1soft(T=T,R=R,X=X,F=F);
  }

}

//-----------------------------------------------------------------------------------
// 346 style
module flat3half(T=1.2,R=28,X=14,F=99){
  
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
  
  // diamond grip is 0.2 mm high, match the first layer height
  dx=4;
  dy=4;  
  for(x=[-2:2]){
    for(y=[-2:2]){
      translate([dx*x,dy*y,0])
      rotate([0,0,90*(-1*(x+y)%2)+45])
      cube([2,0.4,0.4],center=true);
    }
  }
          
}

//-----------------------------------------------------------------------------------
// 346 style, pointy
module flat3(T=1.2,R=28,X=14,F=200){

  flat3half(T=T,R=R,X=X,F=F);
  translate([0,0,T])
  rotate([180,0,0])
  flat3half(T=T,R=R,X=X,F=F);

}
//-----------------------------------------------------------------------------------
// 346 style, pointy
module flat3support(T=1.2,R=28,X=14,F=200){

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
    flat3half();
  }
}

//===================================================================================


//~ thumb2();   // This is the good yellow one

// #1 use defaults
//~ flat1();
//~ flat1soft();

// #2 more pointy
//~ translate([0,0,5])
//~ flat2(T=1.2, R=39, X=27, F=99);
//~ flat2soft(T=1.2, R=39, X=27, F=99);

// #3 teardrop 
//~ translate([0,0,5])
//~ tear1half();
//~ tear1();
tear1soft();

// #4 flat3 adjusted for carbon fiber and support instead of Flex and PetG
//~ flat3half();
//~ flat3();
//~ flat3support();

//===================================================================================
