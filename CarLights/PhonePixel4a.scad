// PhonePixel4a
// Holder for phone in the car
// updated 7 Feb 2021, Tom Flint
//-------------------------

Bhi = 150-5;          // base height
Bwide = 70.5;       // base width

module clip1(
    Chi = 18,
    Cwide=10,
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
    Cwide=7,
    Cthick=2,
    Cdeep=16.6,
    Cround=3,
    tol=0.0){

    difference(){   // diff1
    union(){
        linear_extrude(height=Chi+tol)
        square([Cwide-0.4+tol,2*Cthick+tol]); 
        
        color("orange")
        translate([-tol/2,0,9+tol/2])
        scale([1,0.4,1])
        rotate([0,90,0])
        cylinder(r=9+tol,h=Cwide-0.4+tol,$fn=44);
        
        color("green")
        translate([0,0,-tol/2])
        linear_extrude(height=Cthick-0.5+tol)
        translate([Cround,Cround+tol])
        offset(r=Cround+tol,$fn=22)
        square([Cwide-2*Cround-0.4,Cdeep-2*Cround]);  

        color("red")
        translate([0,0,4.2])
        translate([0,0,-tol/2])
        linear_extrude(height=Cthick-0.2+tol)
        translate([Cround,Cround+tol])
        offset(r=Cround+tol,$fn=22)
        square([Cwide-2*Cround-0.4,Cdeep-2*Cround]);  
          
        color("cyan")
        translate([0,0,Chi-Cthick])
        translate([0,0,-tol/2])
        linear_extrude(height=Cthick+tol)
        translate([Cround,Cround+tol])
        offset(r=Cround+tol,$fn=22)
//        square([Cwide-2*Cround-0.4,Cdeep-2*Cround-9]);  
        square([Cwide-2*Cround-0.4,8-2*Cround]);  
//        square([Cwide-2*Cround-0.4,Cdeep-2*Cround-4]);  
    }   // end of union

    color("pink")
    translate([-1,4,11])
    scale([1,0.5,1])
    rotate([0,90,0])
    cylinder(r=5,h=Cwide-0.4+2,$fn=22);
    
    color("cyan")
    translate([-1,4,2.8])
    scale([1,0.85,1])
    rotate([0,90,0])
    cylinder(r=1.5,h=Cwide-0.4+2,$fn=22);

    color("cyan")
    translate([-1,-0.5,5])
    scale([1,0.75,1])
    rotate([0,90,0])
    cylinder(r=1.5,h=Cwide-0.4+2,$fn=22);

    // cut for buttons, extra clearance for power and volume keys
    color("cyan")
    translate([-1,1.5,11])
    scale([1,0.6,1])
    rotate([0,90,0])
    cylinder(r=2.5,h=Cwide-0.4+2,$fn=22);
    
}   // end of diff1

// raised bump on base attachment
color("pink")
translate([1,Cdeep-4.6,1.5])
scale([1,1,0.4])
rotate([0,90,0])
cylinder(r=2.2,h=Cwide-0.4-2,$fn=22);

}

//--------------------------
// Base
module base1(
    Bround=7,
    Bthick=4
){

    translate([0,0,2]) 
    linear_extrude(height=Bthick)
    offset(r=Bround,$fn=44)
    square(size=[Bwide-2*Bround,Bhi-2*Bround],center=true);

}

//--------------------------
// Hinge
module hinge1(
){
    translate([2,0,0])
    difference(){
    
    linear_extrude(height=3)
    offset(r=2,$fn=22)
    translate([1,2,0])
    square([51-6,7-2]);
    
    linear_extrude(height=1.25)
    square([51,7]);
    }
    
    translate([25.5,2.5,-4])
    cylinder(r1=2.4,r2=2.6,h=7,$fn=22);
    translate([25.5-18.5,2.5,-4])
    cylinder(r1=2.4,r2=2.6,h=7,$fn=22);
    translate([25.5+18.5,2.5,-4])
    cylinder(r1=2.4,r2=2.6,h=7,$fn=22);
        
    
}

//--------------------------
// Hinge
module hinge2(){
$fn=99;
    
difference(){
    union(){
    translate([2,0,0])
    linear_extrude(height=2)
    offset(r=2)
    translate([0,2,0])
    square([44,5]);
        
    translate([25.5-2,4.5,-6])
    cylinder(r1=2.2,r2=2.6,h=8);
    translate([25.5-18.5-2,4.5,-6])
    cylinder(r1=2.2,r2=2.6,h=8);
    translate([25.5+18.5-2,4.5,-6])
    cylinder(r1=2.2,r2=2.6,h=8);
    }   // end union

/*    
    translate([25.5-2,4.5,-7])
    cylinder(r1=0.4,r2=0.8,h=10);
    translate([25.5-18.5-2,4.5,-7])
    cylinder(r1=0.4,r2=0.8,h=10);
    translate([25.5+18.5-2,4.5,-7])
    cylinder(r1=0.4,r2=0.8,h=10);
    */
    }   // end diff
}


//===========================

if(0){
    difference(){
        base1();

        // hole for the fingerprint sensor
        color("green")
        translate([0,31,0]) 
        cylinder(r1=14,r2=10,h=7);

        // cut for the hinge
        translate([25.5,49,2])
        rotate([0,180,0])
        hinge1();
        
        // cuts for clips
        translate([0,0,0.01])
        if(1){

            color("red")
            translate([-Bwide/2+6,-Bhi/2-2,0]) clip2(tol=0.15);

            color("pink")
            translate([Bwide/2-6-7,-Bhi/2-2,0]) clip2(tol=0.15);


            color("cyan")
            translate([Bwide/2+2,-Bhi/2+17,0]) 
            rotate([0,0,90])clip2(tol=0.15);

            color("cyan")
            translate([Bwide/2+2,Bhi/2-30,0]) 
            rotate([0,0,90])clip2(tol=0.15,Cdeep=16.6-5);

            color("orange")
            translate([-Bwide/2-2,-Bhi/2+17+6.5,0]) 
            rotate([0,0,-90])clip2(tol=0.15);

            color("orange")
            translate([-Bwide/2-2,Bhi/2-30+6.5,0]) 
            rotate([0,0,-90])clip2(tol=0.15,Cdeep=16.6-5);

        }    

        // cuts so text goes into the surface
        if(1){
            // extrude some text, provides air space on the backside, protects the camera bump
            translate ([0,5,6-0.3]) color("blue") linear_extrude(height=2){
            text("VINGILOT", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);
            }

            translate ([0,-45,6-0.3]) color("blue") linear_extrude(height=2){
            text("* * * * *", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.1);
            }

            translate ([-10,60,6-0.3]) color("blue") linear_extrude(height=2){
            text("* * *", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.1);
            }

        }

    }
}

// Text as separate object and amf file
if(0){
    // extrude some text, provides air space on the backside, protects the camera bump
    translate ([0,5,6-0.3]) color("blue") linear_extrude(height=2){
    text("VINGILOT", font = "Open Sans:style=Bold", size=8,halign="center",valign="center",spacing=1.1);
    }

    translate ([0,-45,6-0.3]) color("blue") linear_extrude(height=2){
    text("* * * * *", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.1);
    }

    translate ([-10,60,6-0.3]) color("blue") linear_extrude(height=2){
    text("* * *", font = "Open Sans:style=Bold", size=10,halign="center",valign="center",spacing=1.1);
    }

}


//difference(){
//clip2(tol=0.2);
//clip2(tol=0);
//}

// clips
if(0){

    color("red")
    translate([-Bwide/2+6,-Bhi/2-2,0]) clip2();

    color("pink")
    translate([Bwide/2-6-7,-Bhi/2-2,0]) clip2();


    color("cyan")
    translate([Bwide/2+2,-Bhi/2+16,0]) 
    rotate([0,0,90])clip2();

    color("cyan")
    translate([Bwide/2+2,Bhi/2-30,0]) 
    rotate([0,0,90])clip2(Cdeep=11.6);

    color("orange")
    translate([-Bwide/2-2,-Bhi/2+16+6,0]) 
    rotate([0,0,-90])clip2();

    color("orange")
    translate([-Bwide/2-2,Bhi/2-30+6,0]) 
    rotate([0,0,-90])clip2(Cdeep=11.6);

    translate([25.5,49,2])
    rotate([0,180,0])
    hinge1();

}    

//clip2();
//clip2(Cdeep=11.6);

//hinge1();
//color("orange") clip1();

hinge2();
//translate([15,0,0]) clip2();

//===========================
