// BB-6h
// Tophat, enforces the symmetry where 3 hoops meet
// at the top of snowglobe

R=14;     // overall radius
S=6;        // sides
H=2;        // height of one strip cutout
tol=0.25;

difference(){

color("pink")
intersection(){
translate([0,0,-40])
difference(){
    sphere(50, $fa=5, $fs=0.1); 
    sphere(50-3*H, $fa=5, $fs=0.1); 
}
    // Round ends on the star
    //translate([0,0,50])
    union(){
    cylinder(r=R+2, h=10, $fn=S, center=false);
    for(i=[0:5]){
        rotate([0,0,60*i]) translate([R+2,0,0]) 
        cylinder(r=3,h=10,$fn=66);
    }
}
}

color("red")
intersection(){
translate([0,0,-40])
difference(){
    sphere(50+tol, $fa=5, $fs=0.1); 
    sphere(50-H-tol, $fa=5, $fs=0.1); 
}
    linear_extrude(height=10) 
    square(size=[12+2*tol,80],center=true);
}

color("green")
intersection(){
translate([0,0,-40])
difference(){
    sphere(50+tol, $fa=5, $fs=0.1); 
    sphere(50-2*H-tol, $fa=5, $fs=0.1); 
}
    rotate([0,0,120])
    translate([0,40,0])
    linear_extrude(height=10) 
    square(size=[12+2*tol,80],center=true);
}

color("green")
intersection(){
translate([0,0,-40])
difference(){
    sphere(50-H+tol, $fa=5, $fs=0.1); 
    sphere(50-3*H-tol, $fa=5, $fs=0.1); 
}
    rotate([0,0,120])
    translate([0,-40,0])
    linear_extrude(height=10) 
    square(size=[12+2*tol,80],center=true);
}

color("blue")
intersection(){
translate([0,0,-40])
difference(){
    sphere(50-2*H+tol, $fa=5, $fs=0.1); 
    sphere(50-3*H-tol, $fa=5, $fs=0.1); 
}
    rotate([0,0,-120])
    linear_extrude(height=10) 
    square(size=[12+2*tol,80],center=true);
}

// cutout inline with leds
for(i=[0:5]){
    rotate([0,0,30+60*i]) translate([R-0.5,0,0]) cylinder(r=3.5,h=10,$fn=66);
}


// decorative pierce
for(i=[0:5]){
    rotate([0,0,60*i]) translate([R+2.75,0,-H/2]) 
    cylinder(r=1,h=5*H,$fn=66);
}

}



/*

difference(){
    union(){
    
        linear_extrude(height=3*H) circle(r=R,$fn=S, center=true);
    
        translate([0,0,3*H/2]) color("cyan") 
        rotate_extrude($fn=S){
            translate([R,0,0])
            circle(r=3*H/2, $fn=66, center=true);
        }
        
        for(i=[0:5]){
            rotate([0,0,60*i]) translate([R+2,0,0]) 
            cylinder(r=4,h=3*H,$fn=66);
        }
    }
    // decorative pierce?
        for(i=[0:5]){
            rotate([0,0,60*i]) translate([R+2.75,0,-H/2]) 
            cylinder(r=1,h=5*H,$fn=66);
        }
    
    rotate([0,180,0]) translate([0,0,-H-0.05])
    color("red") linear_extrude(height=H+0.1,scale=0.9) square(size=[12+2*tol,80], center=true);
    
    rotate([0,0,120]) translate([0,-19.5,H+.05])
    color("green") linear_extrude(height=2*H+.1) square(size=[12+2*tol,40], center=true);
    
    rotate([0,0,120]) translate([0,19.5,-.05])
    color("green") linear_extrude(height=2*H+.1) square(size=[12+2*tol,40], center=true);
    
    translate([0,0,2*H]) rotate([0,0,-120])
    color("blue") linear_extrude(height=H,scale=0.9) square(size=[12+2*tol,80], center=true);

    for(i=[0:5]){
        rotate([0,0,30+60*i]) translate([R,0,0]) cylinder(r=3.5,h=4*H,$fn=66);
    }
}

*/