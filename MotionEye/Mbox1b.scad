// Mbox1b.scad
// This is the lid
difference(){
union(){
// main tub
translate([-33,-35,0]){
difference(){    

    linear_extrude(height=25.5)
    offset(r=2)
    square([90,125]);
        
    translate([0,0,-0.1])    
    linear_extrude(height=2.1)
    offset(r=1)
    square([90,125]);    

    translate([0,0,0])    
    linear_extrude(height=23.5)
    offset(r=0)
    square([90,125]);    
    
    // cutout for PoE cable in
    color("orange")
    translate([6,0.5,6.5]) 
    rotate([90,0,0])
    linear_extrude(height=4)
    offset(r=2,$fn=12)
    square([16,12]);
   
 }
}   // end of translate for base    


// socket bosses for the camera pole
translate([12,23.5,14.5]){
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    
translate([12,71.5,14.5]){
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    
translate([12,81,14.5]){
    rotate([-90,0,0])
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    

}  // end of union


// cut socket holes for the camera pole
translate([12,23.5,15.5]){
    cylinder(r1=2,r2=2.2,h=11,$fn=20);
}    
translate([12,71.5,15.5]){
    cylinder(r1=2,r2=2.2,h=11,$fn=20);
}    
translate([12,81.5,14.5]){
    rotate([-90,0,0])
    cylinder(r1=2,r2=2.2,h=11,$fn=20);
}    

// cut ribbon cable pass-thru
translate([2,40,23])
    cube([20,1,6]);

// add text
translate ([12,-12,24.75]) color("red") 
    linear_extrude(height=1.5){
    text("M1", font = "Open Sans:style=Bold", size=16,halign="center",valign="center",spacing=1.1);
    }
      
}   // end of difference
    
// posts for the pi
translate([52.5,81.5,4.5]){
    cylinder(r1=2.5,r2=3.5,h=21,$fn=20);
}    
translate([52.5,23.5,4.5]){
    cylinder(r1=2.5,r2=3.5,h=21,$fn=20);
}    
translate([3.5,81.5,4.5]){
    cylinder(r1=2.5,r2=3.5,h=21,$fn=20);
}    
translate([3.5,23.5,4.5]){
    cylinder(r1=2.5,r2=3.5,h=21,$fn=20);
}    


px1=[ [0,0], [4,0], [0,4] ];
    




// mounting ears
difference(){
color("green")
union(){
translate([-44,76,0])    {
    difference(){
        linear_extrude(height=2)
        offset(r=4)
        square([10,10]);    
        
        translate([3,5,-1])
        cylinder(r=2,h=4,$fn=22);
    }    
    translate([9,-3,2])
    rotate([90,0,180])
    linear_extrude(height=4)
    polygon(points=px1);
    translate([9,9,2])
    rotate([90,0,180])
    linear_extrude(height=4)
    polygon(points=px1);
}
translate([-44,-30,0])    {
    difference(){
        linear_extrude(height=2)
        offset(r=4)
        square([10,10]);    
        
        translate([3,5,-1])
        cylinder(r=2,h=4,$fn=22);
    }
    translate([9,-3,2])
    rotate([90,0,180])
    linear_extrude(height=4)
    polygon(points=px1);
    translate([9,9,2])
    rotate([90,0,180])
    linear_extrude(height=4)
    polygon(points=px1);
}
translate([58,76,0])    {
    difference(){
        linear_extrude(height=2)
        offset(r=4)
        square([10,10]);    
        
        translate([6,5,-1])
        cylinder(r=2,h=4,$fn=22);
    }
    translate([1,1,2])
    rotate([90,0,0])
    linear_extrude(height=4)
    polygon(points=px1);
    translate([1,13,2])
    rotate([90,0,0])
    linear_extrude(height=4)
    polygon(points=px1);
}
translate([58,-30,0])    {
    difference(){
        linear_extrude(height=2)
        offset(r=4)
        square([10,10]);    
        
        translate([6,5,-1])
        cylinder(r=2,h=4,$fn=22);
    }
    translate([1,1,2])
    rotate([90,0,0])
    linear_extrude(height=4)
    polygon(points=px1);
    translate([1,13,2])
    rotate([90,0,0])
    linear_extrude(height=4)
    polygon(points=px1);
}
}

    translate([-33,-35,-0.1])
    linear_extrude(height=2.1)
    offset(r=1)
    square([90,125]);    
}



