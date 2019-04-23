tol=0.25;


union(){
    
difference(){

// Base boss
    union(){
        translate([0,0,0]) color("yellow")
        linear_extrude(height=8)  circle(r=30,center=true,$fn=200);


    }
    translate([0,0,3]) color("yellow")
    linear_extrude(height=8,scale=1.1)  circle(r=26,center=true,$fn=200);
    
    translate([-27,-3.5,2]) rotate([90,0,0]){
    // Simplified version of BB1a
    difference(){   // cut the board and components out of 
    // the base plate #1
    union(){
        B1p=[ [0,1], [1,0], [53,0], [54,1], [54,79], [48,85], [6,85], [0,79] ];
        translate([0,0,0]) color("gray")
        linear_extrude(height=4.5)
        polygon(points=B1p);
        
        // Bottom side outer rail
        translate ([0,0,-11.5]) color("red") 
        difference(){
            linear_extrude(height=11.5,convexity=100) polygon(points=B1p);
            linear_extrude(height=12,convexity=100) offset(r=-2) polygon(points=B1p);
        }
                 
         // Switch 1
        translate([2,1.6,-11]) color("blue"){
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
    
    
    } // end of part A union
       


} // end of diffence  =================================

        
    }  // end of BB1a union

    // Front to back cut
    translate([0,49.5,4.5]) color("red"){
        linear_extrude(height=10) 
        square(size=[60,80],center=true);
    }
    translate([0,-49.5,4.5]) color("red"){
        linear_extrude(height=10) 
        square(size=[60,80],center=true);
    }



    // USB charger plug
    translate([7,-12,0]) color("red"){
        linear_extrude(height=5) 
        offset(r=1,$fn=8)
        square(size=[11, 5.5]);
    }

    // New bolt hole for gasket and internal features
    translate([0,-18,0]) color("cyan"){
        cylinder(r=1.5+tol,h=10,center=true,$fn=16);
    }
    // New bolt hole for gasket and internal features
    translate([-12,15,0]) color("cyan"){
        cylinder(r=1.5+tol,h=10,center=true,$fn=16);
    }
    // New bolt hole for gasket and internal features
    translate([12,15,0]) color("cyan"){
        cylinder(r=1.5+tol,h=10,center=true,$fn=16);
    }

    // Pogo pin access
    translate([6,-0.5,0]) color("green"){
        linear_extrude(height=3,scale=0.8)
        offset(r=2,$fn=8) square(size=[10,3],center=true);
    }

    // cutouts for hinges in 6 locations
    for(a=[0, 55, -55, 180, 180-55, 180+55])
    rotate([0,0,a])
    translate([0,-28.5,0]) color("red"){

            linear_extrude(height=12,scale=1.0)
            square(size=[6,10],center=true);
            
            translate([0,1.2,1.0]) rotate([0,90,0])
            cylinder(r=1.5,h=10,center=true,$fn=22);
        }


} // end of top boss difference cuts   
    
// add text for Brights
translate ([0,13,2.4]) rotate([0,0,180]) color("red") 
    linear_extrude(height=1.2){
    text("7B", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
    }


}


