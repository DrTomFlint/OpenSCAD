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
//-------------------------------------
module emotor(tol=0){
F2=88;
F3=22;
    z1=39.0;
    
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
            cube([60,60,14.2],center=true);
            cylinder(r=50/2,h=30.2,center=true,$fn=F2);
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
    translate([42.4/2,-8.25,0])
    cube([8+tol,16.5+tol,11+tol]);
    
    // main shaft
    translate([0,0,z1])
    cylinder(r=2.5,h=20,$fn=F3);
    
}
//-----------------------------------
module znut(holes=1,tol=0){
    F2=88;
    
    cylinder(r=9.95/2+tol,h=10.45+tol,$fn=F2);
    
    difference(){
        translate([0,0,2])
        cylinder(r=21.9/2+tol,h=3.55,$fn=F2);

        if(holes==1){
            translate([7.75,0,0])
            cylinder(r=1.5,h=6,$fn=F2);
            translate([0,7.75,0])
            cylinder(r=1.5,h=6,$fn=F2);
            translate([-7.75,0,0])
            cylinder(r=1.5,h=6,$fn=F2);
            translate([0,-7.75,0])
            cylinder(r=1.5,h=6,$fn=F2);
        }
    }

}
//======================================

//zmotor();

//znut();
emotor();
//xymotor();

//========================================
