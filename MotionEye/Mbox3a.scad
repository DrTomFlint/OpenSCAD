// Mbox3a.scad
// This is the box base



//----------------------------------------------
module post1b(){
        difference(){
        union(){
            // foot
            translate([-2,-2,1])
            minkowski(){
                cube(size=[14,15,2]);
                sphere(1,$fn=40);
            }
            
            // outer cylinder
            translate([3,5,3])
            cylinder(r=2.8,h=4.5,$fn=22);

            // flanges
            translate([3,5,6])
            cylinder(r1=2.8,r2=3.0,h=0.4,$fn=22);
            translate([3,5,6.4])
            cylinder(r1=3.0,r2=2.8,h=1.1,$fn=22);
            // base fillet
            translate([3,5,4])
            cylinder(r1=3.1,r2=2.8,h=0.3,$fn=22);
        }
        // cut hole thru center
        translate([3,5,-1])
        cylinder(r1=0.5,r2=2,h=10,$fn=22);
        // cut slots to allow insertion
        translate([3,5,7.5])
        cube([1,12,6],center=true);
        // trim off rounded edge
        translate([11,-10,-1])
        cube(size=[4,25,12]);
    }
}   // end of module post1b

//------------
module postpi(){
    cylinder(r=3,h=2,$fn=20);
    translate([0,0,2])
    cylinder(r1=1.3,r2=1.0,h=3,$fn=20);
}

//===============================================

module base3(){
    
// translate baseplate and rim 
translate([-33,-35,0]){

/*
// baseplate
linear_extrude(height=1)
offset(r=2)
square([90,125]);
*/
// baseplate with holes cut
difference(){
    linear_extrude(height=1)
    offset(r=2,$fn=40)
    square([90,125]);
/*
    for(i=[0:2]){
        translate([40+i*20,40,-1])
        rotate([0,0,30])
        cylinder(r=10,h=10,$fn=6);
    }
    for(i=[0:1]){
        translate([50+i*20,40+18*1,-1])
        rotate([0,0,30])
        cylinder(r=10,h=10,$fn=6);
    }
    for(i=[0:2]){
        translate([40+i*20,40+18*2,-1])
        rotate([0,0,30])
        cylinder(r=10,h=10,$fn=6);
    }
    for(i=[-2:1]){
        translate([50+i*20,40+18*3,-1])
        rotate([0,0,30])
        cylinder(r=10,h=10,$fn=6);
    }
    for(i=[-1,1]){
        translate([40+i*20,40+18*4,-1])
        rotate([0,0,30])
        cylinder(r=10,h=10,$fn=6);
    }
    */
}


// 1 mm lip all around edge of baseplate
// increased to 3 mm high
difference(){    
    translate([0,0,1])    
    linear_extrude(height=4)
    offset(r=1,$fn=40)
    square([90,125]);    
/*
    translate([0,0,1])    
    linear_extrude(height=5)
    offset(r=0)
    square([90,125]);    
*/
    color("pink")
    translate([1,1,1])    
    linear_extrude(height=5)
    offset(r=1,$fn=40)
    square([88,123]);    
    }


}   // end of translate for base    
    
// posts for the pi
translate([52.5,81.5,1]){
    postpi();
}    
translate([52.5,23.5,1]){
    postpi();
}    
translate([3.5,81.5,1]){
    postpi();
}    
translate([3.5,23.5,1]){
    postpi();
}    
      
// boss for PoE
difference(){
    color("pink")
    translate([-32,-33,1])
    linear_extrude(height=5)
    offset(r=1)
    square([29,81]);

    color("cyan")
    translate([-31,-32,1])
    linear_extrude(height=6)
    offset(r=1)
    square([26.5,78]);
    
    // extra little cutout for the audio jack
    translate([-5,26,1])
    cube([4,15,6]);

    // cutout for the PoE strain relief
    translate([-28.5,46,1])
    cube([22,4,6]);
}

// mounting ears

translate([-44,76,0])    
post1b();

translate([-44,-30,0])    
post1b();

translate([68,76,0])    
mirror([1,0,0])
post1b();

color("cyan")
translate([68,-30,0])    
mirror([1,0,0])
post1b();
   


// add text
translate ([26,-20,1]) color("red") 
    linear_extrude(height=0.35){
    text("M8", font = "Open Sans:style=Bold", size=12,halign="center",valign="center",spacing=1.3);
    }

} // end module base3()


base3();

