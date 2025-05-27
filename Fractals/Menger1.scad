//======================================================================
// Menger1.scad
//
// Menger sponge created by cutting up a large cube
//
// DrTomFlint 7 May 2025
//======================================================================

// Menger sponge created by cutting up a large cube


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
  for(i=[0:3])
  rotate([0,0,i*90])
  box8a();
  
  // upper 4
  //~ translate([0,0,2*l])
  //~ for(i=[0:3])
  //~ rotate([0,0,i*90])
  //~ rotate([0,180,0])
  //~ box8a();
  
}

//----------------------------------------------------------------------
module boxIn(tol=0){

s1=0.575*l-tol;
s2=0.575*l-tol;

  translate([0,0,l])
  rotate([180,0,0])
  cylinder(r1=s1,r2=0.01,h=s2,$fn=4);
  translate([0,0,l])
  cylinder(r1=s1,r2=0.01,h=s2,$fn=4);
}

//----------------------------------------------------------------------
module cutz2(){

  for (k = [0:T]) {
    w = l/pow(3,k);
    
    for (x = [(-l/2)+1.5*w:3*w:(l/2)-w], y = [(-l/2)+1.5*w:3*w:(l/2)-w]) {
      translate([x,y,0])cube([w,w,l+1],center=true);
    }
  
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
box8();

boxIn(tol=0.4);

//======================================================================
