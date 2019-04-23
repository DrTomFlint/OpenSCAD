// Lights1b
// Ferrules for 3 mm fiber optic sideglows

// Try a rotated build
p1=[ [0,0], [0,4], [0.5,5], [5.75,5], [6,4], [6,3], [9.,3], [9,4], [9.25,5], [12,5], [12.5,4], [13.5,4],
  [14,5], [16.5,5], [17,4], [27,3], [27,0] ];

difference(){
rotate([0,-90,0])
rotate_extrude(){
rotate([0,0,-90])
polygon(points=p1);
}    
color("cyan")
// measured 2.5, 2.6 diameter
//cylinder(r1=1.6,r2=1.7, h=50,$fn=22);

rotate([0,90,0])
// just a tad too large
//cylinder(r1=1.8,r2=1.9, h=50,$fn=22);
cylinder(r1=1.7,r2=1.8, h=50,$fn=22);
}



translate([0,0,0]) color("blue")
rotate([-3,90,0])
circle(2.0, center=true,$fn=6);