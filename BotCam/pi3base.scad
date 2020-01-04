// pi3base

use <../Parts/beam1.scad>

//------------
module postpi(){
    cylinder(r1=3,r2=2.7,h=3,$fn=20);
    translate([0,0,3])
    cylinder(r1=1.3,r2=1.0,h=1.5,$fn=20);
}
//-----------------
module pi3base(){

difference(){
    linear_extrude(height=5.5)
    offset(r=2,$fn=40)
    square([56,85],center=true);

    translate([0,0,1.5])
    linear_extrude(height=6)
    offset(r=0.2,$fn=40)
    square([56,85],center=true);

    // cut for sd card
    color("orange")
    translate([-13/2,-42.5-3.5,1.5])
    cube([13,17,10]);

    // vents
    for(i=[0:4])
        translate([0,-30+16*i,-1])
        cylinder(r=8,h=5,$fn=6);

    for(i=[0:3])
        translate([-14,-30+16*i+8,-1])
        cylinder(r=8,h=5,$fn=6);

    for(i=[0:3])
        translate([14,-30+16*i+8,-1])
        cylinder(r=8,h=5,$fn=6);
}

// posts for the pi
translate([0,-10,0.9]){
    translate([24.5,29,0]){
        postpi();
    }    
    translate([24.5,-29,0]){
        postpi();
    }    
    translate([-24.5,29,0]){
        postpi();
    }    
    translate([-24.5,-29,0]){
        postpi();
    }    
}
}

//-----------------
module pi3base2(){


difference(){
    linear_extrude(height=4.5)
    offset(r=2,$fn=40)
    square([56,85],center=true);

    translate([0,0,0.5])
    linear_extrude(height=6)
    offset(r=0.2,$fn=40)
    square([56,85],center=true);

    // cut for sd card
    color("orange")
    translate([-13/2,-42.5-3.5,1.5])
    cube([13,17,10]);

    translate([0,0,-1])
    linear_extrude(height=6)
    offset(r=0.2,$fn=40)
    square([42,80],center=true);
}

// posts for the pi
translate([0,-10,0.5]){
    translate([24.5,29,0]){
        postpi();        
    }    
    translate([24.5,-29,0]){
        postpi();
    }    
    translate([-24.5,29,0]){
        postpi();
    }    
    translate([-24.5,-29,0]){
        postpi();
    }    
}


// beam box
//translate([3*8+4,6*8,-7.8])
//rotate([0,0,90])
//beam1(N=8);

translate([5*8+4,6*8,-7.8])
rotate([0,0,90])
beam1(N=13);

//translate([3*8+4,-6*8,-7.8])
//rotate([0,0,90])
//beam1(N=8);

translate([5*8+4,-6*8,-7.8])
rotate([0,0,90])
beam1(N=13);

translate([3*8+4,-6*8,-7.8])
beam1(N=13);

translate([-3*8-4,-6*8,-7.8])
beam1(N=13);

difference(){
    translate([0,0,-7.8])
    linear_extrude(height=7.8)
    square([6*8+2,11*8+2],center=true);

    translate([0,0,-6])
    linear_extrude(height=9)
    offset(r=0.2,$fn=40)
    square([42,80],center=true);

    // vents
    for(i=[0:4])
        translate([0,-32+16*i,-10])
        cylinder(r=8,h=5,$fn=6);

    for(i=[0:3])
        translate([-14,-32+16*i+8,-10])
        cylinder(r=8,h=5,$fn=6);

    for(i=[0:3])
        translate([14,-32+16*i+8,-10])
        cylinder(r=8,h=5,$fn=6);
}

}//==================================

//pi3base();
pi3base2();


