//=================================================================================
// DcfcLegs.scad
// Legs for the DCFC controller board
//
// Modified for the DCC board 15 June 2021
// Dr Tom Flint, for Rivian, 22 March 2021
//=================================================================================


module legs1(){

difference(){
  union(){
    cylinder(r=4,h=8,$fn=95);
    translate([0,0,8])
    cylinder(r=2.5,h=2,$fn=95);
    translate([0,0,8+1.8])
    cylinder(r1=2.5,r2=2.7,h=0.6,$fn=95);
    translate([0,0,8+1.8+0.6])
    cylinder(r1=2.7,r2=2,h=1.2,$fn=95);
  }
//  translate([0,0,5])
//  cylinder(r=0.5,h=16,$fn=89,center=true);
  translate([0,0,11])
  cube([0.5,8,6],center=true);
}

}

//=================================================================================
d=12;
translate([0,0,0]) legs1();


translate([d,0,0]) legs1();
translate([0,d,0]) legs1();
translate([d,d,0]) legs1();
translate([0,2*d,0]) legs1();
translate([d,2*d,0]) legs1();

translate([0,d/4,0]) cube([1.2,d/2,0.6]);
translate([d,d/4,0]) cube([1.2,d/2,0.6]);
translate([d/4,d,0]) cube([d/2,1.2,0.6]);
translate([d/4,0,0]) cube([d/2,1.2,0.6]);

translate([0,d/4+d,0]) cube([1.2,d/2,0.6]);
translate([d,d/4+d,0]) cube([1.2,d/2,0.6]);
translate([d/4,2*d,0]) cube([d/2,1.2,0.6]);


//=================================================================================




