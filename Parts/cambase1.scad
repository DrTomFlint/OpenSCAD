//======================================================================
// cambase1.scad
// This is the back for the camera
//
//======================================================================

use <hexcut.scad>
use <camlid1.scad>
use <tplug.scad>

//----------------------------------------------------------------------
module cambase1(){
    
// main shell
difference(){
    color("yellow")
    linear_extrude(height=5)
    offset(r=2,$fn=80)    
    square(size=[25,24]);

    translate([0,0,1])
    color("orange")
    linear_extrude(height=5)
    offset(r=0.3,$fn=16)    
    square(size=[25,24]);

    translate([4,-3,1])
    color("green")
    cube([17,5,5]);

}
translate([3,-2.5,1.0])
rotate([0,90,0])
scale([1,2]){
    sphere(r=1.0,$fa=5, $fs=0.1);
    translate([0,0,19])
    sphere(r=1.0,$fa=5, $fs=0.1);
    cylinder(r=1.0,h=19,$fn=80);
}
// posts to support PCB
translate([2.0,9.5,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}
translate([2.0,22,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}
translate([23.0,9.5,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}
translate([23.0,22,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}

// pivots on sides to mount
translate([-5,4,2.5])
color("pink")
rotate([0,90,0])
cylinder(r1=2,r2=2.25,h=3,$fn=12);

translate([30,4,2.5])
color("pink")
rotate([0,-90,0])
cylinder(r1=2,r2=2.25,h=3,$fn=12);


} // end module cambase1

//----------------------------------------------------------------------
module cambase9(showcam=80){
    
// main shell
difference(){
  union(){
    color("yellow")
    linear_extrude(height=3)
    offset(r=2,$fn=80)    
    square(size=[25,24]);

    translate([4,0,-8])
    color("green")
    rotate([-10,0,0])
    cube([17,16,11]);
  }
    // slot for the cam
    translate([7,14,-15])
    color("green")
    rotate([-10,0,0])
    cube([11,2,16]);

    // cut for the pcb
    translate([0,0,1.5])
    color("orange")
    linear_extrude(height=5)
    offset(r=0.3,$fn=16)    
    square(size=[25,24]);

    // window for downlooking module
    translate([5,17,-1])
    color("red")
    linear_extrude(height=5)
    offset(r=0.3,$fn=16)    
    square(size=[15,7]);

    // cut for the ribbon cable
    translate([4,-3,1.5])
    color("green")
    cube([17,5,5]);

    translate([12,1,-12])
    color("green")
    rotate([0,90,0])
    cylinder(r=12,h=40,center=true,$fn=55);

}

if(showcam!=0){

    // main board of cam
    translate([0,0,1.5])
    color("green")
    linear_extrude(height=1.5)
    square(size=[25,24]);

    // cam module V2.1
    translate([8,12,-2])
    color("red")
    translate([0,10,0])
    rotate([showcam,0,0])
    translate([0,-10,0])
    cube([9,9,4]);
}

} // end module cambase9

//----------------------------------------------------------------------
module cambase8(showcam=80){
    
// main shell
difference(){
    color("yellow")
    linear_extrude(height=5)
    offset(r=2,$fn=80)    
    square(size=[25,24]);

    translate([0,0,1.5])
    color("orange")
    linear_extrude(height=5)
    offset(r=0.3,$fn=16)    
    square(size=[25,24]);

    // window for downlooking module
    translate([7,10,-2])
    color("red")
    linear_extrude(height=5)
    offset(r=0.3,$fn=16)    
    square(size=[11,24-10]);

    translate([4,-3,1.5])
    color("green")
    cube([17,5,5]);


}

if(showcam!=0){

    // main board of cam
    translate([0,0,1.5])
    color("green")
    linear_extrude(height=1.5)
    square(size=[25,24]);

    // cam module
    translate([7,12,-5])
    color("red")
    translate([0,10,0])
    rotate([showcam,0,0])
    translate([0,-10,0])
    cube([12,12,5]);
}

} // end module cambase8

//----------------------------------------------------------------------
// No pins on the sides
module cambase2(tol=0){
    
// main shell
difference(){
    color("yellow")
    linear_extrude(height=5+tol)
    offset(r=2+tol,$fn=80)    
    square(size=[25,24]);

    translate([0,0,1])
    color("orange")
    linear_extrude(height=5)
    offset(r=0.2,$fn=16)    
    square(size=[25,24]);

    translate([4,-3,1])
    color("green")
    cube([17,5,5]);

}
translate([3-3,-2.5,1.0])
rotate([0,90,0])
scale([1,2]){
    sphere(r=1.0,$fa=5, $fs=0.1);
    translate([0,0,19+6])
    sphere(r=1.0,$fa=5, $fs=0.1);
    cylinder(r=1.0,h=19+6,$fn=80);
}
// posts to support PCB
translate([2.0,9.5,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}
translate([2.0,22,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}
translate([23.0,9.5,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}
translate([23.0,22,1]){
    cylinder(r=2,h=3,$fn=16);
    cylinder(r=0.8,h=4,$fn=16);
}


} // end module cambase1
//----------------------------------------------------------------------
// decorate cambase2
module cambase3(){
    
    difference(){
        cambase2();    
        hexcut1(x0=12.5,y0=3,R=3);
    }
}

//----------------------------------------------------------------------
// decorate cambase2
module cambase4(tol=0){
    
    difference(){
        cambase2(tol=tol);    
        hexcut1(x0=12.5,y0=3,R=3);
    }
    
    // tabs on sides to mount
    translate([-3,8,1+tol/2])
    color("pink")
    cube([3+tol,10+tol,2+tol],center=true);

    translate([28,8,1+tol/2])
    color("pink")
    cube([3+tol,10+tol,2+tol],center=true);
    
}
//----------------------------------------------------------------------

// setup azimuth and elevation
// #1
//~ az = -20;
//~ el = 120;
// #2
//~ az = -15;
//~ el = 130;
// #3
//~ az = -15;
//~ el = 140;
// Dusa Right
//~ az = 15;
//~ el = 140;
// Dusa Left
//~ az = -15;
//~ el = 140;

//-----------------------------------------
// fixed angle mount for top of 30x30 post
module camfixed(az=15,el=140,sight=1){

rotate([0,0,-az]){
    
  difference(){
    hull(){
      // tabs on sides to mount
      translate([-12.6,-5,20])
      rotate([el,0,0])
      translate([-3,8,1])
      color("pink")
      cube([3+2.5,10+2.5,2+2.5],center=true);

      translate([-15.6,3,3])
      cube([5.5,10,1],center=true);

    }
    translate([-12.5,-5,20])
    rotate([el,0,0])
    cambase4(tol=0.2);
    // trim both sides to make space for the lid
    translate([0,-16,22])
    rotate([el,0,0])
    cube([29.6,24,10],center=true);
  }


  difference(){
    hull(){
      // tabs on sides to mount
      translate([12.6,-5,20])
      rotate([el,0,0])
      translate([3,8,1])
      color("pink")
      cube([3+2.5,10+2.5,2+2.5],center=true);

      translate([15.6,3,3])
      cube([5.5,10,1],center=true);

    }
    translate([-12.5,-5,20])
    rotate([el,0,0])
    cambase4(tol=0.2);
    // trim both sides to make space for the lid
    translate([0,-16,22])
    rotate([el,0,0])
    cube([29.6,24,10],center=true);
  }

  difference(){
    union(){
      cylinder(r=20,h=3,$fn=77);
      rotate([0,0,az])
      tplug();
    }
    
    translate([0,8,3-0.6])
    rotate([0,0,180])
    linear_extrude(height=0.9)
    if(az<0){
      text("DL", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.2);
    }else{
      text("DR", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.2);
    }
  }
  
  // add camera sight
  if(sight==1){
    difference(){
      translate([0,-25,19])
      rotate([el,0,0])
      cylinder(r=10,h=5,$fn=33,center=true);
      
      translate([0,-25,19])
      rotate([el,0,0])
      cylinder(r1=8,r2=9,h=22,$fn=33,center=true);
    }
    
  }

}
}

//======================================================================

//translate([80,0,0])
//cambase1();

//translate([40,0,0])
//cambase2();

//~ camlid1();
//~ cambase4();


if(0){
  translate([-12.5,-5,20])
  rotate([0,0,-15])
  rotate([140,0,0]){
    cambase4(tol=0);
    camlid1();
  }
}
//~ rotate([0,0,75]) 
//~ camfixed(sight=0);

cambase9(showcam=0);


//cambase1();

//translate([0,0,30])
//cambase2();

//======================================================================

