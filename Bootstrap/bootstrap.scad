//=================================================================================
// bootstrap.scad
//
//
// Dr Tom Flint, 3 Dec 2022
//=================================================================================

use <../Parts/rounder.scad>
use <../Parts/threads.scad>
use <../Gears/gears.scad>
use <../Parts/servo1.scad>
use <../BotCam/arm1.scad>

//-----------------------------------------------------------------------------------
module bs1(){

$fn=222;

Bsize=12;
Ssize=12;
hi=10;
off1=1;

  intersection(){

    translate([off1,hi/2,0])
    rotate([90,0,0])
    linear_extrude(height=hi,scale=1)
    text("B", font = "Open Sans:style=Bold", size=Bsize,halign="center",valign="center",spacing=1.2);

    translate([-hi/2,-off1,0])
    rotate([0,90,0])
    rotate([0,0,-90])
    linear_extrude(height=hi,scale=1)
    text("S", font = "Open Sans:style=Bold", size=Ssize,halign="center",valign="center",spacing=1.2);
  
  }

}

//===================================================================================


bs1();

//===================================================================================
