// BB-3c
// This is the mount for LED strip

tol=0.25;
extra=4;
/*
//-----------------------
// Piezo
translate([0,3,0]) rotate([-90,-90,0])
color("orange"){
    union(){
        cylinder(r=10,h=0.2);
        cylinder(r=8,h=1);
        translate([0,-7,0.5])
        rotate([90,0,0]) cylinder(r=0.5,h=8);
        translate([1,-7,0.5])
        rotate([90,0,0]) cylinder(r=0.5,h=8);
    }
}
*/
/*
//-----------------------------------
// Horn
translate([0,7,8]) rotate([-90,0,0])

union(){
H=8; // height total
K=4;    // how fast to neck down
J=0.5;  // eccentricity
L=45;    // rotation
Y=0;    // y-axis offset

for(i=[0:99]){
    translate([0,Y*i/100,H*i/100])
    rotate([L*i/100,0,0])
         scale([1-J*i/100,1,1]){
     difference(){
         cylinder(r=12-K*i/100,h=0.4);
         cylinder(r=10-K*i/100,h=0.8,center=true);
     }
 }
 }

translate([0,-30,8])
rotate([90,0,180])

color("pink"){
H2=30; // height total
K2=4;    // how fast to neck down
J2=.5;  // eccentricity
J3=.5;  // eccentricity
L2=45;    // rotation
Y2=0;    // y-axis offset

for(i=[0:99]){
    translate([0,Y2*i/100,H2*i/100])
    rotate([L2*i/100,0,0])
         scale([1-J2*i/100+J3*(99-i)/100,1-J3*(99-i)/100,1]){
     difference(){
         cylinder(r=12-K2*i/100,h=0.4);
         cylinder(r=10-K2*i/100,h=1,center=true);
     }
 }
 }
}




// attachment to base
    translate([0,0,-3])
    difference(){
        cylinder(r=14,h=3.5);
        cylinder(r1=12,r2=9,h=3.6);
        cylinder(r1=12,r2=12,h=2.0);
    }
    
    
}   // end of union

// Number tag
    translate([0,19.0+3,28]) rotate([90,0,0]){
        difference(){
        cylinder(r=8,h=1);
    
    translate ([-0.5,-0.5,0.5]) color("red") rotate([0,180,0])
    linear_extrude(height=1.0){
    text("7", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);
    }
}
}
*/

//-------------------------------------
// backshell
translate([0,0.5,8]) rotate([-90,0,0])
color("green"){
    difference(){
        cylinder(r=12,h=6);
        translate([0,0,5]) cylinder(r1=10.25,r2=10.75,h=6);
        translate([0,0,1]) cylinder(r=9,h=6);
        translate([-18,0,5.5]) rotate([0,90,0]) cylinder(r=2,h=10,$fn=22);
    }
}

//-------------------------------
// Crossbar

    difference(){
    // Cutouts in the bottom outer rail to support fiber crossbar
        ps1=[ [0,0], [15,0], [14,4.5], [1,4.5] ];
        translate([-27,0,0]) rotate([0,90,0])
        linear_extrude(height=54) offset(r=-0.2) polygon(points=ps1);
i=0;
N=4;
    for(i=[0:1:N-1])
        translate([-18+12*i,0,-8]) 
        rotate([90,0,0]) cylinder(r=5,h=10,center=true,$fn=6);
}

//----------------
// LED support
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
    
    // Cutouts for LED bodies and fibers
    translate([16.5/2,0,1]){
        linear_extrude(height=2) square(size=[6,8],center=true);
        cylinder(r1=1.5,r2=1.8,h=8,$fn=22);
    }

    translate([-16.5/2,0,1]){
        linear_extrude(height=2) square(size=[6,8],center=true);
        cylinder(r1=1.5,r2=1.8,h=8,$fn=22);
    }

}
