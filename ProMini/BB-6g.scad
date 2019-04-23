// BB-6g hinge parts for the led tape
           
pt1=[ [0,4], [4,0], [10,0], [14,4], [14,16], [0,16] ];
            
            // Led tape tab
            translate([0,13,4]) color("red"){
                rotate([25,0,0]){
                difference(){
                    translate([-7,-9,0.5])
                    linear_extrude(height=2.4) 
                        offset(r=1,$fn=8)
                        polygon(points=pt1);
                    
                    // main slot for tape
                    translate([0,2,1.2])
                    linear_extrude(height=2,scale=0.9)
                    square(size=[12.8,16],center=true);

                    // cut for wires
                    translate([0,-2,-1])
                    linear_extrude(height=3,scale=1)
                    
                    square(size=[12,5],center=true);
                }
            }
            }
            
            // Hinge parts
            linear_extrude(height=2.4,scale=1)
            square(size=[5.5,6],center=true);
        
            translate([3,-3,1.5]) rotate([0,90,0])
            cylinder(r1=1.5,r2=1.0,h=3,center=true,$fn=22);

            translate([-3,-3,1.5]) rotate([0,90,0])
            cylinder(r1=1.0,r2=1.5,h=3,center=true,$fn=22);

            translate([0,-3,1.5]) rotate([0,90,0])
            cylinder(r=1.5,h=5.5,center=true,$fn=22);


            hull(){
            // landing on hinge 
            translate([0,2.5,0]) color("cyan")
            linear_extrude(height=2.4,scale=1)
            square(size=[5.5,1],center=true);
            // landing on tab
            translate([0,13,4]) color("pink"){
                rotate([25,0,0]){
                    translate([0,-9,0.5])
                    linear_extrude(height=2.4,scale=1)
                    square(size=[8,0.1],center=true);
                }
            }
            
        }