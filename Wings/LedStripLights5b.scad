// Lights5b
// Ferrules for 3 mm fiber optic sideglows

//p1=[ [0,0], [0,4], [0.5,5], [5.75,5], [5.85,4], [9.15,4], [9.25,5], [12,5], [27,3], [27,0] ];
p1=[ [0,0], [0,4], [0.5,6], [5.75,6], [5.85,5], [9.15,5], [9.25,6], [12,6], [27,3], [27,0] ];

module Ferrule1(){

difference(){
    rotate([0,-90,0])
    rotate_extrude($fn=6){
        rotate([0,0,-90])
        polygon(points=p1);
    }    
    
    color("cyan")
    rotate([0,90,0])
//    cylinder(r1=2.0,r2=1.8, h=50,$fn=6);
    cylinder(r1=1.8,r2=1.85, h=50,$fn=6);
}

}

//---------------------------------------------
// make a solid body version, ie no cut for the fiber
module Ferrule2(){

//difference(){
rotate([0,-90,0])
rotate_extrude($fn=6){
    rotate([0,0,-90])
    polygon(points=p1);
}    

}

//--------------------------------------------------------
// make a solid body version, scale the polygon, use this for making
// cuts into the Rx
module Ferrule3(){

rotate([0,-90,0])
rotate_extrude($fn=6){
    rotate([0,0,-90])
    scale(1.02)
    polygon(points=p1);
}    

}
//--------------------------------------------------------
// make a solid body version, scale the polygon, use this for making
// cuts into the lids only
module Ferrule4(){
/*
intersection(){
rotate([0,-90,0])
rotate_extrude($fn=6){
    rotate([0,0,-90])
    scale(1.02)
    polygon(points=p1);
}    
translate([8,-20,-10]) linear_extrude(height=20) square(40);
}
*/
translate([9,0,0])
color("green") rotate([0,90,0])
cylinder(r=6.1,h=8,$fn=6);

}

//============================


Ferrule1();


//translate([0,0,-13]) Ferrule4();

/*
color("cyan")
translate([-1,0,0])
rotate([0,90,0])
cylinder(r=1.5,h=40,$fn=30);

color("orange")
translate([0,0,13])
Ferrule2();

color("red")
translate([0,0,2*13])
Ferrule3();

color("pink")
intersection(){
    translate([0,0,3*13])
    difference(){
        Ferrule3();
        Ferrule2();
    }
    translate([-35,0,0])
    linear_extrude(heigth=100)
    square(100,center=true);
}

*/


