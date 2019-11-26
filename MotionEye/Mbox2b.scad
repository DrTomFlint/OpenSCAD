// Mbox2b.scad
// This is the lid
difference(){
union(){
// main tub
translate([-33,-35,0]){
difference(){    
    // main boss
//    linear_extrude(height=25.5)
union(){
    linear_extrude(height=23.5)
    offset(r=2,$fn=22)
    square([90,125]);
 
          // add dome lid?
         hull(){
         translate([0,0,23.5])
         color("pink")
         sphere(r=2,$fa=5, $fs=0.1);
         translate([90,0,23.5])
         color("pink")
         sphere(r=2,$fa=5, $fs=0.1);
         translate([90,125,23.5])
         color("pink")
         sphere(r=2,$fa=5, $fs=0.1);
         translate([0,125,23.5])
         color("pink")
         sphere(r=2,$fa=5, $fs=0.1);
    }
}
    // first cutout 1 mm inward
    translate([0,0,-0.1])    
    linear_extrude(height=2.1)
    offset(r=1)
    square([90,125]);    
    // second cutout 2 mm inward
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

// socket bosses for the camera pole
translate([12,23.5,14.5]){
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    
translate([12,82,14.5]){
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    
translate([27,-30,14.5]){
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    
translate([12,81,14.5]){
    rotate([-90,0,0])
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    
translate([46,23.5,14.5]){
    rotate([0,90,0])
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    
translate([27,-25,14.5]){
    rotate([0,90,-90])
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    
translate([-22,81,14.5]){
    color("pink")
    rotate([0,90,180])
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    

}  // end of union

// cut socket holes for the camera pole
translate([12,23.5,15.5]){
    cylinder(r1=2,r2=2.2,h=12.1,$fn=20);
}    
translate([12,82,15.5]){
    cylinder(r1=2,r2=2.2,h=12.1,$fn=20);
}    
translate([27,-30,15.5]){
    cylinder(r1=2,r2=2.2,h=12.1,$fn=20);
}    
translate([12,81.5,14.5]){
    rotate([-90,0,0])
    cylinder(r1=2,r2=2.2,h=11,$fn=20);
}    
translate([48.5,23.5,14.5]){
    rotate([0,90,0])
    cylinder(r1=2,r2=2.2,h=11,$fn=20);
}    
translate([27,-26,14.5]){
    rotate([0,90,-90])
    color("pink")
    cylinder(r1=2,r2=2.2,h=12,$fn=20);
}    
translate([-23,81,14.5]){
    color("pink")
    rotate([0,90,180])
    cylinder(r1=2,r2=2.2,h=12.1,$fn=20);
}    

// cut ribbon cable pass-thru
translate([2,40,23])
    cube([20,1,6]);

// cut ribbon cable pass-thru
translate([8,88,8])
    color("cyan")
    cube([20,6,1]);

// cut text
translate ([12,-8,25.1]) color("red") 
    linear_extrude(height=0.5){
    text("M 2", font = "Open Sans:style=plain", size=16,halign="center",valign="center",spacing=1.1);
    }
      
// cut tiny holes in posts for the pi
// don't go all the way thru to the top surface
translate([52.5,81.5,5.0]){
    cylinder(r1=1.5,r2=2.5,h=20.2,$fn=8);
}    
translate([52.5,23.5,5.0]){
    cylinder(r1=1.5,r2=2.5,h=20.2,$fn=8);
}    
translate([3.5,81.5,5.0]){
    cylinder(r1=1.5,r2=2.5,h=20.2,$fn=8);
}    
translate([3.5,23.5,5.0]){
    cylinder(r1=1.5,r2=2.5,h=20.2,$fn=8);
}    

}   // end of difference
  

// mounting ears
px1=[ [0,0], [11.5,0], [0,12] ];

difference(){
color("green")
union(){
translate([-44,76,0])    {
    difference(){
        linear_extrude(height=2)
        offset(r=4)
        square([10,10]);    
        
        translate([3,5,-1])
        cylinder(r=3,h=4,$fn=22);
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
        cylinder(r=3,h=4,$fn=22);
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
        cylinder(r=3,h=4,$fn=22);
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
        cylinder(r=3,h=4,$fn=22);
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



