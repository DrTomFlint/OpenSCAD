// slew1
// slewing joint with cross roller bearings


F1=200;              // $fn for rollers
F2=44;              // $fn for less critical

rod=7.0;           // roller outer diameter
rid=1.0;            //  roller inner diameter
rhi=rod-0.25;      // roller height
rbevel=1.0;           // z height of bevels
Nr = 21;            // half the number rollers

ofill=1;        // outer race fillet
ood=60-ofill;        // outer race outer rad
oid=38+ofill;         // outer race inner rad
ohi=12-2*ofill;         // outer race height
 
iogap=2;        // inner outer gap

Nholei=12;     // number holes inner
rholei=1.5;     // radius of holes inner
oholei=2;

Nholeo=12;      // number holes outer
rholeo=1.5;    // radius of holes outer
oholeo=2;

//-------------------------------
module roller1(){

difference(){
union(){
    // boss is stack of 3 cylinders
    cylinder(r1=rod/2-rbevel,  r2=rod/2, h=rbevel, $fn=F1);

    translate([0,0,rbevel])
    cylinder(r=rod/2, h=rhi-2*rbevel, $fn=F1);
        
    translate([0,0,rhi-rbevel])
    cylinder(r1=rod/2,  r2=rod/2-rbevel, h=rbevel, $fn=F1);
}

union(){
    // hole is stack of 3 cylinders
    translate([0,0,-0.01])
    cylinder(r1=rid/2+rbevel,  r2=rid/2, h=rbevel+0.01, $fn=F1);

    translate([0,0,rbevel])
    cylinder(r=rid/2, h=rhi-2*rbevel, $fn=F1);
        
    translate([0,0,rhi-rbevel])
    cylinder(r1=rid/2,  r2=rid/2+rbevel, h=rbevel+0.01, $fn=F1);
}

}
}


//------------------------------------
module ring1(tol=0.1){
    
    difference(){
        // main ring
        rotate_extrude(angle=360,$fn=F1){
        translate([(ood+oid)/2,0,0])
        offset(r=ofill,$fn=F2)
        square([ood-oid,ohi],center=true);
        }

        // cut for races
        rotate_extrude($fn=F1){
        translate([(ood+oid)/2,0,0])
        rotate([0,0,45])
        offset(r=rbevel,$fn=F1)
        square([rod-rbevel*2+tol,
            rod-rbevel*2+tol],center=true);
        }
        
        // cut for bolts outer
        for(i=[0:Nholeo-1]){
            rotate([0,0,360/Nholeo*i])
            translate([ood-oholeo,0,-1])
            cylinder(r=rholeo,h=ohi*2,center=true,$fn=F2);
        }

        // cut for bolts inner
        for(i=[0:Nholeo-1]){
            rotate([0,0,360/Nholeo*i])
            translate([oid+oholei,0,-1])
            cylinder(r=rholeo,h=ohi*2,center=true,$fn=F2);
        }

    }
}

//---------------------------------
module outer1(){
    
    difference(){
        ring1();  
        // cut for outer ring
        cylinder(r=(ood+oid+iogap)/2,h=ohi*3,center=true,$fn=F1);
    }    
    
}
//---------------------------------
module inner1(){
    
    intersection(){
        ring1();  
        // cut for inner ring
        cylinder(r=(ood+oid-iogap)/2,h=ohi*3,center=true,$fn=F1);
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
//=================================


if(0){
for(i=[0:1]){
//for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i])

    color("red")
    translate([(ood+oid)/2,0,0])
    rotate([0,45,0])
    translate([0,0,-rhi/2])
    roller1();
}
for(i=[0:1]){
//for(i=[0:Nr-1]){
    rotate([0,0,360/Nr*i+180/Nr])

    color("green")
    translate([(ood+oid)/2,0,0])
    rotate([0,-45,0])
    translate([0,0,-rhi/2])
    roller1();
}
}


outer1();

//innerHi();
//innerLow();



    