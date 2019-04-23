// Perch1
// Owl perch for the Art Bike

Thick=2;

//----------------------------------------------------------------------------------
// left handlebar
translate([-28,0,0]) rotate([0,-90,0])
difference(){
    cylinder(r1=11.5+Thick, r2=11.0+Thick, h=10);
    cylinder(r1=11.5, r2=11.0, h=10);
    rotate([0,0,-45]) translate([10,0,0])
    linear_extrude(height=15){
        square(size=[15,4],center=true);
    }
    
}
// left footpad
translate([-24,-15,11.5]) rotate([0,0,20])
linear_extrude(height=Thick){
    offset(r=5) square(size=[20,55],center=true);
}
// left footstrap
translate([-26,-6,28]) rotate([0,90,110])
difference(){
    rotate_extrude(){
        translate([14.5,0,0]) scale([0.2,1.0]) circle(r=6);
    }

//    rotate([0,0,-50]) translate([10,0,-8])
//    linear_extrude(height=15){
//        square(size=[15,5],center=true);
    rotate([90,0,-140]) translate([0,0,-18])
    linear_extrude(height=15){
        difference(){
            square(size=[12,15],center=true);
            translate([10,0]) circle(r=8,center=true);
            translate([-10,0]) circle(r=8,center=true);
        }
    }
}

//----------------------------------------------------------------------------------
// right handlebar
translate([28,0,0]) rotate([0,90,0])
difference(){
    cylinder(r1=11.5+Thick, r2=11.0+Thick, h=10);
    cylinder(r1=11.5, r2=11.0, h=10);
    rotate([0,0,230]) translate([10,0,0])
    linear_extrude(height=15){
        square(size=[15,4],center=true);
    }
}
// right footpad
translate([24,-15,11.5]) rotate([0,0,-20])
linear_extrude(height=Thick){
    offset(r=5) square(size=[20,55],center=true);
}
// right footstrap
translate([26,-6,28]) rotate([0,90,70])
difference(){
    rotate_extrude(){
        translate([14.5,0,0]) scale([0.2,1.0]) circle(r=6);
    }

//    rotate([0,0,50]) translate([10,0,-8])
//    linear_extrude(height=15){
//        square(size=[15,5],center=true);
//    }
        rotate([90,0,-40]) translate([0,0,-18])
    linear_extrude(height=15){
        difference(){
            square(size=[12,15],center=true);
            translate([10,0]) circle(r=8,center=true);
            translate([-10,0]) circle(r=8,center=true);
        }
    }

}

//----------------------------------------------------------------------------------
// tail bar
rotate([10,0,0])
translate([0,-35,0]) rotate([90,0,0])
difference(){
    cylinder(r1=18+Thick, r2=18+Thick, h=10);
    cylinder(r1=18, r2=18, h=10);
    rotate([0,0,-90]) translate([15,0,0])
    linear_extrude(height=15){
        square(size=[15,4],center=true);
    }
}
// tail pad
translate([0,-42,11.5]) rotate([0,0,0])
linear_extrude(height=Thick){
    offset(r=5) square(size=[54,4],center=true);
}

// tail strap
translate([0,-46,38]) rotate([0,80,90])
difference(){
    rotate_extrude(){
        translate([25,0,0]) scale([0.2,1.0]) circle(r=6);
    }

    rotate([0,0,50]) translate([10,0,-8])
    linear_extrude(height=15){
        square(size=[15,5],center=true);
    }
}

//----------------------------------------------------------------------------------
// vertical posts
translate([25,-42,-10]){
    cylinder(r1=4,r2=3,h=115);
    linear_extrude(height=10) offset(r=2) square(size=[8,8],center=true);
}
translate([-25,-42,-10]){
    cylinder(r1=4,r2=3,h=115);
    linear_extrude(height=10) offset(r=2) square(size=[8,8],center=true);
}

// back strap
translate([0,-7,100])
difference(){
    scale([0.7,1,1]) rotate_extrude(){
        translate([50,0,0]) scale([0.2,1.0]) circle(r=6);
    }

    rotate([0,0,0]) translate([-100,0,-8])
    linear_extrude(height=15){
        square(size=[200,200]);
    }
}
/*
// lance
translate([34,-42,96]) rotate([-80,0,0])
    difference(){
        cylinder(r1=4,r2=2,h=80);
        cylinder(r1=2,r2=1.6,h=80);
    }
*/

// lance mounting block
translate([38,-36,96]) rotate([-80,0,0])
    difference(){
        linear_extrude(height=30) offset(r=2) square(size=[8,8],center=true);
        cylinder(r1=4,r2=2,h=80);
    }

// shield mounting block
translate([-38,-36,96]) rotate([-80,0,0])
    difference(){
        linear_extrude(height=30) offset(r=2) square(size=[8,8],center=true);
        cylinder(r1=4,r2=2,h=80);
    }

// halo holders
translate([-30,-42,40]) rotate([10,0,0])
    difference(){
        linear_extrude(height=20) offset(r=2) square(size=[6,6],center=true);
        cylinder(r1=2,r2=1.6,h=30);
    }
    
translate([30,-42,40]) rotate([10,0,0])
    difference(){
        linear_extrude(height=20) offset(r=2) square(size=[6,6],center=true);
        cylinder(r1=2,r2=1.6,h=30);
    }
    


