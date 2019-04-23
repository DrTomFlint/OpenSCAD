// Pro Mini
translate([0,0,10]) color("red"){
    linear_extrude(height=0.86) 
     square(size=[18.4, 33.7]);

    linear_extrude(height=2.8) 
     offset(r=-1)
     square(size=[18.4, 33.7]);
}

// Adafruit PowerBoost 1000c
translate([0,0,20]) color("blue"){
    linear_extrude(height=1.7) 
     square(size=[22.9, 36.8]);

    linear_extrude(height=7.3) 
     offset(r=-0.5)
      square(size=[22.9, 36.8]);
}

// TXB0104 Level Shifter
translate([0,0,30]) color("green") {
    linear_extrude(height=1.7) 
     square(size=[13.4, 18.4]);
        
    linear_extrude(height=3.3) 
     offset(r=-3)
      square(size=[13.4, 18.4]);
 
}

// LIS3DH
translate([0,0,40]) color("yellow") {
    linear_extrude(height=1.7) 
     square(size=[13.4, 23.5]);
        
    linear_extrude(height=3.3) 
     offset(r=-3)
      square(size=[13.4, 23.5]);
 
}

// Piezo
translate([7,7,50]) color("orange") {
    linear_extrude(height=1.4) 
     circle(r=7);
}

