// BikeLights4e
// This is the lid for v4 hex
use <Lights4a.scad>
use <Lights4b.scad>

module Corner1(){
//--------------------------------------------
difference(){
//  Connectors form outer wall, all around loop
union(){
color("red"){
for(i=[0:3]){
    translate([35,-10+16.7*i,9+14]) {
        Rx1();
        Ferrule3();
    }
}
}
color("green"){
for(i=[0:3]){
    translate([35,-10+16.7*i,7+0]) rotate([180,0,0]) {
        Rx1();
        Ferrule3();
    }
}
}

color("yellow"){
for(i=[2:3]){
    translate([-16.7*1.5+16.7*i,-20,9+14]) rotate([0,0,-90]){
        Rx1();
        Ferrule3();
    }
}
}
color("yellow"){
for(i=[2:3]){
    translate([-16.7*1.5+16.7*i,-20,7+0]) rotate([180,0,-90]){
        Rx1();
        Ferrule3();
    }
}
}


// reinforce the corner joins
color("gray")
translate([32,-17,0])
linear_extrude(height=30){
    intersection(){
        circle(12,center=true);
        translate([0,-12,0]) square(12);
    }
}

}  // end of union

/*
// cut out the corner joins
color("blue")
translate([32.25,-17.25,0])
linear_extrude(height=13){
    square(size=[2.75,2.75],center=true);
}
color("green")
translate([32.25,-17.25,17])
linear_extrude(height=13){
    square(size=[2.75,2.75],center=true);
}

// vertical bolt hole
translate([38,-22,0])
cylinder(r=3,h=30,$fn=22);

// horizontal holes thru bolt hole
color("pink"){
    translate([38,-16,3])
    rotate([90,0,0]) cylinder(r=2,h=5,$fn=22);
    translate([31,-23,3])
    rotate([90,0,90]) cylinder(r=2,h=5,$fn=22);

    translate([38,-16,27])
    rotate([90,0,0]) cylinder(r=2,h=5,$fn=22);
    translate([31,-23,27])
    rotate([90,0,90]) cylinder(r=2,h=5,$fn=22);
}
*/

} // end of difference

// Add back the bolt hole to cut into the lid
// vertical bolt hole
translate([38,-22,-15])
cylinder(r=3,h=60,$fn=22);

// reinforce the corner joins
color("blue")
translate([31.0,-16.0,0])
linear_extrude(height=30){
    circle(2,center=true,$fn=22);
}

} // end of module Corner1


//===============================
// Top lid
difference(){
// main boss
translate([0,40,30-6]){
    difference(){
        union(){
            // main boss
            linear_extrude(height=5.2+4,scale=1)
            offset(r=15)
            square(size=[64,114],center=true);
            
            // upper bevel
            translate([0,0,5.2+4])
            linear_extrude(height=6,scale=0.96)
            offset(r=15)
            square(size=[64,114],center=true);
        }
        
        // cut to make overlapping lip
        linear_extrude(height=6,scale=1)
        offset(r=13)
        square(size=[64,114],center=true);
        
        // cut for the top window
        color("pink")
        translate([0,0,6])
        linear_extrude(height=5.2)
        square(size=[60,110],center=true);

        translate([0,0,6+5])
        linear_extrude(height=5,scale=1.1)
        offset(r=5,$fn=12)
        square(size=[60-18,110-18],center=true);
    }
    
}

//=========================
// The box walls
difference(){
    Corner1();
    /*
    // pass through for the wiring
    color("pink")
    translate([31.5,-2,0])
    linear_extrude(height=12){
        square(size=[4,8],center=true);
    }
    color("pink")
    translate([31.5,-2,30-12])
    linear_extrude(height=12){
        square(size=[4,8],center=true);
    }
    */
}


// no cuts in remaining 3 corners
translate([0,0,30]) rotate([0,180,0]) Corner1();
translate([0,13.4+4*16.7,30]) rotate([180,0,0]) Corner1();
translate([0,13.4+4*16.7,0]) rotate([180,180,0]) Corner1();

} // end of difference lid - walls

/*   
//==============================
// chassis
translate([-27,8,0]) rotate([0,0,0])
union(){
// 7a chassis
B1p=[ [0,1], [1,0], [53,0], [54,1], [54,79], [48,85], [6,85], [0,79] ];
translate([0,0,0]) color("gray")
linear_extrude(height=16)
polygon(points=B1p);
// wiring rises above chassis
linear_extrude(height=26)
offset(r=-2) polygon(points=B1p);

// Switch 1
translate([2,1.6,0]) color("blue"){
    union(){
        // switch body including solder lug clearance
        linear_extrude(height=12) 
        offset(r=tol)
         square(size=[13, 15]);
        
        translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.3,h=10,$fn=30);
    }
}
// Switch 2
translate([54-15,1.6,0]) color("blue"){
    union(){
        // switch body including solder lug clearance
        linear_extrude(height=12) 
        offset(r=tol)
         square(size=[13, 15]);
        
        translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.3,h=10,$fn=30);
    }
}
}

*/







