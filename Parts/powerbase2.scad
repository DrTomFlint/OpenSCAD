// powerbase
// base plate for the dcdc supply and power plug

use <pibase.scad>
use <powerlid.scad>

module powerbase(){
// base borrowed from pieye
translate([25,25,0]){
difference(){
    color("yellow")
    linear_extrude(height=9.4+0.6)
    offset(r=2,$fn=80)    
    square(size=[14,38],center=true);

    translate([1,8,2])
    color("orange")
    linear_extrude(height=10)
    offset(r=0.5,$fn=16)    
    square(size=[11,20.5],center=true);

    translate([0,-11.5,0.6])
    color("pink")
    linear_extrude(height=10)
    offset(r=0.5,$fn=16)    
    square(size=[13.5,14],center=true);

    translate([-0.5,-22,2])
    color("green")
    cube([7,5,10]);

    translate([-7.25,-6,2])
    color("blue")
    cube([5,10,10]);

    translate([-10,-12,5])
    color("orange")
    cube([6,16,10]);
}

/*
    translate([1,12.25,0])
    color("red")
    linear_extrude(height=3.4)
    offset(r=0.5,$fn=16)    
    square(size=[12,15.5],center=true);
*/
    translate([-7.25,-19,0])
    color("blue")
    cube([3.5,5,10]);

}
}
//---
module powerplug(){

translate([28,3.5,5]){
    rotate([90,0,0])
    cylinder(r1=10.5/2,r2=8/2,h=25);
}
}

//-----------
module powerbasecut(){
    color("yellow")
    translate([25,25,0]){
    linear_extrude(height=9.4+0.6)
    offset(r=2+0.2,$fn=80)    
    square(size=[14,38],center=true);
    }
}

//------------
powerbase();
powerplug();

/*
translate([0,0,0])
powerlid();
*/

//pibase();


//---------- end of file ------------------
