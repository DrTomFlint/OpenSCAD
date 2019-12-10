// side rail for rover9 picam

use <Beam1.scad>
use <Disk1.scad>

module siderail(){
    
y0=-48-1;
z0=-31;
f6=88;
hi6=7.8;

    translate([7.8*1.5,y0,z0+5])
    rotate([0,90,0])
    disk1();


  difference(){  
    hull(){
        color("pink")
        translate([7.8*1.5,y0,z0+29])
        rotate([90,0,0])
        rotate([0,90,0])
        cylinder(r=3.5,h=hi6,$fn=44);
    
        translate([7.8*1.5,y0,z0+5])
        rotate([90,0,0])
        rotate([0,90,0])
        cylinder(r=7,h=hi6,$fn=44);
    }
        
    tol6=0.2;    
    color("red")
    translate([15,-51.5+tol6,-10-tol6])
    rotate([83,0,0])
    cube([20,8+tol6*2,1.5+tol6*2],center=true);



    color("green")
    translate([7.8*1.5,y0,z0+5])
    rotate([90,0,0])
    rotate([0,90,0])
    cylinder(r=11.0,h=hi6,$fn=44);
    
}    


difference(){
    union(){
    // triangle side
    color("orange")
    hull(){
        translate([7.8*1.5,y0+9,z0+42])
        rotate([90,0,0])
        rotate([0,90,0])
        cylinder(r=3.0,h=hi6,$fn=44);

        translate([7.8*1.5,y0+8,z0+31])
        rotate([90,0,0])
        rotate([0,90,0])
        cylinder(r=3.0,h=hi6,$fn=44);

        translate([7.8*1.5,y0,z0+29])
        rotate([90,0,0])
        rotate([0,90,0])
        cylinder(r=3.5,h=hi6,$fn=44);
    }

    //  square side
    color("cyan")
    hull(){
        translate([7.8*1.5,y0+10,z0+8*4+1])
        rotate([90,0,0])
        rotate([0,90,0])
        cylinder(r=4,h=hi6,$fn=44);

        translate([7.8*1.5,y0+10,z0+8*5+1])
        rotate([90,0,0])
        rotate([0,90,0])
        cylinder(r=4,h=hi6,$fn=44);

        translate([7.8*1.5,y0+116,z0+8*4+0])
        rotate([90,0,0])
        rotate([0,90,0])
        cylinder(r=3,h=hi6,$fn=44);

        translate([7.8*1.5,y0+116,z0+8*5+2])
        rotate([90,0,0])
        rotate([0,90,0])
        cylinder(r=3,h=hi6,$fn=44);
    }
}// end union

    tol6=0.2;
    color("red")
    translate([15,13.5+tol6,6-tol6])
    cube([15,105+tol6*2,11+tol6*2],center=true);

    tol6=0.2;
    color("pink")
    translate([15,-45+tol6,5-tol6])
    rotate([52,0,0])
    cube([20,6+tol6*2,1.5+tol6*2],center=true);


} // end diff

} //-------- end module side1 -----------

siderail();

