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
module head1(th=1.2,fill=0.4,hi=8,tab=26){

   // main fiber hook
    color("green")
   rotate([0,0,20])
   rotate_extrude(angle=250, $fn=90,convexity=10)
    offset(r=fill)
   translate([Rfiber+fill, 0]) 
   square([th,hi]);

   // second hook
    color("cyan")
    translate([14,0,0])
   rotate([0,0,20])
   rotate_extrude(angle=250, $fn=90,convexity=10)
    offset(r=fill)
   translate([Rfiber+fill, 0]) 
   square([th,hi]);


   // tab
   translate([-3,-2*Rfiber-th-fill*2,0])
    rotate([90,0,90])
       translate([Rfiber+fill, 0]) {
           // body of tab
   color("orange") 
           difference(){
            linear_extrude(height=tab*0.85,scale=[1,1])
            offset(r=fill,$fn=20)
            square([th,hi]);
            
           translate([3.9,-1,10])
           rotate([-90,0,0]) 
           cylinder(r=3,h=hi+2,$fn=22);
           }
           
          color("pink") 
           translate([0,0,tab*0.85])
           linear_extrude(height=tab*0.15,scale=[0.3,1])
        offset(r=fill,$fn=20)
           square([th,hi]);

          color("blue") 
           translate([0,hi,0])
           rotate([180,0,0])
           linear_extrude(height=tab*0.15,scale=[0.3,1])
        offset(r=fill,$fn=20)
           square([th,hi]);

       }

} // end module head1()

head1();


