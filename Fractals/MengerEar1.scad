//======================================================================
// MengerEar1.scad
//
// Menger sponge created by cutting up a large cube, then slice up the 
// sponge to get earrings.
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
module cutz2(){

  for (k = [0:T]) {
    w = l/pow(3,k);
    
    for (x = [(-l/2)+1.5*w:3*w:(l/2)-w], y = [(-l/2)+1.5*w:3*w:(l/2)-w]) {
      translate([x,y,0])cube([w,w,l+1],center=true);
    }
  
  }
}

//----------------------------------------------------------------------
module ear1(){

}

//======================================================================



// Order
//~ T=2; l=30;
T=3; l=90;
//~ T=4; l=270;

menge(T=T,l=l);

//~ cutz2();

//======================================================================
