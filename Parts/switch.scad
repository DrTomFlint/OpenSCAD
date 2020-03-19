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

//=================
 
Tol1=0.2;
switch(ang1=0);

translate([0,25,0])
difference(){
translate([-Tol1/2,-Tol1/2,-Tol1/2])  
switch(ang1=0,tol=Tol1);
switch(ang1=0);
}

//==================
