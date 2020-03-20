// Menger sponge created by cutting up a large cube

l = 54;  // length of side

// Order
T = 3;

echo("Smallest cube is ", l/pow(3,T), " mm");


difference(){
//intersection(){

rotate([0,0,0])
rotate([0,35,0])
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

//cutz2();

module cutz2() {
  for (k = [0:T]) {
    w = l/pow(3,k);
    
    for (x = [(-l/2)+1.5*w:3*w:(l/2)-w], y = [(-l/2)+1.5*w:3*w:(l/2)-w]) {
      translate([x,y,0])cube([w,w,l+1],center=true);
    }
  
  }
}

