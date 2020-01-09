// slew1
// slewing joint with cross roller bearings


F1=200;              // $fn for rollers
F2=44;              // $fn for less critical

rod=9.0;           // roller outer diameter
rid=5.8;            //  roller inner diameter
rhi=rod-0.2;      // roller height
rbevel=1.0;           // z height of bevels
Nr = 9;            // half the number rollers

ofill=1;        // outer race fillet
ood=36-ofill;        // outer race outer rad
oid=17+ofill;         // outer race inner rad
ohi=13-2*ofill;         // outer race height

iooff=0.535;     // offset race in the boss

iogap=1;        // inner outer gap

Nholei=12;     // number holes inner
rholei=1.6;     // radius of holes inner
oholei=1.5;       // offset from edge

CutAngle=60;   // cutaway view if < 360

//-------------------------------
module roller1(tol=0){

difference(){
union(){
    // boss is stack of 3 cylinders
    translate([0,0,-tol])
    cylinder(r1=rod/2-rbevel,  r2=rod/2+tol, h=rbevel+tol, $fn=F1);

    translate([0,0,rbevel])
    cylinder(r=rod/2+tol, h=rhi-2*rbevel, $fn=F1);
        
    translate([0,0,rhi-rbevel])
    cylinder(r1=rod/2+tol,  r2=rod/2-rbevel, h=rbevel, $fn=F1);
}


}
}


//------------------------------------
module ring1(tol=0.1){
    
    difference(){
        // main ring
        rotate_extrude(angle=CutAngle,$fn=F1){
        translate([(ood+oid)/2,0,0])
        offset(r=ofill,$fn=F2)
        square([ood-oid,ohi],center=true);
        }

        // cut for races
        rotate_extrude($fn=F1){
        translate([(ood+oid)*iooff,0,0])
        rotate([0,0,45])
        offset(r=rbevel,$fn=F1)
        square([rod-rbevel*2+tol,
            rod-rbevel*2+tol],center=true);
        }
        
        // cut for bolts inner
        for(i=[0:Nholei-1]){
            rotate([0,0,360/Nholei*i])
            translate([oid+oholei,0,-1])
            cylinder(r=rholei,h=ohi*2,center=true,$fn=F2);
        }

    }
}

//---------------------------------
module outer1(){
    
    difference(){
        ring1();  
        // cut for outer ring
        cylinder(r=(ood+oid)*iooff+iogap/2,h=ohi*3,center=true,$fn=F1);
    }    
    
}
//---------------------------------
module inner1(){
    
    intersection(){
        ring1();  
        // cut for inner ring
        cylinder(r=(ood+oid)*iooff-iogap/2,h=ohi*3,center=true,$fn=F1);
    }   
    
}
//-----------------------------------
module innerLow(tol=0.1){
    difference(){
        inner1();
        
        translate([-ood,-ood,-tol])
        cube([ood*2,ood*2,20]);
    }
}

//-----------------------------------
module innerHi(tol=0.1){
    intersection(){
        inner1();
        
        translate([-ood,-ood,+tol])
        cube([ood*2,ood*2,20]);
    }
}

//--------------------------------
module gasket(){
    intersection(){
    inner1();
    cylinder(r=30,h=0.2,center=true);
}
}


//--------------------------------
module carrier(tol=-0.25){
    a1=360/Nr;
//    a1=360;
    r1=1.5; // corner cuts
    r2=1.0; // face cuts
    r0=rod/2-0.3;
    
    pts=[ [r0-r1,-r0],  [r0,-r0+r1],
          [r0,r0-r1], [r0-r1,r0],
          [-r0+r1,r0], [-r0,r0-r1],
          [-r0,-r0+r1], [-r0+r1,-r0] ];
    

difference(){
    
        rotate_extrude($fn=F1,angle=a1){
        translate([(ood+oid)*iooff,0,0])
        rotate([0,0,45])

        polygon(points=pts);

        }

for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i])

    color("red")
    translate([(ood+oid)*iooff,0,0])
    rotate([0,45,0])
    translate([0,0,-rhi/2-0.5])
    cylinder(r=rod/2+0.1, h=rhi+1, $fn=F1);

    rotate([0,0,360/Nr*i+360/Nr*0.32])
    color("pink")
    translate([(ood+oid)*iooff,0,0])
    rotate([0,45,0])
    translate([1.8,0,-rhi/2-0.5])
    cylinder(r=0.7, h=1, $fn=F1);

    color("cyan")
    rotate([0,0,360/Nr*i-360/Nr*0.33])
    translate([(ood+oid)*iooff,0,0])
    rotate([0,45,0])
    translate([1.8,0,-rhi/2-0.5])
    cylinder(r=0.8, h=1, $fn=4);
}
for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i+180/Nr])

    color("green")
    translate([(ood+oid)*iooff,0,0])
    rotate([0,-45,0])
    translate([0,0,-rhi/2-0.5])
    cylinder(r=rod/2+0.1, h=rhi+1, $fn=F1);
}


}

}

//=================================

if(0){
difference(){
carrier();
translate([22,-13,0])
rotate([0,0,180/Nr])
cube([40,40,40],center=true);    
}
}

//carrier();

if(0){
//for(i=[0]){
for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i])

    color("red")
    translate([(ood+oid)*iooff,0,0])
    rotate([0,45,0])
    translate([0,0,-rhi/2])
    roller1();
}
//for(i=[0]){
for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i+180/Nr])

    color("green")
    translate([(ood+oid)*iooff,0,0])
    rotate([0,-45,0])
    translate([0,0,-rhi/2])
    roller1();
}
}

roller1();

//outer1();

//innerHi();
//innerLow();

//gasket();

