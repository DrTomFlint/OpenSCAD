//=================================================================================
// pipeJig.scad
//
//
// Dr Tom Flint, 3 Dec 2022
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>

//-----------------------------------------------------------------------------------
module jig(){

$fn=222;

//cylinder(r=14.2/2,h=20);
//translate([0,0,20])
//cylinder(r1=14.2/2,r2=16/2,h=10);

R1=4;
R2=2;
R3=3;
x0=7.2;
y0=3;
hi=25;
wide=25;

rotate_extrude(){

    hull(){
        
        translate([x0+R2,R2])
        square([2*R2,2*R2],center=true);

        translate([wide,R1])
        circle(r=R1);

        translate([x0+R2,hi])
        circle(r=R2);
    }
    translate([7.5,R3])
    circle(r=R3);
  }
}

//===================================================================================


jig();

//===================================================================================