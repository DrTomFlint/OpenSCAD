// nose.scad
// nose shape to make a mask actually seal

thick=1.5;

pts=[ [0,0], [1,0.2],  [2,0.6], [3,1.3], [4,2], [5,3], [6,4.3], [7,5.3], [9,8.3], [11,13], [13,18], [15,21], [18,23], [24,25],
      [32,26], [37,27], [44,28], [51,30], 
      [52,27], [44,25], [37,23], [32,22], [28,21], [24,19], [18,13],
      [12,5], [9,2], [7,0], [5,-2], [2.5,-3.5], [0,-4] ];
      

pts2=[ [0,0], [1,0.2],  [2,0.6], [3,1.3], [4,2], [5,3], [6,4.3], [7,5.3], [9,8.3], [11,13], [13,18], [15,21], [18,23], [24,25],
      [32,26], [37,27], [44,28], [51,30], 
      [51,29], [44,27], [37,26], [32,25], [24,24], [18,22],
      [15,20], [13,17], [11,12], [9,7.3], [7,4.3], [6,3.3], [5,2], [4,1], [3,0.3], [2,-0.4], [1,-0.8], [0,-1] ];

pts3=[ [0,0,0],  [2,0.6,0], [4,2,0], [6,4.3,0], [7.5,6,0], [9,8.3,0], [10.5,11,0], [11.8,14.3,0], [13,17.5,0], [15,21,0], [18,23,0], [21,24,0], [24,25,0],
      [27.5,25.5,0], [31.6,26.3,0], [36,27,0], [40,27.5,0], [44,28.3,0], [49,29.5,0], [52,30.5,0] ];



//---------------------------
module half(){
translate([0,0,-3]){
difference(){  
linear_extrude(height=thick)
polygon(pts);
translate([0,-2,-1])
for(i=pts3){
 color("red")
 translate(i)
 cylinder(r=0.5,h=4,$fn=18);
}
}
translate([52.0,28.5,0])
difference(){      
cylinder(r=2.0,h=3,$fn=22);      
cylinder(r=1.0,h=3.1,$fn=22);      
}

difference(){
linear_extrude(height=3)
polygon(pts2);
translate([0,2,2])
for(i=pts3){
 color("red")
 translate(i)
 rotate([90,0,0])
 cylinder(r=0.5,h=5,$fn=18);
}
}
}
}
//==================

half();
mirror([1,0,0])
half();

//===================      
      