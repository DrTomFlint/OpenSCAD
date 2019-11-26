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
    translate([-9,-8.5,0]) rotate([0,0,45])
    linear_extrude(height=H+0.1) 
    offset(r=4)
    square(size=[12,12]);

    color("cyan")    
    translate([-7,-15,0]) rotate([0,0,17])
    linear_extrude(height=H+0.1) square(size=[14.5,26]);
    
}


translate([12,12,0])
difference(){
    cylinder(r=12,h=H);
    cylinder(r=4.2,h=H);

    color("orange")    
    translate([4,-11,0]) rotate([0,0,20])
    linear_extrude(height=H+0.1) 
    offset(r=4)
    square(size=[10,12]);

}

/*
    hull(){
        color("red")    
        translate([-3.5,-36,0]) 
        cylinder(r=3.5,h=H);

        color("red")    
        translate([-4,-25,0]) 
        cylinder(r=4,h=H);
    }
  
    hull(){
        color("red")    
        translate([-4,-25,0]) 
        cylinder(r=4,h=H);

        color("red")    
        translate([7,-5,0]) 
        cylinder(r=4,h=H);
    }
*/
    difference(){
    hull(){
        color("red")    
        translate([12,21,0]) 
        cylinder(r=3.0,h=H);

        color("red")    
        translate([19,17,0]) 
        cylinder(r=4.5,h=H);
    }
        color("red")    
        translate([19,17,0]) 
        cylinder(r=1.2,h=H,$fn=20);

}