// PiCamera fixture for Rover 9

use <cam1.scad>

use <cambase.scad>
use <camlid.scad>
use <pibase.scad>
use <pilid.scad>
use <siderail.scad>
use <powerbase.scad>
use <powerlid.scad>
use <guards.scad>

use <Beam1.scad>
use <Disk1.scad>


/*
translate([0,48,0])
cambase();

translate([0,-2,0])
pibase();

powerbase();
*/

powerlid();

color("grey")
translate([0,48,0])
camlid();

color("pink")
translate([0,-2,11])
rotate([0,180,0])
pilid();


/*
color("cyan")
translate([0,49,4])
cam1();
*/


/*
siderail();
translate([-4*7.8,0,0])
siderail();

guards();
*/

//-----------------





