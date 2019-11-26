// BB-6h
// Tophat, enforces the symmetry where 3 hoops meet
// at the top of snowglobe

R=18;     // overall radius
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
    union(){
    cylinder(r=R+2, h=10, $fn=S, center=false);
    for(i=[0:5]){
        rotate([0,0,60*i]) translate([R+2,0,0]) 
        cylinder(r=5,h=10,$fn=6);
    }
    for(i=[0:5]){
        rotate([0,0,60*i]) translate([R+8,0,0]) 
        cylinder(r=3,h=10,$fn=6);
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
//for(i=[0:1]){
//    rotate([0,0,30+60*i]) translate([R-0.5,0,0]) cylinder(r=3.5,h=10,$fn=66);
    rotate([0,0,30+60*i]) translate([15,0,0]) cylinder(r=4.5,h=10,$fn=6);
}


// decorative pierce
for(i=[0:5]){
//for(i=[0:1]){
    rotate([0,0,60*i]) translate([R+2,0,-H/2]) 
    cylinder(r=2.5,h=5*H,$fn=6);
}
for(i=[0:5]){
//for(i=[0:1]){
    rotate([0,0,60*i]) translate([R+8,0,-H/2]) 
    cylinder(r=1,h=5*H,$fn=6);
}

}



