tol=0.25;

intersection(){

translate([0,0,-5]) color("gray"){
linear_extrude(height=6) square(size=[19,60],center=true);
}

difference(){
    translate([0,0,-5]) color("pink"){
        cylinder(r=22.5,h=5,$fn=40);
    }
    

difference(){

// Base boss
    union(){
        translate([0,0,0]) color("yellow")
        linear_extrude(height=9)  circle(r=30,center=true);

        // This is the pogo pin surround
        translate([0,16,-3]) color("green"){
            difference(){
                linear_extrude(height=3,scale=1.25)
                offset(r=2+tol,$fn=8) square(size=[10,6],center=true);

                linear_extrude(height=3,scale=0.8)
                offset(r=1-tol,$fn=8) square(size=[10,6],center=true);
            }
            translate([0,-3,0]) color("orange")
            linear_extrude(height=3,scale=1.25)  circle(r=1.5+tol,$fn=16,center=true);
        }
    }

} // end of top boss difference cuts   

    // holes for pogo pins
    translate([3,16,-6]) cylinder(r=0.7,h=6,$fn=12);
    translate([-3,16,-6]) cylinder(r=0.7,h=6,$fn=12);
    translate([3,16,-1])  cylinder(r=1.7,h=1,$fn=12);
    translate([-3,16,-1]) cylinder(r=1.7,h=1,$fn=12);

    // remove extra material
    translate([0,-4.5,-6]) linear_extrude(height=6,scale=1.0)
    offset(r=2,$fn=8) square(size=[13,23],center=true);

    // cutout to allow wires lay flat
    translate([0,12,-5.4]) linear_extrude(height=2)
    offset(r=2,$fn=8) square(size=[5,10],center=true);

    // Bottom side boss
    pb1=[ [24-tol,0], [20,0], [20,3], [21,4], [24-tol,4], [24-tol,3],
    [23-tol,2], [24-tol,1] ];
    translate([0,0,1]) rotate([180,0,0]) color("orange")
    rotate_extrude(convexity=20) polygon(points=pb1);
/*
    // cut text for Brights
    translate ([0,-20,-4.6]) rotate([180,0,0]) color("red") 
    linear_extrude(height=0.4){
    text("BB-1C", font = "Open Sans:style=Bold", size=2.5,halign="center",valign="center",spacing=1.1);
    }
*/
}
}






