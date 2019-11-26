// Head1a.scad
// Bracket to attach 3 mm sideglow fiber to 
// the Headliner of the car




// model the fiber
//color("cyan")
//cylinder(r=1.5,h=7,$fn=20);

Rfiber=1.6;

//---------------------------------
module tooth1(zt=2,v=4){
   ptooth=[ [0,0], [5,zt], [0,zt] ];
   color("pink")
   translate([-zt,0,0])
   rotate([90,-90,180])
   linear_extrude(height=v)
   polygon(points=ptooth);

}


//---------------------------------
module head1(th=1,fill=0.4,hi=7.6,tab=30){

    // dress ends of main hook
    color("cyan")
   translate([Rfiber+th/2+fill,0,0]){
    cylinder(r=th/2+fill,h=hi,$fn=20);
//       scale([1,1,0.5])
//       sphere(r=th/2+fill,$fa=5, $fs=0.1);
//        translate([0,0,hi])
//       scale([1,1,0.5])
//       sphere(r=th/2+fill,$fa=5, $fs=0.1);
   }
    
   // main fiber hook
    color("green")
   rotate_extrude(angle=270, $fn=90,convexity=10)
    offset(r=fill)
   translate([Rfiber+fill, 0]) 
   square([th,hi]);

   // recurve 
   color("red") 
   translate([0,-2*Rfiber-th-fill*2,0])
       rotate_extrude(angle=90, $fn=90,convexity=10)
    offset(r=fill)
       translate([Rfiber+fill, 0]) 
       square([th,hi]);
    
   // tab
   translate([0,-2*Rfiber-th-fill*2,0])
    rotate([90,0,0])
       translate([Rfiber+fill, 0]) {
           // body of tab
   color("orange") 
           linear_extrude(height=tab*0.75,scale=[1,1])
        offset(r=fill,$fn=20)
           square([th,hi]);
            
           translate([0,0,tab*0.75])
           linear_extrude(height=tab*0.25,scale=[0.3,1])
        offset(r=fill,$fn=20)
           square([th,hi]);
            
           // teeth
        for(i=[0:6]){
            translate([0,0,i*4])  tooth1(v=hi);
        }
       }

} // end module head1()

head1();


