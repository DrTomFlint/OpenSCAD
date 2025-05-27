//======================================================================
// Menger1.scad
//
// Menger sponge created by cutting up a large cube
//
// DrTomFlint 7 May 2025
//======================================================================

// Menger sponge created by cutting up a large cube


thick=1.2;    // plate thickness
Ztab=1.2;     // depth of tabs into menge

F2=55;

//----------------------------------------------------------------------
module menge(T=3,l=90){
  
  echo("Smallest cube is ", l/pow(3,T), " mm");


  //difference(){
  intersection(){

  // magic rotation 
  rotate([0,0,0])
  rotate([0,35.5,0])
  rotate([45,0,0])

  difference(){
    cube(l, center = true);
    
    cutz2();
    
    rotate([90,0,0])
    cutz2();
    
    rotate([0,90,0])
    cutz2();

  }

  // add a way to cut it
  //color("cyan")
  translate([0,0,1.0*l])
  cube(2*l, center=true);
  }
  
}

//----------------------------------------------------------------------
module box(T=3,l=90){
  
  echo("Smallest cube is ", l/pow(3,T), " mm");


  //difference(){
  intersection(){

  // magic rotation 
  rotate([0,0,0])
  rotate([0,35.5,0])
  rotate([45,0,0])

  difference(){
    cube(l, center = true);
    
    //~ cutz2();
    
    //~ rotate([90,0,0])
    //~ cutz2();
    
    //~ rotate([0,90,0])
    //~ cutz2();

  }

  // add a way to cut it
  //color("cyan")
  translate([0,0,1.0*l])
  cube(2*l, center=true);
  }
  
}
//----------------------------------------------------------------------
module cuts(T=3,l=90){
  
  echo("Smallest cube is ", l/pow(3,T), " mm");


  //difference(){
  intersection(){

  // magic rotation 
  rotate([0,0,0])
  rotate([0,35.5,0])
  rotate([45,0,0]){

    cutz2(tol=-0.25);
    
    rotate([90,0,0])
    cutz2(tol=-0.25);
    
    rotate([0,90,0])
    cutz2(tol=-0.25);
  }

  // add a way to cut it
  //color("cyan")
  translate([0,0,1.0*l])
  cube(2*l, center=true);
  }
  
}

//----------------------------------------------------------------------
module box8a(){
  translate([l/2,-l/2,l/2])
  rotate([-45,0,0])
  rotate([0,-35.5,0])
  difference(){
    //~ box(T=T,l=l);
    menge(T=T,l=l);
    translate([0,0,66]) cube([400,400,100],center=true);
  }
}

//----------------------------------------------------------------------
module box8(){

  // lowers 4
  translate([0,0,-l])
  for(i=[0:3])
  rotate([0,0,i*90])
  box8a();
  
  // upper 4
  //~ translate([0,0,l])
  //~ for(i=[0:3])
  //~ rotate([0,0,i*90])
  //~ rotate([0,180,0])
  //~ box8a();
  
}

//----------------------------------------------------------------------
module cuts8a(){
  translate([l/2,-l/2,l/2])
  rotate([-45,0,0])
  rotate([0,-35.5,0])
  difference(){
    //~ box(T=T,l=l);
    cuts(T=T,l=l);
    translate([0,0,66]) cube([400,400,100],center=true);
  }
}
//----------------------------------------------------------------------
module cuts8(){

  // lowers 4
  translate([0,0,-l])
  for(i=[0:3])
  rotate([0,0,i*90])
  cuts8a();
  
  //~ // upper 4
  //~ translate([0,0,l+2*thick])
  //~ for(i=[0:3])
  //~ rotate([0,0,i*90])
  //~ rotate([0,180,0])
  //~ cuts8a();
  
}

//----------------------------------------------------------------------
module boxIn(tol=0){

s1=0.575*l-tol;
s2=0.575*l-tol;

  translate([0,0,0])
  rotate([180,0,0])
  cylinder(r1=s1,r2=0.01,h=s2,$fn=4);
  translate([0,0,0])
  cylinder(r1=s1,r2=0.01,h=s2,$fn=4);
}

//----------------------------------------------------------------------
module cutz2(tol=0){

  for (k = [0:T]) {
    w = l/pow(3,k);
    
    for (x = [(-l/2)+1.5*w:3*w:(l/2)-w], y = [(-l/2)+1.5*w:3*w:(l/2)-w]) {
      translate([x,y,0])cube([w+tol,w+tol,l+1],center=true);
    }
  
  }
}


//----------------------------------------------------------------------
module plate(tol=0){


  difference(){
    translate([0,0,thick/2])
    intersection(){
      cube([2*l,2*l,thick],center=true);
      rotate([0,0,45])
      cube([2.12*l,2.12*l,thick],center=true);
    }
    // recut the 4 largest
    translate([l/2,l/2,0])
    cube([l/3,l/3,20],center=true);
    translate([-l/2,l/2,0])
    cube([l/3,l/3,20],center=true);
    translate([-l/2,-l/2,0])
    cube([l/3,l/3,20],center=true);
    translate([l/2,-l/2,0])
    cube([l/3,l/3,20],center=true);
    
    // central cavity
    translate([0,0,thick/2])
    rotate([0,0,45])
    cube([0.75*l,0.75*l,3*thick],center=true);
  }
  
  difference(){
    cuts8();
    translate([0,0,-Ztab-l])
    cube([4*l,4*l,2*l],center=true);
    // recut the 4 largest
    translate([l/2,l/2,0])
    cube([l/3,l/3,20],center=true);
    translate([-l/2,l/2,0])
    cube([l/3,l/3,20],center=true);
    translate([-l/2,-l/2,0])
    cube([l/3,l/3,20],center=true);
    translate([l/2,-l/2,0])
    cube([l/3,l/3,20],center=true);
  }
  
  difference(){
    boxIn(tol=0.1);
    translate([0,0,thick])
    boxIn(tol=0.1);
  }
  
  // hinge
  difference(){
    union(){
      translate([l+2,0,-thick+0.4])
      rotate([90,0,0])
      cylinder(r=2,h=l,center=true,$fn=F2);
      translate([l,0,thick/2])
      cube([5,l,thick],center=true);
    }
    translate([l+4,l/5,thick/2])
    cube([10,l/5,6*thick],center=true);    
    translate([l+4,-l/5,thick/2])
    cube([10,l/5,6*thick],center=true);    
    translate([l+2,0,-thick+0.4])
    rotate([90,0,0])
    cylinder(r=1,h=l+2,center=true,$fn=F2);

    translate([l+8,l/2+6,-thick+0.4])
    rotate([0,0,45])
    cube([20,20,20],center=true);    
    translate([l+8,-l/2-6,-thick+0.4])
    rotate([0,0,45])
    cube([20,20,20],center=true);    
  }
}

//----------------------------------------------------------------------
module hinge(tol=0.2){

Zoff=3.5*thick;

  difference(){
    hull(){
      translate([l+2,l/5,-thick+0.4])
      rotate([90,0,0])
      cylinder(r=2,h=l/5-tol,center=true,$fn=F2);
      
      translate([l+2,l/5,-thick+0.4+Zoff])
      rotate([90,0,0])
      cylinder(r=2,h=l/5-tol,center=true,$fn=F2);
    }
    
    translate([l+2,0,-thick+0.4])
    rotate([90,0,0])
    cylinder(r=1,h=l+2,center=true,$fn=F2);
    translate([l+2,0,-thick+0.4+Zoff])
    rotate([90,0,0])
    cylinder(r=1,h=l+2,center=true,$fn=F2);
  }

}

//----------------------------------------------------------------------
module plateA(tol=0){

  difference(){
    plate();
    translate([0,0,thick/2])
    intersection(){
      cube([2*l-thick,2*l-thick,4*l],center=true);
      rotate([0,0,45])
      cube([2.12*l-thick,2.12*l-thick,4*l],center=true);
    }
  }
}

//----------------------------------------------------------------------
module plateB(tol=0){

difference(){
  intersection(){
    plate();
    translate([0,0,thick/2])
    intersection(){
      cube([2*l-thick,2*l-thick,4*l],center=true);
      rotate([0,0,45])
      cube([2.12*l-thick,2.12*l-thick,4*l],center=true);
    }
  }
  rotate([0,0,45])
  cube([0.75*l,0.75*l,2*l],center=true);
}

}

//----------------------------------------------------------------------
module plateC(tol=0){

  intersection(){
    plate();
    rotate([0,0,45])
    cube([0.75*l,0.75*l,2*l],center=true);
  }
  
}

//======================================================================

// Order
T=2; l=30;
//~ T=3; l=90;
//~ T=4; l=270;

//~ menge(T=T,l=l);

//~ cutz2();


// remove top for 8-ball construction
//~ difference(){
//~ menge(T=T,l=l);
//~ translate([0,0,66]) cube([400,400,100],center=true);
//~ }



// tests for internal space
//~ box8();

//~ boxIn(tol=0.4);

//~ plate();

// cut up plate for multi-color prints
//~ plateA();     // outer rim and hinge
//~ plateB();     // inner flat
//~ plateC();     // pyramid tent

//~ translate([0,0,2*thick+0.2])
//~ rotate([180,0,0])
//~ plate();


hinge();

//~ cuts8a();
//~ box8a();

//~ cuts8();


//======================================================================
