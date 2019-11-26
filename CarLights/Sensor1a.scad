//================================================
// Sensor1a 
// Housing for the IR sensors for 12v leds
//

//----------------------------------------------
module eye1(){
    
difference(){
    union(){
    cylinder(r=9,h=7,$fn=88);
    cylinder(r1=10,r2=9,h=2,$fn=88);
        
    hull(){
        color("cyan")
        translate([5,8,0])
        cylinder(r=1,h=9,$fn=22);

        color("pink")
        translate([-5,8,0])
        cylinder(r=1,h=9,$fn=22);
    }   // end of hull
    
    }   // end of union
    
    // conical cut
    color("green")
    translate([0,0,4.5])
    cylinder(r1=3,r2=8,h=2.6,$fn=88);

    // square cut for body of sensor
    color("red")
    translate([-3.5,-11,-1])
    cube([7,16,6]);

    // cut for hinge square
    color("red")
    translate([-3,5,7])
    cube([6,6,3]);

    // cut for hinge cylinder
    color("pink")
    translate([-4.5,8.5,7.5])
    rotate([0,90,0])
    cylinder(r=0.75,h=9,$fn=22);

}   // end of difference


}   // end of module eye1

//----------------------------------------------
module lid1(){

    difference(){
        union(){
            color("orange")
            translate([0,0,7])
            cylinder(r=9,h=1,$fn=88);
            color("orange")
            translate([0,0,8])
            cylinder(r1=9,r2=8,h=1,$fn=88);
        }
        // cut for hinge square
        color("red")
        translate([2.8,6.5,7])
        cube([4,4,3]);

        color("red")
        translate([-2.8-4,6.5,7])
        cube([4,4,3]);

        color("red")
        translate([-8,8.5,7])
        cube([12,4,3]);
    }

    // hinge
    color("pink")
    translate([-4,8.5,7.5])
    rotate([0,90,0])
    cylinder(r=0.55,h=8,$fn=22);


}   // end of module lid1

//================================================


// left side
//eye1();
lid1();

/*

// right side
translate([20,0,0]){
    eye1();
//    lid1();
}

// base
difference(){
    hull(){
        translate([0,0,-1])
        cylinder(r1=11,r2=10.5,h=1,$fn=88);

        translate([20,0,-1])
        cylinder(r1=11,r2=10.5,h=1,$fn=88);
    }
    
    translate([10,-7.5,-1.5])
    cylinder(r1=1,r2=2,h=2,$fn=44);

    translate([10,7.5,-1.5])
    cylinder(r1=1,r2=2,h=2,$fn=44);

}

*/
//================================================

