// Mbox1a.scad
// This is the box base

// baseplate with a lip 1mm all around
translate([-33,-35,0]){
linear_extrude(height=1)
offset(r=2)
square([90,125]);
        
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
    cylinder(r=1.1,h=3,$fn=20);
}    
translate([52.5,23.5,1]){
    cylinder(r=2.5,h=2,$fn=20);
    cylinder(r=1.1,h=3,$fn=20);
}    
translate([3.5,81.5,1]){
    cylinder(r=2.5,h=2,$fn=20);
    cylinder(r=1.1,h=3,$fn=20);
}    
translate([3.5,23.5,1]){
    cylinder(r=2.5,h=2,$fn=20);
    cylinder(r=1.1,h=3,$fn=20);
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
}

// mounting ears

color("green")
translate([-44,76,0])    {
    difference(){
        linear_extrude(height=1)
        offset(r=4)
        square([10,10]);    
        
        translate([3,5,-1])
        cylinder(r=2,h=3,$fn=22);
    }
}

translate([-44,-30,0])    {
    difference(){
        linear_extrude(height=1)
        offset(r=4)
        square([10,10]);    
        
        translate([3,5,-1])
        cylinder(r=2,h=3,$fn=22);
    }
}

translate([58,76,0])    {
    difference(){
        linear_extrude(height=1)
        offset(r=4)
        square([10,10]);    
        
        translate([6,5,-1])
        cylinder(r=2,h=3,$fn=22);
    }
}

translate([58,-30,0])    {
    difference(){
        linear_extrude(height=1)
        offset(r=4)
        square([10,10]);    
        
        translate([6,5,-1])
        cylinder(r=2,h=3,$fn=22);
    }
}



