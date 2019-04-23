
difference(){
    union(){
        // Main bar
        linear_extrude(height=2,scale=1) 
        offset(r=2,$fn=16) offset(r=-2,$fn=16)
        square(size=[54,14.5],center=true);

        translate([0,0,2])    
        linear_extrude(height=2,scale=0.8) 
        offset(r=2,$fn=16) offset(r=-2,$fn=16)
        square(size=[54,14.5],center=true);
        
    translate([0,0,4]) cylinder(r1=4,r2=2.5,h=4,$fn=22);
    translate([16.5,0,4]) cylinder(r1=4,r2=2.5,h=4,$fn=22);
    translate([-16.5,0,4]) cylinder(r1=4,r2=2.5,h=4,$fn=22);
    
    }
    
    // Channel for tape
    translate([0,0,0])
    linear_extrude(height=1) square(size=[54,12.5],center=true);
    
    // Cutouts for LED bodies
    translate([0,0,1]){
        linear_extrude(height=2) square(size=[6,8],center=true);
        cylinder(r1=1.6,r2=2,h=8,$fn=22);
    }
    
    translate([16.5,0,1]){
        linear_extrude(height=2) square(size=[6,8],center=true);
        cylinder(r1=1.6,r2=2,h=8,$fn=22);
    }

    translate([-16.5,0,1]){
        linear_extrude(height=2) square(size=[6,8],center=true);
        cylinder(r1=1.6,r2=2,h=8,$fn=22);
    }

}

// Add tabs
    translate([23,6.75,-1]) color("orange")
    linear_extrude(height=1) square(size=[4,1],center=true);
    translate([-23,6.75,-1]) color("orange")
    linear_extrude(height=1) square(size=[4,1],center=true);
    translate([23,-6.75,-1]) color("orange")
    linear_extrude(height=1) square(size=[4,1],center=true);
    translate([-23,-6.75,-1]) color("orange")
    linear_extrude(height=1) square(size=[4,1],center=true);
