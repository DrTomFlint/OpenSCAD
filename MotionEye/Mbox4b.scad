// Mbox2b.scad
// This is the lid
use <Mbox3a.scad>

//---------------------
module ear1(){
px1=[ [0,0], [11.5,0], [0,12] ];
    difference(){
//        linear_extrude(height=2)
//        offset(r=4)
//        square([10,10]);    
        translate([-2,-2,1])
            minkowski(){
                cube(size=[14,15,1]);
                sphere(1.0,$fn=40);
            }
        
        translate([3,5,-1])
        cylinder(r=3,h=4,$fn=22);
        
        color("blue")
        translate([9,-10,-1])
        cube(size=[8,30,10]);
    }    

    translate([9,-2,2])
    rotate([90,0,180])
    linear_extrude(height=3)
    polygon(points=px1);

    translate([9,10.5,2])
    rotate([90,0,180])
    linear_extrude(height=3)
    polygon(points=px1);

} // end module ear1()

//================================
module lid3(){
    
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
    linear_extrude(height=4.1)
    offset(r=1,$fn=40)
    square([90,125]);    

    // second cutout 2 mm inward
//    translate([0,0,0])    
//   linear_extrude(height=23.5)
//    offset(r=0)
//    square([90,125]);    
    translate([1,1,0])    
    linear_extrude(height=23.5)
    offset(r=1,$fn=40)
    square([88,123]);    
    
    // cutout for PoE cable in
    color("orange")
    translate([6,0.5,8.0]) 
    rotate([90,0,0])
    linear_extrude(height=4)
    offset(r=2,$fn=12)
    square([16,12]);
 } 
}   // end of translate for base    

// posts for the pi
translate([52.5,81.5,3.5]){
    color("pink")
    cylinder(r1=2.5,r2=3.5,h=21,$fn=20);
}    
translate([52.5,23.5,3.5]){
    cylinder(r1=2.5,r2=3.5,h=21,$fn=20);
}    
translate([3.5,81.5,3.5]){
    cylinder(r1=2.5,r2=3.5,h=21,$fn=20);
}    
translate([3.5,23.5,3.5]){
    cylinder(r1=2.5,r2=3.5,h=21,$fn=20);
}    

// socket bosses for the camera pole
translate([12,23.5,14.5]){
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    
translate([12,82,14.5]){
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    
translate([21,-30,14.5]){
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
translate([21,-25,14.5]){
    rotate([0,90,-90])
    cylinder(r1=4,r2=4.5,h=11,$fn=20);
}    
translate([-22,81,14.5]){
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
translate([21,-30,15.5]){
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
translate([21,-26,14.5]){
    rotate([0,90,-90])
    cylinder(r1=2,r2=2.2,h=12,$fn=20);
}    
translate([-23,81,14.5]){
    rotate([0,90,180])
    cylinder(r1=2,r2=2.2,h=12.1,$fn=20);
}    

// cut ribbon cable pass-thru
translate([2,40,23])
    color("gray")
    cube([20,1,6]);

// cut ribbon cable pass-thru
translate([8,88,8])
    color("purple")
    cube([20,6,1]);

// cut ribbon cable pass-thru
translate([11,-39,8])
    color("cyan")
    cube([20,6,1]);

translate([55,-2,8])
    color("orange")
    cube([6,20,1]);

translate([-38,52,8])
    color("red")
    cube([6,20,1]);

translate([-10,50,23])
    color("green")
    cube([1,20,6]);


// cut text
translate ([12,-8,25.1]) color("red") 
    linear_extrude(height=0.5){
    text("M8", font = "Open Sans:style=plain", size=16,halign="center",valign="center",spacing=1.3);
    }
      
// cut tiny holes in posts for the pi
// don't go all the way thru to the top surface
translate([52.5,81.5,2.0]){
    cylinder(r1=1.5,r2=2.5,h=22.5,$fn=8);
}    
translate([52.5,23.5,2.0]){
    cylinder(r1=1.5,r2=2.5,h=22.5,$fn=8);
}    
translate([3.5,81.5,2.0]){
    cylinder(r1=1.5,r2=2.5,h=22.5,$fn=8);
}    
translate([3.5,23.5,2.0]){
    cylinder(r1=1.5,r2=2.5,h=22.5,$fn=8);
}    


// cutout for ears
translate([-44,74,0])
            minkowski(){
                cube(size=[14,15,2]);
                sphere(1.1,$fn=40);
            }

translate([-44,-32,0])   
            minkowski(){
                cube(size=[14,15,2]);
                sphere(1.1,$fn=40);
            }

translate([57,74,0])    
            minkowski(){
                cube(size=[14,15,2]);
                sphere(1.1,$fn=40);
            }

translate([57,-32,0])    
            minkowski(){
                cube(size=[14,15,2]);
                sphere(1.1,$fn=40);
            }

}   // end of difference




  
// mounting ears
px1=[ [0,0], [11.5,0], [0,12] ];

translate([-44,76,3])
    ear1();

translate([-44,-30,3])   
    ear1();

translate([68,76,3])    
    mirror([1,0,0])
    ear1();

translate([68,-30,3])    
    mirror([1,0,0])
    ear1();

} // end of module lid3()


//difference(){
translate([0,0,1])
lid3();

//color("gray")
//base3();
//}





