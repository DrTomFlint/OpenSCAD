//--------------------------------------------------------------------
// Aaxis.scad
// 
// Stepper motor, GT2 belt, slew bearing 10 or 12?
// Setup to swing a Pixelblaze around in a big circle like Poi
// for developing persistence of vision code
//--------------------------------------------------------------------


use <../Parts/motors.scad>
use <../Parts/rounder.scad>



//--------------------------------------------------------------------
module motorBracket(){

  difference(){
    color("cyan")
    hull(){
      translate([0,46/2+10,48])
      cube([58,2,4],center=true);

      translate([0,-46/2,48])
      cube([46,2,4],center=true);
    }
    
    xymotor(tol=0.5);
    
    // motor mount holes
    translate([15.5,15.5,48])
    cylinder(r=1.8,h=10,center=true,$fn=22);
    translate([-15.5,15.5,48])
    cylinder(r=1.8,h=10,center=true,$fn=22);
    translate([15.5,-15.5,48])
    cylinder(r=1.8,h=10,center=true,$fn=22);
    translate([-15.5,-15.5,48])
    cylinder(r=1.8,h=10,center=true,$fn=22);
    
    // center shaft clearance
    translate([0,0,48])
    cylinder(r=3,h=10,center=true,$fn=22);
    
    // beam mount holes
    translate([22,28,48])
    cylinder(r=1.8,h=10,center=true,$fn=22);
    translate([-22,28,48])
    cylinder(r=1.8,h=10,center=true,$fn=22);
    translate([0,28,48])
    cylinder(r=1.8,h=10,center=true,$fn=22);
    
    // round corners
    translate([29,34,44])
    rotate([0,0,180])
    rounder(r=10,h=12,f=133);
    translate([-29,34,44])
    rotate([0,0,-90])
    rounder(r=10,h=12,f=133);
    translate([-24.5,-24,44])
    rotate([0,0,0])
    rounder(r=10,h=12,f=133);
    translate([24.5,-24,44])
    rotate([0,0,90])
    rounder(r=10,h=12,f=133);
  }
  
  // extend the plate over the beam
  
}
//-------------------------------------------------------------------
module hub(){

$fn=222;

difference(){
  union(){
    translate([23,28,14])
    rotate([0,90,0])
    cylinder(r=8,h=10,center=true); 

    color("red")
    hull(){
      rotate([0,0,60])
      translate([46,0,2.5])
      cylinder(r=5,h=5,center=true);

      translate([23,30,2.5])
      cube([10,10,5],center=true);
    }
    color("green")
    translate([23,27,6])
    cube([10,6,12],center=true);

    color("cyan")
    hull(){
      rotate([0,0,60])
      translate([46,0,8])
      cylinder(r=5,h=4,center=true);

      translate([23,30,8])
      cube([10,2,4],center=true);
    }
  }
    
  // cut for expansion ring
  color("pink")
    translate([23,29,8.5])
    rotate([-60,0,0])
    cube([12,7,2],center=true);
  
  // cuts for mounting to slew bearing
    rotate([0,0,1*60])
    translate([46,0,0])
    cylinder(r=1.7,h=25,center=true);

  // main beams
  translate([-45,28,14])
  rotate([0,90,0])
  cylinder(r=4,h=583);

}
  
}

//-------------------------------------------------------------------
module counterWeight(){
  
  
  x1=57;
  $fn=222;
    
  difference(){
    union(){
      translate([-x1,0,18])
      rotate([90,0,0])
      cylinder(r=10.6+1.2, h=76+4, center=true);

      translate([-x1-23,0,18])
      rotate([90,0,0])
      cylinder(r=10.6+1.2, h=76+4, center=true);

      translate([-x1,0,29])
      cube([44,80,2],center=true);

      color("red")
      translate([-60,0,28.3])
      rotate([0,0,-90])
      linear_extrude(height=2,scale=1)
      text("SPIN", font = "Open Sans:style=Bold", size=12,halign="center",valign="center",spacing=1.1);
      
    }

    // nickles
    translate([-x1,0,18])
    rotate([90,0,0])
    cylinder(r=10.6+0.2, h=76+10, center=true);

    translate([-x1-23,0,18])
    rotate([90,0,0])
    cylinder(r=10.6+0.2, h=76+10, center=true);


    translate([-35,40,28])
    rotate([0,0,180])
    rounder(r=18,h=4,f=99);
    translate([-35,-40,28])
    rotate([0,0,90])
    rounder(r=18,h=4,f=99);

    hull(){
      translate([-40,23,18])
      cylinder(r=1.7, h=100, center=true);
      translate([-40,25,18])
      cylinder(r=1.7, h=100, center=true);
    }

    hull(){
      translate([-40,-23,18])
      cylinder(r=1.7, h=100, center=true);
      translate([-40,-25,18])
      cylinder(r=1.7, h=100, center=true);
    }


  }

  
}


//-------------------------------------------------------------------
module endCap(){
  $fn=222;
  
  difference(){
    union(){
      cylinder(r1=10.6+0.4,r2=10.6, h=2);
      translate([0,0,-1.2])
      cylinder(r=12, h=1.2);
    }
    
    cylinder(r=10,h=5);
    translate([21,0,0])
    cube([20,40,10],center=true);

    cylinder(r=5,h=10,center=true);
  }
      

}
//===================================================================

endCap();

//counterWeight();

//translate([-46-17,16,28])
//rotate([180,0,0])
//hub();

//translate([-17,-16,28])
//rotate([0,0,180])
//rotate([180,0,0])
//hub();

//hub();

//motorBracket();

//xymotor(tol=0);

//=====================================================================

