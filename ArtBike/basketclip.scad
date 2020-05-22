// basketclip.scad
// Bike basket has this clip on the handle to attach a 3mm sideglow and
// direct the tip towards the whirlygig on the back.

//----------------------------------------------------
module basketclip(){

x1=27.5;
th=3;

pts=[ [0,0], [x1,0], [x1,6], [x1+th,6], [x1+th,-th], [-th,-th],
      [-th,10], [14.5,20], [20,15.5], [18,13.5], [14.5,15.5], [0,6.5] ];

difference(convexity=10){      
  //minkowski(){
    linear_extrude(height=10,convexity=10)
    //fillet inner corners
    offset(r=-1,$fn=88)
    offset(delta=1,$fn=88)
    // round outer corners
    offset(r=1,$fn=88)
    offset(r=-1,$fn=88)
    polygon(pts);      
    
    //cylinder(r=1,$fn=80);
  //}

  color("red")
  translate([-5,7.5,5])
  rotate([0,0,30])
  rotate([0,90,0])
  cylinder(r1=1.4,r2=1.6,h=25,$fn=88);
}

}

//==============================================================

basketclip();

//==============================================================
