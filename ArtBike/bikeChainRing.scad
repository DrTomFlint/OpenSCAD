//=================================================================================
// bikeChainRing.scad
//
// chain ring for the ArtBike so my cuffs don't get black with grease and dirt
//
// Dr Tom Flint, 27 Dec 2021
//=================================================================================


use <../Parts/rounder.scad>

// 15 letters
word = ["H","E","D","W","I","G","S"," ","H","O","L","I","D","A","Y"];


//---------------------------------------------------------------------------------
module ring(){


  difference(){
    // main disk
    cylinder(r=95,h=3,$fn=222);

    // center hole
    cylinder(r=45,h=9,$fn=222,center=true);
    
    // 4 holes for mounting
    for(i=[0:3]){
      rotate([0,0,45+i*90])
      translate([51,0,0])
      cylinder(r=2.2,h=9,center=true,$fn=22);
    }
    
    // 4 holes in center pattern
    for(i=[0:3]){
      rotate([0,0,i*90])
      translate([45,0,0])
      cylinder(r=30,h=9,center=true,$fn=222);
    }

    // one extra size hole for the pedal clearance
    translate([45,0,0])
    scale([1.4,1,1])
    cylinder(r=30,h=9,center=true,$fn=222);
    
    // lettering
    //color("red")
    for(i=[0:14]){
      rotate([0,0,-125-i*20])
      translate([0,83,3-0.6])
      linear_extrude(height=1)
      text(word[i], font = "Open Sans:style=Bold", size=13,halign="center",valign="center",spacing=1.1);
    }

  }
  

}
//------------------------------------------------------------------------------------
module wordA(){

    // lettering
    for(i=[0:7]){
      rotate([0,0,-125-i*20])
      translate([0,83,3-0.6])
      linear_extrude(height=0.6)
      text(word[i], font = "Open Sans:style=Bold", size=13,halign="center",valign="center",spacing=1.1);
    }
}
  
//------------------------------------------------------------------------------------
module wordB(){

    // lettering
    for(i=[8:14]){
      rotate([0,0,-125-i*20])
      translate([0,83,3-0.6])
      linear_extrude(height=0.6)
      text(word[i], font = "Open Sans:style=Bold", size=13,halign="center",valign="center",spacing=1.1);
    }
}
 
 
//------------------------------------------------------------------------------------
module standOff(){

   difference(){
    // main disk
    cylinder(r1=16/2,r2=15/2,h=5,$fn=222);

    // center hole
    cylinder(r=2.2,h=99,$fn=222,center=true);
    // clearance
    cylinder(r=13.8/2,h=1.5,$fn=222,center=true);
  }

}
 
  
//====================================================================================

standOff();

//color("white")
//ring();

//color("purple")
//wordA();

//color("green")
//wordB();

//====================================================================================

