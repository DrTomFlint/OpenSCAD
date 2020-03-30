// nose.scad
// nose shape to make a mask actually seal

thick=1.5;

pts=[ [0,0], [1,0.2],  [2,0.6], [3,1.3], [4,2], [5,3], [6,4.3], [7,5.3], [9,8.3], [11,13], [13,18], [15,21], [18,23], [24,25],
      [32,26], [37,27], [44,28], [51,30], 
      [52,27], [44,25], [37,23], [32,22], [28,21], [24,19], [18,13],
      [12,5], [9,2], [7,0], [5,-2], [2.5,-3.5], [0,-4] ];
      
translate([0,0,-3]){
linear_extrude(height=thick)
polygon(pts);
      
mirror([1,0,0])
linear_extrude(height=thick)
polygon(pts);

translate([52.0,28.5,0])
cylinder(r=2.0,h=thick,$fn=22);      
      
translate([-52.0,28.5,0])
cylinder(r=2.0,h=thick,$fn=22);      
      
}
      
      
