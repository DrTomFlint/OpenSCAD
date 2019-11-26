// Spiral3
// holder for a set of spiral fibers


//------------------------------------------
module cutter2(ri=20,M=240){
    
    ang=M/ri;

color("cyan")
rotate([0,0,80])

    translate([ri,0,0])
    rotate([0,0,ang])
    translate([-ri,0,0])
    rotate_extrude(angle=25,$fn=88)
    translate([ri,0,0])
    circle(r=1.7,$fn=12);
   
} 

//------------------------------------------
module bar2(wide=5,thick=2,r0=20, N=15, angle=0){

    rotate([0,0,angle])
    difference(){
        union(){
            // the bar itself, slightly rounded
            rotate([-90,0,0])
            linear_extrude(height=100)
            offset(r=1,$fn=16)
            square([wide,thick],center=true);

            // tip rounded
            color("cyan")
            translate([0,100,0])
            minkowski(){
                cylinder(r=(wide)/2,h=thick,center=true,$fn=22);
                sphere(1,$fn=22);
            }
        }
        // hole at tip
        translate([0,99,0])
        cylinder(r=wide/4,h=thick*4,center=true,$fn=22);
        
        // hole at center
        cylinder(r=9,h=thick*4,center=true,$fn=22);

        // slots for fibers
        for(i=[0:N])
        color("pink")
        translate([0,0,thick*0.4])
        cutter2(ri=r0+i*wide);

    }
}   // end of module

//==============================================

difference(){
    // Hub
    union(){

        Legs=5;
        for (j=[0:Legs-1]){
            bar2(angle=360/Legs*j);
        }
        for (j=[0:Legs-1]){
            bar2(angle=360/Legs*j+180/Legs,r0=22.5,N=14);
        }

        cylinder(r1=15,r2=13,h=4,center=true,$fn=88);
    }

    // hole at center
    translate([0,0,-1])
    cylinder(r1=6,r2=9,h=7,center=true,$fn=44);

  for(i=[0:9]){
        color("red")
      rotate([0,0,72/2*i])
      translate([0,11,-4])
      cylinder(r1=0.5,r2=1.5,h=7,$fn=22);
  }
}
            



