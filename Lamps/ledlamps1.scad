// ledlamps1.scad
// Mounts to place chandelier crystals in front of cheap led lights

F1=88;
F2=22;

// ----------------------------------------------------------
module xa(tol=0,hole=1,type=1){
  xtal(r1=3.3,zt=-4,r2=7,z2=21,r3=0,z3=31.6,tol=tol,hole=hole,type=type);
}

// ----------------------------------------------------------
module xb(tol=0,hole=1,type=2){
  xtal(r1=1.7,zt=-4,r2=11.5,z2=31,r3=6,z3=45,tol=tol,hole=hole,type=type);
}
  
// ----------------------------------------------------------
module xc(tol=0,hole=1,type=3){
  xtal(r1=1.7,zt=-4,r2=12.3,z2=15,r3=0,z3=23,tol=tol,hole=hole,type=type);
}
  
// ----------------------------------------------------------
module xd(tol=0,hole=2,type=4){
  xtal(r1=0.2,zt=-2,r2=3.5,z2=11,r3=9,z3=26,tol=tol,hole=hole,type=type);

}
  
// ----------------------------------------------------------
module xtal(
r1=3.3,
zt=-4,
r2=7,
z2=21,
r3=0,
z3=31.6,
hole=1,
tol=0,
type=1){

difference(){
  union(){
    if(type!=2){
    // base
    translate([0,0,zt-tol])
    rotate([0,0,180/8])
    cylinder(r1=r1+tol,r2=r2+tol,h=z2-zt+tol,$fn=8);
    }
    if(type==2){
    // base
    translate([0,0,zt-tol])
    //rotate([0,0,180/8])
    cylinder(r1=r1+tol,r2=r2+tol,h=z2-zt+tol,$fn=8);
    }
    if(type==4){
      rotate([0,0,180/8])
      rotate([90,0,0])
      cylinder(r=3.3+tol,h=2.6+tol,$fn=27,center=true);
    }
  }
  // the string hole
  if(hole){
    rotate([90,0,0])
    cylinder(r=1.3,h=20,$fn=23,center=true);
  }
}  
  // crown
  if(type!=4){
    translate([0,0,z2])
    cylinder(r1=r2+tol,r2=r3+tol,h=z3-z2+tol,$fn=8);
  }
  if(type==4){
    translate([0,0,z2])
    rotate([0,0,180/8])
    cylinder(r1=r2+tol,r2=r3+tol,h=z3-z2+tol,$fn=8);
  }
  // extra on type D
  if(type==4){
    translate([0,0,z3])
    cylinder(r1=r3,r2=0,h=18,$fn=8);
  }


}


//-----------------------------
module led1(tol=0,legs=0){

hull(){
  translate([1,-1,0])
  rotate([0,0,-45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=3,$fn=22);

  translate([1,-1,1])
  rotate([0,0,-45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=3,$fn=22);

  translate([1.5,0,0.75])
  scale([1.5,1.5,1.25])
  sphere(r=tol+1,$fn=44);
}
hull(){
  translate([1,,1,0])
  rotate([0,0,180+45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=3,$fn=22);

  translate([1,1,1])
  rotate([0,0,180+45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=3,$fn=22);

  translate([1.5,0,0.75])
  scale([1.5,1.5,1.25])
  sphere(r=tol+1,$fn=44);
}

if(legs>01){
  
  translate([1,-1,0])
  rotate([0,0,-45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=legs,$fn=22);

  translate([1,-1,1])
  rotate([0,0,-45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=legs,$fn=22);
  translate([1,,1,0])
  rotate([0,0,180+45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=legs,$fn=22);

  translate([1,1,1])
  rotate([0,0,180+45])
  rotate([90,0,0])
  cylinder(r=tol+0.5,h=legs,$fn=22);
}  
}
//-------------------------------------------------
module base(type=1,hole=1){

  difference(){
    hull(){
      // minimal boss
      translate([0,0,-6])
      cylinder(r1=4,r2=7,h=15,$fn=F2);
      // bump to contain the LED
      translate([-9,0,1])
      cylinder(r=4,h=8,$fn=F2);
      
      if(type==3){
        // add extra boss
        translate([0,0,-6])
        cylinder(r1=4,r2=11.5,h=15,$fn=F2);
      }        
      
      
    }
    // crystal cut
    if(type==1){
      xa(tol=0.8,hole=0);
    }
    if(type==2){
      xb(tol=0.8,hole=0);
    }
    if(type==3){
      xc(tol=0.8,hole=0);
    }
    if(type==4){
      xd(tol=0.8,hole=0);
      translate([0,0,-1])
      rotate([0,0,180/8])
      scale([2.5,1,1,])
      cylinder(r=2,h=16,$fn=22);
    }
    
    // cut to secure crystal through its hole
    if(hole){
      rotate([90,0,0])
      cylinder(r=1.8,h=20,$fn=23,center=true);
      translate([0,0,1.5])
      rotate([90,0,0])
      cylinder(r=1.8,h=20,$fn=23,center=true);
    }
    
    // cut for the LED
    hull(){
      translate([-9,0,3])
      led1(tol=0.5,legs=10);
      
      translate([-19,0,3])
      led1(tol=0.5,legs=10);
    }
    
    // retainer for the LED
    translate([-10.5,0,-5])
    cylinder(r=1.2,h=20,$fn=16);

    // cut for the light 
    translate([-4,0,3])
    rotate([0,90,0])
    cylinder(r=2,h=5,$fn=12,center=true);

  }
  // add back a printing closure
    translate([-12.3,0,1])
    cylinder(r=0.8,h=8,$fn=16);
  
}
//===================================================

translate([0,40,0])
base(type=1);

translate([40,40,0])
base(type=2);

translate([80,40,0])
base(type=3);

translate([120,40,0])
base(type=4);

/*

led1();

translate([15,0,0])
difference(){
  led1(tol=0.2);
  led1(tol=0);
}

translate([30,0,0])
led1(legs=10);

translate([0,-40,0])
xa();

translate([15,-40,0])
difference(){
  xa(tol=0.6);
  xa(tol=0);
}

translate([0,-80,0])
xb();

translate([0,-120,0])
xc();

translate([0,-160,0])
xd();

translate([40,-160,0])
xd(tol=0.3,hole=0);

*/
//===============================================
