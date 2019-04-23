// BB-3c
// This is the mount for LED strip

tol=0.25;
extra=4;

    difference(){
    // Cutouts in the bottom outer rail to support fiber crossbar
        ps1=[ [0,0], [15,0], [14,4.5], [1,4.5] ];
        translate([-27,0,0]) rotate([0,90,0])
        linear_extrude(height=54) offset(r=-0.5) polygon(points=ps1);
i=0;
N=4;
    for(i=[0:1:N-1])
        translate([-18+12*i,0,-8]) 
        rotate([90,0,0]) cylinder(r=5,h=10,center=true,$fn=6);
}

        
translate([0,10.5,-13.5]) //rotate([-90,0,0])
difference(){
    union(){
        // Main bar
        linear_extrude(height=2,scale=1) 
        offset(r=2,$fn=16) offset(r=-2,$fn=16)
        square(size=[33,14.5],center=true);

        translate([0,0,2])    
        linear_extrude(height=2,scale=1) 
        offset(r=2,$fn=16) offset(r=-2,$fn=16)
        square(size=[33,14.5],center=true);
        
    translate([16.5/2,0,4]) cylinder(r1=4,r2=2.5,h=4,$fn=22);
    translate([-16.5/2,0,4]) cylinder(r1=4,r2=2.5,h=4,$fn=22);
    
    }
    
    // Channel for tape
    translate([0,0,0])
    linear_extrude(height=1) square(size=[54,12.5],center=true);
    
    // Cutouts for LED bodies
    translate([16.5/2,0,1]){
        linear_extrude(height=2) square(size=[6,8],center=true);
        cylinder(r1=1.6,r2=2,h=8,$fn=22);
    }

    translate([-16.5/2,0,1]){
        linear_extrude(height=2) square(size=[6,8],center=true);
        cylinder(r1=1.6,r2=2,h=8,$fn=22);
    }

}
/*
// Bar
    difference(){
    translate ([0,25,-11]) color("pink") 
        linear_extrude(height=3) 
        square(size=[54, 15]);
i=0;
N=4;
    for(i=[0:1:N-1])
        translate([9+12*i,32,-11]) 
        rotate([0,0,30]) cylinder(r=5,h=10,center=true,$fn=6);
}

/*
// add text for Version
translate ([16,43,3.5]) color("red") 
    linear_extrude(height=1.5){
    text("3C", font = "Open Sans:style=Bold", size=6,halign="center",valign="center",spacing=1.1);
    }

*/