// BikeLights4g
// This is the bottom for v4 hex
use <Lights5a.scad>
use <Lights5b.scad>
use <Lights5f.scad>

/*
//===============================
// Base
difference(){
// main boss
translate([0,40,-5.2]){
    difference(){
        union(){
            // main boss
            linear_extrude(height=5.2+3,scale=1)
            offset(r=15)
            square(size=[64,114],center=true);
            
            // upper bevel
            translate([0,0,0]) rotate([0,180,0])
            linear_extrude(height=2,scale=0.96)
            offset(r=15)
            square(size=[64,114],center=true);
        }
        
        // cut to make overlapping lip
        translate([0,0,5.3])
        linear_extrude(height=18,scale=1)
        offset(r=13)
        square(size=[64,114],center=true);
        
        // cut for the bottom panel
        color("pink"){
        translate([0,17,0])
        linear_extrude(height=5.3)
        square(size=[74,79],center=true);

        translate([0,17,-6])
        linear_extrude(height=10,scale=0.8)
        offset(r=5,$fn=12)
        square(size=[74-14,79-10],center=true);
            
        }
        
        // finger hole for switches and usb charger
        translate([18,-44,-6])
        rotate([0,0,180]){
            linear_extrude(height=16,scale=[1,0.5])
//            offset(r=5,$fn=12)
//            square(size=[50,20]);
            offset(r=12,$fn=22)
            square(size=[36,6]);

        }
        
    // Support for the 7a chassis
    pad = 0.15;
    color("pink"){
        translate([0,-32,5.2-3])
        linear_extrude(height=30+3)
        offset(r=pad)
        square(size=[61,4],center=true);

        translate([29,-29,5.2-3])
        linear_extrude(height=30+3)
        offset(r=pad)
        square(size=[3,10],center=true);

        translate([-29,-29,5.2-3])
        linear_extrude(height=30+3)
        offset(r=pad)
        square(size=[3,10],center=true);
    }

    
    }  // end of difference
    
}


//=========================
// The box walls
translate([0,0,15])
rotate([0,180,0])
Walls2();


//} // end of difference lid - walls




} // end of difference lid - walls - chassis
*/

//------------use this to make an H part

difference(){

translate([0,40,-5.2]){
    // Support for the 7a chassis
//    pad = 0.15;   // for making cutout
    pad = 0;        // for building part
    color("pink"){
        translate([0,-32,5.2-3])
        linear_extrude(height=30+3)
        offset(r=pad)
        square(size=[61,4],center=true);

        translate([29,-29,5.2-3])
        linear_extrude(height=30+3)
        offset(r=pad)
        square(size=[3,10],center=true);

        translate([-29,-29,5.2-3])
        linear_extrude(height=30+3)
        offset(r=pad)
        square(size=[3,10],center=true);
    }

}


//==============================
// chassis
translate([-27,10,0]) rotate([0,0,0])


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
        offset(r=0.2)
         square(size=[13, 15]);
        
        translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.3,h=10,$fn=30);
    }
}
// Switch 2
translate([54-15,1.6,0]) color("blue"){
    union(){
        // switch body including solder lug clearance
        linear_extrude(height=12) 
        offset(r=0.2)
         square(size=[13, 15]);
        
        translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.3,h=10,$fn=30);
    }
}

// Cutout for pogo access
hull(){
translate([28,1.6,8]) color("blue"){
       rotate([90,0,0]) cylinder(r1=3,r2=4,h=10,$fn=30);
}
translate([38,1.6,8]) color("blue"){
       rotate([90,0,0]) cylinder(r1=3,r2=4,h=10,$fn=30);
}
}

// Cutout for usb access
hull(){
translate([32,1.6,19]) color("blue"){
       rotate([90,0,0]) cylinder(r1=4,r2=5,h=10,$fn=30);
}
translate([44,1.6,19]) color("blue"){
       rotate([90,0,0]) cylinder(r1=4,r2=5,h=10,$fn=30);
}
}

// Second cutout for 1A chassis
// Cutout for usb access
hull(){
translate([32-24,1.6,19]) color("blue"){
       rotate([90,0,0]) cylinder(r1=4,r2=5,h=10,$fn=30);
}
translate([44-24,1.6,19]) color("blue"){
       rotate([90,0,0]) cylinder(r1=4,r2=5,h=10,$fn=30);
}
}

}  // end of chassis union


}
