// arm2scad
// scanner part

//-----------------------------------------------------------
module arm2(){
    
ra=88;
F2=88;

  difference(){
    union(){
      // main loop
      difference(){
        // boss
        cylinder(r=ra,h=20,$fn=F2, center=true);
        
        // cut to make a loop
        cylinder(r=ra-3,h=22,$fn=F2, center=true);
        
        // remove the front edge
        translate([0,-130,0])
        cube([200,200,40],center=true);
      }

      // reinforce left
      color("cyan")
      translate([-ra-10,0,0])  
      rotate([0,90,0])
      cylinder(r=28-0.25,h=14,$fn=F2);
      
      // reinforce right
      translate([ra+1.5,0,0])  
      rotate([0,-90,0])
      cylinder(r=12,h=3.5,$fn=F2);
      
    } // end union  

    // cut for the left axle  
    translate([-ra-10.5,0,0])  
    rotate([0,90,0])
    cylinder(r=21,h=16,$fn=88);
    
    // cut for the left bolts to slew13
    for(i=[0,90,180,270]){
      rotate([i+40,0,0])
      translate([-ra-2,24,0])  
      rotate([0,90,0])
      cylinder(r=1.7,h=50,$fn=88,center=true);
    }
    
    // cut for the right axle  
    translate([ra,0,0])  
    rotate([0,90,0])
    cylinder(r=3.6,h=10,$fn=6,center=true);

  }
}
  
//=========================================

arm2();

//==============================================
