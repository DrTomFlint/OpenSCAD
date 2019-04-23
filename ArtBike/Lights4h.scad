difference(){
    // Support for the 7a chassis
    pad = 0.0;
    union(){
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
translate([-27,-30,9]) rotate([0,0,0])
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

}

}