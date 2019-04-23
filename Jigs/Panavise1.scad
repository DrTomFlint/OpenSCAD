// Attach aligator arm to panavise.

H=44;

difference(){
    // lower boss fits over vise head
    difference(){
        linear_extrude(height=H,scale=0.95)
        offset(r=2,$fn=12)
        square(size=[34,34],center=true);

        linear_extrude(height=H+1,scale=0.99)
        offset(r=2,$fn=12)
        square(size=[25.5-4,26.5-4],center=true);
    }

    // slot for the back rails
    hull(){
        translate([0,13.25-4.5,H-8.5]) rotate([0,90,0])
        cylinder(r=4.5,h=50,center=true);
        
        translate([0,13.25-4.5,0]) rotate([0,90,0])
        cylinder(r=4.5,h=50,center=true);
    }    
    
        // slot for the screw
    hull(){
        translate([0,-13.25+4,H-18]) rotate([0,90,0])
        cylinder(r=4.5,h=50,center=true);
        
        translate([0,-13.25+4,0]) rotate([0,90,0])
        cylinder(r=4.5,h=50,center=true);
    }    

        // shorten the front leg
    translate([-20,10,-1])
    linear_extrude(height=31)
    square(size=[56,40]);
    
    // rib the sidewalls back
    for(i=[-1:1:1]){
        translate([10*i,-18,28]) rotate([0,0,0])
        cylinder(r=3,h=50,center=true);
    }
    // rib the sidewalls front
    for(i=[-1:1:1]){
        translate([10*i,+19,58]) rotate([0,0,0])
        cylinder(r=3,h=50,center=true);
    }
    // rib the sidewalls
        translate([18,0,28]) rotate([0,0,0])
        cylinder(r=3,h=50,center=true);
        translate([-18,0,28]) rotate([0,0,0])
        cylinder(r=3,h=50,center=true);
    
}
difference(){
union(){
// upper boss holds the aligator arm    
difference(){
    translate([-57/2,-40/2,H+4])
    linear_extrude(height=10)
    offset(r=4,$fn=22)
    square(size=[56,40]);


pa1=[ [0,0], [15,0], [15,22], [42,22], [42,0], [57,0],
    [57,40], [0,40] ];
    
    translate([0,0,H+3]) rotate([0,0,0])
    linear_extrude(height=12,scale=0.99){
        offset(r=1,$fn=12)
        translate([-57/2,-40/2])
        polygon(points=pa1);
    }

}
    
    hull(){
    // landing on upper
    translate([-57/2,-40/2,H+2])
    linear_extrude(height=2)
    offset(r=4,$fn=22)
    square(size=[56,40]);
    // lower land
    translate([0,0,H-2])
    linear_extrude(height=1,scale=1)
    offset(r=2,$fn=12)
    square(size=[34,34],center=true);
    }
    
}    // end union

// Bolt hole
        translate([0,-9,28]) 
        cylinder(r=3,h=H+10);
} // end diff