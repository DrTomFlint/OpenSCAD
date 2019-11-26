// Spiral1
// holder for a set of spiral fibers


//------------------------------------------
module s1(r0=10,ra=0.06,rx=3,turns=3){


    p1=[for(i=[0:1:360*turns]) [ (r0+ra*i)*cos(i), (r0+ra*i)*sin(i) ]];

    p2=[for(i=[360*turns:-1:0]) [ (r0+rx+ra*i)*cos(i), (r0+rx+ra*i)*sin(i) ]];

    p3=concat(p1,p2);

    polygon(points=p3);

}   // end of module

//------------------------------------------
module s2(r0=10,ra=0.06,rx=3,turns=3){


    for(i=[0:1:360*turns])
    translate([(r0+ra*i)*cos(i), (r0+ra*i)*sin(i), 0 ])
    rotate([90,0,i])
    cylinder(r=1.5,h=0.05*ra*i,$fn=12);
    
    
}   // end of module

//==============================================

s2();

color("red")
rotate([0,0,72])
s2(turns=3.8);

color("green")
rotate([0,0,72*2])
s2(turns=3.6);

color("blue")
rotate([0,0,72*3])
s2(turns=3.4);

color("cyan")
rotate([0,0,72*4])
s2(turns=3.2);

// side out

color("red")
translate([92,0,0])
rotate([-90,0,0])
cylinder(r=1.5,h=50,$fn=12);

color("green")
translate([92-1*4.25,0,0])
rotate([-90,0,0])
cylinder(r=1.5,h=50,$fn=12);

color("blue")
translate([92-2*4.25,0,0])
rotate([-90,0,0])
cylinder(r=1.5,h=50,$fn=12);

color("cyan")
translate([92-3*4.25,0,0])
rotate([-90,0,0])
cylinder(r=1.5,h=50,$fn=12);

color("yellow")
translate([92-4*4.25,0,0])
rotate([-90,0,0])
cylinder(r=1.5,h=50,$fn=12);

//==============================================
