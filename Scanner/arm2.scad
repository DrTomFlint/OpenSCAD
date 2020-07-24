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
      translate([-ra-1.5,0,0])  
      rotate([0,90,0])
      cylinder(r=25,h=5,$fn=F2);
      
      // reinforce right
      translate([ra+1.5,0,0])  
      rotate([0,-90,0])
      cylinder(r=12,h=3.5,$fn=F2);
      
    } // end union  

    // cut for the left axle  
    translate([-ra-2,0,0])  
    rotate([0,90,0])
    cylinder(r=12,h=8,$fn=88);

    // cut for the right axle  
    translate([ra+1.5,0,0])  
    rotate([0,90,0])
    cylinder(r=3.6,h=6,$fn=6);

  }
}
//=========================================

arm2();

//==============================================
