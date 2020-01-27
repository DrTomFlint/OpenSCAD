// tslot
// models for tslots used in PrusaDusa

//---------------------------------------
module tslot1(
tol = 0.0,
len = 60,
type = 1
){
    
// 30x30     
if(type==1){
    linear_extrude(height=len)
    difference(){
        offset(r=2.0+tol,$fn=20)
        square([26,26],center=true);
 
        translate([0,12,0])
        square([8.2-tol,8.2-tol],center=true);
        translate([0,-12,0])
        square([8.2-tol,8.2-tol],center=true);
        translate([12,0,0])
        square([8.2-tol,8.2-tol],center=true);
        translate([-12,0,0])
        square([8.2-tol,8.2-tol],center=true);
    }
}
    
// 30x60
if(type==2){
    linear_extrude(height=len)
    difference(){
        offset(r=2.0+tol,$fn=20)
        square([26,56],center=true);
 
        translate([0,27,0])
        square([8.2-tol,8.2-tol],center=true);
        translate([0,-27,0])
        square([8.2-tol,8.2-tol],center=true);
        
        translate([12,15,0])
        square([8.2-tol,8.2-tol],center=true);
        translate([-12,15,0])
        square([8.2-tol,8.2-tol],center=true);

        translate([12,-15,0])
        square([8.2-tol,8.2-tol],center=true);
        translate([-12,-15,0])
        square([8.2-tol,8.2-tol],center=true);
    }
}
    
// 36x60
if(type==3){
    linear_extrude(height=len)
    difference(){
        offset(r=2.0+tol,$fn=20)
        square([56,56],center=true);
 
        translate([15,27,0])
        square([8.2-tol,8.2-tol],center=true);
        translate([15,-27,0])
        square([8.2-tol,8.2-tol],center=true);
        
        translate([-15,27,0])
        square([8.2-tol,8.2-tol],center=true);
        translate([-15,-27,0])
        square([8.2-tol,8.2-tol],center=true);
        
        translate([27,15,0])
        square([8.2-tol,8.2-tol],center=true);
        translate([-27,15,0])
        square([8.2-tol,8.2-tol],center=true);

        translate([27,-15,0])
        square([8.2-tol,8.2-tol],center=true);
        translate([-27,-15,0])
        square([8.2-tol,8.2-tol],center=true);
    }
}
    
}

//--------------------------------------
module tbrace(
tol=0.0
){

F2=22;
 
translate([0,0,2-15])    
difference(){    
union(){
        cube([4.8,60,26]);
        cube([60,4.8,26]);
    
    hull(){
        translate([60-2.4,4.8,0])
        cylinder(r=2.4,h=26,$fn=F2);
        translate([4.8,60-2.4,0])
        cylinder(r=2.4,h=26,$fn=F2);
    }
}    

        translate([15,0,26/2])
        rotate([-90,0,0])
        cylinder(r1=3.5,r2=4.5,h=60,$fn=F2);
        translate([15+30,0,26/2])
        rotate([-90,0,0])
        cylinder(r1=3.5,r2=4.5,h=60,$fn=F2);

        translate([0,15,26/2])
        rotate([0,90,0])
        cylinder(r1=3.5,r2=4.5,h=60,$fn=F2);
        translate([0,15+30,26/2])
        rotate([0,90,0])
        cylinder(r1=3.5,r2=4.5,h=60,$fn=F2);

}
}

//=======================================

tbrace();

/*
color("cyan")
tslot1(len=70);

color("green")
translate([0,15,0])
tslot1(type=2);

color("red")
translate([15,15,0])
tslot1(type=3,len=50);

*/

//=======================================
