// dusa1
// assembly level file for Prusa Dusa 3D printer

use <../Parts/tslot.scad>



//--------------------------------------
module frame(
yoff=-20,       // tower and top offset from center
x1=480,         // length front, back, top rails
y1=330,         // length side rails
z1=380          // height of towers
){
    
x2=x1/2;    // 240
y2=y1/2;    // 165
    
    // front rail
    translate([-x2,y2+15,0])
    rotate([0,90,0])
    tslot1(type=1,len=x1);

    // back rail
    translate([-x2,-y2-15,0])
    rotate([0,90,0])
    tslot1(type=1,len=x1);

    // left rail
    translate([x2-30,-y2,0])
    rotate([0,90,90])
    tslot1(type=2,len=y1);

    // right rail
    translate([-x2+30,-y2,0])
    rotate([0,90,90])
    tslot1(type=2,len=y1);

    // left tower
    translate([x2-30,yoff,15])
    rotate([0,0,0])
    tslot1(type=3,len=z1);

    // right tower
    translate([-x2+30,yoff,15])
    rotate([0,0,0])
    tslot1(type=3,len=z1);

    // top rail
    translate([-x2,yoff,15+z1+15])
    rotate([0,90,0])
    tslot1(type=2,len=x1);

}

//======================================

frame();

//========================================
