// ShipsBoatC
// Hanger for the fiberglass poles near the handlebars
// 
// Fiberglass 8 mm diameter
// Updated 3 Sept 2021 to strengthen a broken one

thick=16;

difference(){
    cylinder(h=thick,r=23.0,$fn=222);
    
    translate([0,0,-0.5])
    cylinder(h=thick+1,r=18.5,$fn=222);

    translate([-50,-110,-0.5])
    cube([100,100,thick+1]);

}

translate([18.5+3.5+4.2+1,0,0]){
difference(){
    cylinder(h=thick,r=4.2+3.5,$fn=222);
    
    translate([0,0,-0.5])
    cylinder(h=thick+1,r=4.2,$fn=222);

    translate([2,13,8])
    rotate([0,0,25])
    cube([20,20,thick+6],center=true);

}

color("red")
translate([-5,-6,8])
rotate([0,0,25])
cube([5,5,thick],center=true);
}

mirror([1,0,0])
translate([18.5+3.5+4.2+1,0,0]){
difference(){
    cylinder(h=thick,r=4.2+3.5,$fn=222);
    
    translate([0,0,-0.5])
    cylinder(h=thick+1,r=4.2,$fn=222);

    translate([2,13,8])
    rotate([0,0,25])
    cube([20,20,thick+6],center=true);

}

color("red")
translate([-5,-6,8])
rotate([0,0,25])
cube([5,5,thick],center=true);
}

