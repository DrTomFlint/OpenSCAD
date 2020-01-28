// motors

//-------------------------------------
module zmotor(tol=0){
F2=88;
F3=22;
    
    difference(){
    // boss
    translate([0,0,39/2])
    intersection(){
        cube([42.4,42.4,39],center=true);
        cylinder(r=25,h=40,center=true,$fn=F2);
    }
    // mounting holes
    translate([15.5,15.5,35])
    cylinder(r=1.5,h=10,$fn=F3);
    translate([-15.5,15.5,35])
    cylinder(r=1.5,h=10,$fn=F3);
    translate([15.5,-15.5,35])
    cylinder(r=1.5,h=10,$fn=F3);
    translate([-15.5,-15.5,35])
    cylinder(r=1.5,h=10,$fn=F3);
    
    }
    
    // top cylinder
    translate([0,0,39])
    cylinder(r=11,h=1.85,$fn=F2);
    
    // wiring box
    translate([42.4/2,-16.5/2,0])
    cube([6.3,16.5,10]);
    
    // lead screw
    translate([0,0,39])
    cylinder(r=4,h=350,$fn=F3);
    
}
//======================================

zmotor();

//========================================
