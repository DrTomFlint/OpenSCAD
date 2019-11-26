// Head1a.scad
// Bracket to attach 3 mm sideglow fiber to 
// the Headliner of the car




// model the fiber
//color("cyan")
//cylinder(r=1.5,h=7,$fn=20);


//---------------------------------
module tooth1(zt=1,v=4){
   ptooth=[ [0,0], [5,zt], [0,zt] ];
   color("pink")
   translate([-zt,0.1*v,0])
   rotate([90,-90,180])
   linear_extrude(height=0.8*v)
   polygon(points=ptooth);

}


//---------------------------------
module head1(th=1,fill=0.4,hi=12,tab=30){

    // dress ends of main hook
    color("cyan")
   translate([1.5+th/2+fill,0,0]){
    cylinder(r=th/2+fill,h=hi,$fn=20);
       scale([1,1,0.5])
       sphere(r=th/2+fill,$fa=5, $fs=0.1);
        translate([0,0,hi])
       scale([1,1,0.5])
       sphere(r=th/2+fill,$fa=5, $fs=0.1);
   }
    
   // main fiber hook
    color("green")
   rotate_extrude(angle=270, $fn=90,convexity=10)
    offset(r=fill)
   translate([1.5+fill, 0]) 
   square([th,hi]);

   // recurve 
   color("red") 
   translate([0,-3-th-fill*2,0])
       rotate_extrude(angle=90, $fn=90,convexity=10)
    offset(r=fill)
       translate([1.5+fill, 0]) 
       square([th,hi]);
    
   // tab
   translate([0,-3-th-fill*2,0])
    rotate([90,0,0])
       translate([1.5+fill, 0]) {
           // body of tab
   color("orange") 
           linear_extrude(height=tab,scale=[0.3,1])
        offset(r=fill,$fn=20)
           square([th,hi]);
            
           // teeth
           translate([0,0,8])  tooth1(v=hi);
           translate([0,0,16])  tooth1(v=hi);
           translate([0,0,24])  tooth1(v=hi);
       }

} // end module head1()

head1();


