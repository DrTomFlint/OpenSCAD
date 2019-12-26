// shell

module shell1(){
// top shell
translate([10,0,-30]){
    difference(){
        // boss
        linear_extrude(height=40)
        offset(r=4,$fn=40)
        square([55,84],center=true);

        // main cut
        translate([0,0,-1])
        linear_extrude(height=41+2)
        offset(r=2+0.2,$fn=40)
        square([56,85],center=true);

        // cut for power plug
        hull(){
            translate([21,-46,50])
            rotate([-90,0,0])
            cylinder(r=4,h=10,center=true);

            translate([21,-46,37])
            rotate([-90,0,0])
            cylinder(r=4,h=10,center=true);
        }
        
        // cut for usb and ethernet
        translate([16,-46,4])
        scale([0.6,1,1.3])
        intersection(){
            translate([0,0,20])
            cube([40,10,40],center=true);
        
            rotate([-90,0,0])
            cylinder(r=20,h=10,center=true);
        }
        translate([-16,-46,4])
        scale([0.6,1,1.3])
        intersection(){
            translate([0,0,20])
            cube([40,10,40],center=true);
        
            rotate([-90,0,0])
            cylinder(r=20,h=10,center=true);
        }

        // cut for sd card
        translate([0,46,-1])
        scale([0.6,1,1])
        intersection(){
            translate([0,0,20])
            cube([40,10,40],center=true);
        
            rotate([-90,0,0])
            cylinder(r=20,h=10,center=true);
        }

        // cut for locking button
        translate([0,46,34])
        rotate([-90,30,0])
        cylinder(r=3,h=10,center=true,$fn=6);

        // cut for locking button
        translate([0,-46,34])
        rotate([-90,30,0])
        cylinder(r=3,h=10,center=true,$fn=6);

        // cut for usb power and hdmi
        translate([-30,19,4])
        rotate([0,0,90])
        scale([1.0,1,1.3])
        intersection(){
            translate([0,0,20])
            cube([40,10,40],center=true);
        
            rotate([-90,0,0])
            cylinder(r=20,h=10,center=true);
        }
        // round window cut
        translate([-30,-24,22])
        rotate([0,0,90])
        rotate([-90,0,0])
        cylinder(r=8,h=10,center=true);

        // audio cut
        translate([-30,-9,8])
        rotate([0,0,90])
        rotate([-90,0,0])
        cylinder(r=5,h=10,center=true,$fn=22);

        // back wall cuts
        translate([30,24,4])
        rotate([0,0,90])
        scale([0.5,1,1.3])
        intersection(){
            translate([0,0,20])
            cube([40,10,40],center=true);
        
            rotate([-90,0,0])
            cylinder(r=20,h=10,center=true);
        }
        // back wall cuts
        translate([30,24-25,4])
        rotate([0,0,90])
        scale([0.5,1,1.5])
        intersection(){
            translate([0,0,20])
            cube([40,10,40],center=true);
        
            rotate([-90,0,0])
            cylinder(r=20,h=10,center=true);
        }
        // back wall cuts
        translate([30,24-50,4])
        rotate([0,0,90])
        scale([0.5,1,1.3])
        intersection(){
            translate([0,0,20])
            cube([40,10,40],center=true);
        
            rotate([-90,0,0])
            cylinder(r=20,h=10,center=true);
        }
    }
}
}

//==============================

shell1();

