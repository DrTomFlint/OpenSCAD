// Under1
// Fiber holder for back wheel wells


//-------------------------------------


//--------------------------------------------
module block2(
    r0=3.5,   // radius for boss
    s1=6,   // length of side
    r1=1.0,   // radius for fillets
    z1=10,  // height of block
    r2=1.7,  // radius for fiber cut
    t1=10,   // tongue length
    s2=3,   // slot width
){
    
    translate([7,1.5,0])
    difference(){
        // boss
        hull(){
            translate([r0,2.5,0])
            cylinder(r=r0,h=z1,$fn=22);       
            
            translate([-3,-1.5,0])
            cube([10,2,z1]);       
        }
        
        // fiber hole
        color("blue")
        translate([r0,2.5,-0.5])
        cylinder(r1=r2+1.2, r2=r2,h=z1/4+0.5,$fn=22);
        color("cyan")
        translate([r0,2.5,0.75*z1])
        cylinder(r1=r2, r2=r2+1.2,h=z1/4+0.5,$fn=22);
        color("orange")
        translate([r0,2.5,0])
        cylinder(r=r2,h=z1,$fn=22);
        
        // stress relief
        color("pink")
        translate([0.42*s1,3,-0.5])
        rotate([0,0,-90])
        cube([1.6,10,z1+1]);
        
    }
    
    // tongue led side
    hull(){
        translate([-t1,r1,0])
        color("cyan")
        translate([s1,0,0])
        cylinder(r=r1,h=z1,$fn=22);
        
        translate([5,r1,0])
        color("cyan")
        translate([s1,0,0])
        cylinder(r=r1,h=z1,$fn=22);        
    }

    // tongue wheel side
    translate([0,-s2,0])
    difference(){
    hull(){
        translate([-t1,r1+0.75,0])
        color("cyan")
        translate([s1,0,0])
        cylinder(r=r1,h=z1,$fn=22);
        
        translate([5,r1,0])
        color("cyan")
        translate([s1,-1,0])
        cylinder(r=2*r1,h=z1,$fn=22);        
    }
        translate([-t1+5,3.0,0])
        rotate([0,0,-10])
        cube([12,2,2*z1]);

        color("green")
        translate([12,-1.7+s2,0])
        cylinder(r=3,h=z1,$fn=22);
    }

    // connecting tip
    difference(){
        color("green")
        translate([11.5,-1.7,0])
        cylinder(r=3.2,h=z1,$fn=22);
           
        color("pink")
        translate([9.5,-0.7,-0.5])
        scale([3,1,1])
        cylinder(r=0.7,h=z1+1,$fn=22);
    }
}






//==============================================

block2();

//=================================================
