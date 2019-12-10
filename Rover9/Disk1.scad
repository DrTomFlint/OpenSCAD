// Disk1
// disk for motor attachment

use <Beam1.scad>

module disk1(){
    
f1=88;

difference(){
union(){
    cylinder(r1=21/2,r2=23/2,h=1,$fn=f1);

    translate([0,0,6.8])
    cylinder(r1=23/2,r2=21/2,h=1,$fn=f1);

    translate([0,0,1])
    cylinder(r=23/2,h=7.8-2,$fn=f1);
}

translate([0,8,0])
pin1cut();
translate([8,0,0])
pin1cut();
translate([0,-8,0])
pin1cut();
translate([-8,0,0])
pin1cut();

pin1cut();
}
}//----------end module disk1 -------------

disk1();


