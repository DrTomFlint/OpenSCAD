// Phone1
// Holder for Nexus 5x in the car
// Old plastic is 75 x 150 x n10 mm high

//-------------------------
module clip1(
    Chi = 18,
    Cwide=12,
    Cthick=2,
    Cdeep=15,
    Cround=3){

    linear_extrude(height=Chi)
    square([Cwide,1.5*Cthick]); 
    
/*    translate([0,0.75*Cthick,0])
    cylinder(r=0.75*Cthick,h=Chi,$fn=22);
        
    translate([Cwide,0.75*Cthick,0])
    cylinder(r=0.75*Cthick,h=Chi,$fn=22);
*/
    color("green")
    linear_extrude(height=Cthick)
    translate([Cround,Cround,0])
    offset(r=Cround,$fn=22)
    square([Cwide-2*Cround,Cdeep-2*Cround]);  

    color("red")
    translate([0,0,4])
    linear_extrude(height=Cthick)
    translate([Cround,Cround,0])
    offset(r=Cround,$fn=22)
    square([Cwide-2*Cround,Cdeep-2*Cround]);  
      
    color("cyan")
    translate([0,0,Chi-Cthick])
    linear_extrude(height=Cthick)
    translate([Cround,Cround,0])
    offset(r=Cround,$fn=22)
    square([Cwide-2*Cround,Cdeep-2*Cround-5]);  
}

//-------------------------
module clip2(
    Chi = 18,
    Cwide=12,
    Cthick=2,
    Cdeep=16.6,
    Cround=3){

    difference(){   // diff1
    union(){
    linear_extrude(height=Chi)
    square([Cwide-0.4,2*Cthick]); 
    
    color("orange")
    translate([0,0,9])
    scale([1,0.4,1])
    rotate([0,90,0])
    cylinder(r=9,h=Cwide-0.4,$fn=44);
    
    color("green")
    linear_extrude(height=Cthick-0.5)
    translate([Cround,Cround,0])
    offset(r=Cround,$fn=22)
    square([Cwide-2*Cround-0.2,Cdeep-2*Cround]);  

    color("red")
    translate([0,0,4.2])
    linear_extrude(height=Cthick-0.2)
    translate([Cround,Cround,0])
    offset(r=Cround,$fn=22)
    square([Cwide-2*Cround-0.4,Cdeep-2*Cround]);  
      
    color("cyan")
    translate([0,0,Chi-Cthick])
    linear_extrude(height=Cthick)
    translate([Cround,Cround,0])
    offset(r=Cround,$fn=22)
    square([Cwide-2*Cround-0.4,Cdeep-2*Cround-5]);  
}   // end of union

    color("pink")
    translate([0,4,11])
    scale([1,0.5,1])
    rotate([0,90,0])
    cylinder(r=5,h=Cwide-0.4,$fn=22);
    
    color("cyan")
    translate([0,4,2.8])
    scale([1,0.85,1])
    rotate([0,90,0])
    cylinder(r=1.5,h=Cwide-0.4,$fn=22);

    color("cyan")
    translate([0,-0.5,5])
    scale([1,0.75,1])
    rotate([0,90,0])
    cylinder(r=1.5,h=Cwide-0.4,$fn=22);

    // CHOOSE ONE:
    // regular cut
/*    
    color("cyan")
    translate([0,-1,11])
    scale([1,0.4,1])
    rotate([0,90,0])
    cylinder(r=2,h=Cwide-0.4,$fn=22);
*/    
    
    // special cut for buttons
    color("cyan")
    translate([0,1.5,11])
    scale([1,0.6,1])
    rotate([0,90,0])
    cylinder(r=2.5,h=Cwide-0.4,$fn=22);

    //  END CHOOSE
}   // end of diff1

    color("cyan")
    translate([1,12,1.5])
    scale([1,1,0.4])
    rotate([0,90,0])
    cylinder(r=2,h=Cwide-0.4-2,$fn=22);

}
//--------------------------
// Base
module base1(
    Bhi = 150,
    Bwide = 75,
    Bround=5,
    Bthick=4
){

    translate([Bround,Bround,2]) 
    linear_extrude(height=Bthick)
    offset(r=Bround,$fn=44)
    square(size=[Bwide-2*Bround,Bhi-2*Bround]);

}

//--------------------------
// Hinge
module hinge1(
){
    translate([2,0,0])
    difference(){
    
    linear_extrude(height=3)
    offset(r=2,$fn=22)
    translate([0,2,0])
    square([51,7-2]);
    
    linear_extrude(height=1.25)
    square([51,7]);
    }
    
    translate([25.5,2.5,-4])
    cylinder(r1=2.4,r2=2.6,h=6,$fn=22);
    translate([25.5-18.5,2.5,-4])
    cylinder(r1=2.4,r2=2.6,h=6,$fn=22);
    translate([25.5+18.5,2.5,-4])
    cylinder(r1=2.4,r2=2.6,h=6,$fn=22);
        
    
}

//--------------------------
// Hinge
module hinge2(
){
    translate([2,0,0])
    difference(){
    
    linear_extrude(height=3)
    offset(r=2,$fn=22)
    translate([0,2,0])
    square([44,7-2]);
    
    translate([-2,0,0])
    linear_extrude(height=1.25)
    offset(r=0.5,$fn=12)
    square([51,7]);
    }
    
    translate([25.5-2,2.5,-4])
    cylinder(r1=2.2,r2=2.6,h=6,$fn=22);
    translate([25.5-18.5-2,2.5,-4])
    cylinder(r1=2.2,r2=2.6,h=6,$fn=22);
    translate([25.5+18.5-2,2.5,-4])
    cylinder(r1=2.2,r2=2.6,h=6,$fn=22);
        
    
}


//===========================
/*

difference(){
base1();

color("red")
translate([15,0,0]) clip1();

color("pink")
translate([75-10-15,0,0]) clip1();


color("cyan")
translate([75,15,0]) 
rotate([0,0,90])clip1();

color("orange")
translate([0,15+10,0]) 
rotate([0,0,-90])clip1();

color("cyan")
translate([75,130,0]) 
rotate([0,0,90])clip1();

color("orange")
translate([0,130+10,0]) 
rotate([0,0,-90])clip1();

color("green")
translate([75/2,105,0]) 
cylinder(r1=14,r2=10,h=7);

translate([63,122,2])
rotate([0,180,0])
hinge1();


}

*/

// hinge1();
//color("orange") clip1();

//hinge2();
translate([15,0,0]) clip2();

//===========================
