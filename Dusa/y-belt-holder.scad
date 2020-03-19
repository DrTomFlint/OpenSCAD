// Copy from Prusa Original:
// PRUSA iteration4
// Y belt holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// This should not require any changes to fit the Dusa?
// Plenty changes.

module y_belt_holder()
{

    difference()
    {
        // base block
        union()
        {
            translate([-9.5,-24,42.5]) cube([16.5,48,10]);
            translate([-5,-15,27]) cube([12,30,19]);
            
        }
        // cut to make ramp for endstop
        color("orange")
        translate([-6,-30,40.5])
        rotate([0,0,40])
        cube([6,50,13]);

        // lower belt entry
        translate([-7.5,-16,34.9-2.75]) rotate([0,45,0]) cube([3,32,3]);
        
        // lower belt slot
        translate([-8.5,-16,34.2-2.75]) cube([11.5,32,0.75]);
        translate([-8.5,-16,35.4-2.75]) rotate([0,5,0]) cube([11.5,32,0.2]);
        translate([-8.5,-16,33.6-2.75]) rotate([0,-5,0]) cube([11.5,32,0.2]);
        for (_step =[-16:2:16])
        {
            translate([-8.5,_step+0.5,33-2.75]) cube([11.5,1,1.5]);
        }
        
        // upper belt entry 
        translate([-7.5,-16,39.9-1.5]) rotate([0,45,0]) cube([3,32,3]);

        // upper belt slot
        translate([-8.5,-16,39.2-1.5]) cube([11.5,32,0.75]);
        translate([-8.5,-16,40.4-1.5]) rotate([0,5,0]) cube([11.5,32,0.2]);
        translate([-8.5,-16,38.6-1.5]) rotate([0,-5,0]) cube([11.5,32,0.2]);
        for (_step =[-17:2:16])
        {
            translate([-8.5,_step-0.5,38.2-1.5]) cube([11.5,1,1.5]);
        }
        
        // mounting screw holes, these are double cut to make slight oval
        translate([0,-19.50,40]) cylinder( h=30, r=1.65, $fn=50 );
        translate([0,19.50,40]) cylinder( h=30, r=1.65, $fn=50 );
        translate([0,-19.25,40]) cylinder( h=30, r=1.65, $fn=50 );
        translate([0,19.25,40]) cylinder( h=30, r=1.65, $fn=50 );
        translate([0,-19.0,40]) cylinder( h=30, r=1.65, $fn=50 );
        translate([0,19.0,40]) cylinder( h=30, r=1.65, $fn=50 );
        
        translate([0,-19.5,43.5]) cylinder( h=5, r=3.1, $fn=50 );
        translate([0,19.5,43.5]) cylinder( h=5, r=3.1, $fn=50 );
        translate([0,-19.25,43.5]) cylinder( h=5, r=3.1, $fn=50 );
        translate([0,19.25,43.5]) cylinder( h=5, r=3.1, $fn=50 );
        translate([0,-19.0,43.5]) cylinder( h=5, r=3.1, $fn=50 );
        translate([0,19.0,43.5]) cylinder( h=5, r=3.1, $fn=50 );
        
    
    }
 

}


//===========================================

y_belt_holder();



/*
difference()
{
    translate([-40,0,7]) rotate([0,90,0]) y_belt_holder();
    //version   
    translate([8.5,3.5,0.5]) rotate([0,180,90]) linear_extrude(height = 0.6) 
    { text("R2",font = "helvetica:style=Bold", size=4, center=true); }
}
  */  
