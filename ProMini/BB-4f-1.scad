tol=0.25;


intersection(){
    translate([0,30,0])
linear_extrude(height=20) square(size=[46,80],center=true);

difference(){

    union(){
        // main boss
        translate([0,0,2]) color("yellow")
        linear_extrude(height=4)  circle(r=30,center=true,$fn=200);
        
        // rail for hinges
        translate([0,0,8])
        cylinder(r=30,h=4.5,center=true,$fn=200);
    }

    // cuts front to back etc
    translate([0,0,8])
    cylinder(r1=25,r2=27,h=4.5,center=true,$fn=200);
        
    translate([0,0,0]) color("yellow")
    linear_extrude(height=12)  square(size=[80,24],center=true);
    
    translate([0,-14,0])
    linear_extrude(height=12)  square(size=[16,8],center=true);

    // cutouts for hinges in 6 locations
    for(a=[0, 40, -40, 180, 180-40, 180+40])
    rotate([0,0,a])
    translate([0,-28,6]) color("red"){

            linear_extrude(height=5,scale=1)
            square(size=[6,6],center=true);
            
            translate([0,-0.7,1.5]) rotate([0,90,0])
            cylinder(r=1.5,h=10,center=true,$fn=22);
        }

difference(){

// Base boss
    union(){
        translate([0,0,0]) color("yellow")
        linear_extrude(height=9)  circle(r=30,center=true,$fn=200);


    }
    
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

        // Bottom side outer rail  THICKENED 
        translate ([0,0,-11.5]) color("gray") 
            linear_extrude(height=11.5,convexity=100) polygon(points=B1p);
        
 

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



} // end of top boss difference cuts   

    // New bolt hole for gasket and internal features
    translate([0,-22,0]) color("cyan"){
        cylinder(r=1.5+tol,h=20,center=true,$fn=16);
    }
    // New bolt hole for gasket and internal features
    translate([-14,17,0]) color("cyan"){
        cylinder(r=1.5+tol,h=20,center=true,$fn=16);
    }
    // New bolt hole for gasket and internal features
    translate([14,17,0]) color("cyan"){
        cylinder(r=1.5+tol,h=20,center=true,$fn=16);
    }

    
// add text for Brights
translate ([0,-12,2.4]) rotate([0,0,0]) color("red") 
    linear_extrude(height=1.2){
    text("4B", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.1);
    }



difference(){
    // topside reinforce pogo pins
    translate([0,16,3.0]) color("red")
    linear_extrude(height=4,scale=0.8)
    offset(r=2+tol,$fn=8) square(size=[12,7],center=true);

}
}
}

/*

for(a=[0, 40, -40, 180, 180-40, 180+40])
    rotate([0,0,a])
    translate([0,-27,7]) color("red"){
        difference(){
            linear_extrude(height=4.5,scale=1)
            offset(r=1,$fn=8) square(size=[24,2],center=true);

            linear_extrude(height=5,scale=1)
            square(size=[6,4],center=true);
            
            translate([0,-0.7,1.5]) rotate([0,90,0])
            cylinder(r=1.5,h=10,center=true,$fn=22);
        }
    }


*/