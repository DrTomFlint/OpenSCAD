// Spiral3
// holder for a set of spiral fibers

// maybe make a start and end angle into the module
// so don't need to rotate the hundreds of cylinders
// a second time to get the spiral

//------------------------------------------
module cutter(ri=20){
    
//ri=20;
color("green")
rotate([0,0,66])
rotate_extrude(angle=45,$fn=88)
    translate([ri,0,0])
    circle(r=1.6,$fn=12);
   
} 

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
module bar1(wide=5,thick=2,r0=20, N=14, angle=0){

    rotate([0,0,angle])
    difference(){
        // the bar itself, slightly rounded
        rotate([-90,0,0])
        linear_extrude(height=100)
        offset(r=1,$fn=16)
        square([wide,thick],center=true);
        
        // hole at tip
        translate([0,97,0])
        cylinder(r=wide/4,h=thick*4,center=true,$fn=22);
        
        // hole at center
        cylinder(r=6,h=thick*4,center=true,$fn=22);

        // slots for fibers
        for(i=[0:N])
        color("pink")
        translate([0,0,thick*0.4])
        cutter(ri=r0+i*wide);

    }
}   // end of module

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


Legs=5;
for (j=[0:Legs-1]){
    bar2(angle=360/Legs*j);
}



    // hub
    difference(){
        cylinder(r1=15,r2=13,h=4,center=true,$fn=88);
        // hole at center, repeated
        translate([0,0,-1])
        cylinder(r1=6,r2=9,h=7,center=true,$fn=44);

      for(i=[0:4]){
            color("red")
          rotate([0,0,72/2+72*i])
          translate([0,11,-4])
          cylinder(r1=1,r2=2,h=7,$fn=22);
      }
    }
            



