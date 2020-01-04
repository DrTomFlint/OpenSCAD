// powerbase
// base plate for the dcdc supply and power plug

module powerbase(){
// base borrowed from pieye
translate([25,25,0]){
difference(){
    color("yellow")
    linear_extrude(height=9.4+0.6)
    offset(r=2,$fn=80)    
    square(size=[14,38],center=true);

    translate([1,8,2])
    color("orange")
    linear_extrude(height=10)
    offset(r=0.5,$fn=16)    
    square(size=[11,20.5],center=true);

    translate([0,-11.5,0.6])
    color("pink")
    linear_extrude(height=10)
    offset(r=0.5,$fn=16)    
    square(size=[13.5,14],center=true);

    translate([-0.5,-22,2])
    color("green")
    cube([7,5,10]);

    translate([-7.25,-6,2])
    color("blue")
    cube([5,10,10]);

    translate([-10,-12,5])
    color("orange")
    cube([6,16,10]);
}

/*
    translate([1,12.25,0])
    color("red")
    linear_extrude(height=3.4)
    offset(r=0.5,$fn=16)    
    square(size=[12,15.5],center=true);
*/
    translate([-7.25,-19,0])
    color("blue")
    cube([3.5,5,10]);

}
}
//------------------
module powerbase2(){
difference(){
    color("yellow")
    translate([-12,-11.5,0])
    linear_extrude(height=9.4+0.6)
    offset(r=2,$fn=80)    
    square(size=[38,14],center=true);

    translate([-20,-12,2])
    color("orange")
    rotate([0,0,90])
    linear_extrude(height=10)
    offset(r=0.5,$fn=16)    
    square(size=[11,20.5],center=true);

    translate([0,-11.5,0.6])
    color("pink")
    linear_extrude(height=10)
    offset(r=0.5,$fn=16)    
    square(size=[13.5,14],center=true);

    translate([-0.5,-22,2])
    color("green")
    cube([7,5,10]);

    translate([-30,-7,2])
    color("blue")
    cube([5,10,10]);

    translate([-10,-12,5])
    color("orange")
    cube([6,7,10]);
}

    translate([-7.25,-19,0])
    color("blue")
    cube([3.5,5,10]);

}


//------------

module powerbase2b(){
//translate([-5,-27.5,0])
translate([-5,-35.5,0])
rotate([0,0,-90])
difference(){
    color("yellow")
    translate([-20,-11.5,0])
    linear_extrude(height=9.4+0.6)
    offset(r=2,$fn=80)    
    square(size=[22,14],center=true);

    translate([-20,-12,2])
    color("orange")
    rotate([0,0,90])
    linear_extrude(height=10)
    offset(r=0.5,$fn=16)    
    square(size=[11,20.5],center=true);

  
    translate([-30,-7,2])
    color("blue")
    cube([8,10,10]);

    translate([-10,-15,5])
    color("orange")
    cube([6,7,10]);
}

}

module powerbase2a(){
difference(){
    color("yellow")
    translate([0,-11.5,0])
    linear_extrude(height=9.4+0.6)
    offset(r=2,$fn=80)    
    square(size=[16,14],center=true);

    translate([0,-11.5,0.6])
    color("pink")
    linear_extrude(height=10)
    offset(r=0.5,$fn=16)    
    square(size=[13.5,14],center=true);

    translate([-0.5,-22,2])
    color("green")
    cube([7,5,10]);

    translate([-11,-12,5])
    color("orange")
    cube([6,7,10]);
}

    translate([-7.25,-19,0])
    color("blue")
    cube([3.5,5,10]);

}


//---
module powerplug(){

translate([28,3.5,5]){
    rotate([90,0,0])
    cylinder(r1=10.5/2,r2=8/2,h=25);
}
}

//---
module powerplug2(){

translate([28-25,3.5-25,5]){
    rotate([90,0,0])
    cylinder(r1=10.5/2,r2=8/2,h=25);
}
}

//-----------
module powerbasecut(){
    color("yellow")
    translate([25,25,0]){
    linear_extrude(height=9.4+0.6)
    offset(r=2+0.2,$fn=80)    
    square(size=[14,38],center=true);
    }
}

//------------
powerbase2();
powerplug2();

translate([50,0,0]){
    powerbase2a();
    powerbase2b();
    powerplug2();
}

/*
translate([0,0,0])
powerlid();
*/

//pibase();


//---------- end of file ------------------
