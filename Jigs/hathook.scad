// hathook.scad
// hooks to attach face mask elastics to your hat instead of ears.
use <../Parts/rounder.scad>

difference(){
  union(){
    // base
    cube([10,8,1.5]);
    translate([10,4,0])
    cylinder(r=4,h=1.5,$fn=44);
    translate([-1,4,0])
    scale([0.6,1,1])
    cylinder(r=4,h=1.5,$fn=44);

    // riser
    translate([2.5,8,0])
    rotate([0,0,180])
    linear_extrude(height=4,scale=[0.5,1])
    square([4,8]);
    //cube([2,8,3]);

    // hook
    translate([0,0,2.5])
    cube([8,8,1.5]);
    translate([8,4,2.5])
    cylinder(r=4,h=1.5,$fn=44);
  }
  translate([-1.5,5.5,2])
  cylinder(r=0.5,h=8,center=true,$fn=33);
  translate([-1.5,2.5,2])
  cylinder(r=0.5,h=8,center=true,$fn=33);

  translate([12.2,5.5,2])
  cylinder(r=0.5,h=8,center=true,$fn=33);
  translate([12.2,2.5,2])
  cylinder(r=0.5,h=8,center=true,$fn=33);

  color("red")
  translate([0,-1,4])
  rotate([-90,0,0])
  rounder(r=1,h=10,f=22);
}

