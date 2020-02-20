// windy1.scad
// Bracket to attach windicator to garden hosepipe riser.

//use <../Parts/tslot.scad>
//use <frame.scad>

//======================================
// Customizer Values:
// These must be at the top of the main file, cannot contain any
// computations, and should have a comment above to provide text

// Post Diameter (mm)
PostD=33.8;        

// Post to Pole offset
P2P=15;

// Post clamp height
PostH=12;

// Thickness of the clamp
Thick=7;

// Pole Diameter 1
Pole1=7.7;

// Pole Diameter 2
Pole2=9.0;

// Pole hole tolerance
PoleT=0.15;

// --------------------
module windy1(){
F2=88;  
  
  difference(){
    // boss
    hull(){
      cylinder(r=PostD/2+Thick,h=PostH,$fn=F2);
      
      translate([P2P+PostD/2,0,0])
      cylinder(r=Pole2/2+3,h=PostH,$fn=F2);
    }

    // cut for the post
    translate([0,0,-1])
    cylinder(r=PostD/2,h=PostH+2,$fn=F2);

    // cut for the pole 
    translate([P2P+PostD/2,0,-1])
    cylinder(r=Pole2/2+PoleT,h=PostH+2,$fn=F2);

    // cut to form clamp
    rotate([0,0,45])
    translate([0,PostD/2-1,PostH/2-0.5])
    cube([20,20,PostH+2],center=true);
    

  }

      color("red")
      rotate([0,0,16])
      translate([0,PostD/2+4.35,0])
      cylinder(r=5,h=PostH,$fn=F2);

      color("green")
      rotate([0,0,76])
      translate([0,PostD/2+4.35,0])
      cylinder(r=5,h=PostH,$fn=F2);
}

// --------------------
module windy2(){
F2=88;  
  
  difference(){
    // boss
    hull(){
      cylinder(r=PostD/2+Thick,h=PostH,$fn=F2);
      
      translate([P2P+PostD/2,0,0])
      cylinder(r=Pole2/2+3,h=PostH,$fn=F2);

    }

    // cut for the post
    translate([0,0,-1])
    cylinder(r=PostD/2,h=PostH+2,$fn=F2);

    // cut for the pole 
    translate([P2P+PostD/2,0,1.2])
    cylinder(r=Pole1/2+PoleT,h=PostH+2,$fn=F2);

    // cut to form clamp
    rotate([0,0,45])
    translate([0,PostD/2-1,PostH/2-0.5])
    cube([20,20,PostH+2],center=true);
    

  }
      color("red")
      rotate([0,0,16])
      translate([0,PostD/2+4.35,0])
      cylinder(r=5,h=PostH,$fn=F2);

      color("green")
      rotate([0,0,76])
      translate([0,PostD/2+4.35,0])
      cylinder(r=5,h=PostH,$fn=F2);
}


//===========================

color("cyan")
translate([0,0,30])
//windy1();

windy2();

//============================
