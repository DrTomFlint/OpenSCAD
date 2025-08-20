//======================================================================
// mmu_frame_holder.scad
//
// frame() is the original setup for Prusa Mk3
// frame2() is the setup with Core One
//
// DrTomFlint 28 July 2024, updated 12 Aug 2025
//
//======================================================================


thick=10;
wide=7;

x1=45.5;  // first bar
x2=5;   // left foot
x3=10;  // right foot

F1=299;
F2=33;

//----------------------------------------------------------------------
module frame(){

  // first bar
  cube([x1,wide,thick],center=true);
  
  // left foot
  translate([-x1/2,-4.5,0])  
  cube([x2,16,thick],center=true);
  translate([-x1/2+2.5,-4.5-7.2,0])  
  cylinder(r=1,h=thick,$fn=6,center=true);

  // right foot
  translate([x1/2,-4.5,0])  
  cube([x2,16,thick],center=true);
  translate([x1/2-2.5,-4.5-8,0])  
  rotate([0,0,5])
  cube([10,5,thick],center=true);

  // mmu bar
  rotate([0,0,8])
  difference(){
    translate([x1/2+3.5,-18+100/2,0])  
    cube([wide,100,thick],center=true);
    
    // bore
    translate([x1/2,10,0])  
    rotate([0,90,0])
    cylinder(r=1.7,h=3*thick,$fn=22,center=true);
    // countersink
    translate([x1/2,10,0])  
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  
    // bore
    translate([x1/2,10+63.5,0])  
    rotate([0,90,0])
    cylinder(r=1.7,h=3*thick,$fn=22,center=true);
    // countersink
    translate([x1/2,10+63.5,0])  
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  }

  // brace bar
  hull(){
    translate([-x1/2+2,0,0])  
    cube([5,5,thick],center=true);
    
    rotate([0,0,8])
    translate([x1/2+3.5,50,0]) cube([5,5,thick],center=true);
  }
  
}

//----------------------------------------------------------------------
module frame2(){

  // first bar
  translate([9.5,-3,0])  
  rotate([0,0,-45])
  difference(){
    cube([x1,wide,thick],center=true);
    // bore
    translate([7,10,0])  
    rotate([0,0,90])
    rotate([0,90,0])
    cylinder(r=1.7,h=6*thick,$fn=22,center=true);
    // countersink
    translate([7,3,0])  
    rotate([0,0,90])
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  }
  
  // mmu bar
  difference(){
    translate([x1/2+3.5,-22+110/2,0])  
    cube([wide,110,thick],center=true);
    
    // bore
    translate([x1/2,10,0])  
    rotate([0,90,0])
    cylinder(r=1.7,h=3*thick,$fn=22,center=true);
    // countersink
    translate([x1/2,10,0])  
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  
    // bore
    translate([x1/2,10+63.5,0])  
    rotate([0,90,0])
    cylinder(r=1.7,h=3*thick,$fn=22,center=true);
    // countersink
    translate([x1/2,10+63.5,0])  
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  }

  // brace bar
  hull(){
    translate([-5,10,0])  
    rotate([0,0,45])
    cube([5,5,thick],center=true);
    
    rotate([0,0,0])
    translate([x1/2+3.5,50,0]) 
    cube([5,5,thick],center=true);
  }
  
}

//----------------------------------------------------------------------
module frame3(){

  // first bar
  translate([9.5,-3,0])  
  rotate([0,0,-45])
  difference(){
    cube([x1-19,wide,thick],center=true);
    // bore
    translate([7,10,0])  
    rotate([0,0,90])
    rotate([0,90,0])
    cylinder(r=1.7,h=6*thick,$fn=22,center=true);
    // countersink
    translate([7,3,0])  
    rotate([0,0,90])
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  }
  
  // mmu bar
  translate([-25,26,0])  
  difference(){
    translate([x1/2+3.5,-22+110/2,0])  
    cube([wide,110,thick],center=true);
    
    // bore
    translate([x1/2,10,0])  
    rotate([0,90,0])
    cylinder(r=1.7,h=3*thick,$fn=22,center=true);
    // countersink
    translate([x1/2,10,0])  
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  
    // bore
    translate([x1/2,10+63.5,0])  
    rotate([0,90,0])
    cylinder(r=1.7,h=3*thick,$fn=22,center=true);
    // countersink
    translate([x1/2,10+63.5,0])  
    rotate([0,90,0])
    cylinder(r=3,h=3,$fn=22,center=true);
  }

  //~ // brace bar
  //~ hull(){
    //~ translate([-5,10,0])  
    //~ rotate([0,0,45])
    //~ cube([5,5,thick],center=true);
    
    //~ rotate([0,0,0])
    //~ translate([x1/2+3.5,50,0]) 
    //~ cube([5,5,thick],center=true);
  //~ }
  
}

//----------------------------------------------------------------------
module bump(){

R = 45;
//~ H = 20;
H = 35;
T=1.8;
X=20;

// main bump
intersection(){
  difference(){
    hull(){
      rotate_extrude($fn=F1)
      translate([R-H/2,0])
      circle(r=H/2,$fn=6);
      
      translate([-X,R-H/2,0])  
      rotate([0,90,0])
      rotate([0,0,30])
      cylinder(r=H/2,h=X,$fn=6);

      translate([-X,-R+H/2,0])  
      rotate([0,90,0])
      rotate([0,0,30])
      cylinder(r=H/2,h=X,$fn=6);
    }
    
    hull(){
      rotate_extrude($fn=F1)
      translate([R-H/2,0])
      circle(r=H/2-T,$fn=6);
      
      translate([-X,R-H/2,0])  
      rotate([0,90,0])
      rotate([0,0,30])
      cylinder(r=H/2-T,h=X,$fn=6);

      translate([-X,-R+H/2,0])  
      rotate([0,90,0])
      rotate([0,0,30])
      cylinder(r=H/2-T,h=X,$fn=6);
    }

    translate([-X/2,0,H*0.866/2-0.6])
    rotate([0,0,90])
    linear_extrude(height=0.8)
    text("Flint  2025", font = "Open Sans:style=Bold", size=7,halign="center",valign="center",spacing=1.2);
    
  }
  translate([-X,-60,0])
  cube([90,120,H]);
}

//~ // lip
  //~ intersection(){
    //~ difference(){
      //~ cylinder(r1=R+T,r2=R-T/2,h=2*T,$fn=F1);
      //~ cylinder(r=R-T,h=4*T,$fn=F1);
    //~ }
    //~ translate([R,0,H/2])  
    //~ cube([90,120,H],center=true);
  //~ }

  //~ intersection(){
    //~ union(){
      //~ translate([-X/2,R-0.15,0])  
      //~ scale([1,1,1.5])
      //~ rotate([0,90,0])
      //~ cylinder(r=T,h=X,$fn=4,center=true);
      //~ translate([-X/2,-R+0.15,0])  
      //~ scale([1,1,1.5])
      //~ rotate([0,90,0])
      //~ cylinder(r=T,h=X,$fn=4,center=true);
    //~ }
    //~ translate([R-X,0,H/2])  
    //~ cube([90,120,H],center=true);
  //~ }

}

//======================================================================

//~ frame();
//~ frame2();
//~ frame3();

bump();

//~ color("red")
//~ translate([0,-7,0])
//~ cube([40,6.5,10],center=true);

//======================================================================
