// Mbox2a.scad
// This is the box base


//----------------------------------------------
module post1(){
        difference(){
        union(){
            // foot
            linear_extrude(height=1)
            offset(r=4)
            square([10,10]);    
            
            // outer cylinder
            translate([3,5,0])
            cylinder(r=2.8,h=4.5,$fn=22);

            // flanges
            translate([3,5,3])
            cylinder(r1=2.8,r2=3.2,h=0.4,$fn=22);
            translate([3,5,3.4])
            cylinder(r1=3.2,r2=2.8,h=1.1,$fn=22);
        }
        // cut hole thru center
        translate([3,5,-1])
        cylinder(r=1.5,h=7,$fn=22);
        // cut slots to allow insertion
        translate([3,5,5])
        cube([1,12,6],center=true);
    }
}   // end of module post1

//----------------------------------------------
module post2(){
        difference(){
        union(){
            // foot
            linear_extrude(height=1)
            offset(r=4)
            square([10,10]);    
            
            // outer cylinder
            translate([6,5,0])
            cylinder(r=2.8,h=4.5,$fn=22);

            // flanges
            translate([6,5,3])
            cylinder(r1=2.8,r2=3.2,h=0.4,$fn=22);
            translate([6,5,3.4])
            cylinder(r1=3.2,r2=2.8,h=1.1,$fn=22);
        }
        // cut hole thru center
        translate([6,5,-1])
        cylinder(r=1.5,h=7,$fn=22);
        // cut slots to allow insertion
        translate([6,5,5])
        cube([1,12,6],center=true);
    }
}   // end of module post1
//===============================================

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
    offset(r=2)
    square([90,125]);

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
}


// 1 mm lip all around edge of baseplate
difference(){    
    translate([0,0,1])    
    linear_extrude(height=2)
    offset(r=1)
    square([90,125]);    

    translate([0,0,1])    
    linear_extrude(height=3)
    offset(r=0)
    square([90,125]);    
    }


}   // end of translate for base    
    
// posts for the pi
translate([52.5,81.5,1]){
    cylinder(r=2.5,h=2,$fn=20);
    cylinder(r=1.1,h=3.4,$fn=20);
}    
translate([52.5,23.5,1]){
    cylinder(r=2.5,h=2,$fn=20);
    cylinder(r=1.1,h=3.4,$fn=20);
}    
translate([3.5,81.5,1]){
    cylinder(r=2.5,h=2,$fn=20);
    cylinder(r=1.1,h=3.4,$fn=20);
}    
translate([3.5,23.5,1]){
    cylinder(r=2.5,h=2,$fn=20);
    cylinder(r=1.1,h=3.4,$fn=20);
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
}

// mounting ears

color("green")
translate([-44,76,0])    
post1();

translate([-44,-30,0])    
post1();

translate([58,76,0])    
post2();

translate([58,-30,0])    
post2();
   


// add text
translate ([26,-20,1]) color("red") 
    linear_extrude(height=0.35){
    text("M 1", font = "Open Sans:style=Bold", size=16,halign="center",valign="center",spacing=1.1);
    }

