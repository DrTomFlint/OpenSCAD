// Under1
// Fiber holder for underbody below the doors


//-------------------------------------


//--------------------------------------------
module block1(
    s1=6,  // side length
    r1=2,   // radius for fillet
    z1=10,  // height of block
    r2=1.7,  // radius for fiber cut
    t1=9   // tongue length
){
    
    pb = [ [0,0], [s1,0], [0,0.5*s1] ];
    
    difference(){
        // boss
        linear_extrude(height=z1)
        translate([r1,r1,0])
        offset(r=r1,$fn=22)
        polygon(points=pb);
        
        
        // fiber hole
        color("blue")
        translate([0.55*s1,0.55*s1,-0.5])
        cylinder(r1=r2+1.2, r2=r2,h=z1/4+0.5,$fn=22);
        color("cyan")
        translate([0.55*s1,0.55*s1,0.75*z1])
        cylinder(r1=r2, r2=r2+1.2,h=z1/4+0.5,$fn=22);
        color("orange")
        translate([0.55*s1,0.55*s1,0])
        cylinder(r=r2,h=z1,$fn=22);
        
        // stress relief
        color("pink")
        translate([0.42*s1,0.6*s1,-0.5])
        rotate([0,0,-35])
        cube([1.6,10,z1+1]);
        
    }
    
    // tongue
    hull(){
    translate([2,0,0])
    difference(){
        color("cyan")
        translate([s1,0,0])
        cylinder(r=r1,h=z1);
        
        color("red")
        translate([s1-r1,-2*r1,0])
        cube([2*r1,2*r1,z1]);
    }

    translate([t1,0,0])
    difference(){
        color("cyan")
        translate([s1,0,0])
        cylinder(r=r1,h=z1,$fn=22);
        
        color("red")
        translate([s1-r1,-2*r1,0])
        cube([2*r1,2*r1,z1]);
    }
}

    // lip on end of tongue
    color("green")
    translate([16.5,2,0])
    cylinder(r=r1,h=z1,$fn=22);
       

}






//==============================================

block1();

//=================================================
