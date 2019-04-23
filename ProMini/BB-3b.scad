tol=0.25;

difference(){

// Base boss
    union(){
        translate([0,0,0]) color("yellow")
        linear_extrude(height=9)  circle(r=30,center=true,$fn=200);

        // This is the pogo pin surround
        translate([0,16,-3]) color("green"){
            difference(){
                linear_extrude(height=3,scale=1.25)
                offset(r=2,$fn=8) square(size=[10,6],center=true);

                linear_extrude(height=3,scale=0.8)
                offset(r=1,$fn=8) square(size=[10,6],center=true);
            }
            translate([0,-3,0]) color("orange")
            linear_extrude(height=3,scale=1.25)  circle(r=1.5,$fn=16,center=true);
        }

    }
    // holes for pogo pins
    translate([3,16,0]) cylinder(r1=0.8,r2=1.0,h=6,$fn=12);
    translate([-3,16,0]) cylinder(r1=0.8,r2=1.0,h=6,$fn=12);

    
// Simplified version of BB1a
    translate([-27,-1,2]) rotate([90,0,0])
    union(){
        translate([27,1,-1]) color("pink") rotate([-90,0,0])
        linear_extrude(height=65)  circle(r=27,center=true,$fn=200);

        // Base 1 plate
        B1p=[ [0,0], [54,0], [54,70], [44,80],
        [10,80], [0,70] ];
        translate([0,0,0]) color("gray")
        linear_extrude(height=4.5)
        polygon(points=B1p);

        // Switch mounts
        translate ([0,0,-11]) color("gray") 
            linear_extrude(height=11) 
            square(size=[54, 2]);
        
        // Bottom side outer rail  THICKENED 
        translate ([0,0,-11.5]) color("gray") 
            linear_extrude(height=11.5,convexity=100) polygon(points=B1p);
        
        // Switch 1
        translate([2,1.6,-11]) color("green"){
            union(){
                // switch body including solder lug clearance
                linear_extrude(height=12) 
                offset(r=tol)
                 square(size=[13, 15]);
                
                translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.3,h=10,$fn=30);
            }
        }
        // Switch 2
        translate([54-15,1.6,-11]) color("blue"){
            union(){
                // switch body including solder lug clearance
                linear_extrude(height=12) 
                offset(r=tol)
                 square(size=[13, 15]);
                
                translate([6.5,0,5]) rotate([90,0,0]) cylinder(r=3.3,h=10,$fn=30);
            }
        }

        // anti rotate slot for switches
        translate([13,-2,-7]) color("green"){
                linear_extrude(height=2.5) 
                 square(size=[3.5, 1.0]);
        }
        translate([50,-2,-7]) color("blue"){
                linear_extrude(height=2.5) 
                 square(size=[3.5, 1.0]);
        }

        // add a block between switches for cutout
        translate([2,1.6,-11]) color("orange"){
            linear_extrude(height=12) 
            offset(r=tol)
             square(size=[50, 25]);
        }
        
        // extra block  cutout for the battery cable
        translate([-4,5,4]) color("pink"){
            linear_extrude(height=18) 
            offset(r=tol)
             square(size=[14, 14]);
        }
        
        // another cutout for the USB charger plug
        translate([6,-4,0]) color("red"){
            linear_extrude(height=9) 
            //offset(r=1,$fn=8) offset(r=-1,$fn=8)
            square(size=[14, 16]);
        }
        
        // Front to back cut
        translate([4,3,-40]) color("cyan"){
            // switch body including solder lug clearance
            linear_extrude(height=80) 
             square(size=[46, 30]);
        }
        
        
        
    }  // end of BB1a union

    // New bolt hole for gasket and internal features
    translate([0,-22,0]) color("cyan"){
        cylinder(r=1.5+tol,h=10,center=true,$fn=16);
    }

} // end of top boss difference cuts   
    
/* For 3b ditch the bottom side boss
difference(){
    // Bottom side boss
    pb1=[ [24,0], [20,0], [20,3], [21,4], [24,4], [24,3],
    [23,2], [24,1] ];
    translate([0,0,1]) rotate([180,0,0]) color("orange")
    rotate_extrude(convexity=20) polygon(points=pb1);

    // cutaways for access
        translate([-18,5,-4]) color("cyan"){
            cylinder(r=8,h=10);
        }
        translate([18,5,-4]) color("cyan"){
            cylinder(r=8,h=10);
        }
}    
*/

// add text for Brights
translate ([0,-12,2.4]) rotate([0,0,0]) color("red") 
    linear_extrude(height=1.2){
    text("3B", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
    }

difference(){
    // topside reinforce pogo pins
    translate([0,16,3.0]) color("red")
    linear_extrude(height=1.5,scale=0.8)
    offset(r=2,$fn=8) square(size=[10,6],center=true);

    // recut holes for pogo pins
    translate([3,16,0]) cylinder(r1=0.8,r2=1.0,h=6,$fn=12);
    translate([-3,16,0]) cylinder(r1=0.8,r2=1.0,h=6,$fn=12);
}




