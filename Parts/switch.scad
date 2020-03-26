// switch.scad
// micro switch 



//--------------
module switch(
tol=0,  // include for cutting
ang1=5,  // angle of the lever arm
wirecut=0   // set to 1 for clearance around terminals
){

difference(){
  // switch body
  cube([20+tol,9.9+tol,6.5+tol]);  

  // mounting hole NO
  translate([5.0,2.8,-1])
  cylinder(r=2.3/2-tol,h=10,$fn=22);

  // mounting hole NC
  translate([14.75,2.8,-1])
  cylinder(r=2.3/2-tol,h=10,$fn=22);
}

// lump on top body
translate([0,9.9,0])
cube([9.9+tol,0.7+tol,6.5+tol]);  
  
// common leg
translate([1.5,-4.1,1.5])
cube([0.5+tol,4.1+tol,3.2+tol]);

// normally open leg
translate([10.3,-4.1,1.5])
cube([0.5+tol,4.1+tol,3.2+tol]);

// normally closed leg
translate([17.7,-4.1,1.5])
cube([0.5+tol,4.1+tol,3.2+tol]);

// lever fulcrum
translate([2.8,10.4,1.25])
cube([1.5+tol,1.5+tol,4.0+tol]);

// -------- these parts move:

// lever arm
translate([2.8,11.6,1.25])
rotate([0,0,ang1]){
  
  // arm
  cube([19.2+tol,0.35+tol,4.0+tol]);
  
  // roller
  translate([17.5,3.0,0])
  cylinder(r=4.5/2+tol,h=4+tol,$fn=22);
  
  // roller support
  translate([17.5,3.0,-1.5])
  cylinder(r=3.7/2+tol,h=6.9+tol,$fn=22);
  color("cyan")
  translate([17.5-1.75,0,-1.5])
  cube([3.7+tol,3+tol,1.5+tol]);
  color("cyan")
  translate([17.5-1.75,0,-1.5+5.4])
  cube([3.7+tol,3+tol,1.5+tol]);
  
}

}  // end of module switch
//------------------------------------------
module switchcut(tol=0.15){
  
difference(){
  // switch body
  translate([-tol/2,-tol/2,-tol/2])
  cube([20+tol,9.9+tol,13+tol]);  

  // mounting hole NO
  translate([5.0,2.8,-1])
  cylinder(r=2.3/2-tol/2,h=4,$fn=22);

  // mounting hole NC
  translate([14.75,2.8,-1])
  cylinder(r=2.3/2-tol/2,h=4,$fn=22);
}

translate([-tol/2,-tol/2,-tol/2]){

// lump on top body
translate([0,9.9,0])
cube([9.9+tol,0.7+tol,13+tol]);  
  
// common leg
translate([0.5,-4.3,1])
cube([3,4.5,12]);

// normally open leg
translate([9.3,-4.3,1])
cube([3,4.5,12]);

// normally closed leg
translate([16.7,-4.3,1])
cube([3,4.5,12]);

// arm
translate([1.5,8,0])
cube([16.5,13,13]);

// roller
translate([16,11,-1])
cube([7.5,10,15]);

// insertion cut
translate([0,0,6.4])
cube([20+tol,16,6.5]);  
}

}
  
//==========================================

//translate([0,0,6.5])
color("red") 
switch(ang1=0);
color("green") 
switch(ang1=12);

difference(){
  translate([-5,-5,-5])  
  cube([30,20,16]);
  switchcut(tol=0.15);
}

if(0){
Tol1=0.2;
translate([0,25,0])
difference(){
  translate([-Tol1/2,-Tol1/2,-Tol1/2])  
  switch(ang1=0,tol=Tol1);
  switch(ang1=0);
}
}

//==================
