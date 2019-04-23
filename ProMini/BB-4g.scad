// BB4g hinge parts for the led tapes


            translate([0,10.8,0]) color("red"){
                difference(){
                    linear_extrude(height=3,scale=0.9)
                    offset(r=1,$fn=8)
                    square(size=[16,18],center=true);
                    
                    // main slot for tape
                    translate([0,2,1.5])
                    linear_extrude(height=2,scale=0.9)
                    square(size=[12.8,20],center=true);

                    // cut for wires
                    translate([0,-3,-1])
                    linear_extrude(height=3,scale=1)
                    square(size=[12,8],center=true);
                }
            }
            
            linear_extrude(height=3,scale=1)
            square(size=[5,6],center=true);
            
            translate([2.5,-3,1.5]) rotate([0,90,0])
            cylinder(r1=1.5,r2=1.0,h=2.5,center=true,$fn=22);

            translate([-2.5,-3,1.5]) rotate([0,90,0])
            cylinder(r1=1.0,r2=1.5,h=2.5,center=true,$fn=22);

            translate([0,-3,1.5]) rotate([0,90,0])
            cylinder(r=1.5,h=5,center=true,$fn=22);
