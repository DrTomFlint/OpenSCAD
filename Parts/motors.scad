// motors

//-------------------------------------
module zmotor(tol=0){
F2=88;
F3=22;
    
    difference(){
    // boss
    translate([0,0,39/2])
    intersection(){
        cube([42.4+tol,42.4+tol,39+tol],center=true);
        cylinder(r=25+tol,h=40,center=true,$fn=F2);
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
    cylinder(r=11+tol,h=1.85+tol,$fn=F2);
    
    // wiring box
    translate([42.4/2,-16.5/2,0])
    cube([6.3+tol,16.5+tol,10+tol]);
    
    // lead screw
    translate([0,0,39])
    cylinder(r=4+tol,h=350+tol,$fn=F3);
    
}
//-------------------------------------
module xymotor(tol=0){
F2=88;
F3=22;
    z1=47.3;
    
    difference(){
    // boss
    translate([0,0,z1/2])
    intersection(){
        cube([42.4,42.4,z1],center=true);
        cylinder(r=53/2,h=z1,center=true,$fn=F2);
    }

    // stator stack smaller than end plates
    translate([0,0,z1/2]){
        difference(){
            cube([60,60,30.2],center=true);
            cylinder(r=50.2/2,h=30.2,center=true,$fn=F2);
        }
    }
    
    // mounting holes
    translate([15.5,15.5,z1-5])
    cylinder(r=1.5,h=10,$fn=F3);
    translate([-15.5,15.5,z1-5])
    cylinder(r=1.5,h=10,$fn=F3);
    translate([15.5,-15.5,z1-5])
    cylinder(r=1.5,h=10,$fn=F3);
    translate([-15.5,-15.5,z1-5])
    cylinder(r=1.5,h=10,$fn=F3);
    
    }
    
    // top cylinder
    translate([0,0,z1])
    cylinder(r=11,h=1.85,$fn=F2);
    
    // wiring box
    translate([42.4/2,0,2.0+2.5])
    rotate([0,90,0])
    cylinder(r=2.5,h=10);
    
    // main shaft
    translate([0,0,z1])
    cylinder(r=2.5,h=20,$fn=F3);
    
}
//======================================

zmotor();

//xymotor();

//========================================
