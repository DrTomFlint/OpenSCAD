//=================================================================================
// prusaDry.scad
//
// Dry box for the Prusa 5x spools
//
// DrTomFlint, 28 Nov 2024
//----------------------------------------------------------------------------------

use <../Parts/rounder.scad>

dx=133.5+8.3;
dy=230;
z1=115;

//----------------------------------------------------------------------------------
// axle box for the active side
module axleBoxA(){
  
  difference(){
    translate([0,0,2])
    cube([13,16,10],center=true);

    reelAxle(tol=0.25);
    
    translate([-3,0,6])
    cube([7.7,8,4],center=true);
    
  }
  
}

//---------------------------------------------------------------------------------
module reelAxle(tol=0){
  
  // main shaft with 1 flat side
  difference(){
    cylinder(r=7.65/2+tol/2,h=127.9+tol,$fn=88);
    translate([2.775,-4,-1])
    cube([8,8,130]);
  }
  
  // box at lower end
  translate([-6.8,-7.8/2,0])
  cube([6.8,7.8,5.4]);

  // ramp on box end
  difference(){
    color("cyan")
    translate([-6.8,-5.25,0])
    rotate([0,0,45])
    cube([7.5,7.5,5.4]);

    color("gray")
    translate([-21.8,-7.5,-1])
    cube([15,15,7]);
  }
  
  // ridges on sides of box
  color("pink")
  translate([-6.8,-3.3,2.7])
  rotate([0,90,0])
  scale([1,2,1]){
    cylinder(r1=1.2,r2=1.1,h=7.3,$fn=22);
    translate([0,0,7.29])
    cylinder(r2=0.7,r1=1.1,h=2.27,$fn=22);
  }

  color("orange")
  translate([-6.8,3.3,2.7])
  rotate([0,90,0])
  scale([1,2,1]){
    cylinder(r1=1.2,r2=1.1,h=7.3,$fn=22);
    translate([0,0,7.29])
    cylinder(r2=0.7,r1=1.1,h=2.27,$fn=22);
  }

}

//---------------------------------------------------------------------------------
module reelPlus(){

// model reel and rewinder hub
h1=1.2;   // axle sticking out of the hub
h2=16.3;  // knobby adjustment wheel with clutch and spring
h3=5;     // thickness of reel sides
h4=46+0;    // width of hub fiber part
h5=h1+h2+h3+h4+h3;  // total height to the wingnuts
h6=16;    // thickness of wingnuts
  
  // adjustable side of hub
  color("red")
  cylinder(r=11.9/2,h=h1,$fn=22);
  
  color("gray"){
  translate([0,0,h1])
  cylinder(r=105/2,h=h2,$fn=88);

  // main reel
  translate([0,0,h1+h2])
  cylinder(r=200/2,h=h3,$fn=88);
  translate([0,0,h1+h2+h3])
  cylinder(r=150/2,h=h4,$fn=88);
  translate([0,0,h1+h2+h3+h4])
  cylinder(r=200/2,h=h3,$fn=88);
  
  // wing nuts
  translate([0,0,h5])
  cylinder(r=42,h=h6,$fn=88);
  // threaded shaft
  translate([0,0,h1])
  cylinder(r=30/2,h=108-h1,$fn=88);
  }
  
  // add the axle
  color("orange")
  translate([0,0,-6.5])
  reelAxle();

  
}

//----------------------------------------------------------------------------------
module box(){

  // 2 side panels
  for(i=[0,3]){
    translate([dx*i-14.5,115,0])
    cube([8.6,460,2*z1],center=true);
  }
  // 2 middle panels
  for(i=[1,2]){
    translate([dx*i-14.5,115,-z1/2])
    cube([8.6,460,z1],center=true);
  }
  // front and back
  translate([198,-115,0])
  cube([434,8.6,2*z1],center=true);
  translate([198,-115+460,0])
  cube([434,8.6,2*z1],center=true);

}

//---------------------------------------------------------------------------
module centerBlock(){
x0=0;
y0=0;
z0=0;
c0=40;

z1=2*z0;

  difference(){
    translate([3.5,0,z0+1.5-c0/2+10])
    cube([3,34,25],center=true);
    translate([5,0,5])
    rotate([0,-45,0])
    cube([3,50,3],center=true);
    
    
      translate([0,12,z0+1.5-c0/2+18])
      rotate([0,90,0])
      cylinder(r=2,h=15,center=true,$fn=99);
      translate([0,-12,z0+1.5-c0/2+18])
      rotate([0,90,0])
      cylinder(r=2,h=15,center=true,$fn=99);
  }
  
  translate([5,8,z0+1.5-c0/2+8.5])
  rotate([90,0,0])
  rotate([0,0,-90])
  bevel(x=10,y=7,h=16);
  
  translate([5,0,z0+1.5-c0/2+15])
  rotate([0,90,0])
  axleBoxA();

}

  
//---------------------------------------------------------------------------
module endBlock(){
x0=0;
y0=0;
z0=0;
c0=40;

z1=2*z0;

  difference(){
    translate([x0/2-10,0,z0+1.5-c0/2+18])
    cube([14,24,18],center=true);

    hull(){
      translate([x0/2-10,0,z0+1.5-c0/2+18])
      rotate([0,90,0])
      cylinder(r=7.6/2,h=15,center=true,$fn=99);

      translate([x0/2-10,0,z0+1.5-c0/2+18+16])
      rotate([0,90,0])
      cylinder(r=7.6/2,h=15,center=true,$fn=99);
    }
    
    translate([x0/2-10-1.2,0,z0+1.5-c0/2+18+17])
    rotate([45,0,0])
    cube([14,20,20],center=true);
  }

  difference(){
    translate([x0/2-4+0.4,0,z0+1.5-c0/2+18])
    cube([1.2,36,28],center=true);
   
    translate([x0/2-4,0,z0+1.5-c0/2+18])
    rotate([0,90,0])
    cylinder(r=2,h=15,center=true,$fn=99);
  }

  translate([x0/2-1.2-3,12,z0+1.5-11])
  rotate([90,0,0])
  rotate([0,0,180])
  rounder(r=5,h=24,f=99);

}


//----------------------------------------------------------------------------------
module lid(){

x0=280;
y0=230;
z0=110;
c0=40;

z1=2*z0;

  // top
  translate([-3,-3,220])
  cube([x0+6,y0+6,3]);

  // left side
  translate([-3,-3,220-33])
  cube([3,y0+6,30]);

if(0){  
  // right side
  translate([x0-3,3,3])
  cube([3,y0-6,30]);
  
  // front side
  color("cyan")
  translate([0,0,3])
  cube([x0,3,30]);
  
  // back side
  color("green")
  translate([0,y0-3,3])
  cube([x0,3,30]);
}
  
}


//-------------------------------------------------------------------------------
module set6(){

  for(i=[0:2]){
    for(j=[0:1]){
      translate([dx*i,dy*j,0])
      set();
    }
  }

}

//-------------------------------------------------------------------------------
module set(){


  rotate([0,90,0])
  reelPlus();
  translate([125+1,0,0])
  endBlock();
  translate([-12,0,0])
  centerBlock();
  
}

//==================================================================================

//~ endBlock();
centerBlock();

  //~ box();
  //~ lid();

  //~ set();
  //~ set6();
  
//==================================================================================
