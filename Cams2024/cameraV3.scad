//======================================================================
// cameraV3.scad
//
// Raspberry Pi Camera Model 3, larger lens box, same PCB footprint
//
// DrTomFlint, 19 Oct 2024
//======================================================================

//----------------------------------------------------------------------
module cameraV3(){

  // translate so lense is centered
  translate([0,2.5,0]){
  
    // pcb  
    difference(){
        linear_extrude(height=1.1)
        offset(r=1,$fn=22)
        square([23,22],center=true);

        translate([10.5,9.8,0])
        cylinder(r=1,h=3,$fn=22);

        translate([-10.5,9.8,0])
        cylinder(r=1,h=3,$fn=22);

        translate([10.5,9.8-12.5,0])
        cylinder(r=1,h=3,$fn=22);

        translate([-10.5,9.8-12.5,0])
        cylinder(r=1,h=3,$fn=22);
    }

    // lens and box
    translate([0,-2.7,0]){
        linear_extrude(height=6.5)
        square([11,11],center=true);
        translate([0,0,6.5])
        cylinder(r1=8/2,r2=6/2,h=1.5,$fn=22);
        translate([0,0,6.5+1.5])
        cylinder(r=6/2,h=1.5,$fn=22);
    }

    // cable off lens box
    color("red")
    translate([0,5.5,1.25])
    cube([12,8.5,2.5],center=true);

    // main cable
    color("green")
    translate([0,-12+3.5,-1.5])
    cube([21,7,3],center=true);

    // ribbon if needed
    color("orange")
    translate([0,-14,-1])
    linear_extrude(height=0.4)
    square([16.4,10],center=true);

    // component clearance on backside
    //color("red")
    translate([0,0,-1.5])
    difference(){
        linear_extrude(height=1.5)
        offset(r=1,$fn=22)
        square([23-0.5,22-0.5],center=true);

        translate([10.5,9.8,-0.2])
        cylinder(r=2.5,h=2,$fn=22);

        translate([-10.5,9.8,-0.2])
        cylinder(r=2.5,h=2,$fn=22);

        translate([10.5,9.8-12.5,-0.2])
        cylinder(r=2.5,h=2,$fn=22);

        translate([-10.5,9.8-12.5,-0.2])
        cylinder(r=2.5,h=2,$fn=22);
    }
  }
}

//======================================================================

cameraV3();

//======================================================================

