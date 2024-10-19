/*
Screw capture plate add-on for MMU2S
Original by Blindside_o0 at https://www.printables.com/model/68165

This version includes wider viewing openings as well as openings in front.
Reverse-engineered in OpenSCAD by Alex Matulich, April 2022

On Printables: https://www.printables.com/model/172280
On Thingiverse: https://www.thingiverse.com/thing:5355285

Version 2 of Blindside_o0's excellent design included ports on the sides of the capture cage to view the screw head. It is important for me to know where the screw heads are -- mine need to be flush with the top of the MMU cover for proper tension -- but my printer is situated so that I cannot easily look into the side holes. I need to look in from the front. In reverse-engineering the design in OpenSCAD, I made the existing side holes larger and cut additional viewing holes in the front, so that I can more easily see if the top of the screw head is flush with the top of the cover.
*/

translate([0,0,-4.5]) {
    difference() {
        solids();
        holes();
        //~ #translate([-75,31.5,0]) rotate([0,90,0]) linear_extrude(150) polygon(points=[[1,1], [1,-3], [-3,1]]);
        translate([0,43,0]) cube([200,40,20],center=true);

    }
}

module solids() {
    union() {
        //~ #linear_extrude(2, convexity=6) polygon(points=[[-62.5,32], [-54.5,32], [-54.5,-6], [53.5,-6], [53.5,32], [62.5,32],
        //~ [62.5,-15.5], [-17.5,-15.5], [-17.5,-13.75], [-62.5,-13.75]]);
        linear_extrude(3, convexity=6) polygon(points=[[-62.5,32], [-54.5,32], [-54.5,-6], [53.5,-6], [53.5,32], [62.5,32],
        [62.5,-15.5], [-17.5,-15.5], [-17.5,-13.75], [-62.5,-13.75]]);
        trap(-60.5); // left trap
        difference() { // thicker extension on left trap
            translate([-62.5,-19.5,0]) cube([3,10,9]);
            wedgecut(-63);
        }
        trap(52.5); // right trap
    }
}

// screw trap structure
module trap(x) {
    difference() {
        hull() {
            translate([x,-27.5,0]) linear_extrude(9) polygon(points=[[0,18], [10,18], [10,2], [8,0], [2,0], [0,2]]);
            translate([x,-24.5,0]) linear_extrude(0.2) polygon(points=[[0,0], [10,0], [10,-3], [7.5,-7.3], [2.5,-7.3], [0,-3]]);
        }
        // cut out rear wedge
        wedgecut(x-1);
        // cut out front viewing window
        translate([x+5,-20,-1]) rotate([90,0,0]) linear_extrude(15) ogive45_2d(2,3.2);
        // cut out both side windows
        translate([x-1,-21.5,0.8]) rotate([90,0,90]) linear_extrude(15) ogive45_2d(2,1.4);
    }
}

// wedge cutout on back of traps
module wedgecut(x) {
    //~ #translate([x,-9.55,2.005]) rotate([0,90,0]) linear_extrude(20) polygon(points=[[0,1], [0,-6], [-1.04,-6], [-8.04,1]]);
}

// various holes
module holes() {
    // cover holes
    translate([-57.5,13.54,-1]) cylinder(5, d=3.9, $fn=64);
    translate([57.5,19.54,-1]) cylinder(5, d=3.9, $fn=64);
    // trap holes
    screwtraphole(-55.5);
    screwtraphole(57.5);
}

// elongated hole in screw trap
module screwtraphole(x) {
    td = 3.9;
    bd = 7;
    // top screw hole elongated
    hull() {
        translate([x,-20,-1]) cylinder(15, d=td, $fn=64);
        translate([x,-23,-1]) cylinder(15, d=td, $fn=64);
    }
    // bottom screw hole elongated
    hull() {
        translate([x,-20,-1]) cylinder(9.6, d=td, $fn=64);
        translate([x,-23,-1]) cylinder(9.6, d=td, $fn=64);
        translate([x,-20,-1]) cylinder(8.2, d=bd, $fn=64);
        translate([x,-23,-1]) cylinder(8.2, d=bd, $fn=64);
    }
}

// ogive arch profile, d=width, htext = height extension (bottom base)
module ogive45_2d(d, htext) {
    r = d / (1-cos(45));
    pts = [
        let(x0 = r-d) for(a=[0:3:45]) [x0-r*cos(a), r*sin(a) + htext],
        let(x0 = d-r) for(a=[45:-3:0]) [x0+r*cos(a), r*sin(a) + htext],
        [d,0], [-d,0]
    ];
    polygon(points=pts);
}

// for comparison:
//#import("mmu2-captive-screw-plate v2.3mf", convexity=10);
