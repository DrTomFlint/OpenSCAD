// BikeLights4e
// This is the lid for v4 hex
use <Lights5a.scad>
use <Lights5b.scad>
use <Lights5f.scad>


//===============================
// Top lid
difference(){
// main boss
translate([0,40,30-3]){
    difference(){
        union(){
            // main boss
            translate([0,0,0])
            linear_extrude(height=5.2+3,scale=1)
            offset(r=15)
            square(size=[64,114],center=true);
            
            // upper bevel
            translate([0,0,5.2+3])
            linear_extrude(height=2,scale=0.96)
            offset(r=15)
            square(size=[64,114],center=true);
            
        }
        
        
        // cut to make overlapping lip
        translate([0,0,0])
        linear_extrude(height=3,scale=1)
        offset(r=13)
        square(size=[64,114],center=true);
       
        // cut for the top window
        color("pink")
        translate([0,0,3])
        linear_extrude(height=5.2)
        square(size=[70,112],center=true);

        color("orange")
        translate([0,0,2+5.2])
        linear_extrude(height=8,scale=1.2)
        offset(r=5,$fn=44)
        square(size=[50,110-20],center=true);
        
       
    }
    
}


//=========================
// The box walls
translate([0,0,15])    
Walls2();


} // end of difference lid - walls

/*
translate([0,0,15])    
Walls2();
*/

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







