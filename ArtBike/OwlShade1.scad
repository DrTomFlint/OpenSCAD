// OwlShade1
// Sunglass accessory for daytime use
r1=38;

//-----------------------------
// loop
module loop1(
    x1=80, // offset for rotate_extrude
    r1=38,  // inner radius main loop
    a1=12  // angle for rotate_extrude
){
        
    rotate([90,0,0])
    translate([-x1,0,0]){
        difference(){
        
            rotate_extrude(angle=a1,$fn=300)
            translate([x1,0,0])
            circle(r=r1+0.8,$fn=300);

            rotate_extrude(angle=a1+10,$fn=300)
            translate([x1,0,0])
            circle(r=r1,$fn=300);
        }    
    }   // end translate
}
//-----------------------------
// cutter for nose
module cut1(
    x2=r1-15,    // cutter intersects loop
    r2=5,       // radius nose cut
    y1=8  // offset for hull
){
    
    hull(){
        translate([x2,0,r2])
        rotate([0,90,0])
        cylinder(r=r2,h=20,$fn=100);

        translate([x2,y1,-r2])
        rotate([0,90,0])
        cylinder(r=r2,h=20,$fn=100);

        translate([x2,-y1,-r2])
        rotate([0,90,0])
        cylinder(r=r2,h=20,$fn=100);
    }
}

//------------------------
module cut2(
    x2=r1-15,
    r3=30,
    y1=8,
    a2=80,
    z1=-8
){
    color("pink")
        scale([1,1,0.5])
        rotate([0,0,a2])
        translate([x2,0,z1])
        rotate([0,90,0])
        cylinder(r=r3,h=20,$fn=100);
}


//------------------------
module cut3(
    a1=12){
        
    rotate([0,-a1,0])
    translate([-50,0,0])
    cube([100,100,18],center=true);
    }
    
//---------------------------------
module head1(
    th=0.8,
    fill=0.4,
    hi=4,
    Rfiber=1.6
){

   // main fiber hook
    color("green")
   rotate([0,0,20])
   rotate_extrude(angle=250, $fn=90,convexity=10)
    offset(r=fill)
   translate([Rfiber+fill, 0]) 
   square([th,hi]);


} // end module head1()

//===============================
difference(){
    loop1();
    cut1();
    cut2();
    cut2(a2=-80);
    cut3();
}

translate([-r1-3.0,-2,4])
rotate([0,130,0])
rotate([-90,0,0])
head1();

//===============================


