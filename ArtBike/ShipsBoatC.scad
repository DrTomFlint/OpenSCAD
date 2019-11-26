// ShipsBoatC
// Hanger for the fiberglass poles near the handlebars
// 
// Fiberglass 8 mm diameter

thick=10;

difference(){
    cylinder(h=thick,r=22.0,$fn=88);
    
    translate([0,0,-0.5])
    cylinder(h=thick+1,r=18.5,$fn=88);

    translate([-50,-110,-0.5])
    cube([100,100,thick+1]);

}

translate([18.5+3.5+4.2,0,0])
difference(){
    cylinder(h=thick,r=4.2+3.5,$fn=88);
    
    translate([0,0,-0.5])
    cylinder(h=thick+1,r=4.2,$fn=88);

    translate([-50,2,-0.5])
    cube([100,100,thick+1]);

}


translate([-(18.5+3.5+4.2),0,0])
difference(){
    cylinder(h=thick,r=4.2+3.5,$fn=88);
    
    translate([0,0,-0.5])
    cylinder(h=thick+1,r=4.2,$fn=88);

    translate([-50,2,-0.5])
    cube([100,100,thick+1]);

}



