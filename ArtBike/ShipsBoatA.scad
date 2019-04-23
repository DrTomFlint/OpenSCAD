// ShipsBoatA
// Parts to mate fiberglass pole onto bike rack
// Fiberglass 8 mm diameter
// Bikerack 8.4 mm, more like 9 near bends

// Back
H=12.0;      // height to extrude

difference(){
    cylinder(r=12,h=H);
    cylinder(r=4.6,h=H);

    color("pink")    
    translate([6,-12.5,0]) rotate([0,0,45])
    linear_extrude(height=H+0.1) square(size=[8,13]);

    color("cyan")    
    translate([13,-11,0]) rotate([0,0,70])
    linear_extrude(height=H+0.1) square(size=[10,14]);
}


translate([12,12,0])
difference(){
    cylinder(r=12,h=H);
    cylinder(r=4.2,h=H);

    color("orange")    
    translate([8-11,7-9.5,0]) rotate([0,0,45])
    linear_extrude(height=H+0.1) square(size=[16,12]);

    color("purple")    
    translate([8.5-11,6-9,0]) rotate([0,0,75])
    linear_extrude(height=H+0.1) square(size=[6,13]);
}

    hull(){
        color("red")    
        translate([10+3.5,-36,0]) 
        cylinder(r=3.5,h=H);

        color("red")    
        translate([10+3.5,-25,0]) 
        cylinder(r=4,h=H);
    }
    
    hull(){
        color("red")    
        translate([10+3.5,-25,0]) 
        cylinder(r=4,h=H);

        color("red")    
        translate([-6,-6,0]) 
        cylinder(r=3.5,h=H);
    }

    difference(){
    hull(){
        color("red")    
        translate([8,22,0]) 
        cylinder(r=3.0,h=H);

        color("red")    
        translate([17,19,0]) 
        cylinder(r=4.5,h=H);
    }
        translate([10,21.5,0]) 
        cylinder(r=1.2,h=H,$fn=20);
}
    